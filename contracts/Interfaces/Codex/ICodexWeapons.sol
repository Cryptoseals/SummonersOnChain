import {Weapon} from "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.15;

interface ICodexWeapons {
    function weapon(uint _id, uint _tier) external pure returns (Weapon memory);
}