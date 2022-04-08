import "./IGameObjects.sol";
import "./IGameRewards.sol";
import "./IMonster.sol";
import "./IGenericMetadata.sol";
pragma solidity ^0.8.0;

interface IAdventure {



    struct AdventureLevel {
        IGenericMetadata.Metadata Metadata;
        IMonster.Monster Monster;
        GameObjects.ItemRequirement Requirements;
        IGameRewards.Reward Rewards;
    }

}
