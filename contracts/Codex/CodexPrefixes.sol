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
    function baseHp() internal pure returns(uint) {
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
    function Wizards(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Wizard's";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
    function Elementalists(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Elementalist's";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : baseEleAtk() * _tier,
        COLD_ATK : baseEleAtk() * _tier,
        EARTH_ATK : baseEleAtk() * _tier,
        LIGHTNING_ATK : baseEleAtk() * _tier,
        DARK_ATK : baseEleAtk() * _tier,
        HOLY_ATK : baseEleAtk() * _tier,
        VOID_ATK : baseEleAtk() * _tier
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
    function Ferocious(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Ferocious";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : baseCritMulti() * _tier,
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
    function Wicked(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Wicked";
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
    function Sharpshooter(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Sharpshooter";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : baseStat() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : baseCrit() * _tier,
        CRIT_MULTIPLIER : 0,
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
    function Skirmishing(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Skirmishing";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
    function Defiant(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Defiant";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Merciless(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Merciless";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
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
    function Fiery(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Fiery";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Thunderous(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Thunderous";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : baseEleAtk() * _tier,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Holy(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Holy";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : 0
        });
    }
    function Frozen(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Frozen";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseStat() * _tier,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Natural(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Natural";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : baseEleAtk() * _tier,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Sacred(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Sacred";
        _prefix.difficulty = 3;
        _prefix.statBonus = GameObjects.Stats({
        STR : baseStat() * _tier,
        DEX : baseStat() * _tier,
        AGI : baseStat() * _tier,
        INT : baseStat() * _tier,
        VIT : baseStat() * _tier,
        LUCK : baseStat() * _tier
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
    function Eternal(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Eternal";
        _prefix.difficulty = 5;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : baseEleAtk() * _tier
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : baseEleDef() * _tier
        });
    }
    function Devastating(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Devastating ";
        _prefix.difficulty = 3;
        _prefix.statBonus = GameObjects.Stats({
        STR : baseStat() * _tier,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : baseStat() * _tier
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : baseCrit() * _tier,
        CRIT_MULTIPLIER : 0,
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
    function Forged(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Forged";
        _prefix.difficulty = 2;
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
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Mystical(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Mystical";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
    function Clever(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Clever";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : baseStat() * _tier,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
    function Enormous(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Enormous";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseStat() * _tier,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
    function Ethereal(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Ethereal";
        _prefix.difficulty = 3;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Vengeful(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Vengeful";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : baseStat() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
    function Divine(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Divine";
        _prefix.difficulty = 3;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Elusive(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Elusive";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : baseStat() * _tier,
        AGI : baseStat() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
    function Protective(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Protective";
        _prefix.difficulty = 3;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : baseEleDef() * _tier
        });
    }
    function Pristine(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Pristine";
        _prefix.difficulty = 3;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : baseStat() * _tier
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : baseEleDef() * _tier
        });
    }
    function Glacial(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Glacial";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Rugged(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Rugged";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : baseStat() * _tier
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
    function Ruthless(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Ruthless";
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
    function Lurid(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Lurid";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : baseAcc() * _tier,
        DODGE : baseDodge() * _tier,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
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
    function Pastoral(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Pastoral";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseStat() * _tier,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Supreme(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Supreme";
        _prefix.difficulty = 3;
        _prefix.statBonus = GameObjects.Stats({
        STR : baseStat() * _tier,
        DEX : baseStat() * _tier,
        AGI : baseStat() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : baseEleDef() * _tier
        });
    }
    function Banishing(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Banishing";
        _prefix.difficulty = 3;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Shapened(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Shapened";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
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
    function Obsidian(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Obsidian";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : baseStat() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Devoted(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Devoted";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : baseStat() * _tier
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : 0
        });
    }
    function Revival(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Revival";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : baseStat() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseStat() * _tier,
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
    function Damned(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Damned";
        _prefix.difficulty = 3;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : baseCritMulti() * _tier,
        INFUSION : 0
        });

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
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
    function Unholy(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Unholy";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _prefix.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
    function Smoky(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Smoky";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : baseEleAtk() * _tier,
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
    function Shardy(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Shardy";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
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
    function Shiny(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Shiny";
        _prefix.difficulty = 2;
        _prefix.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseStat() * _tier,
        VIT : 0,
        LUCK : 0
        });



        // these are percentages.

        _prefix.generatedStatBonus = GameObjects.GeneratedStats({
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

        _prefix.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : baseEleAtk() * _tier,
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