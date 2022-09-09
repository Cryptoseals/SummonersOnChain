import {Stats, GeneratedStats, ElementalStats} from "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

interface IEquipable {
    function getSummonerBattleStats(uint summoner) external view returns (Stats memory _stats, GeneratedStats memory _gen_stats, ElementalStats memory _ele_stats);

    function getPreCalculated(uint summoner) external view returns (Stats memory, GeneratedStats memory, ElementalStats memory);

    function getPreCalculatedStats(uint summoner) external view returns (Stats memory);

    function getPreCalculatedGeneratedStats(uint summoner) external view returns (GeneratedStats memory);
}
