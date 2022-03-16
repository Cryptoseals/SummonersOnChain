import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract Equipable is InitNavigator {

    constructor(address _navigator) InitNavigator(_navigator) {}

    // @dev Maps summoners to equipment slots, and slots to stat bonus of the equipped item.
    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.Stats)) public EquipableSlotStats;


    // @TODO , CREATE A SPECIAL STRUCT TO STORE DATA OF EACH EQUIPABLE,
    //(ARTIFACTS AND ELIXIR WILL BE IN THEIR OWN CONTRACT)

    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.EquippedHelmet)) public EquippedHelmets;
    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.EquippedArmor)) public EquippedArmors;
    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.EquippedWeapon)) public EquippedWeapons;
    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.EquippedShield)) public EquippedShields;
    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.EquippedSeal)) public EquippedSeal;
    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.SummonedCompanion)) public SummonedCompanions;

    function equipSeal() external ensureNotPaused {

    }

    function equipHelmet() external ensureNotPaused {}

    function equipArmor() external ensureNotPaused {}

    function equipWeapon() external ensureNotPaused {}

    function equipShield() external ensureNotPaused {}

    // @notice equip pet
    function summonCompanion() external ensureNotPaused {}

}
