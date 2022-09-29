import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {InitNavigator, INavigator, ISummoners} from "../Core/Navigator/InitNavigator.sol";
import {SummonerMetadata, SummonerState, SummonerData} from "../Interfaces/GameObjects/IGameEntities.sol";
import {ICalculator} from "../Interfaces/Core/Calculator/ICalculator.sol";
import {ICodexAdventures} from "../Interfaces/Codex/ICodexAdventures.sol";
import {ICodexEnemies, IMonster} from "../Interfaces/Codex/ICodexEnemies.sol";
import {EquipableUtils} from "../Inventory/EquipableUtils.sol";
import {ICodexRandom} from "../Interfaces/Codex/ICodexRandom.sol";
import {IReward, Reward} from "../Interfaces/Reward/IReward.sol";
import {BattleStats} from "../Interfaces/GameObjects/IGameObjects.sol";
import {AdventureBattle, AdventureMonster, AdventureLevel} from "../Interfaces/GameObjects/IAdventure.sol";
pragma solidity ^0.8.0;

interface ConsumableInventory {
    function reduceConsumableDuration(uint256 summoner) external;
}

contract Adventures is Initializable, InitNavigator, OwnableUpgradeable {
    ICodexRandom RNG;
    uint256 battleNonce;
    uint256 battleId;
    mapping(uint256 => uint256) public timer;
    uint256 public COOLDOWN;
    IReward rewardContract;
    ICodexAdventures adventureCodex;
    ICalculator calculatorContract;
    ConsumableInventory elixirInventory;
    ICodexEnemies enemyCodex;
    // summoner -> battle
    mapping(uint256 => AdventureBattle) public activeBattles;

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
        calculatorContract = ICalculator(
            contractAddress(INavigator.CONTRACT.CALCULATOR)
        );
        elixirInventory = ConsumableInventory(
            contractAddress(INavigator.CONTRACT.INVENTORY)
        );
        enemyCodex = ICodexEnemies(
            contractAddress(INavigator.CONTRACT.CODEX_ENEMIES)
        );
        COOLDOWN = 10 minutes;
    }

    function setCooldown(uint256 _minutes) external onlyOwner {
        COOLDOWN = _minutes * 1 minutes;
    }

    function startBattle(
        uint256 summoner,
        uint256 adventureArea,
        uint256 adventureLevel
    )
        external
        ensureNotPaused
        senderIsSummonerOwner(summoner)
        notInFight(summoner)
    {
        require(timer[summoner] < block.timestamp, "early");
        timer[summoner] = block.timestamp + COOLDOWN;
        uint256 lvl = Summoners.level(summoner);
        (
            IMonster.Monster memory _monster,
            AdventureMonster memory _advMonster
        ) = getMonster(adventureArea, adventureLevel, lvl);

        (
            BattleStats memory _summonerStats,
            BattleStats memory _monsterStats
        ) = calculatorContract.PVEBattleStats(summoner, _monster);
        _summonerStats.MAX_HP = _summonerStats.TOTAL_HP;
        _monsterStats.MAX_HP = _monsterStats.TOTAL_HP;

        activeBattles[summoner] = AdventureBattle({
            account: msg.sender,
            battleId: battleId,
            summoner: summoner,
            adventureArea: adventureArea,
            adventureLevel: adventureLevel,
            monster: _advMonster,
            playerStats: _summonerStats,
            monsterStats: _monsterStats,
            isActive: true
        });

        battleNonce++;
        battleId++;
        Summoners.setSummonerState(summoner, SummonerState.IN_FIGHT);
    }

    function flee(uint256 summoner) external onlyGameContracts {
        require(
            activeBattles[summoner].account != address(0) &&
                activeBattles[summoner].isActive == true,
            "h4x0r"
        );
        delete activeBattles[summoner];
        timer[summoner] = block.timestamp + COOLDOWN * 4;
        Summoners.setSummonerState(summoner, SummonerState.FREE);
        elixirInventory.reduceConsumableDuration(summoner);
    }

    function attack(
        uint256 summoner,
        uint256 multiplier,
        uint256 overrideDps
    ) external onlyGameContracts returns (uint256 _dealt) {
        require(activeBattles[summoner].account != address(0), "no battle");

        AdventureBattle memory battle = activeBattles[summoner];
        if (overrideDps > 0) battle.playerStats.DPS = overrideDps;
        require(
            battle.monsterStats.TOTAL_HP > 0 && battle.playerStats.TOTAL_HP > 0,
            "dead"
        );

        (bool playerHits, bool monsterHits, uint256 nonce) = getHitRolls(
            summoner,
            battle
        );
        // if monster dodges or player misses, skip atk, else roll crit chance
        if (playerHits) {
            (bool isCrit, uint256 roll) = getCritRoll(
                summoner,
                battle.playerStats.CRIT_CHANCE,
                nonce
            );
            uint256 damage = isCrit
                ? (battle.playerStats.DPS * multiplier) /
                    100 +
                    (battle.playerStats.DPS * battle.playerStats.CRIT_MULTI) /
                    100
                : (battle.playerStats.DPS * multiplier) / 100;

            nonce += roll + 1;

            if (damage >= battle.monsterStats.TOTAL_HP) {
                battle.monsterStats.TOTAL_HP = 0;
                _dealt = 0;
            } else {
                battle.monsterStats.TOTAL_HP -= damage;
                _dealt = damage;
            }
        }

        if (monsterHits) {
            (bool isCrit, uint256 roll) = getCritRoll(
                battle.monster.monsterId + block.number,
                battle.monsterStats.CRIT_CHANCE,
                nonce + 1881
            );

            uint256 damage = isCrit
                ? (battle.monsterStats.DPS * multiplier) /
                    100 +
                    (battle.monsterStats.DPS * battle.monsterStats.CRIT_MULTI) /
                    100
                : (battle.monsterStats.DPS * multiplier) / 100;
            nonce += roll + 1938;

            if (damage >= battle.playerStats.TOTAL_HP) {
                battle.playerStats.TOTAL_HP = 0;
            } else {
                battle.playerStats.TOTAL_HP -= damage;
            }
        }

        activeBattles[summoner].monsterStats = battle.monsterStats;
        activeBattles[summoner].playerStats = battle.playerStats;
        battleNonce = nonce + 1;
    }

    function heal(
        uint256 summoner,
        uint256 minHealAmount,
        uint256 maxHealAmount,
        bool isPercentage
    ) external onlyGameContracts {
        require(activeBattles[summoner].account != address(0), "no battle");
        require(minHealAmount > 0, "0h");
        AdventureBattle memory battle = activeBattles[summoner];
        uint256 roll = maxHealAmount == 0
            ? 0
            : RNG.dn(
                block.number + minHealAmount + maxHealAmount + 1881,
                maxHealAmount - minHealAmount
            );
        uint256 toHeal = minHealAmount + roll;

        uint256 finalAmount = isPercentage
            ? (battle.playerStats.MAX_HP * toHeal) / 100
            : toHeal;

        battle.playerStats.TOTAL_HP += finalAmount >= battle.playerStats.MAX_HP
            ? battle.playerStats.MAX_HP
            : finalAmount;
    }

    function settleBattle(uint256 summoner) external onlyGameContracts {
        AdventureBattle memory battle = activeBattles[summoner];
        require(battle.isActive, "finalized");
        uint256 nonce = battleNonce;
        if (
            battle.playerStats.TOTAL_HP == 0 && battle.monsterStats.TOTAL_HP > 0
        ) {
            // lose, end battle, cooldown
            rewardContract.halfRewardXP(summoner, battle.monster.level);
            timer[battle.summoner] = block.timestamp + (COOLDOWN * 2);
        } else if (battle.monsterStats.TOTAL_HP == 0) {
            // win
            AdventureLevel memory _level = adventureCodex.adventure(
                battle.adventureArea,
                battle.adventureLevel
            );
            Reward memory rewardPool = _level.Rewards;
            _level.Rewards.bonus = 100;

            if (battle.monster.level > _level.MonsterLevel) {
                uint256 diff = battle.monster.level - _level.MonsterLevel;
                _level.Rewards.bonus = diff > 10 ? 200 : (100 + (diff * 10));
            }

            rewardContract.reward(
                battle.account,
                summoner,
                battle.monster.level,
                _level.Rewards,
                _level.CurrencyRewards,
                nonce
            );

            nonce++;
            // end battle, cooldown
            timer[battle.summoner] = block.timestamp + COOLDOWN;
        } else {
            revert("on going");
        }

        Summoners.setSummonerState(battle.summoner, SummonerState.FREE);
        delete activeBattles[battle.summoner];
        battleNonce = nonce;
        elixirInventory.reduceConsumableDuration(summoner);
    }

    event Roll(uint256 roll);

    function getHitRolls(uint256 summoner, AdventureBattle memory battle)
        internal
        returns (
            bool,
            bool,
            uint256 nonce
        )
    {
        nonce = battleNonce;
        nonce++;
        uint256 roll1 = RNG.d100(1 + summoner + nonce);

        // if player dodges or monster misses, skip atk, else roll crit chance

        nonce += 1001;
        uint256 roll2 = RNG.d100(
            2 + summoner + block.number + battle.monster.monsterId + nonce
        );
        nonce++;
        return (
            roll1 <= battle.playerStats.HIT_CHANCE,
            roll2 <= battle.monsterStats.HIT_CHANCE,
            nonce
        );
    }

    function getCritRoll(
        uint256 summoner,
        uint256 critChance,
        uint256 nonce
    ) internal returns (bool, uint256) {
        uint256 roll = RNG.d100(nonce);
        return (roll <= critChance, roll);
    }

    function getMonster(
        uint256 adventureArea,
        uint256 adventureLevel,
        uint256 summonerLvl
    ) internal view returns (IMonster.Monster memory, AdventureMonster memory) {
        AdventureLevel memory _level = adventureCodex.adventure(
            adventureArea,
            adventureLevel
        );
        require(summonerLvl + 4 >= _level.MonsterLevel, "low lvl");
        return pickMonster(_level, summonerLvl);
    }

    function pickMonster(AdventureLevel memory _level, uint256 summonerLvl)
        internal
        view
        returns (IMonster.Monster memory, AdventureMonster memory)
    {
        uint256 monsterIdx = RNG.dn(
            block.number + battleNonce,
            _level.MonsterList.length
        );

        AdventureMonster memory _adventureMonster = _level.MonsterList[
            monsterIdx
        ];
        _adventureMonster.level = summonerLvl > _level.MonsterLevel + 5
            ? summonerLvl - 3
            : _level.MonsterLevel;
        IMonster.Monster memory monster = enemyCodex.enemy(
            _adventureMonster.element,
            _adventureMonster.monsterId,
            _adventureMonster.level
        );
        if (_level.Difficulty > 100) {
            monster.EnemyStats = EquipableUtils.sumStatsAsTier(
                monster.EnemyStats,
                _level.Difficulty * 10
            );
            monster.EnemyGeneratedStats = EquipableUtils
                .sumGeneratedStatsAsTier(
                    monster.EnemyGeneratedStats,
                    _level.Difficulty * 10
                );
            monster.EnemyElementalStats = EquipableUtils
                .sumGeneratedElementalStatsAsTier(
                    monster.EnemyElementalStats,
                    _level.Difficulty * 10
                );
        }
        return (monster, _adventureMonster);
    }

    function activeBattle(uint256 summoner)
        external
        view
        returns (AdventureBattle memory)
    {
        return activeBattles[summoner];
    }
}
