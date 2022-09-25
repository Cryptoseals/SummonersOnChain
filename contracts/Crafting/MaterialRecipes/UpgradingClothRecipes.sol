import {CraftingMaterial, UpgradingRecipe} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract UpgradingClothRecipes {

    function upgradeRecipe (CraftingMaterial material, uint amount) external view returns(UpgradingRecipe memory _recipe){
        if (material == CraftingMaterial.BOLT_OF_WOOL) {
            return BoltOfWool(amount);
        } else if (material == CraftingMaterial.BOLT_OF_COTTON) {
            return BoltOfCotton(amount);
        } else if (material == CraftingMaterial.BOLT_OF_LINEN) {
            return BoltOfLinen(amount);
        } else if (material == CraftingMaterial.BOLT_OF_SILK) {
            return BoltOfSilk(amount);
        } else if (material == CraftingMaterial.BOLT_OF_HEMP) {
            return BoltOfHemp(amount);
        } else if (material == CraftingMaterial.BOLT_OF_CASHMERE) {
            return BoltOfCashmere(amount);
        } else if (material == CraftingMaterial.BOLT_OF_VISCOSE) {
            return BoltOfViscose(amount);
        } else if (material == CraftingMaterial.BOLT_OF_LYOCELL) {
            return BoltOfLyocell(amount);
        } else if (material == CraftingMaterial.BOLT_OF_RAYON) {
            return BoltOfRayon(amount);
        } else {
            revert("invalid");
        }
    }


    function BoltOfWool (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.BOLT_OF_JUTE;
        _recipe.amount = amount * 10;
    }

    function BoltOfCotton (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.BOLT_OF_WOOL;
        _recipe.amount = amount * 10;
    }

    function BoltOfLinen (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.BOLT_OF_COTTON;
        _recipe.amount = amount * 10;
    }

    function BoltOfSilk (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.BOLT_OF_LINEN;
        _recipe.amount = amount * 10;
    }

    function BoltOfHemp (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.BOLT_OF_SILK;
        _recipe.amount = amount * 10;
    }

    function BoltOfCashmere (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.BOLT_OF_HEMP;
        _recipe.amount = amount * 10;
    }

    function BoltOfViscose (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.BOLT_OF_CASHMERE;
        _recipe.amount = amount * 10;
    }

    function BoltOfLyocell (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.BOLT_OF_VISCOSE;
        _recipe.amount = amount * 10;
    }

    function BoltOfRayon (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.BOLT_OF_LYOCELL;
        _recipe.amount = amount * 10;
    }
}
