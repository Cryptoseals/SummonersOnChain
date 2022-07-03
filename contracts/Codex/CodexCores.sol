import {ICore, GameObjects} from "../Interfaces/GameObjects/ICore.sol";
pragma solidity ^0.8.0;

contract CodexCores {
    string constant public index = "Codex";
    string constant public class = "Cores";
    string constant public version = "0.0.1";

    function getAllCores() external view returns (ICore.Core[] memory) {
        ICore.Core[] memory result = new ICore.Core[](97);
        for (uint i = 1; i <= 97; i++) {
            result[i - 1] = core(i);
        }
        return result;
    }

    function core(uint _id) public view returns (ICore.Core memory) {
        if (_id == 1) {return earthCore();}
        else if (_id == 2) {return lightningCore();}
        else if (_id == 3) {return fireCore();}
        else if (_id == 4) {return coldCore();}
        else if (_id == 5) {return darkCore();}
        else if (_id == 6) {return holyCore();}
        else if (_id == 7) {return voidCore();}
        else if (_id == 8) {return physicalCore();}
        else if (_id == 9) {return arcaneCore();}
        else if (_id == 10) {return solarionCore();}
        else if (_id == 11) {return templarCore();}
        else if (_id == 12) {return phoenixCore();}
        else if (_id == 13) {return celestionCore();}
        else if (_id == 14) {return baphometCore();}
        else if (_id == 15) {return sujinCore();}
        else if (_id == 16) {return sentinelCore();}
        else if (_id == 17) {return verdantCore();}
        else if (_id == 18) {return watcherCore();}
        else if (_id == 19) {return deathbringerCore();}
        else if (_id == 20) {return wraithCore();}
        else if (_id == 21) {return spellcasterCore();}
        else if (_id == 22) {return luminousCore();}
        else if (_id == 23) {return fallenCore();}
        else if (_id == 24) {return greedyCore();}
        else if (_id == 25) {return blacksmithCore();}
        else if (_id == 26) {return sunCore();}
        else if (_id == 27) {return moonCore();}
        else if (_id == 28) {return stormCore();}
        else if (_id == 29) {return gladiatorCore();}
        else if (_id == 30) {return voidheartCore();}
        else if (_id == 31) {return trollCore();}
        else if (_id == 32) {return warmongerCore();}
        else if (_id == 33) {return assassinCore();}
        else if (_id == 34) {return deathCore();}
        else if (_id == 35) {return acrobatCore();}
        else if (_id == 36) {return shadowCore();}
        else if (_id == 37) {return concentrationCore();}
        else if (_id == 38) {return guardianCore();}
        else if (_id == 39) {return savageCore();}
        else if (_id == 40) {return cultistCore();}
        else if (_id == 41) {return faithCore();}
        else if (_id == 42) {return wandererCore();}
        else if (_id == 43) {return rootsCore();}
        else if (_id == 44) {return orderCore();}
        else if (_id == 45) {return sealCore();}
        else if (_id == 46) {return resistanceCore();}
        else if (_id == 47) {return fortitudeCore();}
        else if (_id == 48) {return runesCore();}
        else if (_id == 49) {return malevolenceCore();}
        else if (_id == 50) {return eclipseCore();}
        else if (_id == 51) {return immortalCore();}
        else if (_id == 52) {return sanctityCore();}
        else if (_id == 53) {return wisdomCore();}
        else if (_id == 54) {return berserkerCore();}
        else if (_id == 55) {return wizardCore();}
        else if (_id == 56) {return elementalistCore();}
        else if (_id == 57) {return ferociousCore();}
        else if (_id == 58) {return wickedCore();}
        else if (_id == 59) {return sharpshooterCore();}
        else if (_id == 60) {return skirmishingCore();}
        else if (_id == 61) {return defiantCore();}
        else if (_id == 62) {return mercilessCore();}
        else if (_id == 63) {return fieryCore();}
        else if (_id == 64) {return thunderousCore();}
        else if (_id == 65) {return righteousCore();}
        else if (_id == 66) {return frozenCore();}
        else if (_id == 67) {return naturalCore();}
        else if (_id == 68) {return sacredCore();}
        else if (_id == 69) {return eternalCore();}
        else if (_id == 70) {return devastatingCore();}
        else if (_id == 71) {return forgedCore();}
        else if (_id == 72) {return mysticalCore();}
        else if (_id == 73) {return cleverCore();}
        else if (_id == 74) {return enormousCore();}
        else if (_id == 75) {return etherealCore();}
        else if (_id == 76) {return vengefulCore();}
        else if (_id == 77) {return divineCore();}
        else if (_id == 78) {return elusiveCore();}
        else if (_id == 79) {return protectiveCore();}
        else if (_id == 80) {return pristineCore();}
        else if (_id == 81) {return glacialCore();}
        else if (_id == 82) {return ruggedCore();}
        else if (_id == 83) {return ruthlessCore();}
        else if (_id == 84) {return luridCore();}
        else if (_id == 85) {return pastoralCore();}
        else if (_id == 86) {return supremeCore();}
        else if (_id == 87) {return banishingCore();}
        else if (_id == 88) {return sharpenedCore();}
        else if (_id == 89) {return obsidianCore();}
        else if (_id == 90) {return devotedCore();}
        else if (_id == 91) {return revivalCore();}
        else if (_id == 92) {return damnedCore();}
        else if (_id == 93) {return unholyCore();}
        else if (_id == 94) {return smokyCore();}
        else if (_id == 95) {return shardyCore();}
        else if (_id == 96) {return shinyCore();}

        else {revert("?c");}
    }

    function earthCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_ELEMENT;
        _core.fx.elementToAdd = GameObjects.Element.EARTH;
        _core.minItemLvl = 10;
    }

    function lightningCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_ELEMENT;
        _core.fx.elementToAdd = GameObjects.Element.LIGHTNING;
        _core.minItemLvl = 10;
    }

    function fireCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_ELEMENT;
        _core.fx.elementToAdd = GameObjects.Element.FIRE;
        _core.minItemLvl = 10;
    }

    function coldCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_ELEMENT;
        _core.fx.elementToAdd = GameObjects.Element.COLD;
        _core.minItemLvl = 10;
    }

    function darkCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_ELEMENT;
        _core.fx.elementToAdd = GameObjects.Element.DARK;
        _core.minItemLvl = 10;
    }

    function holyCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_ELEMENT;
        _core.fx.elementToAdd = GameObjects.Element.HOLY;
        _core.minItemLvl = 10;
    }

    function voidCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 4;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_ELEMENT;
        _core.fx.elementToAdd = GameObjects.Element.VOID;
        _core.minItemLvl = 30;
    }

    function physicalCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_ELEMENT;
        _core.fx.elementToAdd = GameObjects.Element.PHYSICAL;
        _core.minItemLvl = 10;
    }

    function arcaneCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_ELEMENT;
        _core.fx.elementToAdd = GameObjects.Element.ARCANE;
        _core.minItemLvl = 10;
    }

    function solarionCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 1;
        _core.minItemLvl = 5;
    }

    function templarCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 2;
        _core.minItemLvl = 5;
    }

    function phoenixCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 3;
        _core.minItemLvl = 5;
    }

    function celestionCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 4;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 4;
        _core.minItemLvl = 30;
    }

    function baphometCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 5;
        _core.minItemLvl = 5;
    }

    function sujinCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 6;
        _core.minItemLvl = 5;
    }

    function sentinelCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 7;
        _core.minItemLvl = 5;
    }

    function verdantCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 8;
        _core.minItemLvl = 5;
    }

    function watcherCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 9;
        _core.minItemLvl = 5;
    }

    function deathbringerCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 4;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 10;
        _core.minItemLvl = 30;
    }

    function wraithCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 11;
        _core.minItemLvl = 5;
    }

    function spellcasterCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 12;
        _core.minItemLvl = 30;
    }

    function luminousCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 13;
        _core.minItemLvl = 5;
    }

    function fallenCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 14;
        _core.minItemLvl = 10;
    }

    function greedyCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 15;
        _core.minItemLvl = 5;
    }

    function blacksmithCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 16;
        _core.minItemLvl = 20;
    }

    function sunCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 17;
        _core.minItemLvl = 10;
    }

    function moonCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 18;
        _core.minItemLvl = 10;
    }

    function stormCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 19;
        _core.minItemLvl = 10;
    }

    function gladiatorCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 20;
        _core.minItemLvl = 10;
    }

    function voidheartCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 5;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 21;
        _core.minItemLvl = 35;
    }

    function trollCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 22;
        _core.minItemLvl = 5;
    }

    function warmongerCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 23;
        _core.minItemLvl = 20;
    }

    function assassinCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 24;
        _core.minItemLvl = 25;
    }

    function deathCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 25;
        _core.minItemLvl = 25;
    }

    function acrobatCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 26;
        _core.minItemLvl = 25;
    }

    function shadowCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 27;
        _core.minItemLvl = 15;
    }

    function concentrationCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 28;
        _core.minItemLvl = 15;
    }

    function guardianCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 29;
        _core.minItemLvl = 25;
    }

    function savageCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 30;
        _core.minItemLvl = 15;
    }

    function cultistCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 31;
        _core.minItemLvl = 25;
    }

    function faithCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 32;
        _core.minItemLvl = 15;
    }

    function wandererCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 33;
        _core.minItemLvl = 5;
    }

    function rootsCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 34;
        _core.minItemLvl = 25;
    }

    function orderCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 35;
        _core.minItemLvl = 15;
    }

    function sealCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 4;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 36;
        _core.minItemLvl = 30;
    }

    function resistanceCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 37;
        _core.minItemLvl = 25;
    }

    function fortitudeCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 38;
        _core.minItemLvl = 15;
    }

    function runesCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 39;
        _core.minItemLvl = 25;
    }

    function malevolenceCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 40;
        _core.minItemLvl = 15;
    }

    function eclipseCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 41;
        _core.minItemLvl = 15;
    }

    function immortalCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 42;
        _core.minItemLvl = 25;
    }

    function sanctityCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 43;
        _core.minItemLvl = 20;
    }

    function wisdomCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_SUFFIX;
        _core.fx.suffixToAdd = 44;
        _core.minItemLvl = 5;
    }

    function berserkerCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 1;
        _core.minItemLvl = 5;
    }

    function wizardCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 2;
        _core.minItemLvl = 5;
    }

    function elementalistCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 3;
        _core.minItemLvl = 5;
    }

    function ferociousCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 4;
        _core.minItemLvl = 15;
    }

    function wickedCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 5;
        _core.minItemLvl = 5;
    }

    function sharpshooterCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 6;
        _core.minItemLvl = 10;
    }

    function skirmishingCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 7;
        _core.minItemLvl = 5;
    }

    function defiantCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 8;
        _core.minItemLvl = 5;
    }

    function mercilessCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 9;
        _core.minItemLvl = 5;
    }

    function fieryCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 10;
        _core.minItemLvl = 5;
    }

    function thunderousCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 11;
        _core.minItemLvl = 5;
    }

    function righteousCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 12;
        _core.minItemLvl = 5;
    }

    function frozenCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 13;
        _core.minItemLvl = 5;
    }

    function naturalCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 14;
        _core.minItemLvl = 20;
    }

    function sacredCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 15;
        _core.minItemLvl = 30;
    }

    function eternalCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 5;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 16;
        _core.minItemLvl = 40;
    }

    function devastatingCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 17;
        _core.minItemLvl = 25;
    }

    function forgedCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 18;
        _core.minItemLvl = 20;
    }

    function mysticalCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 19;
        _core.minItemLvl = 15;
    }

    function cleverCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 20;
        _core.minItemLvl = 15;
    }

    function enormousCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 21;
        _core.minItemLvl = 15;
    }

    function etherealCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 22;
        _core.minItemLvl = 25;
    }

    function vengefulCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 23;
        _core.minItemLvl = 30;
    }

    function divineCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 24;
        _core.minItemLvl = 25;
    }

    function elusiveCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 25;
        _core.minItemLvl = 20;
    }

    function protectiveCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 26;
        _core.minItemLvl = 30;
    }

    function pristineCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 27;
        _core.minItemLvl = 30;
    }

    function glacialCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 28;
        _core.minItemLvl = 10;
    }

    function ruggedCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 29;
        _core.minItemLvl = 15;
    }

    function ruthlessCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 30;
        _core.minItemLvl = 5;
    }

    function luridCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 31;
        _core.minItemLvl = 5;
    }

    function pastoralCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 32;
        _core.minItemLvl = 10;
    }

    function supremeCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 33;
        _core.minItemLvl = 30;
    }

    function banishingCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 34;
        _core.minItemLvl = 25;
    }

    function sharpenedCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 1;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 35;
        _core.minItemLvl = 5;
    }

    function obsidianCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 36;
        _core.minItemLvl = 15;
    }

    function devotedCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 37;
        _core.minItemLvl = 15;
    }

    function revivalCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 38;
        _core.minItemLvl = 15;
    }

    function damnedCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 3;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 39;
        _core.minItemLvl = 25;
    }

    function unholyCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 40;
        _core.minItemLvl = 15;
    }

    function smokyCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 41;
        _core.minItemLvl = 15;
    }

    function shardyCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 42;
        _core.minItemLvl = 15;
    }

    function shinyCore() public view returns (ICore.Core memory _core) {
        _core.difficulty = 2;
        _core.fx.fxType = ICore.EffectType.OVERRIDE_PREFIX;
        _core.fx.prefixToAdd = 43;
        _core.minItemLvl = 15;
    }
}