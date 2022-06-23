import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface IElixirAndArtifactSlots {
    function activeElixirs(uint summoner) external view returns (GameObjects.Stats memory _stats,GameObjects.GeneratedStats memory _gen_stats,GameObjects.ElementalStats memory _ele_stats);
    function activeArtifacts(uint summoner) external view returns (GameObjects.Stats memory _stats,GameObjects.GeneratedStats memory _gen_stats,GameObjects.ElementalStats memory _ele_stats);
    function activeEffects(uint summoner) external view returns (GameObjects.Stats memory _stats,GameObjects.GeneratedStats memory _gen_stats,GameObjects.ElementalStats memory _ele_stats);
}
