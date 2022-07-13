import {GameObjects_Equipments} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.15;

interface ICodexAmulets {
    function amulet(uint _id, uint _tier) external pure returns (GameObjects_Equipments.EquipableItem memory);
}
