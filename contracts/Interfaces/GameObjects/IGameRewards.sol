import {ItemType} from "./IGameObjects.sol";
import {CraftingMaterial} from "./ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

struct Reward {
    RewardPool pool;
    Rewards rewards;
    uint256 bonus;
}

struct RewardPool {
    bool yieldsArtifact;
    bool yieldsConsumable;
    bool yieldsMiscItem;
}

struct Rewards {
    ArtifactRewards artifactRewards;
    ConsumableRewards elixirRewards;
    EquipableItemRewards equipableItemRewards;
    MiscItemRewards miscItemRewards;
}

struct CurrencyRewards {
    bool yieldsGold;
    bool yieldsEssence;
    bool yieldsCraftingMaterial;
    GoldRewards goldRewards;
    EssenceRewards essenceRewards;
    CraftingMaterialReward[] materials;
}

struct CraftingMaterialReward {
    CraftingMaterial material;
    uint256 min;
    uint256 max;
}

struct ArtifactRewards {
    uint256[] artifactIds;
    uint256[] artifactTiers;
    uint256 minRewardTier;
    uint256 maxRewardTier;
    uint256[] tierChances;
}

struct ConsumableRewards {
    uint256[] consumableIds;
    uint256[] consumableTiers;
    uint256 minRewardTier;
    uint256 maxRewardTier;
    uint256[] tierChances;
}

struct EquipableItemRewards {
    EquipableItemReward[] rewards;
    uint256[] weights;
    uint256 totalWeight;
    uint256 chanceToDrop;
}

struct EquipableItemReward {
    ItemType equipableType;
    uint256 equipableId;
    uint256 maxTierDrop;
    uint256[] weights;
}

struct MiscItemRewards {
    ItemReward[] rewards;
    uint256 chanceToDrop;
}

struct CookingItemRewards {
    ItemReward[] rewards;
    uint256 chanceToDrop;
}

struct AlchemyItemRewards {
    ItemReward[] rewards;
    uint256 chanceToDrop;
}

struct ItemReward {
    uint256 itemId;
    uint256 minAmount;
    uint256 maxAmount;
}

struct GoldRewards {
    uint256 minAmount;
    uint256 maxAmount;
}

struct EssenceRewards {
    uint256 minAmount;
    uint256 maxAmount;
}
