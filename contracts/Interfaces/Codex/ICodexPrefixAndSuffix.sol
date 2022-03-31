import "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

interface ICodexPrefixAndSuffix {
    function prefix(uint _id, uint _tier) external pure returns (GameObjects.Prefix memory);
    function suffix(uint _id, uint _tier) external pure returns (GameObjects.Suffix memory);
}
