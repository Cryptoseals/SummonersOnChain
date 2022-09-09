import {ElixirBonusEffect, Stats, GeneratedStats, ElementalStats} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface IConsumablesAndArtifacts {
    function activeConsumableEffects(uint summoner) external view returns (ElixirBonusEffect memory _fx, Stats memory _stats,GeneratedStats memory _gen_stats,ElementalStats memory _ele_stats);
    function activeArtifacts(uint summoner) external view returns (Stats memory _stats,GeneratedStats memory _gen_stats,ElementalStats memory _ele_stats);
    function activeEffects(uint summoner) external view returns (Stats memory _stats,GeneratedStats memory _gen_stats,ElementalStats memory _ele_stats);
}
