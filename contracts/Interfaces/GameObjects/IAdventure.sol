import "./IGameRewards.sol";
pragma solidity ^0.8.0;

interface IAdventure {

    struct AdventureMetadata {
        string name;
        string description;
    }

    struct AdventureLevel {
        AdventureMetadata Metadata;
        GameObjects.Stats EnemyStats;
        GameObjects.GeneratedStats EnemyGeneratedStats;
        GameObjects.ElementalStats EnemyElementalStats;
        GameObjects.ItemRequirement Requirements;
        IGameRewards.Reward Rewards;
    }

}