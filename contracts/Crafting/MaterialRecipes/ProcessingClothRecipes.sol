import {CraftingMaterial, ProcessingRecipe} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

contract ProcessingClothRecipes {

    function recipe (CraftingMaterial material, uint amount) external view returns(ProcessingRecipe memory _recipe){
        if(material == CraftingMaterial.BOLT_OF_JUTE) {
            return BoltOfJute(amount);
        } else if (material == CraftingMaterial.BOLT_OF_WOOL) {
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

    function BoltOfJute (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.JUTE;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 15 minutes;
    }

    function BoltOfWool (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.WOOL;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 20 minutes;
    }

    function BoltOfCotton (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.COTTON;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 25 minutes;
    }

    function BoltOfLinen (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.LINEN;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 30 minutes;
    }

    function BoltOfSilk (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.SILK;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 35 minutes;
    }

    function BoltOfHemp (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.HEMP;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 40 minutes;
    }

    function BoltOfCashmere (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.CASHMERE;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 45 minutes;
    }

    function BoltOfViscose (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.VISCOSE;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 50 minutes;
    }

    function BoltOfLyocell (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.LYOCELL;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 55 minutes;
    }

    function BoltOfRayon (uint amount) public view returns(ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.RAYON;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 1 hours;
    }
}
