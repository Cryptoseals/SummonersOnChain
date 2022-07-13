import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.15;

interface ICodexBoots {
    function boots(uint _id, uint _tier) external pure returns (GameObjects_Equipments.EquipableItem memory);
}
