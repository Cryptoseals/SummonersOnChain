import {Prefix, ElementalAtk, ElementalDef} from "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexPrefixes {
    string constant public index = "Codex";
    string constant public class = "Prefixes";
    string constant public version = "0.0.1";


    function allPrefix(uint tier) external view returns (Prefix[] memory){
        Prefix[] memory result = new Prefix[](44);
        for (uint i = 0; i < 44; i++) {
            result[i] = prefix(i, tier);
        }
        return result;
    }

    function prefix(uint _id, uint _tier) public pure returns (Prefix memory) {
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
            return Sharpened(_tier);
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

    function getPercentage(uint val, uint percentage) internal pure returns (uint) {
        return (val * percentage) / 100;
    }

    function baseStr() internal pure returns (uint) {
        return 50;
    }

    function baseDex() internal pure returns (uint) {
        return 30;
    }

    function baseAgi() internal pure returns (uint) {
        return 30;
    }

    function baseInt() internal pure returns (uint) {
        return 50;
    }

    function baseVit() internal pure returns (uint) {
        return 50;
    }

    function baseLuck() internal pure returns (uint) {
        return 30;
    }

    function baseAtk() internal pure returns (uint) {
        return 30;
    }

    function baseDef() internal pure returns (uint) {
        return 50;
    }

    function baseCrit() internal pure returns (uint) {
        return 100;
    }

    function baseCritMulti() internal pure returns (uint) {
        return 100;
    }

    function baseDodge() internal pure returns (uint) {
        return 20;
    }

    function baseAcc() internal pure returns (uint) {
        return 30;
    }

    function baseEleDef() internal pure returns (uint) {
        return 50;
    }

    function baseEleAtk() internal pure returns (uint) {
        return 50;
    }

    function baseHp() internal pure returns (uint) {
        return 30;
    }


    function none() public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "";
        _prefix.difficulty = 1;
    }

    function Berserkers(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Berserker's";
        _prefix.difficulty = 1;

        _prefix.statBonus.STR = baseStr() * _tier;

        _prefix.generatedStatBonus.P_ATK = baseAtk() * _tier;
    }

    function Wizards(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Wizard's";
        _prefix.difficulty = 1;

        _prefix.statBonus.INT = baseInt() * _tier;

        _prefix.generatedStatBonus.M_ATK = baseAtk() * _tier;
    }

    function Elementalists(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Elementalist's";
        _prefix.difficulty = 1;

        _prefix.elementalStats.ElementalAtk.FIRE_ATK = baseEleAtk() * _tier;
        _prefix.elementalStats.ElementalAtk.COLD_ATK = baseEleAtk() * _tier;
        _prefix.elementalStats.ElementalAtk.EARTH_ATK = baseEleAtk() * _tier;
        _prefix.elementalStats.ElementalAtk.LIGHTNING_ATK = baseEleAtk() * _tier;
        _prefix.elementalStats.ElementalAtk.DARK_ATK = baseEleAtk() * _tier;
        _prefix.elementalStats.ElementalAtk.HOLY_ATK = baseEleAtk() * _tier;
        _prefix.elementalStats.ElementalAtk.VOID_ATK = baseEleAtk() * _tier;

    }

    function Ferocious(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Ferocious";
        _prefix.difficulty = 2;

        _prefix.generatedStatBonus.CRIT_MULTIPLIER = baseCritMulti() * _tier;
    }

    function Wicked(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Wicked";
        _prefix.difficulty = 1;

        _prefix.statBonus.STR = baseStr() * _tier;

        _prefix.generatedStatBonus.P_ATK = baseAtk() * _tier;
    }

    function Sharpshooter(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Sharpshooter";
        _prefix.difficulty = 2;

        _prefix.statBonus.AGI = baseAgi() * _tier;

        _prefix.generatedStatBonus.CRIT = baseCrit() * _tier;
    }

    function Skirmishing(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Skirmishing";
        _prefix.difficulty = 1;

        _prefix.generatedStatBonus.M_ATK = baseAtk() * _tier;
    }

    function Defiant(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Defiant";
        _prefix.difficulty = 1;

        _prefix.generatedStatBonus.P_DEF = baseDef() * _tier;

        _prefix.elementalStats.ElementalDef.FIRE_DEF = baseEleDef() * _tier;
    }

    function Merciless(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Merciless";
        _prefix.difficulty = 1;


        _prefix.generatedStatBonus.M_DEF = baseDef() * _tier;

        _prefix.elementalStats.ElementalAtk.COLD_ATK = baseEleAtk() * _tier;

    }

    function Fiery(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Fiery";
        _prefix.difficulty = 1;

        _prefix.elementalStats.ElementalAtk.FIRE_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.FIRE_DEF = baseEleDef() * _tier;
    }

    function Thunderous(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Thunderous";
        _prefix.difficulty = 1;

        _prefix.elementalStats.ElementalAtk.LIGHTNING_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.LIGHTNING_DEF = baseEleDef() * _tier;
    }

    function Holy(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Holy";
        _prefix.difficulty = 1;

        _prefix.elementalStats.ElementalAtk.HOLY_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.HOLY_DEF = baseEleDef() * _tier;
    }

    function Frozen(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Frozen";
        _prefix.difficulty = 1;

        _prefix.elementalStats.ElementalAtk.COLD_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.COLD_DEF = baseEleDef() * _tier;
    }

    function Natural(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Natural";
        _prefix.difficulty = 2;
        _prefix.statBonus.INT = baseInt() * _tier;

        _prefix.elementalStats.ElementalAtk.EARTH_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.EARTH_DEF = baseEleDef() * _tier;
    }

    function Sacred(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Sacred";
        _prefix.difficulty = 3;

        _prefix.statBonus.STR = baseStr() * _tier;
        _prefix.statBonus.DEX = baseDex() * _tier;
        _prefix.statBonus.AGI = baseAgi() * _tier;
        _prefix.statBonus.INT = baseInt() * _tier;
        _prefix.statBonus.VIT = baseVit() * _tier;
        _prefix.statBonus.LUCK = baseLuck() * _tier;
    }

    function Eternal(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Eternal";
        _prefix.difficulty = 5;

        _prefix.elementalStats.ElementalAtk.VOID_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.VOID_DEF = baseEleDef() * _tier;
    }

    function Devastating(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Devastating ";
        _prefix.difficulty = 3;

        _prefix.statBonus.STR = baseStr() * _tier;

        _prefix.statBonus.LUCK = baseLuck() * _tier;

        _prefix.generatedStatBonus.CRIT = baseCrit() * _tier;
    }

    function Forged(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Forged";
        _prefix.difficulty = 2;

        _prefix.statBonus.STR = baseStr() * _tier;

        _prefix.generatedStatBonus.P_DEF = baseDef() * _tier;

        _prefix.elementalStats.ElementalDef.FIRE_DEF = baseEleDef() * _tier;
    }

    function Mystical(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Mystical";
        _prefix.difficulty = 2;

        _prefix.statBonus.INT = baseInt() * _tier;

        _prefix.generatedStatBonus.M_ATK = baseAtk() * _tier;
    }

    function Clever(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Clever";
        _prefix.difficulty = 2;

        _prefix.statBonus.AGI = baseAgi() * _tier;

        _prefix.statBonus.INT = baseInt() * _tier;
    }

    function Enormous(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Enormous";
        _prefix.difficulty = 2;

        _prefix.statBonus.VIT = baseVit() * _tier;

        _prefix.generatedStatBonus.HP = baseHp() * _tier;
    }

    function Ethereal(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Ethereal";
        _prefix.difficulty = 3;

        _prefix.generatedStatBonus.P_ATK = baseAtk() * _tier;

        _prefix.elementalStats.ElementalAtk.DARK_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.DARK_DEF = baseEleDef() * _tier;
    }

    function Vengeful(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Vengeful";
        _prefix.difficulty = 2;

        _prefix.statBonus.AGI = baseAgi() * _tier;

        _prefix.generatedStatBonus.CRIT = baseCrit() * _tier;

        _prefix.generatedStatBonus.CRIT_MULTIPLIER = baseCritMulti() * _tier;
    }

    function Divine(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Divine";
        _prefix.difficulty = 3;

        _prefix.generatedStatBonus.HP = baseHp() * _tier;

        _prefix.elementalStats.ElementalAtk.HOLY_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.DARK_DEF = baseEleDef() * _tier;
    }

    function Elusive(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Elusive";
        _prefix.difficulty = 2;

        _prefix.statBonus.DEX = baseDex() * _tier;
        _prefix.statBonus.AGI = baseAgi() * _tier;

        _prefix.generatedStatBonus.DODGE = baseDodge() * _tier;

    }

    function Protective(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Protective";
        _prefix.difficulty = 3;

        _prefix.generatedStatBonus.P_DEF = baseDef() * _tier;
        _prefix.generatedStatBonus.M_DEF = baseDef() * _tier;

        _prefix.elementalStats.ElementalDef = ElementalDef({
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : baseEleDef() * _tier
        });
    }

    function Pristine(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Pristine";
        _prefix.difficulty = 3;
        _prefix.statBonus.LUCK = baseLuck() * _tier;


        _prefix.elementalStats.ElementalDef = ElementalDef({
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : baseEleDef() * _tier
        });
    }

    function Glacial(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Glacial";
        _prefix.difficulty = 1;


        _prefix.elementalStats.ElementalAtk.COLD_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.FIRE_DEF = baseEleDef() * _tier;
    }

    function Rugged(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Rugged";
        _prefix.difficulty = 2;
        _prefix.statBonus.LUCK = baseLuck() * _tier;


        _prefix.generatedStatBonus.DODGE = baseDodge() * _tier;
    }

    function Ruthless(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Ruthless";
        _prefix.difficulty = 1;

        _prefix.statBonus.STR = baseStr() * _tier;

        _prefix.generatedStatBonus.ACCURACY = baseAcc() * _tier;
    }

    function Lurid(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Lurid";
        _prefix.difficulty = 1;

        _prefix.generatedStatBonus.ACCURACY = baseAcc() * _tier;

        _prefix.generatedStatBonus.DODGE = baseDodge() * _tier;
    }

    function Pastoral(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Pastoral";
        _prefix.difficulty = 1;

        _prefix.statBonus.VIT = baseVit() * _tier;

        _prefix.elementalStats.ElementalDef.EARTH_DEF = baseEleDef() * _tier;
    }

    function Supreme(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Supreme";
        _prefix.difficulty = 3;
        _prefix.statBonus.STR = baseStr() * _tier;
        _prefix.statBonus.DEX = baseDex() * _tier;
        _prefix.statBonus.AGI = baseAgi() * _tier;

        _prefix.elementalStats.ElementalDef = ElementalDef({
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : baseEleDef() * _tier
        });
    }

    function Banishing(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Banishing";
        _prefix.difficulty = 3;

        _prefix.statBonus.INT = baseInt() * _tier;

        _prefix.elementalStats.ElementalAtk.DARK_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.LIGHTNING_DEF = baseEleDef() * _tier;
    }

    function Sharpened(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Sharpened";
        _prefix.difficulty = 1;

        _prefix.generatedStatBonus.P_ATK = baseAtk() * _tier;

        _prefix.generatedStatBonus.ACCURACY = baseAcc() * _tier;
    }

    function Obsidian(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Obsidian";
        _prefix.difficulty = 2;

        _prefix.statBonus.AGI = baseAgi() * _tier;

        _prefix.elementalStats.ElementalDef.FIRE_DEF = baseEleDef() * _tier;
    }

    function Devoted(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Devoted";
        _prefix.difficulty = 2;

        _prefix.statBonus.LUCK = baseLuck() * _tier;

        _prefix.elementalStats.ElementalDef.HOLY_DEF = baseEleDef() * _tier;
    }

    function Revival(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Revival";
        _prefix.difficulty = 2;

        _prefix.statBonus.AGI = baseAgi() * _tier;

        _prefix.elementalStats.ElementalAtk.HOLY_ATK = baseEleAtk() * _tier;

    }

    function Damned(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Damned";
        _prefix.difficulty = 3;

        _prefix.generatedStatBonus.CRIT_MULTIPLIER = baseCritMulti() * _tier;

        _prefix.elementalStats.ElementalAtk.DARK_ATK = baseEleAtk() * _tier;

    }

    function Unholy(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Unholy";
        _prefix.difficulty = 2;

        _prefix.elementalStats.ElementalAtk.DARK_ATK = baseEleAtk() * _tier;

        _prefix.elementalStats.ElementalDef.DARK_DEF = baseEleDef() * _tier;
    }

    function Smoky(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Smoky";
        _prefix.difficulty = 2;

        _prefix.generatedStatBonus.DODGE = baseDodge() * _tier;

        _prefix.elementalStats.ElementalAtk.FIRE_ATK = baseEleAtk() * _tier;

    }

    function Shardy(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Shardy";
        _prefix.difficulty = 2;

        _prefix.generatedStatBonus.ACCURACY = baseAcc() * _tier;

        _prefix.elementalStats.ElementalAtk.COLD_ATK = baseEleAtk() * _tier;

    }

    function Shiny(uint _tier) public pure returns (Prefix memory _prefix) {
        _prefix.isPercentage = true;
        //        _prefix.title = "Shiny";
        _prefix.difficulty = 2;

        _prefix.statBonus.INT = baseInt() * _tier;

        _prefix.generatedStatBonus.ACCURACY = baseAcc() * _tier;

        _prefix.elementalStats.ElementalAtk.LIGHTNING_ATK = baseEleAtk() * _tier;

    }
}