import "../../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICalculator {
    function CostOfStat (uint skill) external view returns(uint);
    function SumOfStatSetCost (GameObjects.Stats memory stats) external view returns(uint);
    function getAllStats(uint summoner) external view returns (GameObjects.Stats memory _stats_base, GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _generated_stats, GameObjects.ElementalStats memory _ele_stats, uint lvl);
}
