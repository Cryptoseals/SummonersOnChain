import {Stats} from "../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

interface IAttributes {
    function stats(uint summoner) external view returns (Stats memory _stats);
    function totalPointsOfSummoner(uint summoner) external view returns (uint);
}
