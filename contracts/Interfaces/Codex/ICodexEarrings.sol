import "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.15;

interface ICodexEarrings {
    function earring(uint _id, uint _tier) external view returns (GameObjects_Equipments.EquipableItem memory);
}
