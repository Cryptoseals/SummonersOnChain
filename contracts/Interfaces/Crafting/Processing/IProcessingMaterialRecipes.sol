import {CraftingRecipe} from "../../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial, ProcessingRecipe, UpgradingRecipe} from "../../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

interface IProcessingMaterialRecipes {
    function recipe(CraftingMaterial material, uint amount) external view returns (ProcessingRecipe memory _recipe);
    function upgradeRecipe(CraftingMaterial material, uint amount) external view returns (UpgradingRecipe memory _recipe);
}
