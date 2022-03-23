import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface IAllCodexViews {
    function weapon(uint _id, uint _tier) external pure returns (GameObjects.Weapon memory);
    function offHand(uint _id, uint _tier) external pure returns (GameObjects.OffHand memory);
    function helmet(uint _id, uint _tier) external pure returns (GameObjects.Helmet memory);
    function armor(uint _id, uint _tier) external pure returns (GameObjects.Armor memory);
    function boots(uint _id, uint _tier) external pure returns (GameObjects.Boots memory);
    function amulet(uint _id, uint _tier) external pure returns (GameObjects.Amulet memory);
    function ring(uint _id, uint _tier) external pure returns (GameObjects.Ring memory);
    function earring(uint _id, uint _tier) external view returns (GameObjects.Earring memory);
    function belt(uint _id, uint _tier) external pure returns (GameObjects.Belt memory);
    function mount(uint _id, uint _tier) external pure returns (GameObjects.Mount memory);
}
