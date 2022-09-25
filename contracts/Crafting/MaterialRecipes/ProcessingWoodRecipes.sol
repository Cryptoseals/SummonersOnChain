import {CraftingMaterial, ProcessingRecipe} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract ProcessingWoodRecipes {
    function recipe(CraftingMaterial material, uint amount) external view returns (ProcessingRecipe memory _recipe){
        if (material == CraftingMaterial.GREEN_WOOD_PLANK) {
            return GreenWoodPlank(amount);
        } else if (material == CraftingMaterial.SOFT_WOOD_PLANK) {
            return SoftWoodPlank(amount);
        } else if (material == CraftingMaterial.AGED_WOOD_PLANK) {
            return AgedWoodPlank(amount);
        } else if (material == CraftingMaterial.HARD_WOOD_PLANK) {
            return HardWoodPlank(amount);
        } else if (material == CraftingMaterial.PETRIFIED_WOOD_PLANK) {
            return PetrifiedWoodPlank(amount);
        } else if (material == CraftingMaterial.RED_OAK_WOOD_PLANK) {
            return RedOakWoodPlank(amount);
        } else if (material == CraftingMaterial.ELDER_WOOD_PLANK) {
            return ElderWoodPlank(amount);
        } else if (material == CraftingMaterial.ANCIENT_WOOD_PLANK) {
            return AncientWoodPlank(amount);
        } else if (material == CraftingMaterial.EBONY_WOOD_PLANK) {
            return EbonyWoodPlank(amount);
        } else if (material == CraftingMaterial.SNAKEWOOD_PLANK) {
            return SnakewoodPlank(amount);
        } else {
            revert("invalid");
        }
    }

    function GreenWoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.GREEN_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 15 minutes;
    }

    function SoftWoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.SOFT_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 20 minutes;
    }

    function AgedWoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.AGED_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 25 minutes;
    }

    function HardWoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.HARD_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 30 minutes;
    }

    function PetrifiedWoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.PETRIFIED_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 35 minutes;
    }

    function RedOakWoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.RED_OAK_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 40 minutes;
    }

    function ElderWoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.ELDER_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 45 minutes;
    }

    function AncientWoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.ANCIENT_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 50 minutes;
    }

    function EbonyWoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.EBONY_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 50 minutes;
    }

    function SnakewoodPlank(uint amount) public view returns (ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.SNAKEWOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 1 hours;
    }
}
