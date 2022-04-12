import "../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

library EquipableUtils {

    function sumStats(GameObjects.Stats memory _a, GameObjects.Stats memory _b) internal pure returns (GameObjects.Stats memory) {
        _a.STR += _b.STR;
        _a.AGI += _b.AGI;
        _a.DEX += _b.DEX;
        _a.INT += _b.INT;
        _a.VIT += _b.VIT;
        _a.LUCK += _b.LUCK;
        return _a;
    }

    function sumGeneratedStats(GameObjects.GeneratedStats memory _a, GameObjects.GeneratedStats memory _b) internal pure returns (GameObjects.GeneratedStats memory) {
        _a.P_ATK += _b.P_ATK;
        _a.M_ATK += _b.M_ATK;
        _a.P_DEF += _b.P_DEF;
        _a.M_DEF += _b.M_DEF;
        _a.ACCURACY += _b.ACCURACY;
        _a.DODGE += _b.DODGE;
        _a.CRIT += _b.CRIT;
        _a.CRIT_MULTIPLIER += _b.CRIT_MULTIPLIER;
        return _a;
    }

    function sumGeneratedStatsAsPercentage(
        GameObjects.GeneratedStats memory _a,
        GameObjects.GeneratedStats memory _b) internal pure returns (GameObjects.GeneratedStats memory) {
        _a.P_ATK += percentage(_a.P_ATK, _b.P_ATK);
        _a.M_ATK += percentage(_a.M_ATK, _b.M_ATK);
        _a.P_DEF += percentage(_a.P_DEF, _b.P_DEF);
        _a.M_DEF += percentage(_a.M_DEF, _b.M_DEF);
        _a.ACCURACY += percentage(_a.ACCURACY, _b.ACCURACY);
        _a.DODGE += percentage(_a.DODGE, _b.DODGE);
        _a.CRIT += percentage(_a.CRIT, _b.CRIT);
        _a.CRIT_MULTIPLIER += percentage(_a.CRIT_MULTIPLIER, _b.CRIT_MULTIPLIER);
        return _a;
    }

    function sumGeneratedElementalStats(GameObjects.ElementalStats memory _a, GameObjects.ElementalStats memory _b) internal pure returns (GameObjects.ElementalStats memory) {
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
    function sumGeneratedElementalStatsAsPercentage(GameObjects.ElementalStats memory _a, GameObjects.ElementalStats memory _b) internal pure returns (GameObjects.ElementalStats memory) {
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


    function percentage(uint val, uint percentage) public pure returns (uint){
        require(percentage > 0, "?");
        return val * percentage / 100;
    }
}
