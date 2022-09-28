import {SummonerMetadata, SummonerState, SummonerData} from "../GameObjects/IGameEntities.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

pragma solidity ^0.8.0;

interface ISummoners is IERC721 {
    function level(uint id) external view returns (uint);
    function exp(uint id) external view returns (uint);
    function rewardXP(uint summoner, uint xp) external;
    function state(uint id) external view returns (SummonerState _state);
    function summonerData(uint id) external view returns (SummonerData memory _data);
    function senderIsOwner(uint summoner, address _owner) external returns(bool);
    function setSummonerState(uint summoner, SummonerState _state) external;
}
