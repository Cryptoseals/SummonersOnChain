import {GameObjects} from "../GameObjects/IGameObjects.sol";
import {ICraftingMaterials} from "../GameObjects/ICrafting/ICraftingMaterials.sol";
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
        MaterialRequirement[] materialRequirements;
        RequiredEquipment[] equipmentRequirements;
    }

    struct RequiredEquipment {
        GameObjects.ItemType itemType;
        uint id;
    }
}
