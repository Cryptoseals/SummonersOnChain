import "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract UpgradingWoodRecipes {
    function upgradeRecipe (ICraftingMaterials.CraftingMaterial material, uint amount) external view returns(ICraftingMaterials.UpgradingRecipe memory _recipe) {
        if(material == ICraftingMaterials.CraftingMaterial.SOFT_WOOD_PLANK) {
            return SoftWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.AGED_WOOD_PLANK) {
            return AgedWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.HARD_WOOD_PLANK) {
            return HardWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD_PLANK) {
            return PetrifiedWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD_PLANK) {
            return RedOakWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.ELDER_WOOD_PLANK) {
            return ElderWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD_PLANK) {
            return AncientWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.EBONY_WOOD_PLANK) {
            return EbonyWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.SNAKEWOOD_PLANK) {
            return SnakewoodPlank(amount);
        }
    }

    function SoftWoodPlank(uint amount) public view returns (ICraftingMaterials.UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function AgedWoodPlank(uint amount) public view returns (ICraftingMaterials.UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.SOFT_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function HardWoodPlank(uint amount) public view returns (ICraftingMaterials.UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.AGED_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function PetrifiedWoodPlank(uint amount) public view returns (ICraftingMaterials.UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.HARD_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function RedOakWoodPlank(uint amount) public view returns (ICraftingMaterials.UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function ElderWoodPlank(uint amount) public view returns (ICraftingMaterials.UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function AncientWoodPlank(uint amount) public view returns (ICraftingMaterials.UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.ELDER_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function EbonyWoodPlank(uint amount) public view returns (ICraftingMaterials.UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }

    function SnakewoodPlank(uint amount) public view returns (ICraftingMaterials.UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.EBONY_WOOD_PLANK;
        _recipe.amount = amount * 10;
    }
}
