import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {InitNavigator, INavigator} from "../../Core/Navigator/InitNavigator.sol";
import {Spell, SpellCategories} from "../../Interfaces/GameObjects/ISpell.sol";
import {Class} from "../../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface SpellCodex {
    function spell(uint256 _id, uint256 _tier)
        external
        pure
        returns (Spell memory);
}

contract CodexSpells is Initializable, InitNavigator {
    string public constant index = "Codex";
    string public constant _class = "Spells";
    string public constant version = "0.0.1";
    SpellCodex public physical;
    SpellCodex public arcane;
    SpellCodex public fire;
    SpellCodex public cold;
    SpellCodex public lightning;
    SpellCodex public earth;
    SpellCodex public dark;
    SpellCodex public holy;
    SpellCodex public gadget;
    SpellCodex public ranged;
    SpellCodex public void;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function initializeContracts() external {
        physical = SpellCodex(
            contractAddress(INavigator.CONTRACT.PHYSICAL_SPELLS)
        );
        arcane = SpellCodex(contractAddress(INavigator.CONTRACT.ARCANE_SPELLS));
        fire = SpellCodex(contractAddress(INavigator.CONTRACT.FIRE_SPELLS));
        cold = SpellCodex(contractAddress(INavigator.CONTRACT.COLD_SPELLS));
        lightning = SpellCodex(
            contractAddress(INavigator.CONTRACT.LIGHTNING_SPELLS)
        );
        earth = SpellCodex(contractAddress(INavigator.CONTRACT.EARTH_SPELLS));
        dark = SpellCodex(contractAddress(INavigator.CONTRACT.DARK_SPELLS));
        holy = SpellCodex(contractAddress(INavigator.CONTRACT.HOLY_SPELLS));
        gadget = SpellCodex(contractAddress(INavigator.CONTRACT.GADGET_SPELLS));
        void = SpellCodex(contractAddress(INavigator.CONTRACT.VOID_SPELLS));
        ranged = SpellCodex(contractAddress(INavigator.CONTRACT.RANGED_SPELLS));
    }

    function spell(
        SpellCategories _category,
        uint256 _id,
        uint256 _tier
    ) public view returns (Spell memory) {
        require(_id > 0, "0");
        SpellCodex _contract;
        if (_category == SpellCategories.PHYSICAL) {
            _contract = physical;
        } else if (_category == SpellCategories.ARCANE) {
            _contract = arcane;
        } else if (_category == SpellCategories.FIRE) {
            _contract = fire;
        } else if (_category == SpellCategories.COLD) {
            _contract = cold;
        } else if (_category == SpellCategories.LIGHTNING) {
            _contract = lightning;
        } else if (_category == SpellCategories.EARTH) {
            _contract = earth;
        } else if (_category == SpellCategories.DARK) {
            _contract = dark;
        } else if (_category == SpellCategories.HOLY) {
            _contract = holy;
        } else if (_category == SpellCategories.GADGET) {
            _contract = gadget;
        } else if (_category == SpellCategories.VOID) {
            _contract = void;
        } else if (_category == SpellCategories.RANGED) {
            _contract = ranged;
        }

        return _contract.spell(_id, _tier);
    }

    // FIRE,  COLD,  EARTH,  LNG, ARCANE,PHYS, DARK, HOLY,  GADGET,VOID, RANGED

    function classSpells(Class _class) external view returns (bool[11] memory) {
        if (_class == Class.Barbarian) {
            return [
                false,
                false,
                true,
                false,
                false,
                true,
                false,
                false,
                true,
                true,
                false
            ];
        }
        if (_class == Class.Paladin) {
            return [
                true,
                false,
                false,
                false,
                false,
                true,
                false,
                true,
                false,
                true,
                false
            ];
        }
        if (_class == Class.Assassin) {
            return [
                false,
                false,
                false,
                false,
                true,
                true,
                false,
                false,
                false,
                true,
                true
            ];
        }
        if (_class == Class.Wizard) {
            return [
                true,
                true,
                true,
                false,
                true,
                false,
                false,
                false,
                false,
                true,
                false
            ];
        }
        if (_class == Class.Necromancer) {
            return [
                false,
                true,
                false,
                false,
                true,
                false,
                true,
                false,
                false,
                true,
                false
            ];
        }
        if (_class == Class.Priest) {
            return [
                false,
                false,
                true,
                true,
                false,
                false,
                false,
                true,
                false,
                true,
                false
            ];
        }
        if (_class == Class.Engineer) {
            return [
                false,
                false,
                false,
                true,
                false,
                true,
                false,
                false,
                true,
                true,
                false
            ];
        }
        if (_class == Class.Ranger) {
            return [
                false,
                false,
                false,
                false,
                false,
                true,
                false,
                true,
                true,
                true,
                true
            ];
        }
        revert();
    }
}
