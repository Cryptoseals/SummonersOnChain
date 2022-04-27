import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface IAllCodexViews {
    function weapon(GameObjects.EquippedItemStruct memory) external pure returns (GameObjects.Weapon memory);
    function weaponCore(uint itemId, uint itemTier) external view returns (GameObjects.Weapon memory);
    function helmet(GameObjects.EquippedItemStruct memory) external pure returns (GameObjects.Helmet memory);
    function helmetCore(uint id, uint itemTier) external pure returns (GameObjects.Helmet memory);
    function armor(GameObjects.EquippedItemStruct memory) external pure returns (GameObjects.Armor memory);
    function armorCore(uint id, uint itemTier) external pure returns (GameObjects.Armor memory);
    function boots(GameObjects.EquippedItemStruct memory) external pure returns (GameObjects.Boots memory);
    function bootsCore(uint id, uint itemTier) external pure returns (GameObjects.Boots memory);
    function amulet(GameObjects.EquippedItemStruct memory) external pure returns (GameObjects.Amulet memory);
    function amuletCore(uint id, uint itemTier) external pure returns (GameObjects.Amulet memory);
    function ring(GameObjects.EquippedItemStruct memory) external pure returns (GameObjects.Ring memory);
    function ringCore(uint id, uint itemTier) external pure returns (GameObjects.Ring memory);
    function earring(GameObjects.EquippedItemStruct memory) external view returns (GameObjects.Earring memory);
    function earringCore(uint id, uint itemTier) external view returns (GameObjects.Earring memory);
    function belt(GameObjects.EquippedItemStruct memory) external pure returns (GameObjects.Belt memory);
    function beltCore(uint id, uint itemTier) external pure returns (GameObjects.Belt memory);
    function mount(uint _id, uint _tier) external pure returns (GameObjects.Mount memory);
    function mountCore(uint _id, uint _tier) external pure returns (GameObjects.Mount memory);
    function elixir(uint _id, uint _tier) external pure returns (GameObjects.Elixir memory);
    function elixirCore(uint _id, uint _tier) external pure returns (GameObjects.Elixir memory);
    function artifact(uint _id, uint _tier) external pure returns (GameObjects.Artifact memory);
    function artifactCore(uint _id, uint _tier) external pure returns (GameObjects.Artifact memory);
    function prefix(uint _id, uint _tier) external pure returns (GameObjects.Prefix memory);
    function prefixCore(uint _id, uint _tier) external pure returns (GameObjects.Prefix memory);
    function suffix(uint _id, uint _tier) external pure returns (GameObjects.Suffix memory);
    function suffixCore(uint _id, uint _tier) external pure returns (GameObjects.Suffix memory);

}
