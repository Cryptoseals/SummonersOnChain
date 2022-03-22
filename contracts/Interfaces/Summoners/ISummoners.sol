import "../GameObjects/IGameEntities.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

pragma solidity ^0.8.0;

interface ISummoners is IERC721 {
    function level(uint id) external view returns (uint);
    function exp(uint id) external view returns (uint);
    function state(uint id) external view returns (GameEntities.SummonerState _state);
    function summonerData(uint id) external view returns (GameEntities.SummonerData memory _data);
    function senderIsOwner(uint summoner, address _owner) external returns(bool);
}
