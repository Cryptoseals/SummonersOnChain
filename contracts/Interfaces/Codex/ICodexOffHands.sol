import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexOffHands {
    function offHand(uint _id, uint _tier) external pure returns (GameObjects.OffHand memory);
}
