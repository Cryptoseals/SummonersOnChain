import "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

contract ProcessingClothRecipes {

    function recipe (ICraftingMaterials.CraftingMaterial material, uint amount) external view returns(ICraftingMaterials.ProcessingRecipe memory _recipe){
        if(material == ICraftingMaterials.CraftingMaterial.JUTE) {
            return BoltOfJute(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.WOOL) {
            return BoltOfWool(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.COTTON) {
            return BoltOfCotton(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.LINEN) {
            return BoltOfLinen(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.SILK) {
            return BoltOfSilk(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.HEMP) {
            return BoltOfHemp(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.CASHMERE) {
            return BoltOfCashmere(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.VISCOSE) {
            return BoltOfViscose(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.LYOCELL) {
            return BoltOfLyocell(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.RAYON) {
            return BoltOfRayon(amount);
        }
    }

    function BoltOfJute (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.JUTE;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 15 minutes;
    }

    function BoltOfWool (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.WOOL;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 20 minutes;
    }

    function BoltOfCotton (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.COTTON;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 25 minutes;
    }

    function BoltOfLinen (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.LINEN;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 30 minutes;
    }

    function BoltOfSilk (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.SILK;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 35 minutes;
    }

    function BoltOfHemp (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.HEMP;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 40 minutes;
    }

    function BoltOfCashmere (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.CASHMERE;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 45 minutes;
    }

    function BoltOfViscose (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.VISCOSE;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 50 minutes;
    }

    function BoltOfLyocell (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.LYOCELL;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 55 minutes;
    }

    function BoltOfRayon (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.RAYON;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 1 hours;
    }
}
