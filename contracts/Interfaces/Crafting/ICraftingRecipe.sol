import "../GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

interface ICraftingRecipe {

    struct MaterialRequirement {
        uint amount;
        ICraftingMaterials.CraftingMaterial material;
    }

    struct CraftingRecipe {
        uint requiredLevel;
        uint requiredCraftingLevel;
        uint requiredGold;
        uint requiredEssence;
        uint requiredXP;
        MaterialRequirement materialRequirements;
    }
}
