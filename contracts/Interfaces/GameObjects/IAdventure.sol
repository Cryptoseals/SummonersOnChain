import "./IGameObjects.sol";
import "./IGameRewards.sol";
import "./IGenericMetadata.sol";
pragma solidity ^0.8.0;

interface IAdventure {

    struct AdventureMonster {
        GameObjects.Element element;
        uint monsterId;
    }

    struct AdventureArea {
        IGenericMetadata.Metadata Metadata;
        AdventureLevel[] levels;
    }

    struct AdventureLevel {
        IGenericMetadata.Metadata Metadata;
        AdventureMonster[] MonsterList;
//        GameObjects.ItemRequirement Requirements;
        IGameRewards.Reward Rewards;
    }
    
}
