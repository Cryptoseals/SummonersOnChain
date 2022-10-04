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
    ) external view returns (bool _isEquipped, uint256 lvl);

    function decreaseCooldowns(uint256 summoner) external;

    function markSpellUsed(
        uint256 summoner,
        SpellCategories cat,
        uint256 spellId
    ) external;
}
