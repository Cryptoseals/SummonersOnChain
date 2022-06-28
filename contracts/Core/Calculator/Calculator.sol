import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {ICalculator} from "../../Interfaces/Core/Calculator/ICalculator.sol";
import {InitNavigator, INavigator} from "../../Core/Navigator/InitNavigator.sol";
import {ICodexRandom} from "../../Interfaces/Codex/ICodexRandom.sol";
import {IAttributes} from "../../Interfaces/Attributes/IAttributes.sol";
import {GameConstants} from "../../Interfaces/Core/Constants/Constants.sol";
import {EquipableUtils, GameObjects} from "../../Inventory/EquipableUtils.sol";
import {IEquipable} from "../../Interfaces/Inventory/IEquipable.sol";
import {IElixirAndArtifactSlots} from "../../Interfaces/Inventory/IElixirAndArtifactSlots.sol";
import {ISummoners} from "../../Interfaces/Summoners/ISummoners.sol";
import {IMonster} from "../../Interfaces/GameObjects/IMonster.sol";

/*
            Generated stats
            Health
            equipTotalHP+(lvl*10)+(vit*10)
            DPS
            attack * stat / enemy armor
            Attack
            (equipTotalAttack+(1+(STR/100/2))+STR/2)
            Magic Attack
            (equipTotalMagicAttack+(1+(INT/100/2))+INT/2)
            Defence
            (vit/2)+(lv/4)
            Magic Defence
            (int/2)+(lv/4)
            Accuracy
            1+(dex/2)
            Dodge
            1+(agi/3)
            Critical Chance
            (1+luk/3)/100
*/
pragma solidity ^0.8.0;

contract Calculator is Initializable, InitNavigator {


    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }


    function PVEBattleStats(uint summoner,
        IMonster.Monster memory _monster) external view returns (GameObjects.BattleStats memory,
        GameObjects.BattleStats memory) {
        (
        GameObjects.Stats memory _statsBase1,
        GameObjects.GeneratedStats memory _genStatsFromEquips1,
        GameObjects.ElementalStats memory _eleStatsFromEquips1,
        uint lvl
        ) = getAllStats(summoner);

        (GameObjects.BattleStats memory player,
        GameObjects.BattleStats memory monster) = GetBattleStats(
            _statsBase1,
            _genStatsFromEquips1,
            _eleStatsFromEquips1,
            _monster.EnemyStats,
            _monster.EnemyGeneratedStats,
            _monster.EnemyElementalStats);

        //        player.TOTAL_HP += lvl * 10;

        return (player, monster);
    }

    function BattleStats(GameObjects.Stats memory _stats1,
        GameObjects.GeneratedStats memory _gen_stats1,
        GameObjects.ElementalStats memory _eleStats1,
        GameObjects.Stats memory _stats2,
        GameObjects.GeneratedStats memory _gen_stats2,
        GameObjects.ElementalStats memory _eleStats2) external view returns (GameObjects.BattleStats memory,
        GameObjects.BattleStats memory) {
        return GetBattleStats(_stats1,
            _gen_stats1,
            _eleStats1,
            _stats2,
            _gen_stats2,
            _eleStats2);
    }

    function VSBattleStats(uint summoner, uint summoner2) external view returns (
        GameObjects.BattleStats memory,
        GameObjects.BattleStats memory
    ){
        (
        GameObjects.Stats memory _stats1,
        GameObjects.GeneratedStats memory _genStatsFromEquips1,
        GameObjects.ElementalStats memory _eleStatsFromEquips1,) = getAllStats(summoner);

        (
        GameObjects.Stats memory _stats2,
        GameObjects.GeneratedStats memory _genStatsFromEquips2,
        GameObjects.ElementalStats memory _eleStatsFromEquips2,) = getAllStats(summoner2);

        (
        GameObjects.BattleStats memory _battleStats1,
        GameObjects.BattleStats memory _battleStats2
        ) = GetBattleStats(
            _stats1,
            _genStatsFromEquips1,
            _eleStatsFromEquips1,
            _stats2,
            _genStatsFromEquips2,
            _eleStatsFromEquips2
        );

        return (_battleStats1, _battleStats2);
    }


    function GetBattleStats(
        GameObjects.Stats memory _stats1,
        GameObjects.GeneratedStats memory _gen_stats1,
        GameObjects.ElementalStats memory _eleStats1,
        GameObjects.Stats memory _stats2,
        GameObjects.GeneratedStats memory _gen_stats2,
        GameObjects.ElementalStats memory _eleStats2
    ) internal view returns (
        GameObjects.BattleStats memory _battleStats1,
        GameObjects.BattleStats memory _battleStats2) {

        if (_eleStats1.SummonerDamageType == GameObjects.Element.PHYSICAL) {
            _battleStats1.DPS = DPSWDecimals(_gen_stats1.P_ATK, _stats1.STR, _gen_stats2.P_DEF, _gen_stats1.INFUSION);
        } else if (_eleStats1.SummonerDamageType == GameObjects.Element.ARCANE) {
            _battleStats1.DPS = DPSWDecimals(_gen_stats1.M_ATK, _stats1.INT, _gen_stats2.M_DEF, _gen_stats1.INFUSION);
        } else if (_eleStats1.SummonerDamageType == GameObjects.Element.FIRE) {
            _battleStats1.DPS = DPSWDecimals(_eleStats1.ElementalAtk.FIRE_ATK, _stats1.INT > _stats1.STR ? _stats1.INT : _stats1.STR,
                _eleStats2.ElementalDef.FIRE_DEF, _gen_stats1.INFUSION);
        } else if (_eleStats1.SummonerDamageType == GameObjects.Element.COLD) {
            _battleStats1.DPS = DPSWDecimals(_eleStats1.ElementalAtk.COLD_ATK, _stats1.INT > _stats1.STR ? _stats1.INT : _stats1.STR,
                _eleStats2.ElementalDef.COLD_DEF, _gen_stats1.INFUSION);
        } else if (_eleStats1.SummonerDamageType == GameObjects.Element.EARTH) {
            _battleStats1.DPS = DPSWDecimals(_eleStats1.ElementalAtk.EARTH_ATK, _stats1.INT > _stats1.STR ? _stats1.INT : _stats1.STR,
                _eleStats2.ElementalDef.EARTH_DEF, _gen_stats1.INFUSION);
        } else if (_eleStats1.SummonerDamageType == GameObjects.Element.LIGHTNING) {
            _battleStats1.DPS = DPSWDecimals(_eleStats1.ElementalAtk.LIGHTNING_ATK, _stats1.INT > _stats1.STR ? _stats1.INT : _stats1.STR,
                _eleStats2.ElementalDef.LIGHTNING_DEF, _gen_stats1.INFUSION);
        } else if (_eleStats1.SummonerDamageType == GameObjects.Element.DARK) {
            _battleStats1.DPS = DPSWDecimals(_eleStats1.ElementalAtk.DARK_ATK, _stats1.INT > _stats1.STR ? _stats1.INT : _stats1.STR,
                _eleStats2.ElementalDef.DARK_DEF, _gen_stats1.INFUSION);
        } else if (_eleStats1.SummonerDamageType == GameObjects.Element.HOLY) {
            _battleStats1.DPS = DPSWDecimals(_eleStats1.ElementalAtk.HOLY_ATK, _stats1.INT > _stats1.STR ? _stats1.INT : _stats1.STR,
                _eleStats2.ElementalDef.HOLY_DEF, _gen_stats1.INFUSION);
        } else if (_eleStats1.SummonerDamageType == GameObjects.Element.VOID) {
            _battleStats1.DPS = DPSWDecimals(_eleStats1.ElementalAtk.VOID_ATK, _stats1.INT > _stats1.STR ? _stats1.INT : _stats1.STR,
                _eleStats2.ElementalDef.VOID_DEF, _gen_stats1.INFUSION);
        } else {
            revert("ELEM ERROR");
        }


        if (_eleStats2.SummonerDamageType == GameObjects.Element.PHYSICAL) {
            _battleStats2.DPS = DPSWDecimals(_gen_stats2.P_ATK, _stats2.STR, _gen_stats1.P_DEF, _gen_stats2.INFUSION);
        } else if (_eleStats2.SummonerDamageType == GameObjects.Element.ARCANE) {
            _battleStats2.DPS = DPSWDecimals(_gen_stats2.M_ATK, _stats2.INT, _gen_stats1.M_DEF, _gen_stats2.INFUSION);
        } else if (_eleStats2.SummonerDamageType == GameObjects.Element.FIRE) {
            _battleStats2.DPS = DPSWDecimals(_eleStats2.ElementalAtk.FIRE_ATK, _stats2.INT > _stats2.STR ? _stats2.INT : _stats2.STR,
                _eleStats1.ElementalDef.FIRE_DEF, _gen_stats2.INFUSION);
        } else if (_eleStats2.SummonerDamageType == GameObjects.Element.COLD) {
            _battleStats2.DPS = DPSWDecimals(_eleStats2.ElementalAtk.COLD_ATK, _stats2.INT > _stats2.STR ? _stats2.INT : _stats2.STR,
                _eleStats1.ElementalDef.COLD_DEF, _gen_stats2.INFUSION);
        } else if (_eleStats2.SummonerDamageType == GameObjects.Element.EARTH) {
            _battleStats2.DPS = DPSWDecimals(_eleStats2.ElementalAtk.EARTH_ATK, _stats2.INT > _stats2.STR ? _stats2.INT : _stats2.STR,
                _eleStats1.ElementalDef.EARTH_DEF, _gen_stats2.INFUSION);
        } else if (_eleStats2.SummonerDamageType == GameObjects.Element.LIGHTNING) {
            _battleStats2.DPS = DPSWDecimals(_eleStats2.ElementalAtk.LIGHTNING_ATK, _stats2.INT > _stats2.STR ? _stats2.INT : _stats2.STR,
                _eleStats1.ElementalDef.LIGHTNING_DEF, _gen_stats2.INFUSION);
        } else if (_eleStats2.SummonerDamageType == GameObjects.Element.DARK) {
            _battleStats2.DPS = DPSWDecimals(_eleStats2.ElementalAtk.DARK_ATK, _stats2.INT > _stats2.STR ? _stats2.INT : _stats2.STR,
                _eleStats1.ElementalDef.DARK_DEF, _gen_stats2.INFUSION);
        } else if (_eleStats2.SummonerDamageType == GameObjects.Element.HOLY) {
            _battleStats2.DPS = DPSWDecimals(_eleStats2.ElementalAtk.HOLY_ATK, _stats2.INT > _stats2.STR ? _stats2.INT : _stats2.STR,
                _eleStats1.ElementalDef.HOLY_DEF, _gen_stats2.INFUSION);
        } else if (_eleStats2.SummonerDamageType == GameObjects.Element.VOID) {
            _battleStats2.DPS = DPSWDecimals(_eleStats2.ElementalAtk.VOID_ATK, _stats2.INT > _stats2.STR ? _stats2.INT : _stats2.STR,
                _eleStats1.ElementalDef.VOID_DEF, _gen_stats2.INFUSION);
        } else {
            revert("ELEM ERROR2");
        }
        _battleStats1.CRIT_CHANCE = _gen_stats1.CRIT;
        _battleStats1.CRIT_MULTI = _gen_stats1.CRIT_MULTIPLIER;
        _battleStats1.TOTAL_HP = _gen_stats1.HP;
        _battleStats1.HIT_CHANCE = HitChance(_gen_stats1.ACCURACY, _gen_stats2.DODGE);


        _battleStats2.CRIT_CHANCE = _gen_stats2.CRIT;
        _battleStats2.CRIT_MULTI = _gen_stats2.CRIT_MULTIPLIER;
        _battleStats2.TOTAL_HP = _gen_stats2.HP;
        _battleStats2.HIT_CHANCE = HitChance(_gen_stats2.ACCURACY, _gen_stats1.DODGE);


    }

    // generated value based calculations
    function HitChance(uint ACC, uint DODGE) public pure returns (uint){
        uint chance = HitChanceWDecimals(ACC, DODGE) / GameConstants.GAME_DECIMAL;
        return chance >= 100 ? 100 : chance < 20 ? 20 : chance;
    }

    function HitChanceWDecimals(uint ACC, uint DODGE) public pure returns (uint) {
        //(100+(dodge - accuracy))/100
        int ACC_W_DECIMAL = int(ACC * GameConstants.GAME_DECIMAL);
        int DODGE_W_DECIMAL = int(DODGE * GameConstants.GAME_DECIMAL);
        int DIFF = (DODGE_W_DECIMAL - ACC_W_DECIMAL);
        int X = int(GameConstants.HUNDRED) + DIFF;
        uint chance = uint(int(GameConstants.HUNDRED) - (X / 100));
        return chance;
    }

    //    // chance based calculations
    //    function IsSuccessfulDiceRoll100(uint summoner, uint seed, uint chance) public view returns (bool, uint) {
    //        ICodexRandom RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
    //        uint roll = RNG.d100(seed);
    //        /* @notice */
    //        /* example: assume crit chance = 10, use rolled 80, 100-80=20, 20 <= 10, false*/
    //        /* example2: assume crit chance = 20, use rolled 80, 100-80=20, 20 <= 20, true*/
    //        return (roll <= chance, roll);
    //    }

    // STAT RELATED CALCULATIONS
    function DPS(uint ATK, uint STAT, uint DEF, uint PEN) external pure returns (uint){
        return DPSWDecimals(ATK, STAT, DEF, PEN) / GameConstants.GAME_DECIMAL;
    }

    function DPSWDecimals(uint ATK, uint STAT, uint DEF, uint PEN) public pure returns (uint) {
        if (ATK == 0) return 0;
        if (DEF == 0) return ATK;
        uint DEF_PENETRATED = DEF - (((DEF) * PEN) / 100);
        uint FINAL_ATK = ATK * STAT / DEF_PENETRATED;
        return FINAL_ATK;
    }

    function P_ATK(uint summoner) public view returns (uint) {
        (
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return ATK(_generatedStatsFromEquipments.P_ATK, _statsFromEquipments.STR) / GameConstants.GAME_DECIMAL;
    }

    function M_ATK(uint summoner) public view returns (uint) {
        (
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return ATK(_generatedStatsFromEquipments.M_ATK, _statsFromEquipments.INT) / GameConstants.GAME_DECIMAL;
    }

    function ATK(uint STAT, uint ATK) public pure returns (uint) {
        // (equipTotalAttack+(1+STR/30)
        return ATK + 1 + (STAT / 30);
    }

    function P_DEF(uint summoner) public view returns (uint) {
        (
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,uint lvl) = getAllStats(summoner);
        return DEFW(_generatedStatsFromEquipments.P_DEF, _statsFromEquipments.VIT, lvl) / GameConstants.GAME_DECIMAL;
    }

    function M_DEF(uint summoner) public view returns (uint) {
        (
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,uint lvl) = getAllStats(summoner);
        return DEFW(_generatedStatsFromEquipments.M_DEF, _statsFromEquipments.INT, lvl) / GameConstants.GAME_DECIMAL;
    }

    function DEFW(uint DEF, uint STAT, uint LVL) public pure returns (uint) {
        // (vitOrInt / 2)+(lv/4)
        return DEF + (STAT / 20) + (LVL / 4);
    }

    function ACCURACY(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return ACCU(_generatedStatsFromEquipments.ACCURACY,
            _statsFromEquipments.DEX);
    }

    function ACCU(uint ACC, uint DEX) public pure returns (uint) {
        // 1+(dex/40)
        return ACC + 1 + (DEX / 40);
    }

    function CRIT(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return CRITW(_generatedStatsFromEquipments.CRIT,
            _statsFromEquipments.LUCK);
    }


    function CRITW(uint _CRIT, uint LUCK) public pure returns (uint){
        return _CRIT + 1 + (LUCK / 50);
    }

    function DODGEWDecimals(uint _DODGE, uint AGI) public pure returns (uint){
        return _DODGE + 1 + (AGI / 35);
    }

    // @notice VIEW UTILS
    function getAllStats(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _generated_stats, GameObjects.ElementalStats memory _ele_stats, uint lvl) {

        //function getSummonerBattleStats(uint summoner) public view returns
        //(GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats)
        GameObjects.Stats memory _summonerStats = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES)).stats(summoner);

        (GameObjects.Stats memory _stats_eq,
        GameObjects.GeneratedStats memory _gen_stats_eq,
        GameObjects.ElementalStats memory _ele_stats_eq) = precalculatedStats(summoner);

        (GameObjects.Stats memory _stats_fx,
        GameObjects.GeneratedStats memory _gen_stats_fx,
        GameObjects.ElementalStats memory _ele_stats_fx) = IElixirAndArtifactSlots(contractAddress(INavigator.CONTRACT.INVENTORY)).activeEffects(summoner);

        lvl = ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).level(summoner);
        _stats = EquipableUtils.sumStats(_stats_fx, _stats_eq);
        _stats = EquipableUtils.sumStats(_summonerStats, _stats);
        _generated_stats = EquipableUtils.sumGeneratedStats(_gen_stats_eq, _gen_stats_fx);
        _generated_stats.HP += ((_stats.VIT / 15) * 4) + (lvl * 10);
        _generated_stats.CRIT = CRITW(_generated_stats.CRIT, _stats.LUCK);
        _generated_stats.ACCURACY = ACCU(_generated_stats.ACCURACY, _stats.DEX);
        _generated_stats.DODGE = DODGEWDecimals(_generated_stats.DODGE, _stats.AGI);
        //        _generated_stats.P_ATK = ATK(_generated_stats.P_ATK, _stats.STR);
        //        _generated_stats.M_ATK = ATK(_generated_stats.M_ATK, _stats.INT);
        _generated_stats.P_DEF = DEFW(_generated_stats.P_DEF, _stats.VIT, lvl);
        _generated_stats.M_DEF = DEFW(_generated_stats.M_DEF, _stats.INT, lvl);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats_eq, _ele_stats_fx);
        _ele_stats.SummonerDamageType = _ele_stats_eq.SummonerDamageType;
    }

    function precalculatedStats(uint summoner) public view returns (GameObjects.Stats memory,
        GameObjects.GeneratedStats memory,
        GameObjects.ElementalStats memory) {
        (GameObjects.Stats memory _stats_eq,
        GameObjects.GeneratedStats memory _gen_stats_eq,
        GameObjects.ElementalStats memory _ele_stats_eq) = IEquipable(contractAddress(INavigator.CONTRACT.INVENTORY)).getSummonerBattleStats(summoner);

        GameObjects.GeneratedStats memory _base = SummonerBaseStats();
        _gen_stats_eq = EquipableUtils.sumGeneratedStats(_gen_stats_eq, _base);
        return (_stats_eq, _gen_stats_eq, _ele_stats_eq);
    }

    function SummonerBaseStats() public view returns (GameObjects.GeneratedStats memory) {
        return GameObjects.GeneratedStats({HP : 10, P_ATK : 10, M_ATK : 10, P_DEF : 10, M_DEF : 10, ACCURACY : 10, DODGE : 10, CRIT : 0, CRIT_MULTIPLIER : 0, INFUSION : 0});
    }

    function CostOfStat(uint lvl) public view returns (uint) {
        //1+target_skill_point/10
        return lvl == 0 ? 0 : 1 + (lvl / 14);
    }

    function SumOfStatSetCost(GameObjects.Stats memory stats) external view returns (uint) {
        uint cost = 0;

        for (uint i = 0; i <= stats.STR; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.DEX; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.AGI; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.INT; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.VIT; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.LUCK; i++) {
            cost += CostOfStat(i);
        }

        return cost;
    }


}