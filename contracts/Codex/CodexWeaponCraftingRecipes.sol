import "../Interfaces/GameObjects/ICrafting/ICraftingWeapon.sol";
pragma solidity ^0.8.0;

contract CodexWeaponCraftingRecipes {
    string constant public index = "Codex";
    string constant public class = "WeaponRecipes";
    string constant public version = "0.0.1";
    

    function recipe(uint weaponId) external view returns (ICraftingWeapon.WeaponRecipe memory _recipe) {
        
        if(weaponId == 1) {
            return DummyRecipe();
        }

        revert("");
    }

    function DummyRecipe() view public returns (ICraftingWeapon.WeaponRecipe memory _recipe) {
        _recipe.gold = 1e18;
        _recipe.essence = 1e18;
        _recipe.material = 1e18;
        _recipe.difficulty = 15; // dice bigger than.
        _recipe.miscItemIds = new uint[](0);
    }

}
