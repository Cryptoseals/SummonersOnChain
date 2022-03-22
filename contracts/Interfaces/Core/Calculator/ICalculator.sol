import "../../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICalculator {
    function CostOfStat (uint skill) external view returns(uint);
    function SumOfStatSetCost (GameObjects.Stats memory stats) external view returns(uint);
}
