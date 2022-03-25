pragma solidity ^0.8.0;

interface IGameRewards {

    struct Reward {
        RewardPool pool;
        Rewards rewards;
    }

    struct RewardPool {
        bool yieldsArtifact;
        bool yieldsElixir;
        bool yieldsEquipableItem;
        bool yieldsMiscItem;
        bool yieldsGold;
        bool yieldsEssence;
        bool yieldsMount;
        bool yieldsChest;
        bool yieldsPet;
        bool yieldsFish;
    }

    struct Rewards {
        ArtifactRewards artifactRewards;
        ElixirRewards elixirRewards;
        EquipableItemRewards equipableItemRewards;
        MiscItemRewards miscItemRewards;
        GoldRewards goldRewards;
        EssenceRewards essenceRewards;
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
        uint[] equipableType;
        uint[][] equipableIds;
        uint[] equipableTiers;
        uint minRewardTier;
        uint maxRewardTier;
        uint[] tierChances;
    }

    struct MiscItemRewards {
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
