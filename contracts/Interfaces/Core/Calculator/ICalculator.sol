import {GameObjects, GameObjects_Stats, IMonster} from "../../GameObjects/IMonster.sol";
pragma solidity ^0.8.0;

interface ICalculator {
    function CostOfStat(uint skill) external view returns (uint);

    function SumOfStatSetCost(GameObjects_Stats.Stats memory stats) external view returns (uint);

    function getAllStats(uint summoner) external view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _generated_stats, GameObjects_Stats.ElementalStats memory _ele_stats, uint lvl);

    function BattleStats(GameObjects_Stats.Stats memory _stats1,
        GameObjects_Stats.GeneratedStats memory _gen_stats1,
        GameObjects_Stats.ElementalStats memory _eleStats1,
        GameObjects_Stats.Stats memory _stats2,
        GameObjects_Stats.GeneratedStats memory _gen_stats2,
        GameObjects_Stats.ElementalStats memory _eleStats2) external view returns (GameObjects_Stats.BattleStats memory,
        GameObjects_Stats.BattleStats memory);

    function PVEBattleStats(uint summoner, IMonster.Monster memory monster) external view returns
    (GameObjects_Stats.BattleStats memory,
        GameObjects_Stats.BattleStats memory);

    function PVEBattleStatsByElement(uint summoner, IMonster.Monster memory monster, GameObjects.Element element) external view returns
    (GameObjects_Stats.BattleStats memory,
        GameObjects_Stats.BattleStats memory);

    function DPSWDecimals(uint ATK, uint STAT, uint DEF, uint PEN) external pure returns (uint);
    //    function IsSuccessfulDiceRoll100(uint summoner, uint seed, uint chance) external view returns (bool,uint);
}
