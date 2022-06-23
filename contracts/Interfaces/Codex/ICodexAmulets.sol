import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexAmulets {
    function amulet(uint _id, uint _tier) external pure returns (GameObjects.Amulet memory);
}
