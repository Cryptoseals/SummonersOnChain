import {IAdventure} from "../GameObjects/IAdventure.sol";
pragma solidity ^0.8.0;

interface ICodexAdventures {
    function adventure(uint _id, uint difficulty) external pure returns (IAdventure.AdventureLevel memory);
}
