import {Stats, GeneratedStats, ElementalStats} from "../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

library EquipableUtils {

    function sumStats(Stats memory _a, Stats memory _b) internal pure returns (Stats memory) {
        _a.STR += _b.STR;
        _a.AGI += _b.AGI;
        _a.DEX += _b.DEX;
        _a.INT += _b.INT;
        _a.VIT += _b.VIT;
        _a.LUCK += _b.LUCK;
        return _a;
    }

    function sumStatsAsTier(Stats memory _a, uint tier) internal pure returns (Stats memory) {
        _a.STR += percentage(_a.STR, tier);
        _a.AGI += percentage(_a.AGI, tier);
        _a.DEX += percentage(_a.DEX, tier);
        _a.INT += percentage(_a.INT, tier);
        _a.VIT += percentage(_a.VIT, tier);
        _a.LUCK += percentage(_a.LUCK, tier);
        return _a;
    }

    function sumStatsWithNumber(Stats memory _a, uint num) internal pure returns (Stats memory) {
        if (num == 0) return _a;
        if (_a.STR > 0) _a.STR += (_a.STR + num);
        if (_a.AGI > 0) _a.AGI += (_a.AGI + num);
        if (_a.DEX > 0) _a.DEX += (_a.DEX + num);
        if (_a.INT > 0) _a.INT += (_a.INT + num);
        if (_a.VIT > 0) _a.VIT += (_a.VIT + num);
        if (_a.LUCK > 0) _a.LUCK += (_a.LUCK + num);
        return _a;
    }

    function sumStatsAsPercentage(Stats memory _a, Stats memory _b) internal pure returns (Stats memory) {
        _a.STR += percentage(_a.STR, _b.STR);
        _a.AGI += percentage(_a.AGI, _b.AGI);
        _a.DEX += percentage(_a.DEX, _b.DEX);
        _a.INT += percentage(_a.INT, _b.INT);
        _a.VIT += percentage(_a.VIT, _b.VIT);
        _a.LUCK += percentage(_a.LUCK, _b.LUCK);
        return _a;
    }

    function sumGeneratedStats(GeneratedStats memory _a, GeneratedStats memory _b) internal pure returns (GeneratedStats memory) {
        _a.HP += _b.HP;
        _a.P_ATK += _b.P_ATK;
        _a.M_ATK += _b.M_ATK;
        _a.P_DEF += _b.P_DEF;
        _a.M_DEF += _b.M_DEF;
        _a.ACCURACY += _b.ACCURACY;
        _a.DODGE += _b.DODGE;
        _a.CRIT += _b.CRIT;
        _a.CRIT_MULTIPLIER += _b.CRIT_MULTIPLIER;
        _a.INFUSION += _b.INFUSION;
        return _a;
    }

    function sumGeneratedStatsWithNumber(GeneratedStats memory _a, uint num) internal pure returns (GeneratedStats memory) {
        if (num == 0) return _a;
        if (_a.HP > 0) _a.HP += num;
        if (_a.P_ATK > 0) _a.P_ATK += num;
        if (_a.M_ATK > 0) _a.M_ATK += num;
        if (_a.P_DEF > 0) _a.P_DEF += num;
        if (_a.M_DEF > 0) _a.M_DEF += num;
        if (_a.ACCURACY > 0) _a.ACCURACY += num;
        if (_a.DODGE > 0) _a.DODGE += num;
        if (_a.CRIT > 0) _a.CRIT += num;
        if (_a.CRIT_MULTIPLIER > 0) _a.CRIT_MULTIPLIER += num;
        if (_a.INFUSION > 0) _a.INFUSION += num;
        return _a;
    }

    function sumGeneratedStatsAsPercentage(
        GeneratedStats memory _a,
        GeneratedStats memory _b) internal pure returns (GeneratedStats memory) {
        _a.HP += percentage(_a.HP, _b.HP);
        _a.P_ATK += percentage(_a.P_ATK, _b.P_ATK);
        _a.M_ATK += percentage(_a.M_ATK, _b.M_ATK);
        _a.P_DEF += percentage(_a.P_DEF, _b.P_DEF);
        _a.M_DEF += percentage(_a.M_DEF, _b.M_DEF);
        _a.ACCURACY += percentage(_a.ACCURACY, _b.ACCURACY);
        _a.DODGE += percentage(_a.DODGE, _b.DODGE);
        _a.CRIT += percentage(_a.CRIT, _b.CRIT);
        _a.CRIT_MULTIPLIER += percentage(_a.CRIT_MULTIPLIER, _b.CRIT_MULTIPLIER);
        _a.INFUSION += percentage(_a.INFUSION, _b.INFUSION);
        return _a;
    }

    function sumGeneratedStatsAsTier(
        GeneratedStats memory _a,
        uint tier) internal pure returns (GeneratedStats memory) {
        _a.HP += percentage(_a.HP, tier);
        _a.P_ATK += percentage(_a.P_ATK, tier);
        _a.M_ATK += percentage(_a.M_ATK, tier);
        _a.P_DEF += percentage(_a.P_DEF, tier);
        _a.M_DEF += percentage(_a.M_DEF, tier);
        _a.ACCURACY += percentage(_a.ACCURACY, tier);
        _a.DODGE += percentage(_a.DODGE, tier);
        _a.CRIT += percentage(_a.CRIT, tier);
        _a.CRIT_MULTIPLIER += percentage(_a.CRIT_MULTIPLIER, tier);
        _a.INFUSION += percentage(_a.INFUSION, tier);
        return _a;
    }

    function sumGeneratedElementalStats(ElementalStats memory _a, ElementalStats memory _b) internal pure returns (ElementalStats memory) {
        _a.ElementalAtk.FIRE_ATK += _b.ElementalAtk.FIRE_ATK;
        _a.ElementalAtk.COLD_ATK += _b.ElementalAtk.COLD_ATK;
        _a.ElementalAtk.LIGHTNING_ATK += _b.ElementalAtk.LIGHTNING_ATK;
        _a.ElementalAtk.EARTH_ATK += _b.ElementalAtk.EARTH_ATK;
        _a.ElementalAtk.HOLY_ATK += _b.ElementalAtk.HOLY_ATK;
        _a.ElementalAtk.DARK_ATK += _b.ElementalAtk.DARK_ATK;
        _a.ElementalAtk.VOID_ATK += _b.ElementalAtk.VOID_ATK;

        _a.ElementalDef.FIRE_DEF += _b.ElementalDef.FIRE_DEF;
        _a.ElementalDef.COLD_DEF += _b.ElementalDef.COLD_DEF;
        _a.ElementalDef.LIGHTNING_DEF += _b.ElementalDef.LIGHTNING_DEF;
        _a.ElementalDef.EARTH_DEF += _b.ElementalDef.EARTH_DEF;
        _a.ElementalDef.HOLY_DEF += _b.ElementalDef.HOLY_DEF;
        _a.ElementalDef.DARK_DEF += _b.ElementalDef.DARK_DEF;
        _a.ElementalDef.VOID_DEF += _b.ElementalDef.VOID_DEF;
        return _a;
    }

    function sumGeneratedElementalStatsAsPercentage(ElementalStats memory _a, ElementalStats memory _b) internal pure returns (ElementalStats memory) {
        _a.ElementalAtk.FIRE_ATK += percentage(_a.ElementalAtk.FIRE_ATK, _b.ElementalAtk.FIRE_ATK);
        _a.ElementalAtk.COLD_ATK += percentage(_a.ElementalAtk.COLD_ATK, _b.ElementalAtk.COLD_ATK);
        _a.ElementalAtk.LIGHTNING_ATK += percentage(_a.ElementalAtk.LIGHTNING_ATK, _b.ElementalAtk.LIGHTNING_ATK);
        _a.ElementalAtk.EARTH_ATK += percentage(_a.ElementalAtk.EARTH_ATK, _b.ElementalAtk.EARTH_ATK);
        _a.ElementalAtk.HOLY_ATK += percentage(_a.ElementalAtk.HOLY_ATK, _b.ElementalAtk.HOLY_ATK);
        _a.ElementalAtk.DARK_ATK += percentage(_a.ElementalAtk.DARK_ATK, _b.ElementalAtk.DARK_ATK);
        _a.ElementalAtk.VOID_ATK += percentage(_a.ElementalAtk.VOID_ATK, _b.ElementalAtk.VOID_ATK);

        _a.ElementalDef.FIRE_DEF += percentage(_a.ElementalDef.FIRE_DEF, _b.ElementalDef.FIRE_DEF);
        _a.ElementalDef.COLD_DEF += percentage(_a.ElementalDef.COLD_DEF, _b.ElementalDef.COLD_DEF);
        _a.ElementalDef.LIGHTNING_DEF += percentage(_a.ElementalDef.LIGHTNING_DEF, _b.ElementalDef.LIGHTNING_DEF);
        _a.ElementalDef.EARTH_DEF += percentage(_a.ElementalDef.EARTH_DEF, _b.ElementalDef.EARTH_DEF);
        _a.ElementalDef.HOLY_DEF += percentage(_a.ElementalDef.HOLY_DEF, _b.ElementalDef.HOLY_DEF);
        _a.ElementalDef.DARK_DEF += percentage(_a.ElementalDef.DARK_DEF, _b.ElementalDef.DARK_DEF);
        _a.ElementalDef.VOID_DEF += percentage(_a.ElementalDef.VOID_DEF, _b.ElementalDef.VOID_DEF);
        return _a;
    }

    function sumGeneratedElementalStatsAsTier(ElementalStats memory _a, uint tier) internal pure returns (ElementalStats memory) {
        _a.ElementalAtk.FIRE_ATK += percentage(_a.ElementalAtk.FIRE_ATK, tier);
        _a.ElementalAtk.COLD_ATK += percentage(_a.ElementalAtk.COLD_ATK, tier);
        _a.ElementalAtk.LIGHTNING_ATK += percentage(_a.ElementalAtk.LIGHTNING_ATK, tier);
        _a.ElementalAtk.EARTH_ATK += percentage(_a.ElementalAtk.EARTH_ATK, tier);
        _a.ElementalAtk.HOLY_ATK += percentage(_a.ElementalAtk.HOLY_ATK, tier);
        _a.ElementalAtk.DARK_ATK += percentage(_a.ElementalAtk.DARK_ATK, tier);
        _a.ElementalAtk.VOID_ATK += percentage(_a.ElementalAtk.VOID_ATK, tier);

        _a.ElementalDef.FIRE_DEF += percentage(_a.ElementalDef.FIRE_DEF, tier);
        _a.ElementalDef.COLD_DEF += percentage(_a.ElementalDef.COLD_DEF, tier);
        _a.ElementalDef.LIGHTNING_DEF += percentage(_a.ElementalDef.LIGHTNING_DEF, tier);
        _a.ElementalDef.EARTH_DEF += percentage(_a.ElementalDef.EARTH_DEF, tier);
        _a.ElementalDef.HOLY_DEF += percentage(_a.ElementalDef.HOLY_DEF, tier);
        _a.ElementalDef.DARK_DEF += percentage(_a.ElementalDef.DARK_DEF, tier);
        _a.ElementalDef.VOID_DEF += percentage(_a.ElementalDef.VOID_DEF, tier);
        return _a;
    }

    function sumGeneratedElementalStatsWithNumber(ElementalStats memory _a, uint num) internal pure returns (ElementalStats memory) {
        if (num == 0) return _a;
        if (_a.ElementalAtk.FIRE_ATK > 0) _a.ElementalAtk.FIRE_ATK += (_a.ElementalAtk.FIRE_ATK + num);
        if (_a.ElementalAtk.COLD_ATK > 0) _a.ElementalAtk.COLD_ATK += (_a.ElementalAtk.COLD_ATK + num);
        if (_a.ElementalAtk.LIGHTNING_ATK > 0) _a.ElementalAtk.LIGHTNING_ATK += (_a.ElementalAtk.LIGHTNING_ATK + num);
        if (_a.ElementalAtk.EARTH_ATK > 0) _a.ElementalAtk.EARTH_ATK += (_a.ElementalAtk.EARTH_ATK + num);
        if (_a.ElementalAtk.HOLY_ATK > 0) _a.ElementalAtk.HOLY_ATK += (_a.ElementalAtk.HOLY_ATK + num);
        if (_a.ElementalAtk.DARK_ATK > 0) _a.ElementalAtk.DARK_ATK += (_a.ElementalAtk.DARK_ATK + num);
        if (_a.ElementalAtk.VOID_ATK > 0) _a.ElementalAtk.VOID_ATK += (_a.ElementalAtk.VOID_ATK + num);
        if (_a.ElementalDef.FIRE_DEF > 0) _a.ElementalDef.FIRE_DEF += (_a.ElementalDef.FIRE_DEF + num);
        if (_a.ElementalDef.COLD_DEF > 0) _a.ElementalDef.COLD_DEF += (_a.ElementalDef.COLD_DEF + num);
        if (_a.ElementalDef.LIGHTNING_DEF > 0) _a.ElementalDef.LIGHTNING_DEF += (_a.ElementalDef.LIGHTNING_DEF + num);
        if (_a.ElementalDef.EARTH_DEF > 0) _a.ElementalDef.EARTH_DEF += (_a.ElementalDef.EARTH_DEF + num);
        if (_a.ElementalDef.HOLY_DEF > 0) _a.ElementalDef.HOLY_DEF += (_a.ElementalDef.HOLY_DEF + num);
        if (_a.ElementalDef.DARK_DEF > 0) _a.ElementalDef.DARK_DEF += (_a.ElementalDef.DARK_DEF + num);
        if (_a.ElementalDef.VOID_DEF > 0) _a.ElementalDef.VOID_DEF += (_a.ElementalDef.VOID_DEF + num);
        return _a;
    }


    function percentage(uint val, uint percentage) internal pure returns (uint){
        if (percentage == 0) return 0;
        return val * percentage / 1000;
    }
}
