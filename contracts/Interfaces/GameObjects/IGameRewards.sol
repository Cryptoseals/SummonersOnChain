import {GameObjects} from "./IGameObjects.sol";
import {ICraftingMaterials} from "./ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

interface IGameRewards {

    struct Reward {
        RewardPool pool;
        Rewards rewards;
        uint bonus;
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
        ICraftingMaterials.CraftingMaterial material;
        uint min;
        uint max;
    }

    struct ArtifactRewards {
        uint[] artifactIds;
        uint[] artifactTiers;
        uint minRewardTier;
        uint maxRewardTier;
        uint[] tierChances;
    }

    struct ConsumableRewards {
        uint[] consumableIds;
        uint[] consumableTiers;
        uint minRewardTier;
        uint maxRewardTier;
        uint[] tierChances;
    }

    struct EquipableItemRewards {
        EquipableItemReward[] rewards;
        uint[] weights;
        uint totalWeight;
        uint chanceToDrop;
    }

    struct EquipableItemReward {
        GameObjects.ItemType equipableType;
        uint equipableId;
        uint maxTierDrop;
        uint[] weights;
    }

    struct MiscItemRewards {
        ItemReward[] rewards;
        uint chanceToDrop;
    }

    struct CookingItemRewards {
        ItemReward[] rewards;
        uint chanceToDrop;
    }

    struct AlchemyItemRewards {
        ItemReward[] rewards;
        uint chanceToDrop;
    }

    struct ItemReward {
        uint itemId;
        uint minAmount;
        uint maxAmount;
    }

    struct GoldRewards {
        uint minAmount;
        uint maxAmount;
    }

    struct EssenceRewards {
        uint minAmount;
        uint maxAmount;
    }
}
