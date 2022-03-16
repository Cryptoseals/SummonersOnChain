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
    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.EquippedSeal)) public EquippedSeals;
    mapping(uint => mapping(EquipableLibrary.Slot => GameObjects.SummonedCompanion)) public SummonedCompanions;

    function equipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        EquippedSeals[summoner][EquipableLibrary.Slot.SEAL].sealId = id;
    }

    function equipHelmet(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) /* @TODO , nftIsOwned(address(0))*/ {}

    function equipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {}

    function equipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {}

    function equipShield(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {}

    // @notice equip pet
    function summonCompanion(uint summoner, address _contract, uint _id) external ensureNotPaused senderIsSummonerOwner(summoner) {}

}
