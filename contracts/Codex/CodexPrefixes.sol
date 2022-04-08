import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexPrefixes {
    string constant public index = "Codex";
    string constant public class = "Prefixes";
    string constant public version = "0.0.1";

    function prefix(uint _id, uint _tier) public pure returns (GameObjects.Prefix memory) {
        if (_id == 1) {
            return applyTierEffect(Berserkers(), _tier);
        }

        revert("invalid");
    }
    function applyTierEffect(GameObjects.Prefix memory _prefix, uint lvl) internal pure returns (GameObjects.Prefix memory) {
        _prefix.statBonus.STR += lvl;
        _prefix.statBonus.AGI += lvl;
        _prefix.statBonus.INT += lvl;
        _prefix.statBonus.DEX += lvl;
        _prefix.statBonus.VIT += lvl;
        _prefix.statBonus.LUCK += lvl;

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : _prefix.generatedStatBonus.HP * lvl,
        P_ATK : _prefix.generatedStatBonus.P_ATK * lvl,
        M_ATK : _prefix.generatedStatBonus.M_ATK * lvl,
        P_DEF : _prefix.generatedStatBonus.P_DEF * lvl,
        M_DEF : _prefix.generatedStatBonus.M_DEF * lvl,
        ACCURACY : _prefix.generatedStatBonus.ACCURACY * lvl,
        DODGE : _prefix.generatedStatBonus.DODGE * lvl,
        CRIT : _prefix.generatedStatBonus.CRIT * lvl,
        CRIT_MULTIPLIER : _prefix.generatedStatBonus.CRIT_MULTIPLIER + 25 * lvl / 10,
        INFUSION : _prefix.generatedStatBonus.INFUSION + lvl / 10
        });

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : _prefix.elementalStats.ElementalAtk.FIRE_ATK * lvl,
        COLD_ATK : _prefix.elementalStats.ElementalAtk.COLD_ATK * lvl,
        LIGHTNING_ATK : _prefix.elementalStats.ElementalAtk.LIGHTNING_ATK * lvl,
        EARTH_ATK : _prefix.elementalStats.ElementalAtk.EARTH_ATK * lvl,
        VOID_ATK : _prefix.elementalStats.ElementalAtk.VOID_ATK * lvl,
        HOLY_ATK : _prefix.elementalStats.ElementalAtk.HOLY_ATK * lvl,
        DARK_ATK : _prefix.elementalStats.ElementalAtk.DARK_ATK * lvl
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : _prefix.elementalStats.ElementalDef.FIRE_DEF * lvl,
        COLD_DEF : _prefix.elementalStats.ElementalDef.COLD_DEF * lvl,
        EARTH_DEF : _prefix.elementalStats.ElementalDef.EARTH_DEF * lvl,
        LIGHTNING_DEF : _prefix.elementalStats.ElementalDef.LIGHTNING_DEF * lvl,
        DARK_DEF : _prefix.elementalStats.ElementalDef.DARK_DEF * lvl,
        HOLY_DEF : _prefix.elementalStats.ElementalDef.HOLY_DEF * lvl,
        VOID_DEF : _prefix.elementalStats.ElementalDef.VOID_DEF * lvl
        });
        return _prefix;
    }

    function Berserkers() public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Berserker's";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 1,
        P_ATK : 1,
        M_ATK : 1,
        P_DEF : 1,
        M_DEF : 1,
        ACCURACY : 1,
        DODGE : 1,
        CRIT : 1,
        CRIT_MULTIPLIER : 1,
        INFUSION : 0
        });

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
}
