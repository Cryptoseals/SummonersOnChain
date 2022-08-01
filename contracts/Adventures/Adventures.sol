import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {InitNavigator, INavigator, GameEntities, ISummoners} from "../Core/Navigator/InitNavigator.sol";
import {ICalculator} from "../Interfaces/Core/Calculator/ICalculator.sol";
import {ICodexAdventures, IAdventure} from "../Interfaces/Codex/ICodexAdventures.sol";
import {ICodexEnemies, IMonster} from "../Interfaces/Codex/ICodexEnemies.sol";
import {EquipableUtils} from "../Inventory/EquipableUtils.sol";
import {ICodexRandom} from "../Interfaces/Codex/ICodexRandom.sol";
import {IReward, IGameRewards} from "../Interfaces/Reward/IReward.sol";
import {GameObjects_Stats} from "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ConsumableInventory {
    function reduceConsumableDuration(uint summoner) external;
}

contract Adventures is Initializable, InitNavigator, OwnableUpgradeable {
    ICodexRandom RNG;
    uint battleNonce;
    uint battleId;
    mapping(uint => uint) public timer;
    uint public COOLDOWN;
    IReward rewardContract;
    ICodexAdventures adventureCodex;
    ICalculator calculatorContract;
    ConsumableInventory elixirInventory;
    ICodexEnemies enemyCodex;
    // summoner -> battle
    mapping(uint => IAdventure.AdventureBattle) public activeBattles;

    function initialize(address _navigator) external initializer {
        __Ownable_init();
        initializeNavigator(_navigator);
    }

    function initializeContracts() external {
        RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        rewardContract = IReward(contractAddress(INavigator.CONTRACT.REWARDS));
        adventureCodex = ICodexAdventures(
            contractAddress(INavigator.CONTRACT.ADVENTURES_CODEX)
        );
        calculatorContract = ICalculator(contractAddress(INavigator.CONTRACT.CALCULATOR));
        elixirInventory = ConsumableInventory(contractAddress(INavigator.CONTRACT.INVENTORY));
        enemyCodex = ICodexEnemies(contractAddress(INavigator.CONTRACT.CODEX_ENEMIES));
        //        COOLDOWN = 1 minutes;
    }

    function setCooldown(uint _minutes) external onlyOwner {
        COOLDOWN = _minutes * 1 minutes;
    }

    function startBattle(uint summoner,
        uint adventureArea,
        uint adventureLevel) external ensureNotPaused
    senderIsSummonerOwner(summoner)
    notInFight(summoner) {
        require(timer[summoner] < block.timestamp, "early");
        timer[summoner] = block.timestamp + COOLDOWN;
        uint lvl = Summoners.level(summoner);
        (
        IMonster.Monster memory _monster,
        IAdventure.AdventureMonster memory _advMonster
        ) = getMonster(adventureArea, adventureLevel, lvl);

        (
        GameObjects_Stats.BattleStats memory _summonerStats,
        GameObjects_Stats.BattleStats memory _monsterStats
        ) = calculatorContract.PVEBattleStats(summoner, _monster);

        activeBattles[summoner] = IAdventure.AdventureBattle({
        account : msg.sender,
        battleId : battleId,
        summoner : summoner,
        adventureArea : adventureArea,
        adventureLevel : adventureLevel,
        monster : _advMonster,
        playerStats : _summonerStats,
        monsterStats : _monsterStats,
        isActive : true
        });

        battleNonce++;
        battleId++;
        Summoners.setSummonerState(
            summoner,
            GameEntities.SummonerState.IN_FIGHT
        );
    }

    function flee(uint summoner) external onlyGameContracts {
        require(activeBattles[summoner].account != address(0) && activeBattles[summoner].isActive == true, "h4x0r");
        delete activeBattles[summoner];
        timer[summoner] = block.timestamp + COOLDOWN * 4;
        Summoners.setSummonerState(
            summoner,
            GameEntities.SummonerState.FREE
        );
        elixirInventory.reduceConsumableDuration(summoner);
    }

    function attack(uint summoner, uint multiplier, uint overrideDps) external onlyGameContracts {
        require(activeBattles[summoner].account != address(0), "no battle");

        IAdventure.AdventureBattle memory battle = activeBattles[summoner];
        if (overrideDps > 0) battle.playerStats.DPS = overrideDps;
        require(battle.monsterStats.TOTAL_HP > 0 && battle.playerStats.TOTAL_HP > 0, "dead");

        (
        bool playerHits,
        bool monsterHits,
        uint nonce) = getHitRolls(summoner, battle);
        // if monster dodges or player misses, skip atk, else roll crit chance
        if (playerHits) {
            (bool isCrit, uint roll) = getCritRoll(summoner, battle.playerStats.CRIT_CHANCE, nonce);
            uint damage = isCrit
            ?
            (battle.playerStats.DPS * multiplier) / 100 +
            (battle.playerStats.DPS * battle.playerStats.CRIT_MULTI) / 100
            :
            (battle.playerStats.DPS * multiplier) / 100;

            nonce += roll + 1;

            if (damage >= battle.monsterStats.TOTAL_HP) {
                battle.monsterStats.TOTAL_HP = 0;
            } else {
                battle.monsterStats.TOTAL_HP -= damage;
            }
        }

        if (monsterHits) {
            (bool isCrit, uint roll) = getCritRoll(battle.monster.monsterId + block.number,
                battle.monsterStats.CRIT_CHANCE, nonce + 1881);

            uint damage = isCrit
            ?
            (battle.monsterStats.DPS * multiplier) / 100 +
            (battle.monsterStats.DPS * battle.monsterStats.CRIT_MULTI) / 100
            :
            (battle.monsterStats.DPS * multiplier) / 100;
            nonce += roll + 1938;

            if (damage >= battle.playerStats.TOTAL_HP) {
                battle.playerStats.TOTAL_HP = 0;
            } else {
                battle.playerStats.TOTAL_HP -= damage;
            }
        }
        if (overrideDps > 0) {
            battle.playerStats.DPS = activeBattles[summoner].playerStats.DPS;
        }
        activeBattles[summoner].monsterStats = battle.monsterStats;
        activeBattles[summoner].playerStats = battle.playerStats;
        battleNonce = nonce + 1;
    }

    function settleBattle(uint summoner) external onlyGameContracts {
        IAdventure.AdventureBattle memory battle = activeBattles[summoner];
        require(battle.isActive, "finalized");
        uint nonce = battleNonce;
        if (battle.playerStats.TOTAL_HP == 0 && battle.monsterStats.TOTAL_HP > 0) {
            // lose, end battle, cooldown
            rewardContract.halfRewardXP(summoner, battle.monster.level);
            timer[battle.summoner] = block.timestamp + (COOLDOWN * 2);
        } else if (battle.monsterStats.TOTAL_HP == 0) {
            // win
            IAdventure.AdventureLevel memory _level = adventureCodex.adventure(battle.adventureArea, battle.adventureLevel);
            IGameRewards.Reward memory rewardPool = _level.Rewards;
            _level.Rewards.bonus = 100;

            if (battle.monster.level > _level.MonsterLevel) {
                uint diff = battle.monster.level - _level.MonsterLevel;
                _level.Rewards.bonus = diff > 10 ? 200 : (100 + (diff * 10));
            }

            rewardContract.reward(
                battle.account,
                summoner,
                battle.monster.level,
                _level.Rewards,
                _level.CurrencyRewards,
                nonce);

            nonce++;
            // end battle, cooldown
            timer[battle.summoner] = block.timestamp + COOLDOWN;
        } else {
            revert("on going");
        }

        Summoners.setSummonerState(
            battle.summoner,
            GameEntities.SummonerState.FREE
        );
        delete activeBattles[battle.summoner];
        battleNonce = nonce;
        elixirInventory.reduceConsumableDuration(summoner);
    }


    event Roll(uint roll);

    function getHitRolls(uint summoner, IAdventure.AdventureBattle memory battle) internal returns (bool, bool, uint nonce) {
        nonce = battleNonce;
        nonce++;
        uint roll1 = RNG.d100(1 + summoner + nonce);

        // if player dodges or monster misses, skip atk, else roll crit chance

        nonce += 1001;
        uint roll2 = RNG.d100(2 + summoner + block.number + battle.monster.monsterId + nonce);
        nonce++;
        return (
        roll1 <= battle.playerStats.HIT_CHANCE,
        roll2 <= battle.monsterStats.HIT_CHANCE,
        nonce);
    }

    function getCritRoll(uint summoner, uint critChance, uint nonce) internal returns (bool, uint) {
        uint roll = RNG.d100(nonce);
        return (roll <= critChance, roll);
    }

    function getMonster(uint adventureArea,
        uint adventureLevel, uint summonerLvl) internal view returns (IMonster.Monster memory, IAdventure.AdventureMonster memory) {

        IAdventure.AdventureLevel memory _level =
        adventureCodex.adventure(adventureArea, adventureLevel);
        require(summonerLvl + 4 >= _level.MonsterLevel, "low lvl");
        return pickMonster(_level, summonerLvl);
    }

    function pickMonster(IAdventure.AdventureLevel memory _level, uint summonerLvl) internal view returns (IMonster.Monster memory, IAdventure.AdventureMonster memory) {
        uint monsterIdx = RNG.dn(
            block.number + battleNonce,
            _level.MonsterList.length);

        IAdventure.AdventureMonster memory _adventureMonster = _level.MonsterList[monsterIdx];
        _adventureMonster.level = summonerLvl > _level.MonsterLevel + 5 ? summonerLvl - 3 : _level.MonsterLevel;
        IMonster.Monster memory monster = enemyCodex.enemy(
            _adventureMonster.element,
            _adventureMonster.monsterId,
            _adventureMonster.level
        );
        if (_level.Difficulty > 100) {
            monster.EnemyStats = EquipableUtils.sumStatsAsTier(monster.EnemyStats, _level.Difficulty);
            monster.EnemyGeneratedStats = EquipableUtils.sumGeneratedStatsAsTier(monster.EnemyGeneratedStats, _level.Difficulty);
            monster.EnemyElementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(monster.EnemyElementalStats, _level.Difficulty);
        }
        return (monster, _adventureMonster);
    }

    function activeBattle(uint summoner) external view returns (IAdventure.AdventureBattle memory){
        return activeBattles[summoner];
    }

}
