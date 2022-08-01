import {GameObjects_Equipments, GameObjects_BuffEffects} from "../GameObjects/IGameObjects.sol";
import {ICore} from "../GameObjects/ICore.sol";
pragma solidity ^0.8.15;

interface IAllCodexViews {
    function weapon(GameObjects_Equipments.EquippedItemStruct memory) external pure returns (GameObjects_Equipments.Weapon memory);
    function weaponCore(uint itemId, uint itemTier) external view returns (GameObjects_Equipments.Weapon memory);
    function helmet(GameObjects_Equipments.EquippedItemStruct memory) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function helmetCore(uint id, uint itemTier) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function armor(GameObjects_Equipments.EquippedItemStruct memory) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function armorCore(uint id, uint itemTier) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function boots(GameObjects_Equipments.EquippedItemStruct memory) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function bootsCore(uint id, uint itemTier) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function amulet(GameObjects_Equipments.EquippedItemStruct memory) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function amuletCore(uint id, uint itemTier) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function ring(GameObjects_Equipments.EquippedItemStruct memory) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function ringCore(uint id, uint itemTier) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function earrings(GameObjects_Equipments.EquippedItemStruct memory) external view returns (GameObjects_Equipments.EquipableItem memory);
    function earringsCore(uint id, uint itemTier) external view returns (GameObjects_Equipments.EquipableItem memory);
    function belt(GameObjects_Equipments.EquippedItemStruct memory) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function beltCore(uint id, uint itemTier) external pure returns (GameObjects_Equipments.EquipableItem memory);
    function mount(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Mount memory);
    function mountCore(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Mount memory);
    function buffEffect(uint _id, uint _tier) external pure returns (GameObjects_BuffEffects.BuffEffect memory);
    function buffEffectCore(uint _id, uint _tier) external pure returns (GameObjects_BuffEffects.BuffEffect memory);
    function buffEffectTurnDuration(uint _id, uint _tier) external pure returns (uint);
    function artifact(uint _id) external pure returns (GameObjects_Equipments.Artifact memory);
    function artifactCore(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Artifact memory);
    function prefix(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Prefix memory);
    function prefixCore(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Prefix memory);
    function suffix(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Suffix memory);
    function suffixCore(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Suffix memory);
    function core (uint id) external view returns(ICore.Core memory);
}
