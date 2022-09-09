import {BuffEffect, EquippedItemStruct, Weapon, EquipableItem, Mount, Artifact, Prefix, Suffix} from "../GameObjects/IGameObjects.sol";
import {Core} from "../GameObjects/ICore.sol";
pragma solidity ^0.8.15;

interface IAllCodexViews {
    function weapon(EquippedItemStruct memory) external pure returns (Weapon memory);
    function weaponCore(uint itemId, uint itemTier) external view returns (Weapon memory);
    function helmet(EquippedItemStruct memory) external pure returns (EquipableItem memory);
    function helmetCore(uint id, uint itemTier) external pure returns (EquipableItem memory);
    function armor(EquippedItemStruct memory) external pure returns (EquipableItem memory);
    function armorCore(uint id, uint itemTier) external pure returns (EquipableItem memory);
    function boots(EquippedItemStruct memory) external pure returns (EquipableItem memory);
    function bootsCore(uint id, uint itemTier) external pure returns (EquipableItem memory);
    function amulet(EquippedItemStruct memory) external pure returns (EquipableItem memory);
    function amuletCore(uint id, uint itemTier) external pure returns (EquipableItem memory);
    function ring(EquippedItemStruct memory) external pure returns (EquipableItem memory);
    function ringCore(uint id, uint itemTier) external pure returns (EquipableItem memory);
    function earrings(EquippedItemStruct memory) external view returns (EquipableItem memory);
    function earringsCore(uint id, uint itemTier) external view returns (EquipableItem memory);
    function belt(EquippedItemStruct memory) external pure returns (EquipableItem memory);
    function beltCore(uint id, uint itemTier) external pure returns (EquipableItem memory);
    function mount(uint _id, uint _tier) external pure returns (Mount memory);
    function mountCore(uint _id, uint _tier) external pure returns (Mount memory);
    function buffEffect(uint _id, uint _tier) external pure returns (BuffEffect memory);
    function buffEffectCore(uint _id, uint _tier) external pure returns (BuffEffect memory);
    function buffEffectTurnDuration(uint _id, uint _tier) external pure returns (uint);
    function artifact(uint _id) external pure returns (Artifact memory);
    function artifactCore(uint _id, uint _tier) external pure returns (Artifact memory);
    function prefix(uint _id, uint _tier) external pure returns (Prefix memory);
    function prefixCore(uint _id, uint _tier) external pure returns (Prefix memory);
    function suffix(uint _id, uint _tier) external pure returns (Suffix memory);
    function suffixCore(uint _id, uint _tier) external pure returns (Suffix memory);
    function core (uint id) external view returns(Core memory);
}
