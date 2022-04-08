import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexSuffixes {
    string constant public index = "Codex";
    string constant public class = "Suffixes";
    string constant public version = "0.0.1";

    function suffix(uint _id,
        uint _tier) public pure returns (GameObjects.Suffix memory) {
        if (_id == 1) {
            return OfSolarion(_tier);
        }

        revert("invalid");
    }

    function OfSolarion(uint tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Solarion";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({HP : 1,
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

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });
        _suffix.elementalStats.ElementalDef = GameObjects.ElementalDef({
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
