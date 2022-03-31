pragma solidity ^0.8.0;

interface ICraftingWeapon {
    struct WeaponRecipe {
        uint id;
        uint gold;
        uint essence;
        uint material;
        uint[] miscItemIds;
        uint difficulty;
    }
}
