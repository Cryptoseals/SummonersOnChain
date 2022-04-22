import "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract ProcessingWoodRecipes {
    function recipe (ICraftingMaterials.CraftingMaterial material, uint amount) external view returns(ICraftingMaterials.ProcessingRecipe memory _recipe){
        if(material == ICraftingMaterials.CraftingMaterial.GREEN_WOOD) {
            return GreenWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.SOFT_WOOD) {
            return SoftWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.AGED_WOOD) {
            return AgedWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.HARD_WOOD) {
            return HardWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD) {
            return PetrifiedWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD) {
            return RedOakWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.ELDER_WOOD) {
            return ElderWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD) {
            return AncientWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.EBONY_WOOD) {
            return EbonyWoodPlank(amount);
        } else if(material == ICraftingMaterials.CraftingMaterial.SNAKEWOOD) {
            return SnakewoodPlank(amount);
        }
    }

    function GreenWoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.GREEN_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 15 minutes;
    }

    function SoftWoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.SOFT_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 20 minutes;
    }

    function AgedWoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.AGED_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 25 minutes;
    }

    function HardWoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.HARD_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 30 minutes;
    }

    function PetrifiedWoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 35 minutes;
    }

    function RedOakWoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 40 minutes;
    }

    function ElderWoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.ELDER_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 45 minutes;
    }

    function AncientWoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 50 minutes;
    }

    function EbonyWoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.EBONY_WOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 50 minutes;
    }

    function SnakewoodPlank (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.SNAKEWOOD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 1 hours;
    }
}