import {SpellCategories, Spell} from "../GameObjects/ISpell.sol";

pragma solidity ^0.8.0;

interface ISpells {
    function spellLevel(
        uint256 summoner,
        SpellCategories category,
        uint256 spellId
    ) external view returns (uint256);

    function isSpellEquipped(
        uint256 summoner,
        SpellCategories category,
        uint256 spellId
    ) external view returns (bool _isEquipped, uint lvl);
}
