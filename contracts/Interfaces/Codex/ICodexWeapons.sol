import "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

interface ICodexWeapons {
    function weapon(uint _id, uint _tier) external pure returns (GameObjects.Weapon memory);
}