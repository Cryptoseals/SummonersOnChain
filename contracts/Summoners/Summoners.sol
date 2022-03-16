import "../Interfaces/NonFungibles/Common/ERC721A.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Interfaces/Summoners/ISummoners.sol";

pragma solidity ^0.8.0;

contract Summoners is ERC721A, ISummoners {

    mapping(uint => GameEntities.SummonerMetadata) public SummonerMetadatas;
    mapping(uint => GameEntities.SummonerData) public SummonerData;

    constructor () ERC721A("Summoners on Chain Season 1", "SoC1") {

    }

    function senderIsOwner(uint summonerId) external override(ISummoners) returns(bool) {
        return ownerOf(summonerId) == msg.sender;
    }

    function level(uint id) external view override(ISummoners) returns (uint) {
        return SummonerData[id].level;
    }
}
