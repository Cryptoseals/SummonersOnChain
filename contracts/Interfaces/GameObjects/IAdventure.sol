import "./IGameRewards.sol";
pragma solidity ^0.8.0;

interface IAdventure {

    struct Metadata {
        string name;
        string description;
    }

    struct Monster {
        Metadata MonsterMetadata;
        GameObjects.Stats EnemyStats;
        GameObjects.GeneratedStats EnemyGeneratedStats;
        GameObjects.ElementalStats EnemyElementalStats;
        GameObjects.Element damageType;
    }

    struct AdventureLevel {
        Metadata Metadata;
        Monster Monster;
        GameObjects.ItemRequirement Requirements;
        IGameRewards.Reward Rewards;
    }

}
