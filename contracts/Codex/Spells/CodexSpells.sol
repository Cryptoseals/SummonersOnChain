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

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function spell(
        SpellCategories _category,
        uint256 _id,
        uint256 _tier
    ) public view returns (Spell memory) {
        SpellCodex _contract;
        if (_category == SpellCategories.PHYSICAL) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.PHYSICAL_SPELLS)
            );
        } else if (_category == SpellCategories.ARCANE) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.ARCANE_SPELLS)
            );
        } else if (_category == SpellCategories.FIRE) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.FIRE_SPELLS)
            );
        } else if (_category == SpellCategories.COLD) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.COLD_SPELLS)
            );
        } else if (_category == SpellCategories.LIGHTNING) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.LIGHTNING_SPELLS)
            );
        } else if (_category == SpellCategories.EARTH) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.EARTH_SPELLS)
            );
        } else if (_category == SpellCategories.DARK) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.DARK_SPELLS)
            );
        } else if (_category == SpellCategories.HOLY) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.HOLY_SPELLS)
            );
        } else if (_category == SpellCategories.GADGET) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.GADGET_SPELLS)
            );
        } else if (_category == SpellCategories.VOID) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.VOID_SPELLS)
            );
        } else if (_category == SpellCategories.RANGED) {
            _contract = SpellCodex(
                contractAddress(INavigator.CONTRACT.RANGED_SPELLS)
            );
        } else {
            revert("?");
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
