import {GameObjects_Elixir} from "../GameObjects/IGameObjects.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

interface ICodexElixirRecipes {

    function lifetime_by_tier(uint _id) external pure returns (uint256);

    function getAllElixirs(uint8 tier) external pure returns (GameObjects_Elixir.ElixirRecipe[] memory);

    function recipe(uint _id, uint8 _tier) external pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe);

}