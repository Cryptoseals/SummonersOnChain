import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexArmors {
    function armor(uint _id, uint _tier) external pure returns (GameObjects.Armor memory);
}
