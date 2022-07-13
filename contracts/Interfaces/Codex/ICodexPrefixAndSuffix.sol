import {GameObjects_Equipments} from "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

interface ICodexPrefixAndSuffix {
    function prefix(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Prefix memory);
    function suffix(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Suffix memory);
}
