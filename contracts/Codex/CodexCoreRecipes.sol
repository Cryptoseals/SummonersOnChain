import {MaterialRequirement, BasicMiscRequirement, BasicAlchemyRequirement, CoreRecipe} from "../Interfaces/GameObjects/IGameObjects.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";
import {IAlchemyItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
import {IMiscs} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IMisc.sol";
import {CraftingMaterial} from "../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexCoreRecipes {
    string public constant index = "Codex";
    string public constant class = "CoreRecipes";
    string public constant version = "0.0.1";

    function getAllCoreRecipes() external pure returns (CoreRecipe[] memory) {
        CoreRecipe[] memory result = new CoreRecipe[](1);
        for (uint256 i = 1; i < 61; i++) {
            result[i - 1] = recipe_by_id(i);
        }
        return result;
    }

    function recipe_by_id(uint256 _id)
        public
        pure
        returns (CoreRecipe memory _recipe)
    {
        if (_id == 1) {
            return EarthCore();
        } else if (_id == 2) {
            return EarthCore(); // continue here...
        }

        revert("wrong");
    }

    function EarthCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 1;
        // example - alch.
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Ancient_Flower;
        _recipe.requiredAlchemyItems[0].amount = 1;

        // example - misc.
        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Junk;
        _recipe.requiredMiscItems[0].amount = 1;

        // example - misc.
        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.COPPER;
        _recipe.requiredMaterials[0].amount = 1;
    }

    function generateCraftingMaterialRequirement(uint256 length)
        internal
        pure
        returns (MaterialRequirement[] memory)
    {
        return new MaterialRequirement[](length);
    }

    function generateMiscRequirement(uint256 length)
        internal
        pure
        returns (BasicMiscRequirement[] memory)
    {
        return new BasicMiscRequirement[](length);
    }

    function generateAlchemyRequirement(uint256 length)
        internal
        pure
        returns (BasicAlchemyRequirement[] memory)
    {
        return new BasicAlchemyRequirement[](length);
    }
}
