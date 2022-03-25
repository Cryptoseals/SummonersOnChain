import "./IGameRewards.sol";
pragma solidity ^0.8.0;

interface IJob {

    struct JobMetadata {
        string name;
        string description;
    }

    struct Job {
        JobMetadata Metadata;
        GameObjects.ItemRequirement Requirements;
        IGameRewards.Reward Rewards;
        uint Time;
    }

}
