import {IAdventure} from "../GameObjects/IAdventure.sol";
pragma solidity ^0.8.15;

interface ICodexAdventures {
    function adventure(uint _id, uint difficulty) external pure returns (IAdventure.AdventureLevel memory);
}
