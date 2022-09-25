import {INavigator,UpgradeableCodex} from "./../../Codex/Common/UpgradeableCodex.sol";
import {CraftingRecipe} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;


interface IndividualRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory);
}

contract BootsRecipes is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "BootsRecipes";
    string constant public version = "0.0.1";

    function recipe(uint itemId) external view returns (CraftingRecipe memory _recipe) {
        CraftingRecipe memory _recipe;
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
