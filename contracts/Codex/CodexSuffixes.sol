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


    function baseStat() internal pure returns (uint) {
        return 1;
    }

    function baseAtk() internal pure returns (uint) {
        return 3;
    }

    function baseDef() internal pure returns (uint) {
        return 5;
    }

    function baseCrit() internal pure returns (uint) {
        return 1;
    }

    function baseCritMulti() internal pure returns (uint) {
        return 10;
    }

    function baseDodge() internal pure returns (uint) {
        return 2;
    }

    function baseAcc() internal pure returns (uint) {
        return 3;
    }

    function baseEleDef() internal pure returns (uint) {
        return 5;
    }

    function baseEleAtk() internal pure returns (uint) {
        return 3;
    }
    function baseHp() internal pure returns (uint) {
        return 3;
    }

    function OfSolarion(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Solarion";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : baseEleAtk() * _tier,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function OfTemplar(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Templar";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : baseEleAtk() * _tier,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function OfPhoenix(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Phoenix";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : baseEleAtk() * _tier,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function OfCelestion(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Celestion";
        _suffix.difficulty = 4;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : baseEleAtk() * _tier
        });

        _suffix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : baseEleDef() * _tier
        });
    }
    function OfBaphomet(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Baphomet";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function OfSujin(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Sujin";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function OfSentinel(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Sentinel";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : 0
        });
    }
    function OfVerdant(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Verdant";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfWatcher(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Watcher";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : baseStat() * _tier
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfDeathbringer(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Deathbringer";
        _suffix.difficulty = 4;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : baseStat() * _tier
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : baseCrit() * _tier,
        CRIT_MULTIPLIER : baseCritMulti() * _tier,
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
    function OfWraith(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Wraith";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : baseDodge() * _tier,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfSpellcaster(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Spellcaster";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : baseCrit() * _tier,
        CRIT_MULTIPLIER : 0,
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
    function OfLuminous(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Luminous";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfFallen(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Fallen";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfGreedy(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Greedy";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : baseStat() * _tier
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfBlacksmith(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Blacksmith";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : baseStat() * _tier
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfSun(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Sun";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseStat() * _tier,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : baseEleAtk() * _tier,
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
    function OfMoon(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Moon";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseStat() * _tier,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
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
    function OfStorm(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Storm";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : baseEleAtk() * _tier,
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
    function OfGladiator(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Gladiator";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : baseCritMulti() * _tier,
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
    function OfVoidheart(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Voidheart";
        _suffix.difficulty = 5;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : baseEleAtk() * _tier
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
    function OfTroll(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Troll";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : baseStat() * _tier,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseStat() * _tier,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfWarmonger(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Warmonger";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : baseStat() * _tier,
        DEX : baseStat() * _tier,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfAssassin(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Assassin";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : baseStat() * _tier,
        AGI : baseStat() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : baseCrit() * _tier,
        CRIT_MULTIPLIER : baseCritMulti() * _tier,
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
    function OfDeath(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Death";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : baseStat() * _tier,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
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
    function OfAcrobat(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Acrobat";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : baseStat() * _tier,
        AGI : baseStat() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : baseDodge() * _tier,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfShadow(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Shadow";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : 0
        });
    }
    function OfConcentration(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Concentration";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : baseAcc() * _tier,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfGuardian(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Guardian";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseStat() * _tier,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
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
    function OfSavage(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Savage";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfCultist(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Cultist";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
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
    function OfFaith(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Faith";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
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
    function OfWanderer(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Wanderer";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : baseStat() * _tier,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : baseAcc() * _tier,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfRoots(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Roots";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : baseStat() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : baseEleAtk() * _tier,
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
    function OfOrder(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Order";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : baseStat() * _tier
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfSeal(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Seal";
        _suffix.difficulty = 4;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
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
    function OfResistance(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Resistance";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : baseEleDef() * _tier
        });
    }
    function OfFortitude(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Fortitude";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : baseAtk() * _tier,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : baseAcc() * _tier,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfRunes(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Runes";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : baseStat() * _tier,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfMalevolence(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Malevolence";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : baseEleAtk() * _tier,
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
    function OfEclipse(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Eclipse";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
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
    function OfImmortal(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Immortal";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : baseDodge() * _tier,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function OfSanctity(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Sanctity";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function OfWisdom(uint _tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "of Wisdom";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() *_tier,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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