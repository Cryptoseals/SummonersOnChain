import {ItemRequirement} from "./IGameObjects.sol";
import {Reward} from "./IGameRewards.sol";
pragma solidity ^0.8.0;

interface IJob {

    //    struct JobMetadata {
    //        string name;
    //        string description;
    //    }

    struct Job {
        //        JobMetadata Metadata;
        ItemRequirement Requirements;
        Reward Rewards;
        uint Time;
    }

}
