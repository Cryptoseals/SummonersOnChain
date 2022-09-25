import {CraftingMaterial, UpgradingRecipe} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract UpgradingOreRecipes {

    function upgradeRecipe (CraftingMaterial material, uint amount) external view returns(UpgradingRecipe memory _recipe){
        if (material == CraftingMaterial.TIN_INGOT) {
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

    function TinIngot (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.COPPER_INGOT;
        _recipe.amount = amount * 10;
    }

    function IronIngot (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.TIN_INGOT;
        _recipe.amount = amount * 10;
    }

    function SilverIngot (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.IRON_INGOT;
        _recipe.amount = amount * 10;
    }

    function GoldIngot (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.SILVER_INGOT;
        _recipe.amount = amount * 10;
    }

    function PlatinumIngot (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.GOLD_INGOT;
        _recipe.amount = amount * 10;
    }

    function MythrilIngot (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.PLATINUM_INGOT;
        _recipe.amount = amount * 10;
    }

    function OricalchumIngot (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.MYTHRIL_INGOT;
        _recipe.amount = amount * 10;
    }

    function ObsidianIngot (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.ORICALCHUM_INGOT;
        _recipe.amount = amount * 10;
    }

    function LuminiteIngot (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.OBSIDIAN_INGOT;
        _recipe.amount = amount * 10;
    }
}
