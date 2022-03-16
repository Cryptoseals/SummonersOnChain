import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";

pragma solidity ^0.8.0;

contract Equipable {
    // @dev Maps summoners to equipment slots, and slots to stat bonus of the equipped item.
    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.Stats)) public EquipableSlotStats;


    function equipSeal () external {

    }

    function equipHelmet () external {}
    function equipArmor () external {}
    function equipWeapon () external {}
    function equipShield () external {}

    // @notice equip pet
    function summonCompanion () external {}

}
