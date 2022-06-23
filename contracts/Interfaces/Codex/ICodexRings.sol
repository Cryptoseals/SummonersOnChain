import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexRings {
    function ring(uint _id, uint _tier) external pure returns (GameObjects.Ring memory);
}
