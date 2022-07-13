import {GameObjects_Equipments} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexBelts {
    function belt(uint _id, uint _tier) external pure returns (GameObjects_Equipments.EquipableItem memory);
}
