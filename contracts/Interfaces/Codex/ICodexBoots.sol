import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexBoots {
    function boots(uint _id, uint _tier) external pure returns (GameObjects.Boots memory);
}
