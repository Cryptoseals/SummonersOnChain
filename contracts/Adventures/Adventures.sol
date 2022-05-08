import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/Core/Calculator/ICalculator.sol";
import "../Interfaces/Codex/ICodexAdventures.sol";
import "../Interfaces/Codex/ICodexEnemies.sol";
import "../Inventory/EquipableUtils.sol";
import "../Interfaces/Codex/ICodexRandom.sol";

pragma solidity ^0.8.0;

contract Adventures is Initializable, InitNavigator, OwnableUpgradeable {
    ICodexRandom RNG;
    ICalculator calculator;

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
        RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        calculator = ICalculator(contractAddress(INavigator.CONTRACT.CALCULATOR));
        COOLDOWN = 15 minutes;
    }

    function setCooldown(uint _minutes) external onlyOwner {
        COOLDOWN = _minutes * 1 minutes;
    }

    function startBattle(uint summoner,
        uint adventureArea,
        uint adventureLevel) external ensureNotPaused
    senderIsSummonerOwner(summoner) notInFight(summoner) {
        require(timer[summoner] < block.timestamp, "early");
        timer[summoner] += block.timestamp + COOLDOWN;
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
        ISummoners(Navigator.getContractAddress(INavigator.CONTRACT.SUMMONERS)).setSummonerState(
            summoner,
            GameEntities.SummonerState.IN_FIGHT
        );
    }

    function flee(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        require(activeBattles[summoner].account == msg.sender, "no battle");
        delete activeBattles[summoner];
        timer[summoner] = block.timestamp + COOLDOWN * 4;
        ISummoners(Navigator.getContractAddress(INavigator.CONTRACT.SUMMONERS)).setSummonerState(
            summoner,
            GameEntities.SummonerState.FREE
        );
    }

    function attack(uint summoner) external onlyGameContracts {
        AdventureBattle memory battle = activeBattles[summoner];
        (
        bool playerHits,
        bool monsterDodges,
        bool monsterHits,
        bool playerDodges,
        uint nonce) = getHitRolls(summoner, battle);
        // if monster dodges or player misses, skip atk, else roll crit chance
        if (playerHits) {
            if (!monsterDodges) {
                uint damage = battle.playerStats.DPS;

                (bool isCrit, uint _nonce) = getCritRoll(summoner, battle.playerStats.CRIT_CHANCE);
                nonce = _nonce;
                if (isCrit) {
                    damage = (damage * battle.playerStats.CRIT_MULTI) * 100;
                }
                battle = applyPlayerDamage(battle, damage);
            }
        }

        if (monsterHits) {
            if (!playerDodges) {
                uint damage = battle.monsterStats.DPS;
                (bool isCrit, uint _nonce) = getCritRoll(battle.monster.monsterId + block.number,
                    battle.monsterStats.CRIT_CHANCE);
                nonce = _nonce;
                if (isCrit) {
                    damage = (damage * battle.playerStats.CRIT_MULTI) * 100;
                }
                battle = applyMonsterDamage(battle, damage);
            }
        }

        settleBattle(battle);
    }


    function settleBattle (AdventureBattle memory battle, uint nonce) internal {
        if(battle.playerStats.TOTAL_HP == 0) {
            // win

            // TODO, roll rewards,

            // end battle, cooldown
        }

        if(battle.monsterStats.TOTAL_HP == 0) {
            // lose, end battle, cooldown
        }
    }

    function applyPlayerDamage(AdventureBattle memory battle, uint dmg) internal returns (AdventureBattle memory) {
        if (dmg > battle.monsterStats.TOTAL_HP) {
            battle.monsterStats.TOTAL_HP = 0;
        } else {
            battle.monsterStats.TOTAL_HP -= dmg;
        }
        return battle;
    }

    function applyMonsterDamage(AdventureBattle memory battle, uint dmg) internal returns (AdventureBattle memory) {
        if (dmg > battle.monsterStats.TOTAL_HP) {
            battle.playerStats.TOTAL_HP = 0;
        } else {
            battle.playerStats.TOTAL_HP -= dmg;
        }
        return battle;
    }

    function getHitRolls(uint summoner, AdventureBattle memory battle) internal view returns (bool, bool, bool, bool, uint nonce) {
        nonce = battleNonce;
        bool playerHits = calculator.IsSuccessfulDiceRoll100(summoner, block.number + nonce, battle.playerStats.HIT_CHANCE);
        nonce++;
        bool monsterDodges = calculator.IsSuccessfulDiceRoll100(summoner, block.number + nonce, battle.monsterStats.DODGE_CHANCE);
        nonce++;

        // if player dodges or monster misses, skip atk, else roll crit chance

        bool monsterHits = calculator.IsSuccessfulDiceRoll100(summoner, block.number + nonce, battle.monsterStats.HIT_CHANCE);
        nonce++;
        bool playerDodges = calculator.IsSuccessfulDiceRoll100(summoner, block.number + nonce, battle.playerStats.DODGE_CHANCE);
        nonce++;

        return (playerHits,
        monsterDodges,
        monsterHits,
        playerDodges, nonce);
    }

    function getCritRoll(uint summoner, uint critChance) internal view returns (bool isCrit, uint nonce) {
        nonce = battleNonce;
        isCrit = calculator.IsSuccessfulDiceRoll100(summoner, block.number + nonce, critChance);
        nonce++;
    }

    function getMonster(uint adventureArea,
        uint adventureLevel) internal view returns (IMonster.Monster memory, IAdventure.AdventureMonster memory) {

        IAdventure.AdventureLevel memory _level =
        ICodexAdventures(
            contractAddress(INavigator.CONTRACT.ADVENTURES)
        ).adventure(adventureArea, adventureLevel);
        return pickMonster(_level);
    }

    function pickMonster(IAdventure.AdventureLevel memory _level) internal view returns (IMonster.Monster memory, IAdventure.AdventureMonster memory) {
        uint monsterIdx = RNG.dn(
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
