import {CraftingMaterial, UpgradingRecipe} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract UpgradingGemstoneRecipes {

    function upgradeRecipe (CraftingMaterial material, uint amount) external view returns(UpgradingRecipe memory _recipe){
        if (material == CraftingMaterial.POLISHED_PEARL) {
            return POLISHED_PEARL(amount);
        } else if (material == CraftingMaterial.POLISHED_AMETHYST) {
            return POLISHED_AMETHYST(amount);
        } else if (material == CraftingMaterial.POLISHED_CORAL) {
            return POLISHED_CORAL(amount);
        } else if (material == CraftingMaterial.POLISHED_RUBY) {
            return POLISHED_RUBY(amount);
        } else if (material == CraftingMaterial.POLISHED_TOPAZ) {
            return POLISHED_TOPAZ(amount);
        } else if (material == CraftingMaterial.POLISHED_AZURITE) {
            return POLISHED_AZURITE(amount);
        } else if (material == CraftingMaterial.POLISHED_EMERALD) {
            return POLISHED_EMERALD(amount);
        } else if (material == CraftingMaterial.POLISHED_SAPPHIRE) {
            return POLISHED_SAPPHIRE(amount);
        } else if (material == CraftingMaterial.POLISHED_DIAMOND) {
            return POLISHED_DIAMOND(amount);
        } else {
            revert("invalid");
        }
    }


    function POLISHED_PEARL (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.POLISHED_AMBER;
        _recipe.amount = amount * 10;
    }

    function POLISHED_AMETHYST (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.POLISHED_PEARL;
        _recipe.amount = amount * 10;
    }

    function POLISHED_CORAL (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.POLISHED_AMETHYST;
        _recipe.amount = amount * 10;
    }

    function POLISHED_RUBY (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.POLISHED_CORAL;
        _recipe.amount = amount * 10;
    }

    function POLISHED_TOPAZ (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.POLISHED_RUBY;
        _recipe.amount = amount * 10;
    }

    function POLISHED_AZURITE (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.POLISHED_TOPAZ;
        _recipe.amount = amount * 10;
    }

    function POLISHED_EMERALD (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.POLISHED_AZURITE;
        _recipe.amount = amount * 10;
    }

    function POLISHED_SAPPHIRE (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.POLISHED_EMERALD;
        _recipe.amount = amount * 10;
    }

    function POLISHED_DIAMOND (uint amount) public view returns(UpgradingRecipe memory _recipe) {
        _recipe.requiredMaterial = CraftingMaterial.POLISHED_SAPPHIRE;
        _recipe.amount = amount * 10;
    }
}
