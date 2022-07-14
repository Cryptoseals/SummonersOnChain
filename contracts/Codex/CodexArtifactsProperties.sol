import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {GameObjects, GameObjects_Equipments} from "../Interfaces/GameObjects/IGameObjects.sol";
import {InitNavigator} from "../Core/Navigator/InitNavigator.sol";
pragma solidity ^0.8.0;

contract CodexArtifactsProperties is InitNavigator, OwnableUpgradeable {
    string constant public index = "Codex";
    string constant public class = "ArtifactsProperties";
    string constant public version = "0.0.1";

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        __Ownable_init();
    }

    function properties(uint[] memory ids, uint tier) external view returns (GameObjects_Equipments.Artifact[] memory){
        GameObjects_Equipments.Artifact[] memory result = new  GameObjects_Equipments.Artifact[](ids.length);
        for (uint i = 0; i < ids.length; i++) {
            result[i] = property(ids[i], tier);
        }
        return result;
    }

    function property(uint _id, uint _tier) public pure returns (GameObjects_Equipments.Artifact memory) {
        if (_id == 1) {return STR(_tier);}
        else if (_id == 2) {return AGI(_tier);}
        else if (_id == 3) {return INT(_tier);}
        else if (_id == 4) {return DEX(_tier);}
        else if (_id == 5) {return VIT(_tier);}
        else if (_id == 6) {return LUCK(_tier);}
        else if (_id == 7) {return HP(_tier);}
        else if (_id == 8) {return P_ATK(_tier);}
        else if (_id == 9) {return P_DEF(_tier);}
        else if (_id == 10) {return M_ATK(_tier);}
        else if (_id == 11) {return M_DEF(_tier);}
        else if (_id == 12) {return ACC(_tier);}
        else if (_id == 13) {return DODGE(_tier);}
        else if (_id == 14) {return CRIT(_tier);}
        else if (_id == 15) {return CRIT_MULT(_tier);}
        else if (_id == 16) {return INFUSION(_tier);}
        else if (_id == 17) {return FIRE_ATK(_tier);}
        else if (_id == 18) {return FIRE_DEF(_tier);}
        else if (_id == 19) {return COLD_ATK(_tier);}
        else if (_id == 20) {return COLD_DEF(_tier);}
        else if (_id == 21) {return EARTH_ATK(_tier);}
        else if (_id == 22) {return EARTH_DEF(_tier);}
        else if (_id == 23) {return LIGHTNING_ATK(_tier);}
        else if (_id == 24) {return LIGHTNING_DEF(_tier);}
        else if (_id == 25) {return HOLY_ATK(_tier);}
        else if (_id == 26) {return HOLY_DEF(_tier);}
        else if (_id == 27) {return DARK_ATK(_tier);}
        else if (_id == 28) {return DARK_DEF(_tier);}
        else if (_id == 29) {return VOID_ATK(_tier);}
        else if (_id == 30) {return VOID_DEF(_tier);}

        revert("invalid");
    }

    function STR(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.statBonus.STR = 7 + tier * 2;
    }

    function AGI(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.statBonus.AGI = 7 + tier * 2;
    }

    function INT(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.statBonus.INT = 7 + tier * 2;
    }

    function DEX(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.statBonus.DEX = 7 + tier * 2;
    }

    function VIT(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.statBonus.VIT = 7 + tier * 2;
    }

    function LUCK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.statBonus.LUCK = 7 + tier * 2;
    }

    function HP(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.HP = 5 + tier * 2;
    }

    function P_ATK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.P_ATK = 5 + tier * 2;
    }

    function P_DEF(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.P_DEF = 5 + tier * 2;
    }

    function M_ATK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.M_ATK = 5 + tier * 2;
    }

    function M_DEF(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.M_DEF = 5 + tier * 2;
    }

    function ACC(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.ACCURACY = 5 + tier * 2;
    }

    function DODGE(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.DODGE = 5 + tier * 2;
    }

    function CRIT(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.CRIT = 5 + tier * 2;
    }

    function CRIT_MULT(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.CRIT_MULTIPLIER = 5 + tier * 2;
    }

    function INFUSION(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.generatedStatBonus.INFUSION = 5 + tier * 2;
    }

    function FIRE_ATK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalAtk.FIRE_ATK = 10 + tier * 2;
    }

    function FIRE_DEF(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalDef.FIRE_DEF = 10 + tier * 2;
    }

    function COLD_ATK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalAtk.COLD_ATK = 10 + tier * 2;
    }

    function COLD_DEF(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalDef.COLD_DEF = 10 + tier * 2;
    }

    function EARTH_ATK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalAtk.EARTH_ATK = 10 + tier * 2;
    }

    function EARTH_DEF(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalDef.EARTH_DEF = 10 + tier * 2;
    }

    function LIGHTNING_ATK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalAtk.LIGHTNING_ATK = 10 + tier * 2;
    }

    function LIGHTNING_DEF(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalDef.LIGHTNING_DEF = 10 + tier * 2;
    }

    function HOLY_ATK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalAtk.HOLY_ATK = 10 + tier * 2;
    }

    function HOLY_DEF(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalDef.HOLY_DEF = 10 + tier * 2;
    }

    function DARK_ATK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalAtk.DARK_ATK = 10 + tier * 2;
    }

    function DARK_DEF(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalDef.DARK_DEF = 10 + tier * 2;
    }

    function VOID_ATK(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalAtk.VOID_ATK = 10 + tier * 2;
    }

    function VOID_DEF(uint tier) public pure returns (GameObjects_Equipments.Artifact memory _property) {
        _property.elementalStats.ElementalDef.VOID_DEF = 10 + tier * 2;
    }
}