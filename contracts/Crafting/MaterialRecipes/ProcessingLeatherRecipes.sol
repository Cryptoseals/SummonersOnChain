import "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

contract ProcessingLeatherRecipes {

    function recipe(ICraftingMaterials.CraftingMaterial material, uint amount) external view returns (ICraftingMaterials.ProcessingRecipe memory _recipe){
        if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER) {
            return ProcessedTatteredLeather(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER) {
            return ProcessedRaggedLeather(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER) {
            return ProcessedRawLeather(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER) {
            return ProcessedThinLeather(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER) {
            return ProcessedCoarseLeather(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER) {
            return ProcessedRuggedLeather(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER) {
            return ProcessedThickLeather(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER) {
            return ProcessedReinforcedLeather(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER) {
            return ProcessedHardenedLeather(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PROCESSED_LORDLY_LEATHER) {
            return ProcessedLordlyLeather(amount);
        } else {
            revert("invalid");
        }
    }

    function ProcessedTatteredLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.TATTERED_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 15 minutes;
    }

    function ProcessedRaggedLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.RAGGED_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 20 minutes;
    }

    function ProcessedRawLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.RAW_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 25 minutes;
    }

    function ProcessedThinLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.THIN_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 30 minutes;
    }

    function ProcessedCoarseLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.COARSE_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 35 minutes;
    }

    function ProcessedRuggedLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.RUGGED_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 40 minutes;
    }

    function ProcessedThickLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.THICK_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 45 minutes;
    }

    function ProcessedReinforcedLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.REINFORCED_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 50 minutes;
    }

    function ProcessedHardenedLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.HARDENED_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 55 minutes;
    }

    function ProcessedLordlyLeather(uint amount) public view returns (ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.LORDLY_LEATHER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 1 hours;
    }
}
