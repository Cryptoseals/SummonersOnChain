import "../../GameObjects/IGameObjects.sol";
import "../../GameObjects/IGameEntities.sol";

pragma solidity ^0.8.0;

interface IGameState {
    function summonerLevel (uint summoner) external view returns(GameObjects.Stats memory _stats);
    function summonerState (uint summoner) external view returns(GameObjects.Stats memory _stats);
    function summonerBaseStats (uint summoner) external view returns(GameObjects.Stats memory _stats);
    function summonerFinalStats (uint summoner) external view returns(GameObjects.Stats memory _stats);
    function summonerGeneratedStats (uint summoner) external view returns(GameObjects.Stats memory _stats);
    function summonerFinalGeneratedStats (uint summoner) external view returns(GameObjects.Stats memory _stats);
}
