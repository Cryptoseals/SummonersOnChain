import {GameObjects_BuffEffects} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.15;

interface ICodexBuffEffects {
    function buffEffect(uint _id, uint _tier) external pure returns (GameObjects_BuffEffects.BuffEffect memory);
}
