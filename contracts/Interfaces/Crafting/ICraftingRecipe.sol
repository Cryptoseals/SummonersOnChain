import {ItemType, MaterialRequirement} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

struct CraftingRecipe {
    uint256 requiredLevel;
    uint256 requiredCraftingLevel;
    uint256 requiredGold;
    uint256 requiredEssence;
    uint256 requiredXP;
    MaterialRequirement[] materialRequirements;
    RequiredEquipment[] equipmentRequirements;
}

struct RequiredEquipment {
    ItemType itemType;
    uint256 id;
}
