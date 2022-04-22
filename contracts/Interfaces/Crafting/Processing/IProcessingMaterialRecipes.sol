import "../../GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

interface IProcessingMaterialRecipes {
    function recipe(ICraftingMaterials.CraftingMaterial material, uint amount) external view returns (ICraftingMaterials.ProcessingRecipe memory _recipe);
}
