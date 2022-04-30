import "../GameObjects/IGameObjects.sol";


pragma solidity ^0.8.0;

interface IEquipable {
    function getSummonerBattleStats(uint summoner) external view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats);
    function getPreCalculatedStats (uint summoner) external view returns(GameObjects.Stats memory);
    function getPreCalculatedGeneratedStats (uint summoner) external view returns(GameObjects.GeneratedStats memory);
}
