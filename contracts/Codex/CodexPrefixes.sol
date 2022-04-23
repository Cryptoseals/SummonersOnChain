import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexPrefixes {
    string constant public index = "Codex";
    string constant public class = "Prefixes";
    string constant public version = "0.0.1";
    function prefix(uint _id, uint _tier) public pure returns (GameObjects.Prefix memory) {
        require(_tier < 21, "?");
        if (_id == 0) {
            return none();
        } else if (_id == 1) {
            return Berserkers(_tier);
        } else if (_id == 2) {
            return Wizards(_tier);
        } else if (_id == 3) {
            return Elementalists(_tier);
        } else if (_id == 4) {
            return Ferocious(_tier);
        } else if (_id == 5) {
            return Wicked(_tier);
        } else if (_id == 6) {
            return Sharpshooter(_tier);
        } else if (_id == 7) {
            return Skirmishing(_tier);
        } else if (_id == 8) {
            return Defiant(_tier);
        } else if (_id == 9) {
            return Merciless(_tier);
        } else if (_id == 10) {
            return Fiery(_tier);
        } else if (_id == 11) {
            return Thunderous(_tier);
        } else if (_id == 12) {
            return Holy(_tier);
        } else if (_id == 13) {
            return Frozen(_tier);
        } else if (_id == 14) {
            return Natural(_tier);
        } else if (_id == 15) {
            return Sacred(_tier);
        } else if (_id == 16) {
            return Eternal(_tier);
        } else if (_id == 17) {
            return Devastating(_tier);
        } else if (_id == 18) {
            return Forged(_tier);
        } else if (_id == 19) {
            return Mystical(_tier);
        } else if (_id == 20) {
            return Clever(_tier);
        } else if (_id == 21) {
            return Enormous(_tier);
        } else if (_id == 22) {
            return Ethereal(_tier);
        } else if (_id == 23) {
            return Vengeful(_tier);
        } else if (_id == 24) {
            return Divine(_tier);
        } else if (_id == 25) {
            return Elusive(_tier);
        } else if (_id == 26) {
            return Protective(_tier);
        } else if (_id == 27) {
            return Pristine(_tier);
        } else if (_id == 28) {
            return Glacial(_tier);
        } else if (_id == 29) {
            return Rugged(_tier);
        } else if (_id == 30) {
            return Ruthless(_tier);
        } else if (_id == 31) {
            return Lurid(_tier);
        } else if (_id == 32) {
            return Pastoral(_tier);
        } else if (_id == 33) {
            return Supreme(_tier);
        } else if (_id == 34) {
            return Banishing(_tier);
        } else if (_id == 35) {
            return Shapened(_tier);
        } else if (_id == 36) {
            return Obsidian(_tier);
        } else if (_id == 37) {
            return Devoted(_tier);
        } else if (_id == 38) {
            return Revival(_tier);
        } else if (_id == 39) {
            return Damned(_tier);
        } else if (_id == 40) {
            return Unholy(_tier);
        } else if (_id == 41) {
            return Smoky(_tier);
        } else if (_id == 42) {
            return Shardy(_tier);
        } else if (_id == 43) {
            return Shiny(_tier);
        }

        revert("invalid");
    }

    function getPercentage(uint val, uint percentage) internal pure returns(uint) {
        return (val * percentage) / 100;
    }

    function baseStr() internal pure returns(uint) {
        return 14;
    }

    function baseDex() internal pure returns(uint) {
        return 3;
    }

    function baseAgi() internal pure returns(uint) {
        return 3;
    }

    function baseInt() internal pure returns(uint) {
        return 15;
    }
    
    function baseVit() internal pure returns(uint) {
        return 16;
    }
    
    function baseLuck() internal pure returns(uint) {
        return 3;
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



    function none() public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "";
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
    function Berserkers(uint _tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Berserker's";
        _prefix.difficulty = 1;
        _prefix.statBonus = GameObjects.Stats({
        STR : baseStr() * _tier,
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
        INT : baseInt() * _tier,
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
        STR : baseStr() * _tier,
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
        AGI : baseAgi() * _tier,
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
        COLD_ATK : baseEleAtk() * _tier,
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
        INT : baseInt() * _tier,
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
        STR : baseStr() * _tier,
        DEX : baseDex() * _tier,
        AGI : baseAgi() * _tier,
        INT : baseInt() * _tier,
        VIT : baseVit() * _tier,
        LUCK : baseLuck() * _tier
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
        STR : baseStr() * _tier,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : baseLuck() * _tier
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
        STR : baseStr() * _tier,
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
        INT : baseInt() * _tier,
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
        AGI : baseAgi() * _tier,
        INT : baseInt() * _tier,
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
        VIT : baseVit() * _tier,
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
        AGI : baseAgi() * _tier,
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
        DEX : baseDex() * _tier,
        AGI : baseAgi() * _tier,
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
        LUCK : baseLuck() * _tier
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
        LUCK : baseLuck() * _tier
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
        STR : baseStr() * _tier,
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
        VIT : baseVit() * _tier,
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
        STR : baseStr() * _tier,
        DEX : baseDex() * _tier,
        AGI : baseAgi() * _tier,
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
        INT : baseInt() * _tier,
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
        AGI : baseAgi() * _tier,
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
        LUCK : baseLuck() * _tier
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
        AGI : baseAgi() * _tier,
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
        INT : baseInt() * _tier,
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