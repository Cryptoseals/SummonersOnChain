import {Prefix, Suffix} from "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.15;

interface ICodexPrefixAndSuffix {
    function prefix(uint _id, uint _tier) external pure returns (Prefix memory);
    function suffix(uint _id, uint _tier) external pure returns (Suffix memory);
}
