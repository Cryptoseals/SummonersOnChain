import "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

interface ICodexEarrings {
    function earring(uint _id, uint _tier) external view returns (GameObjects.Earring memory);
}
