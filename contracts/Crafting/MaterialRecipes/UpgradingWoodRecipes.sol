import {CraftingMaterial, UpgradingRecipe} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract UpgradingWoodRecipes {
    function upgradeRecipe (CraftingMaterial material, uint amount) external view returns(UpgradingRecipe memory _recipe) {
        if(material == CraftingMaterial.SOFT_WOOD_PLANK) {
            return SoftWoodPlank(amount);
        } else if(material == CraftingMaterial.AGED_WOOD_PLANK) {
            return AgedWoodPlank(amount);
        } else if(material == CraftingMaterial.HARD_WOOD_PLANK) {
            return HardWoodPlank(amount);
        } else if(material == CraftingMaterial.PETRIFIED_WOOD_PLANK) {
            return PetrifiedWoodPlank(amount);
        } else if(material == CraftingMaterial.RED_OAK_WOOD_PLANK) {
            return RedOakWoodPlank(amount);
        } else if(material == CraftingMaterial.ELDER_WOOD_PLANK) {
            return ElderWoodPlank(amount);
        } else if(material == CraftingMaterial.ANCIENT_WOOD_PLANK) {
            return AncientWoodPlank(amount);
        } else if(material == CraftingMaterial.EBONY_WOOD_PLANK) {
            return EbonyWoodPlank(amount);
        } else if(material == CraftingMaterial.SNAKEWOOD_PLANK) {
            return SnakewoodPlank(amount);
        } else {
            revert("invalid");
        }
    }

    function SoftWoodPlank(uint amount) public view returns (UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.GREEN_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function AgedWoodPlank(uint amount) public view returns (UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.SOFT_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function HardWoodPlank(uint amount) public view returns (UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.AGED_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function PetrifiedWoodPlank(uint amount) public view returns (UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.HARD_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function RedOakWoodPlank(uint amount) public view returns (UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.PETRIFIED_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function ElderWoodPlank(uint amount) public view returns (UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.RED_OAK_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function AncientWoodPlank(uint amount) public view returns (UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.ELDER_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function EbonyWoodPlank(uint amount) public view returns (UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.ANCIENT_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function SnakewoodPlank(uint amount) public view returns (UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.EBONY_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }
}
