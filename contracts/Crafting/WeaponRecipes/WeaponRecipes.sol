import "./../../Codex/Common/UpgradeableCodex.sol";
import "../../Interfaces/Crafting/ICraftingRecipe.sol";
pragma solidity ^0.8.0;


interface IndividualRecipe {
    function recipe(uint id) external view returns (ICraftingRecipe.CraftingRecipe memory _recipe);
}

contract WeaponRecipes is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "WeaponRecipes";
    string constant public version = "0.0.1";

    function recipe(uint itemId) external view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        if (itemId > 0 && itemId < 22) {
            // Swords
            _recipe = IndividualRecipe(contractAddress(INavigator.CONTRACT.SWORD_RECIPES)).recipe(itemId);
        } else if (itemId > 21 && itemId < 43) {
            // Dagger
            _recipe = IndividualRecipe(contractAddress(INavigator.CONTRACT.DAGGER_RECIPES)).recipe(itemId);
        } else if (itemId > 42 && itemId < 64) {
            // Bow
            _recipe = IndividualRecipe(contractAddress(INavigator.CONTRACT.BOW_RECIPES)).recipe(itemId);
        } else if (itemId > 63 && itemId < 85) {
            // Axe
            _recipe = IndividualRecipe(contractAddress(INavigator.CONTRACT.BOW_RECIPES)).recipe(itemId);
        } else if (itemId > 84 && itemId < 106) {
            // Staff
            _recipe = IndividualRecipe(contractAddress(INavigator.CONTRACT.STAFF_RECIPES)).recipe(itemId);
        } else if (itemId > 105 && itemId < 127) {
            // Focus
            _recipe = IndividualRecipe(contractAddress(INavigator.CONTRACT.FOCUS_RECIPES)).recipe(itemId);
        } else if (itemId < 148) {
            // Shield
            _recipe = IndividualRecipe(contractAddress(INavigator.CONTRACT.SHIELD_RECIPES)).recipe(itemId);

        } else {
            revert("???");
        }
        return _recipe;
    }

}
