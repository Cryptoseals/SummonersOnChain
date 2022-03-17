import "../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

interface IAttributes {
    function stats(uint summoner) external view returns (GameObjects.Stats memory _stats);
}
