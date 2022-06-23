import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexHelmets {
    function helmet(uint _id, uint _tier) external pure returns (GameObjects.Helmet memory);
}
