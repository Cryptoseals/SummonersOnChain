import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {InitNavigator, INavigator} from "../../Core/Navigator/InitNavigator.sol";
import {ISpell, GameObjects} from "../../Interfaces/GameObjects/ISpell.sol";
pragma solidity ^0.8.0;

interface SpellCodex {
    function spell(uint _id, uint _tier) external pure returns (ISpell.Spell memory);
}

contract CodexSpells is Initializable, InitNavigator {
    string constant public index = "Codex";
    string constant public _class = "Spells";
    string constant public version = "0.0.1";

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function classSpells(GameObjects.Class _class) external view returns(bool[11] memory) {
        //Assassin: Physical, Dark, Arcane, Void
        //Necromancer: Dark, Arcane, Cold, Void
        //Priest: Lightning, Earth, Holy, Void
        //Barbarian: Physical, Gadgets, Earth, Void
        //Engineer: Physical, Lightning, Gadgets, Void
        //Paladin: Physical, Fire, Holy, Void
        //Wizard: Fire, Cold, Lightning, Arcane, Void
        //Ranger: Physical, Gadgets, Ranged, Void

        //Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger

        //          FIRE,  COLD,  EARTH,  LNG, ARCANE,PHYS, DARK, HOLY,  GADGET,VOID, RANGED

        if(_class == GameObjects.Class.Barbarian) {
            return [false, false, true, false, false, true, false, false, true, true, false];
        }
        if(_class == GameObjects.Class.Paladin) {
            return [true, false, false, false, false, true, false, true, false, true, false];
        }
        if(_class == GameObjects.Class.Assassin) {
            return [false, false, false, false, true, true, false, false, false, true, true];
        }
        if(_class == GameObjects.Class.Wizard) {
            return [true, true, true, false, true, false, false, false, false, true, false];
        }
        if(_class == GameObjects.Class.Necromancer) {
            return [false, true, false, false, true, false, true, false, false, true, false];
        }
        if(_class == GameObjects.Class.Priest) {
            return [false, false, true, true, false, false, false, true, false, true, false];
        }
        if(_class == GameObjects.Class.Engineer) {
            return [false, false, false, true, false, true, false, false, true, true, false];
        }
        if(_class == GameObjects.Class.Ranger) {
            return [false, false, false, false, false, true, false, true, true, true, true];
        }
        revert();
    }

    function spell(ISpell.SpellCategories _category, uint _id, uint _tier) public view returns (ISpell.Spell memory) {
        SpellCodex _contract;
        if (_category == ISpell.SpellCategories.PHYSICAL) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.PHYSICAL_SPELLS));
        } else if (_category == ISpell.SpellCategories.ARCANE) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.ARCANE_SPELLS));
        } else if (_category == ISpell.SpellCategories.FIRE) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.FIRE_SPELLS));
        } else if (_category == ISpell.SpellCategories.COLD) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.COLD_SPELLS));
        } else if (_category == ISpell.SpellCategories.LIGHTNING) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.LIGHTNING_SPELLS));
        } else if (_category == ISpell.SpellCategories.EARTH) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.EARTH_SPELLS));
        } else if (_category == ISpell.SpellCategories.DARK) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.DARK_SPELLS));
        } else if (_category == ISpell.SpellCategories.HOLY) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.HOLY_SPELLS));
        }  else if (_category == ISpell.SpellCategories.GADGET) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.GADGET_SPELLS));
        } else if (_category == ISpell.SpellCategories.VOID) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.VOID_SPELLS));
        } else if (_category == ISpell.SpellCategories.RANGED) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.RANGED_SPELLS));
        } else {
            revert("?");
        }

        return _contract.spell(_id, _tier);
    }

}
