import "../../GameObjects/IMonster.sol";
pragma solidity ^0.8.0;

interface ICalculator {
    function CostOfStat(uint skill) external view returns (uint);

    function SumOfStatSetCost(GameObjects.Stats memory stats) external view returns (uint);

    function getAllStats(uint summoner) external view returns (GameObjects.Stats memory _stats_base, GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _generated_stats, GameObjects.ElementalStats memory _ele_stats, uint lvl);

    function BattleStats(GameObjects.Stats memory _stats1,
        GameObjects.GeneratedStats memory _gen_stats1,
        GameObjects.ElementalStats memory _eleStats1,
        GameObjects.Stats memory _stats2,
        GameObjects.GeneratedStats memory _gen_stats2,
        GameObjects.ElementalStats memory _eleStats2) external view returns (GameObjects.BattleStats memory,
        GameObjects.BattleStats memory);

    function PVEBattleStats(uint summoner, IMonster.Monster memory monster) external view returns
    (GameObjects.BattleStats memory,
        GameObjects.BattleStats memory);

    function IsSuccessfulDiceRoll100(uint summoner, uint seed, uint chance) external view returns (bool);
}
