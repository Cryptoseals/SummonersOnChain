import {GameObjects_Stats} from "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

interface IEquipable {
    function getSummonerBattleStats(uint summoner) external view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats);

    function getPreCalculated(uint summoner) external view returns (GameObjects_Stats.Stats memory, GameObjects_Stats.GeneratedStats memory, GameObjects_Stats.ElementalStats memory);

    function getPreCalculatedStats(uint summoner) external view returns (GameObjects_Stats.Stats memory);

    function getPreCalculatedGeneratedStats(uint summoner) external view returns (GameObjects_Stats.GeneratedStats memory);
}
