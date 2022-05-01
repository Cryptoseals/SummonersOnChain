import "./../../Codex/Common/UpgradeableCodex.sol";
import "../../Interfaces/Crafting/ICraftingRecipe.sol";
pragma solidity ^0.8.0;


interface IndividualRecipes {
    function recipe(uint id) external view returns (ICraftingRecipe.CraftingRecipe memory);
}

contract BootsRecipes is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "BootsRecipes";
    string constant public version = "0.0.1";

    function recipe(uint itemId) public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        ICraftingRecipe.CraftingRecipe memory _recipe;
        if (itemId > 0 && itemId < 22) {
            // H
            _recipe = IndividualRecipes(contractAddress(INavigator.CONTRACT.HEAVY_BOOTS_RECIPES)).recipe(itemId);
        } else if (itemId > 21 && itemId < 43) {
            // M
            _recipe = IndividualRecipes(contractAddress(INavigator.CONTRACT.MEDIUM_BOOTS_RECIPES)).recipe(itemId);
        } else if (itemId > 42 && itemId < 64) {
            // L
            _recipe = IndividualRecipes(contractAddress(INavigator.CONTRACT.LIGHT_BOOTS_RECIPES)).recipe(itemId);
        } else {
            revert("???");
        }
        return _recipe;
    }
}
