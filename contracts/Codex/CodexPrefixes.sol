import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexPrefixes {
    string constant public index = "Codex";
    string constant public class = "Prefixes";
    string constant public version = "0.0.1";

    function prefix(uint _id, uint _tier) public pure returns (GameObjects.Prefix memory) {
        if (_id == 1) {
            return Berserkers(_tier);
        }

        revert("invalid");
    }

    function getPercentage(uint val, uint percentage) internal pure returns(uint) {
        return (val * percentage) / 100;
    }

    function baseStat() internal pure returns(uint) {
        return 1;
    }

    function baseAtk() internal pure returns(uint) {
        return 3;
    }

    function baseDef() internal pure returns(uint) {
        return 5;
    }

    function baseCrit() internal pure returns(uint) {
        return 1;
    }

    function baseCritMulti() internal pure returns(uint) {
        return 10;
    }

    function baseDodge() internal pure returns(uint) {
        return 2;
    }

    function baseAcc() internal pure returns(uint) {
        return 3;
    }

    function baseEleDef() internal pure returns(uint) {
        return 5;
    }

    function baseEleAtk() internal pure returns(uint) {
        return 3;
    }



    function Berserkers(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Berserker's";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : baseStat() * _tier,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 1,
        P_ATK : baseAtk() * _tier,
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
