import {GameObjects_BuffEffects} from "../GameObjects/IGameObjects.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

interface ICodexBuffEffectRecipes {

    function lifetime_by_tier(uint _id) external pure returns (uint256);

    function getAllElixirs(uint8 tier) external pure returns (GameObjects_BuffEffects.BuffEffectRecipe[] memory);

    function recipe_by_id(uint _id) external pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe);
}