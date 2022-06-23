import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexBelts {
    function belt(uint _id, uint _tier) external pure returns (GameObjects.Belt memory);
}
