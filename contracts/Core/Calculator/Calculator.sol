import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Interfaces/Core/Calculator/ICalculator.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../../Interfaces/Codex/ICodexRandom.sol";
import "../../Interfaces/Attributes/IAttributes.sol";
import "../../Interfaces/Core/Constants/Constants.sol";
import "../../Inventory/EquipableUtils.sol";
import "../../Interfaces/Inventory/IEquipable.sol";
import "../../Interfaces/Inventory/IElixirAndArtifactSlots.sol";
import "../../Interfaces/Summoners/ISummoners.sol";
import "../../Interfaces/GameObjects/IMonster.sol";

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
        GameObjects.Stats memory _statsFromEquips1,
        GameObjects.Stats memory _statsBase1,
        GameObjects.GeneratedStats memory _genStatsFromEquips1,
        GameObjects.ElementalStats memory _eleStatsFromEquips1, uint lvl) = getAllStats(summoner);

        (GameObjects.BattleStats memory player,
        GameObjects.BattleStats memory monster) = GetBattleStats(
            EquipableUtils.sumStats(_statsBase1, _statsFromEquips1),
            _genStatsFromEquips1,
            _eleStatsFromEquips1,
            _monster.EnemyStats,
            _monster.EnemyGeneratedStats,
            _monster.EnemyElementalStats);

        player.TOTAL_HP += lvl * 10;

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
        GameObjects.Stats memory _statsFromEquips1,
        GameObjects.Stats memory _statsBase1,
        GameObjects.GeneratedStats memory _genStatsFromEquips1,
        GameObjects.ElementalStats memory _eleStatsFromEquips1,) = getAllStats(summoner);

        (
        GameObjects.Stats memory _statsFromEquips2,
        GameObjects.Stats memory _statsBase2,
        GameObjects.GeneratedStats memory _genStatsFromEquips2,
        GameObjects.ElementalStats memory _eleStatsFromEquips2,) = getAllStats(summoner2);

        (
        GameObjects.BattleStats memory _battleStats1,
        GameObjects.BattleStats memory _battleStats2
        ) = GetBattleStats(
            EquipableUtils.sumStats(_statsFromEquips1, _statsBase1),
            _genStatsFromEquips1,
            _eleStatsFromEquips1,
            EquipableUtils.sumStats(_statsFromEquips2, _statsBase2),
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
        //        _battleStats1.DPS = _battleStats1.DPS;
        //        _battleStats2.DPS = _battleStats2.DPS;

        _battleStats1.TOTAL_HP = HIT_POINTS(_gen_stats1.HP, _stats1.VIT);
        _battleStats2.TOTAL_HP = HIT_POINTS(_gen_stats2.HP, _stats2.VIT);
        _battleStats1.CRIT_CHANCE = CRITICALWDecimals(_stats1.LUCK, _gen_stats1.CRIT);
        _battleStats2.CRIT_CHANCE = CRITICALWDecimals(_stats2.LUCK, _gen_stats2.CRIT);
        _battleStats1.CRIT_MULTI = _gen_stats1.CRIT_MULTIPLIER;
        _battleStats2.CRIT_MULTI = _gen_stats2.CRIT_MULTIPLIER;

        _battleStats1.HIT_CHANCE = HitChance(_gen_stats1.ACCURACY, _gen_stats2.DODGE);
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


    // @param _dns, N of dice, n=20 means d20
    function BatchRollN(uint summoner, uint[] calldata _seeds, uint[] calldata _chances, uint[] calldata _dns) external view returns (bool[] memory) {
        bool[] memory results = new bool[](_chances.length);
        for (uint i = 0; i < _seeds.length; i++) {
            results[i] = IsSuccessfulDiceRollN(summoner, _seeds[i], _chances[i], _dns[i]);
        }
        return results;
    }

    function BatchRoll100(uint summoner, uint[] calldata _seeds, uint[] calldata _chances) external view returns (bool[] memory) {
        bool[] memory results = new bool[](_chances.length);
        for (uint i = 0; i < _seeds.length; i++) {
            results[i] = IsSuccessfulDiceRoll100(summoner, _seeds[i], _chances[i]);
        }
        return results;
    }

    // chance based calculations
    function IsSuccessfulDiceRoll100(uint summoner, uint seed, uint chance) public view returns (bool) {
        uint CHANCE_W_DEC = chance * GameConstants.E18;
        ICodexRandom RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        uint _seed = uint(keccak256(abi.encodePacked(msg.sender, block.number, summoner, seed)));
        uint rollE18 = GameConstants.HUNDRED - (RNG.d100(_seed) * GameConstants.E18);
        /* @notice */
        /* example: assume crit chance = 10, use rolled 80, 100-80=20, 20 <= 10, false*/
        /* example2: assume crit chance = 20, use rolled 80, 100-80=20, 20 <= 20, true*/
        return rollE18 <= CHANCE_W_DEC;
    }

    // chance based calculations
    function IsSuccessfulDiceRollN(uint summoner, uint seed, uint chance, uint dice) public view returns (bool) {
        uint CHANCE_W_DEC = chance * GameConstants.E18;
        ICodexRandom RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        uint _seed = uint(keccak256(abi.encodePacked(msg.sender, block.number, summoner, seed)));
        uint rollE18 = (dice * GameConstants.E18) - (RNG.dn(_seed, dice) * GameConstants.E18);
        /* @notice */
        /* example: assume crit chance = 10, use rolled 80, 100-80=20, 20 <= 10, false*/
        /* example2: assume crit chance = 20, use rolled 80, 100-80=20, 20 <= 20, true*/
        return rollE18 <= CHANCE_W_DEC;
    }

    // STAT RELATED CALCULATIONS
    function DPS(uint ATK, uint STAT, uint DEF, uint PEN) external pure returns (uint){
        return DPSWDecimals(ATK, STAT, DEF, PEN) / GameConstants.GAME_DECIMAL;
    }

    function DPSWDecimals(uint ATK, uint STAT, uint DEF, uint PEN) public pure returns (uint) {
        if (ATK == 0) return 0;
        if (DEF == 0) return ATK;
        // atk*stat / armor(reduce pen if exists)
        //        uint256 DECIMAL = 0;
        //        uint256 TEMP = DEF;
        //        while (TEMP != 0) {TEMP >>= 8;
        //            DECIMAL++;}

        //        int diff = int(DEF) - int(ATK);
        //        uint ratio;
        //
        //        if (diff > 0) {
        //            ratio = uint(DEF / ATK);
        //        }
        uint DEF_PENETRATED = DEF - (((DEF) * PEN) / 100);
        uint FINAL_ATK = ATK * STAT / DEF_PENETRATED;
        return FINAL_ATK;
    }

    function P_ATK(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.P_ATK, _summonerStats.STR + _statsFromEquipments.STR) / GameConstants.GAME_DECIMAL;
    }

    function P_ATKwDecimal(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.P_ATK, _summonerStats.STR + _statsFromEquipments.STR);
    }

    function M_ATK(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.M_ATK, _summonerStats.INT + _statsFromEquipments.INT) / GameConstants.GAME_DECIMAL;
    }

    function M_ATKwDecimal(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.M_ATK, _summonerStats.INT + _statsFromEquipments.INT);
    }

    function ATKWDecimals(uint STAT, uint ATK) public pure returns (uint) {
        // (equipTotalAttack+(1+(STR/200))+STR/2)
        uint ATK_W_DECIMAL = ATK * GameConstants.GAME_DECIMAL;
        uint STAT_W_DECIMAL = STAT * GameConstants.GAME_DECIMAL;
        uint ATK_BONUS_FROM_STATS = (GameConstants.GAME_DECIMAL + (STAT_W_DECIMAL / 200)) + (STAT_W_DECIMAL / 2);
        return ATK_W_DECIMAL + ATK_BONUS_FROM_STATS;
    }

    function P_DEF(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,uint lvl) = getAllStats(summoner);
        return DEFWDecimals(_generatedStatsFromEquipments.P_DEF, _summonerStats.VIT + _statsFromEquipments.VIT, lvl) / GameConstants.GAME_DECIMAL;
    }

    function P_DEFWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,
        uint lvl) = getAllStats(summoner);
        return DEFWDecimals(_generatedStatsFromEquipments.P_DEF, _summonerStats.VIT + _statsFromEquipments.VIT, lvl);
    }

    function M_DEF(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,uint lvl) = getAllStats(summoner);
        return DEFWDecimals(_generatedStatsFromEquipments.M_DEF, _summonerStats.INT + _statsFromEquipments.INT, lvl) / GameConstants.GAME_DECIMAL;
    }

    function M_DEFWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,
        uint lvl) = getAllStats(summoner);
        return DEFWDecimals(_generatedStatsFromEquipments.M_DEF, _summonerStats.INT + _statsFromEquipments.INT, lvl);
    }

    function DEFWDecimals(uint DEF, uint STAT, uint LVL) public pure returns (uint) {
        // (vitOrInt / 2)+(lv/4)
        uint DEF_W_DECIMAL = DEF * GameConstants.GAME_DECIMAL;
        uint STAT_W_DECIMAL = STAT * GameConstants.GAME_DECIMAL;
        uint LVL_W_DECIMAL = LVL * GameConstants.GAME_DECIMAL;
        return DEF_W_DECIMAL + (STAT_W_DECIMAL / 2) + (LVL_W_DECIMAL / 4);
    }

    function HP(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return HIT_POINTS(_generatedStatsFromEquipments.HP, _summonerStats.VIT + _statsFromEquipments.VIT) / GameConstants.GAME_DECIMAL;
    }

    function HPWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,
        ) = getAllStats(summoner);
        return HIT_POINTS(_generatedStatsFromEquipments.HP, _summonerStats.VIT + _statsFromEquipments.VIT);
    }

    function HIT_POINTS(uint HP, uint VIT) public pure returns (uint) {
        return HP + (VIT * 4);
    }

    function ACCURACY(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return ACCWDecimals(_generatedStatsFromEquipments.ACCURACY,
            _summonerStats.DEX + _statsFromEquipments.DEX) / GameConstants.GAME_DECIMAL;
    }

    function ACCURACYWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return ACCWDecimals(_generatedStatsFromEquipments.ACCURACY,
            _summonerStats.DEX + _statsFromEquipments.DEX);
    }

    function ACCWDecimals(uint ACC, uint DEX) public pure returns (uint) {
        // 1+(dex/2)
        uint DEX_W_DECIMAL = DEX * GameConstants.GAME_DECIMAL;
        uint ACC_W_DECIMAL = ACC * GameConstants.GAME_DECIMAL;
        return ACC_W_DECIMAL + GameConstants.GAME_DECIMAL + (DEX_W_DECIMAL / 10);
    }

    function CRIT(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,,) = getAllStats(summoner);
        return CRITICALWDecimals(_generatedStatsFromEquipments.CRIT,
            _summonerStats.LUCK + _statsFromEquipments.LUCK) / GameConstants.GAME_DECIMAL;
    }


    function CRITICALWDecimals(uint _CRIT, uint LUCK) public pure returns (uint){
        return _CRIT + 1 + (LUCK / 50);
    }

    // @notice VIEW UTILS
    function getAllStats(uint summoner) public view returns (GameObjects.Stats memory _stats_base, GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _generated_stats, GameObjects.ElementalStats memory _ele_stats, uint lvl) {


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
        _stats_base = _summonerStats;
        _stats = _stats_eq;
        _generated_stats = EquipableUtils.sumGeneratedStats(_gen_stats_eq, _gen_stats_fx);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats_eq, _ele_stats_fx);
    }

    function precalculatedStats(uint summoner) public view returns (GameObjects.Stats memory,
        GameObjects.GeneratedStats memory,
        GameObjects.ElementalStats memory) {
        (GameObjects.Stats memory _stats_eq,
        GameObjects.GeneratedStats memory _gen_stats_eq,
        GameObjects.ElementalStats memory _ele_stats_eq) = IEquipable(contractAddress(INavigator.CONTRACT.INVENTORY)).getSummonerBattleStats(summoner);

        GameObjects.GeneratedStats memory _base = SummonerBaseStats();
        _gen_stats_eq = EquipableUtils.sumGeneratedStats(_base, _gen_stats_eq);
        return (_stats_eq, _gen_stats_eq, _ele_stats_eq);
    }

    function SummonerBaseStats() public view returns (GameObjects.GeneratedStats memory) {
        return GameObjects.GeneratedStats({HP : 10, P_ATK : 10, M_ATK : 10, P_DEF : 10, M_DEF : 10, ACCURACY : 10, DODGE : 10, CRIT : 0, CRIT_MULTIPLIER : 0, INFUSION : 0});
    }

    function CostOfStat(uint skill) public view returns (uint) {
        //1+target_skill_point/10
        return skill == 0 ? 0 : 1 + (skill / 10);
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