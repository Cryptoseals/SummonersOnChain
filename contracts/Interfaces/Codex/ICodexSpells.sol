import {Spell, SpellCategories} from "../GameObjects/ISpell.sol";
import {Class} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.15;

interface ICodexSpells {
    function spell(SpellCategories _category, uint _id, uint _tier) external pure returns (Spell memory);
    function classSpells(Class _class) external view returns(bool[11] memory);
}
