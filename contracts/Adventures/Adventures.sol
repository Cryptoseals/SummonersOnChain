import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/Core/Calculator/ICalculator.sol";
import "../Interfaces/Codex/ICodexAdventures.sol";
import "../Interfaces/Codex/ICodexEnemies.sol";
import "../Inventory/EquipableUtils.sol";
import "../Interfaces/Codex/ICodexRandom.sol";
import "../Interfaces/Reward/IReward.sol";

pragma solidity ^0.8.0;

contract Adventures is Initializable, InitNavigator, OwnableUpgradeable {

    uint battleNonce;
    mapping(uint => uint) public timer;
    uint public COOLDOWN;

    struct AdventureBattle {
        address account;
        uint summoner;
        uint adventureArea;
        uint adventureLevel;
        IAdventure.AdventureMonster monster;
        GameObjects.BattleStats playerStats;
        GameObjects.BattleStats monsterStats;
    }

    // summoner -> battle
    mapping(uint => AdventureBattle) public activeBattles;

    function initialize(address _navigator) external initializer {
        __Ownable_init();
        initializeNavigator(_navigator);
        COOLDOWN = 1 minutes;
    }

    function setCooldown(uint _minutes) external onlyOwner {
        COOLDOWN = _minutes * 1 minutes;
    }

    function startBattle(uint summoner,
        uint adventureArea,
        uint adventureLevel) external ensureNotPaused
    senderIsSummonerOwner(summoner) notInFight(summoner) {
        require(timer[summoner] < block.timestamp, "early");
        timer[summoner] = block.timestamp + COOLDOWN;
        (IMonster.Monster memory _monster, IAdventure.AdventureMonster memory _advMonster) = getMonster(adventureArea, adventureLevel);

        (
        GameObjects.BattleStats memory _summonerStats,
        GameObjects.BattleStats memory _monsterStats
        ) = ICalculator(contractAddress(INavigator.CONTRACT.CALCULATOR)).PVEBattleStats(summoner, _monster);

        activeBattles[summoner] = AdventureBattle({
        account : msg.sender,
        summoner : summoner,
        adventureArea : adventureArea,
        adventureLevel : adventureLevel,
        monster : _advMonster,
        playerStats : _summonerStats,
        monsterStats : _monsterStats
        });

        battleNonce++;
        ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).setSummonerState(
            summoner,
            GameEntities.SummonerState.IN_FIGHT
        );
    }

    function flee(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        require(activeBattles[summoner].account == msg.sender, "no battle");
        delete activeBattles[summoner];
        timer[summoner] = block.timestamp + COOLDOWN * 4;
        ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).setSummonerState(
            summoner,
            GameEntities.SummonerState.FREE
        );
    }

    function attack(uint summoner, uint multiplier) external onlyGameContracts {
        AdventureBattle memory battle = activeBattles[summoner];
        (
        bool playerHits,
        bool monsterHits,
        uint nonce) = getHitRolls(summoner, battle);
        // if monster dodges or player misses, skip atk, else roll crit chance
        if (playerHits) {
            (bool isCrit, uint roll) = getCritRoll(summoner, battle.playerStats.CRIT_CHANCE, nonce);
            emit Roll(roll);
            uint damage = isCrit
            ?
            (battle.playerStats.DPS * multiplier) / 100 +
            (battle.playerStats.DPS * battle.playerStats.CRIT_MULTI) / 100
            :
            (battle.playerStats.DPS * multiplier) / 100;

            nonce++;

            if (damage >= battle.monsterStats.TOTAL_HP) {
                battle.monsterStats.TOTAL_HP = 0;
            } else {
                battle.monsterStats.TOTAL_HP -= damage;
            }
        }

        if (monsterHits) {
            (bool isCrit, uint roll) = getCritRoll(battle.monster.monsterId + block.number,
                battle.monsterStats.CRIT_CHANCE, nonce);
            emit Roll(roll);

            uint damage = isCrit
            ?
            (battle.monsterStats.DPS * multiplier) / 100 +
            (battle.monsterStats.DPS * battle.monsterStats.CRIT_MULTI) / 100
            :
            (battle.monsterStats.DPS * multiplier) / 100;
            nonce++;

            if (damage >= battle.playerStats.TOTAL_HP) {
                battle.playerStats.TOTAL_HP = 0;
            } else {
                battle.playerStats.TOTAL_HP -= damage;
            }
        }
        settleBattle(battle, nonce);
    }


    function settleBattle(AdventureBattle memory battle, uint nonce) internal {
        if (battle.playerStats.TOTAL_HP == 0) {

            // lose, end battle, cooldown
            timer[battle.summoner] = block.timestamp + COOLDOWN;
            delete activeBattles[battle.summoner];
            ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).setSummonerState(
                battle.summoner,
                GameEntities.SummonerState.FREE
            );
        } else if (battle.monsterStats.TOTAL_HP == 0) {

            // win
            // TODO, roll rewards,
            IAdventure.AdventureLevel memory _level =
            ICodexAdventures(
                contractAddress(INavigator.CONTRACT.ADVENTURES_CODEX)
            ).adventure(battle.adventureArea, battle.adventureLevel);
            IGameRewards.Reward memory rewardPool = _level.Rewards;
            IReward(contractAddress(INavigator.CONTRACT.REWARDS)).reward(msg.sender, rewardPool, nonce);
            nonce++;
            // end battle, cooldown
            timer[battle.summoner] = block.timestamp + COOLDOWN;
            ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).setSummonerState(
                battle.summoner,
                GameEntities.SummonerState.FREE
            );
            delete activeBattles[battle.summoner];


        } else {
            battleNonce = nonce;
            activeBattles[battle.summoner].monsterStats = battle.monsterStats;
            activeBattles[battle.summoner].playerStats = battle.playerStats;
        }
    }




    event Roll(uint roll);

    function getHitRolls(uint summoner, AdventureBattle memory battle) internal returns (bool, bool, uint nonce) {
        nonce = battleNonce;
        ICodexRandom RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        nonce++;
        uint roll1 = RNG.d100(1 + summoner + nonce);
        emit Roll(roll1);

        // if player dodges or monster misses, skip atk, else roll crit chance

        uint roll2 = RNG.d100(1 + battle.monster.monsterId + nonce);
        nonce++;
        emit Roll(roll2);
        return (roll1 <= battle.playerStats.HIT_CHANCE,
        roll2 <= battle.monsterStats.HIT_CHANCE,
        nonce);
    }

    function getCritRoll(uint summoner, uint critChance, uint nonce) internal returns (bool, uint) {
        ICodexRandom RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        uint roll = RNG.d100(nonce);
        return (critChance <= roll, roll);
    }

    function getMonster(uint adventureArea,
        uint adventureLevel) internal view returns (IMonster.Monster memory, IAdventure.AdventureMonster memory) {

        IAdventure.AdventureLevel memory _level =
        ICodexAdventures(
            contractAddress(INavigator.CONTRACT.ADVENTURES_CODEX)
        ).adventure(adventureArea, adventureLevel);
        return pickMonster(_level);
    }

    function pickMonster(IAdventure.AdventureLevel memory _level) internal view returns (IMonster.Monster memory, IAdventure.AdventureMonster memory) {
        uint monsterIdx = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).dn(
            block.number + getGlobalNonce() + battleNonce,
            _level.MonsterList.length);

        IAdventure.AdventureMonster memory _adventureMonster = _level.MonsterList[monsterIdx];
        IMonster.Monster memory monster = ICodexEnemies(
            contractAddress(INavigator.CONTRACT.CODEX_ENEMIES)).enemy(
            _adventureMonster.element,
            _adventureMonster.monsterId,
            _level.MonsterLevel
        );
        return (monster, _adventureMonster);
    }

}
