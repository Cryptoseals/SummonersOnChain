import "../GameObjects/IGameObjects.sol";

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface ICodexElixirRecipes {

    function lifetime_by_tier(uint _id) external pure returns (uint256);

    function getAllElixirs(uint8 tier) external pure returns (GameObjects.ElixirRecipe[] memory);

    function recipe(uint _id, uint8 _tier) external pure returns (GameObjects.ElixirRecipe memory _recipe);

}