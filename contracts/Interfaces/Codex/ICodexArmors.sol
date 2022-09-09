import {EquipableItem} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.15;

interface ICodexArmors {
    function armor(uint _id, uint _tier) external pure returns (EquipableItem memory);
}
