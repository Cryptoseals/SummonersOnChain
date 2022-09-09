import {IMonster} from "../../GameObjects/IMonster.sol";
import {Element, Stats, GeneratedStats, ElementalStats, BattleStats} from "../../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICalculator {
    function CostOfStat(uint skill) external view returns (uint);

    function SumOfStatSetCost(Stats memory stats) external view returns (uint);

    function getAllStats(uint summoner) external view returns (Stats memory _stats, GeneratedStats memory _generated_stats, ElementalStats memory _ele_stats, uint lvl);

    function BattleStats(Stats memory _stats1,
        GeneratedStats memory _gen_stats1,
        ElementalStats memory _eleStats1,
        Stats memory _stats2,
        GeneratedStats memory _gen_stats2,
        ElementalStats memory _eleStats2) external view returns (BattleStats memory,
        BattleStats memory);

    function PVEBattleStats(uint summoner, IMonster.Monster memory monster) external view returns
    (BattleStats memory,
        BattleStats memory);

    function PVEBattleStatsByElement(uint summoner, IMonster.Monster memory monster, Element element) external view returns
    (BattleStats memory, BattleStats memory);

    function DPSWDecimals(uint ATK, uint STAT, uint DEF, uint PEN) external pure returns (uint);
    //    function IsSuccessfulDiceRoll100(uint summoner, uint seed, uint chance) external view returns (bool,uint);
}
