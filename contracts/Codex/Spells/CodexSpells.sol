import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {InitNavigator, INavigator} from "../../Core/Navigator/InitNavigator.sol";
import {Spell, SpellCategories} from "../../Interfaces/GameObjects/ISpell.sol";
pragma solidity ^0.8.0;

interface SpellCodex {
    function spell(uint _id, uint _tier) external pure returns (Spell memory);
}

contract CodexSpells is Initializable, InitNavigator {
    string constant public index = "Codex";
    string constant public _class = "Spells";
    string constant public version = "0.0.1";

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function spell(SpellCategories _category, uint _id, uint _tier) public view returns (Spell memory) {
        SpellCodex _contract;
        if (_category == SpellCategories.PHYSICAL) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.PHYSICAL_SPELLS));
        } else if (_category == SpellCategories.ARCANE) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.ARCANE_SPELLS));
        } else if (_category == SpellCategories.FIRE) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.FIRE_SPELLS));
        } else if (_category == SpellCategories.COLD) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.COLD_SPELLS));
        } else if (_category == SpellCategories.LIGHTNING) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.LIGHTNING_SPELLS));
        } else if (_category == SpellCategories.EARTH) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.EARTH_SPELLS));
        } else if (_category == SpellCategories.DARK) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.DARK_SPELLS));
        } else if (_category == SpellCategories.HOLY) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.HOLY_SPELLS));
        }  else if (_category == SpellCategories.GADGET) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.GADGET_SPELLS));
        } else if (_category == SpellCategories.VOID) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.VOID_SPELLS));
        } else if (_category == SpellCategories.RANGED) {
            _contract = SpellCodex(contractAddress(INavigator.CONTRACT.RANGED_SPELLS));
        } else {
            revert("?");
        }

        return _contract.spell(_id, _tier);
    }

}
