import "./../../Codex/Common/UpgradeableCodex.sol";
import "../../Interfaces/Crafting/ICraftingRecipe.sol";
pragma solidity ^0.8.0;


interface IndividualRecipes {
    function recipe(uint id) external view returns (ICraftingRecipe.CraftingRecipe memory);
}

contract HelmetRecipes is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "HelmetRecipes";
    string constant public version = "0.0.1";

    function recipe(uint itemId) external view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        ICraftingRecipe.CraftingRecipe memory _recipe;
        if (itemId > 0 && itemId < 22) {
            // H
            _recipe = IndividualRecipes(contractAddress(INavigator.CONTRACT.HEAVY_HELMET_RECIPES)).recipe(itemId);
        } else if (itemId > 21 && itemId < 43) {
            // M
            _recipe = IndividualRecipes(contractAddress(INavigator.CONTRACT.MEDIUM_HELMET_RECIPES)).recipe(itemId);
        } else if (itemId > 42 && itemId < 64) {
            // L
            _recipe = IndividualRecipes(contractAddress(INavigator.CONTRACT.LIGHT_HELMET_RECIPES)).recipe(itemId);
        } else {
            revert("???");
        }
        return _recipe;
    }


}
