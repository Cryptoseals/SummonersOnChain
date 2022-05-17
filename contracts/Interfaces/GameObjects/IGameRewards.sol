import "./IGameObjects.sol";
import "./ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

interface IGameRewards {

    struct Reward {
        RewardPool pool;
        Rewards rewards;
    }

    struct RewardPool {
        bool yieldsArtifact;
        bool yieldsElixir;
        bool yieldsMiscItem;
    }

    struct Rewards {
        ArtifactRewards artifactRewards;
        ElixirRewards elixirRewards;
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

    struct ElixirRewards {
        uint[] elixirIds;
        uint[] elixirTiers;
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
        MiscItemReward[] rewards;
        uint chanceToDrop;
    }

    struct MiscItemReward {
        uint miscType;
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
