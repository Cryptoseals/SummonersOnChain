import {Suffix, ElementalDef, ElementalAtk} from "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexSuffixes {
    string constant public index = "Codex";
    string constant public class = "Suffixes";
    string constant public version = "0.0.1";

    function allSuffix(uint tier) external view returns (Suffix[] memory){
        Suffix[] memory result = new Suffix[](45);
        for (uint i = 0; i <= 44; i++) {
            result[i] = suffix(i, tier);
        }
        return result;
    }

    function suffix(uint _id,
        uint _tier) public pure returns (Suffix memory) {
        require(_tier < 21, "?");
        if (_id == 0) {
            return none();
        }
        if (_id == 1) {
            return OfSolarion(_tier);
        } else if (_id == 2) {
            return OfTemplar(_tier);
        } else if (_id == 3) {
            return OfPhoenix(_tier);
        } else if (_id == 4) {
            return OfCelestion(_tier);
        } else if (_id == 5) {
            return OfBaphomet(_tier);
        } else if (_id == 6) {
            return OfSujin(_tier);
        } else if (_id == 7) {
            return OfSentinel(_tier);
        } else if (_id == 8) {
            return OfVerdant(_tier);
        } else if (_id == 9) {
            return OfWatcher(_tier);
        } else if (_id == 10) {
            return OfDeathbringer(_tier);
        } else if (_id == 11) {
            return OfWraith(_tier);
        } else if (_id == 12) {
            return OfSpellcaster(_tier);
        } else if (_id == 13) {
            return OfLuminous(_tier);
        } else if (_id == 14) {
            return OfFallen(_tier);
        } else if (_id == 15) {
            return OfGreedy(_tier);
        } else if (_id == 16) {
            return OfBlacksmith(_tier);
        } else if (_id == 17) {
            return OfSun(_tier);
        } else if (_id == 18) {
            return OfMoon(_tier);
        } else if (_id == 19) {
            return OfStorm(_tier);
        } else if (_id == 20) {
            return OfGladiator(_tier);
        } else if (_id == 21) {
            return OfVoidheart(_tier);
        } else if (_id == 22) {
            return OfTroll(_tier);
        } else if (_id == 23) {
            return OfWarmonger(_tier);
        } else if (_id == 24) {
            return OfAssassin(_tier);
        } else if (_id == 25) {
            return OfDeath(_tier);
        } else if (_id == 26) {
            return OfAcrobat(_tier);
        } else if (_id == 27) {
            return OfShadow(_tier);
        } else if (_id == 28) {
            return OfConcentration(_tier);
        } else if (_id == 29) {
            return OfGuardian(_tier);
        } else if (_id == 30) {
            return OfSavage(_tier);
        } else if (_id == 31) {
            return OfCultist(_tier);
        } else if (_id == 32) {
            return OfFaith(_tier);
        } else if (_id == 33) {
            return OfWanderer(_tier);
        } else if (_id == 34) {
            return OfRoots(_tier);
        } else if (_id == 35) {
            return OfOrder(_tier);
        } else if (_id == 36) {
            return OfSeal(_tier);
        } else if (_id == 37) {
            return OfResistance(_tier);
        } else if (_id == 38) {
            return OfFortitude(_tier);
        } else if (_id == 39) {
            return OfRunes(_tier);
        } else if (_id == 40) {
            return OfMalevolence(_tier);
        } else if (_id == 41) {
            return OfEclipse(_tier);
        } else if (_id == 42) {
            return OfImmortal(_tier);
        } else if (_id == 43) {
            return OfSanctity(_tier);
        } else if (_id == 44) {
            return OfWisdom(_tier);
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
        return 10;
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

    function none() public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "";
        _suffix.difficulty = 1;
    }

    function OfSolarion(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Solarion";
        _suffix.difficulty = 1;

        _suffix.elementalStats.ElementalAtk.EARTH_ATK = baseEleAtk() * _tier;

        _suffix.elementalStats.ElementalDef.EARTH_DEF = baseEleDef() * _tier;
    }

    function OfTemplar(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Templar";
        _suffix.difficulty = 1;

        _suffix.elementalStats.ElementalAtk.LIGHTNING_ATK = baseEleAtk() * _tier;

        _suffix.elementalStats.ElementalDef.LIGHTNING_DEF = baseEleDef() * _tier;
    }

    function OfPhoenix(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Phoenix";
        _suffix.difficulty = 1;

        _suffix.elementalStats.ElementalAtk.FIRE_ATK = baseEleAtk() * _tier;

        _suffix.elementalStats.ElementalDef.FIRE_DEF = baseEleDef() * _tier;
    }

    function OfCelestion(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Celestion";
        _suffix.difficulty = 4;

        _suffix.elementalStats.ElementalAtk.VOID_ATK = baseEleAtk() * _tier;

        _suffix.elementalStats.ElementalDef.VOID_DEF = baseEleDef() * _tier;
    }

    function OfBaphomet(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Baphomet";
        _suffix.difficulty = 1;

        _suffix.elementalStats.ElementalAtk.DARK_ATK = baseEleAtk() * _tier;

        _suffix.elementalStats.ElementalDef.DARK_DEF = baseEleDef() * _tier;
    }

    function OfSujin(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Sujin";
        _suffix.difficulty = 1;

        _suffix.elementalStats.ElementalAtk.COLD_ATK = baseEleAtk() * _tier;

        _suffix.elementalStats.ElementalDef.COLD_DEF = baseEleDef() * _tier;
    }

    function OfSentinel(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Sentinel";
        _suffix.difficulty = 1;

        _suffix.elementalStats.ElementalAtk.HOLY_ATK = baseEleAtk() * _tier;

        _suffix.elementalStats.ElementalDef.HOLY_DEF = baseEleDef() * _tier;
    }

    function OfVerdant(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Verdant";
        _suffix.difficulty = 1;

        _suffix.generatedStatBonus.M_ATK = baseAtk() * _tier;

        _suffix.generatedStatBonus.M_DEF = baseDef() * _tier;
    }

    function OfWatcher(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Watcher";
        _suffix.difficulty = 1;

        _suffix.statBonus.INT = baseInt() * _tier;

        _suffix.statBonus.LUCK = baseLuck() * _tier;
    }

    function OfDeathbringer(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Deathbringer";
        _suffix.difficulty = 4;

        _suffix.statBonus.LUCK = baseLuck() * _tier;

        _suffix.generatedStatBonus.CRIT = baseCrit() * _tier;

        _suffix.generatedStatBonus.CRIT_MULTIPLIER = baseCritMulti() * _tier;
    }

    function OfWraith(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Wraith";
        _suffix.difficulty = 1;

        _suffix.generatedStatBonus.DODGE = baseDodge() * _tier;
    }

    function OfSpellcaster(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Spellcaster";
        _suffix.difficulty = 2;

        _suffix.statBonus.INT = baseInt() * _tier;

        _suffix.generatedStatBonus.M_ATK = baseAtk() * _tier;

        _suffix.generatedStatBonus.CRIT = baseCrit() * _tier;
    }

    function OfLuminous(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Luminous";
        _suffix.difficulty = 1;

        _suffix.generatedStatBonus.P_DEF = baseDef() * _tier;

        _suffix.generatedStatBonus.M_DEF = baseDef() * _tier;
    }

    function OfFallen(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Fallen";
        _suffix.difficulty = 2;

        _suffix.generatedStatBonus.P_DEF = baseDef() * _tier;

        _suffix.generatedStatBonus.M_DEF = baseDef() * _tier;
    }

    function OfGreedy(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Greedy";
        _suffix.difficulty = 1;

        _suffix.statBonus.LUCK = baseLuck() * _tier;
    }

    function OfBlacksmith(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Blacksmith";
        _suffix.difficulty = 3;

        _suffix.statBonus.INT = baseInt() * _tier;

        _suffix.statBonus.LUCK = baseLuck() * _tier;

        _suffix.generatedStatBonus.P_DEF = baseDef() * _tier;
    }

    function OfSun(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Sun";
        _suffix.difficulty = 2;

        _suffix.statBonus.VIT = baseVit() * _tier;

        _suffix.elementalStats.ElementalAtk.FIRE_ATK = baseEleAtk() * _tier;
    }

    function OfMoon(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Moon";
        _suffix.difficulty = 2;

        _suffix.statBonus.VIT = baseVit() * _tier;

        _suffix.elementalStats.ElementalAtk.COLD_ATK = baseEleAtk() * _tier;
    }

    function OfStorm(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Storm";
        _suffix.difficulty = 2;

        _suffix.statBonus.INT = baseInt() * _tier;

        _suffix.elementalStats.ElementalAtk.LIGHTNING_ATK = baseEleAtk() * _tier;
    }

    function OfGladiator(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Gladiator";
        _suffix.difficulty = 2;

        _suffix.generatedStatBonus.P_ATK = baseAtk() * _tier;

        _suffix.generatedStatBonus.CRIT_MULTIPLIER = baseCritMulti() * _tier;
    }

    function OfVoidheart(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Voidheart";
        _suffix.difficulty = 5;

        _suffix.elementalStats.ElementalAtk.VOID_ATK = baseEleAtk() * _tier;
    }

    function OfTroll(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Troll";
        _suffix.difficulty = 1;

        _suffix.statBonus.STR = baseStr() * _tier;

        _suffix.statBonus.VIT = baseVit() * _tier;
    }

    function OfWarmonger(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Warmonger";
        _suffix.difficulty = 2;

        _suffix.statBonus.STR = baseStr() * _tier;

        _suffix.statBonus.DEX = baseDex() * _tier;

        _suffix.generatedStatBonus.P_ATK = baseAtk() * _tier;
    }

    function OfAssassin(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Assassin";
        _suffix.difficulty = 3;

        _suffix.statBonus.DEX = baseDex() * _tier;

        _suffix.statBonus.AGI = baseAgi() * _tier;

        _suffix.generatedStatBonus.CRIT = baseCrit() * _tier;

        _suffix.generatedStatBonus.CRIT_MULTIPLIER = baseCritMulti() * _tier;
    }

    function OfDeath(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Death";
        _suffix.difficulty = 3;
        _suffix.statBonus.DEX = baseDex() * _tier;

        _suffix.generatedStatBonus.P_DEF = baseDef() * _tier;

        _suffix.elementalStats.ElementalAtk.DARK_ATK = baseEleAtk() * _tier;
    }

    function OfAcrobat(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Acrobat";
        _suffix.difficulty = 3;

        _suffix.statBonus.DEX = baseDex() * _tier;

        _suffix.statBonus.AGI = baseAgi() * _tier;

        _suffix.generatedStatBonus.DODGE = baseDodge() * _tier;
    }

    function OfShadow(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Shadow";
        _suffix.difficulty = 2;

        _suffix.generatedStatBonus.M_ATK = baseAtk() * _tier;

        _suffix.elementalStats.ElementalDef.HOLY_DEF = baseEleDef() * _tier;
    }

    function OfConcentration(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Concentration";
        _suffix.difficulty = 2;

        _suffix.statBonus.INT = baseInt() * _tier;

        _suffix.generatedStatBonus.ACCURACY = baseAcc() * _tier;
    }

    function OfGuardian(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Guardian";
        _suffix.difficulty = 3;

        _suffix.statBonus.VIT = baseVit() * _tier;

        _suffix.generatedStatBonus.HP = baseHp() * _tier;

        _suffix.elementalStats.ElementalAtk.HOLY_ATK = baseEleAtk() * _tier;
    }

    function OfSavage(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Savage";
        _suffix.difficulty = 2;

        _suffix.generatedStatBonus.P_ATK = baseAtk() * _tier;

        _suffix.generatedStatBonus.M_ATK = baseAtk() * _tier;

        _suffix.generatedStatBonus.M_DEF = baseDef() * _tier;
    }

    function OfCultist(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Cultist";
        _suffix.difficulty = 3;

        _suffix.generatedStatBonus.M_ATK = baseAtk() * _tier;

        _suffix.elementalStats.ElementalAtk.DARK_ATK = baseEleAtk() * _tier;
    }

    function OfFaith(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Faith";
        _suffix.difficulty = 2;

        _suffix.statBonus.INT = baseInt() * _tier;

        _suffix.elementalStats.ElementalAtk.HOLY_ATK = baseEleAtk() * _tier;
    }

    function OfWanderer(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Wanderer";
        _suffix.difficulty = 1;

        _suffix.statBonus.DEX = baseDex() * _tier;

        _suffix.generatedStatBonus.ACCURACY = baseAcc() * _tier;
    }

    function OfRoots(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Roots";
        _suffix.difficulty = 3;

        _suffix.statBonus.AGI = baseAgi() * _tier;

        _suffix.generatedStatBonus.P_ATK = baseAtk() * _tier;

        _suffix.elementalStats.ElementalAtk.EARTH_ATK = baseEleAtk() * _tier;
    }

    function OfOrder(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Order";
        _suffix.difficulty = 2;

        _suffix.statBonus.INT = baseInt() * _tier;

        _suffix.statBonus.LUCK = baseLuck() * _tier;

        _suffix.generatedStatBonus.HP = baseHp() * _tier;
    }

    function OfSeal(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Seal";
        _suffix.difficulty = 4;

        _suffix.generatedStatBonus.P_ATK = baseAtk() * _tier;

        _suffix.generatedStatBonus.M_ATK = baseAtk() * _tier;

        _suffix.elementalStats.ElementalAtk.DARK_ATK = baseEleAtk() * _tier;
    }

    function OfResistance(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Resistance";
        _suffix.difficulty = 3;

        _suffix.elementalStats.ElementalDef = ElementalDef({
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : baseEleDef() * _tier
        });
    }

    function OfFortitude(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Fortitude";
        _suffix.difficulty = 2;

        _suffix.generatedStatBonus.HP = baseHp() * _tier;

        _suffix.generatedStatBonus.P_ATK = baseAtk() * _tier;

        _suffix.generatedStatBonus.ACCURACY = baseAcc() * _tier;
    }

    function OfRunes(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Runes";
        _suffix.difficulty = 3;

        _suffix.statBonus.DEX = baseDex() * _tier;

        _suffix.generatedStatBonus.HP = baseHp() * _tier;

        _suffix.generatedStatBonus.M_DEF = baseDef() * _tier;
    }

    function OfMalevolence(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Malevolence";
        _suffix.difficulty = 2;

        _suffix.generatedStatBonus.M_ATK = baseAtk() * _tier;

        _suffix.elementalStats.ElementalAtk.FIRE_ATK = baseEleAtk() * _tier;
    }

    function OfEclipse(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Eclipse";
        _suffix.difficulty = 2;

        _suffix.generatedStatBonus.M_ATK = baseAtk() * _tier;

        _suffix.elementalStats.ElementalAtk.COLD_ATK = baseEleAtk() * _tier;
    }

    function OfImmortal(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Immortal";
        _suffix.difficulty = 3;

        _suffix.generatedStatBonus.HP = baseHp() * _tier;

        _suffix.generatedStatBonus.P_DEF = baseDef() * _tier;

        _suffix.generatedStatBonus.M_DEF = baseDef() * _tier;

        _suffix.generatedStatBonus.DODGE = baseDodge() * _tier;
    }

    function OfSanctity(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Sanctity";
        _suffix.difficulty = 2;

        _suffix.elementalStats.ElementalAtk.HOLY_ATK = baseEleAtk() * _tier;

        _suffix.elementalStats.ElementalDef.DARK_DEF = baseEleDef() * _tier;
    }

    function OfWisdom(uint _tier) public pure returns (Suffix memory _suffix) {
        _suffix.isPercentage = true;
        //        _suffix.title = "of Wisdom";
        _suffix.difficulty = 1;

        _suffix.statBonus.INT = baseInt() * _tier;

        _suffix.generatedStatBonus.M_ATK = baseAtk() * _tier;
    }
}