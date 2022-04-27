import "../../../Interfaces/Crafting/ICraftingRecipe.sol";
pragma solidity ^0.8.0;

contract WeaponRecipes {
    function recipe(uint id) external view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        if(id == 1) return WoodenSword();
        else if (id == 2) return Needle();
    }

    function WoodenSword() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 5;
        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](1);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.GREEN_WOOD,
        amount : 5
        });
    }

    function Needle() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.COPPER_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 5
        });
    }
}
