import {GameObjects_BuffEffects, GameObjects_Stats} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface IConsumablesAndArtifacts {
    function activeConsumableEffects(uint summoner) external view returns (GameObjects_BuffEffects.ElixirBonusEffect memory _fx, GameObjects_Stats.Stats memory _stats,GameObjects_Stats.GeneratedStats memory _gen_stats,GameObjects_Stats.ElementalStats memory _ele_stats);
    function activeArtifacts(uint summoner) external view returns (GameObjects_Stats.Stats memory _stats,GameObjects_Stats.GeneratedStats memory _gen_stats,GameObjects_Stats.ElementalStats memory _ele_stats);
    function activeEffects(uint summoner) external view returns (GameObjects_Stats.Stats memory _stats,GameObjects_Stats.GeneratedStats memory _gen_stats,GameObjects_Stats.ElementalStats memory _ele_stats);
}
