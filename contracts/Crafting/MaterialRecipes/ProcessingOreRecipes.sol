import {CraftingMaterial, ProcessingRecipe} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;


contract ProcessingOreRecipes {

    function recipe (CraftingMaterial material, uint amount) external view returns(ProcessingRecipe memory _recipe){
        if(material == CraftingMaterial.COPPER_INGOT) {
            return CopperIngot(amount);
        } else if (material == CraftingMaterial.TIN_INGOT) {
            return TinIngot(amount);
        } else if (material == CraftingMaterial.IRON_INGOT) {
            return IronIngot(amount);
        } else if (material == CraftingMaterial.SILVER_INGOT) {
            return SilverIngot(amount);
        } else if (material == CraftingMaterial.GOLD_INGOT) {
            return GoldIngot(amount);
        } else if (material == CraftingMaterial.PLATINUM_INGOT) {
            return PlatinumIngot(amount);
        } else if (material == CraftingMaterial.MYTHRIL_INGOT) {
            return MythrilIngot(amount);
        }  else if (material == CraftingMaterial.ORICALCHUM_INGOT) {
            return OricalchumIngot(amount);
        } else if (material == CraftingMaterial.OBSIDIAN_INGOT) {
            return ObsidianIngot(amount);
        } else if (material == CraftingMaterial.LUMINITE_INGOT) {
            return LuminiteIngot(amount);
        } else {
            revert("invalid");
        }

        revert("?");
    }

    function CopperIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.COPPER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 15 minutes;
    }

    function TinIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.TIN;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 20 minutes;
    }

    function IronIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.IRON;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 25 minutes;
    }

    function SilverIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.SILVER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 30 minutes;
    }

    function GoldIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.GOLD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 35 minutes;
    }

    function PlatinumIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.PLATINUM;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 40 minutes;
    }

    function MythrilIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.MYTHRIL;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 45 minutes;
    }

    function OricalchumIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.ORICALCHUM;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 50 minutes;
    }

    function ObsidianIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.OBSIDIAN;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 55 minutes;
    }

    function LuminiteIngot (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.LUMINITE;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 1 hours;
    }
}
