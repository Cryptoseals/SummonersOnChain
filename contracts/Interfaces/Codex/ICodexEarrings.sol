import {EquipableItem} from "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.15;

interface ICodexEarrings {
    function earring(uint _id, uint _tier) external view returns (EquipableItem memory);
}
