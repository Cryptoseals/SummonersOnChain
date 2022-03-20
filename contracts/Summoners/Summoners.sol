import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract Summoners is ERC721EnumerableUpgradeable, InitNavigator {
    mapping(uint => GameEntities.SummonerMetadata) public SummonerMetadatas;
    mapping(uint => GameEntities.SummonerData) public SummonerData;
    mapping(uint => GameEntities.SummonerState) public SummonerState;

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
        __ERC721_init("Summoners on Chain Season 1", "SoC1");
    }

    function senderIsOwner(uint summonerId) external returns (bool) {
        return ownerOf(summonerId) == msg.sender;
    }

    function setSummonerState(uint summoner, GameEntities.SummonerState state) public onlyGameContracts {
        SummonerState[summoner] = state;
    }

    // view functions

    function level(uint id) external view returns (uint) {
        GameEntities.SummonerData memory _data = SummonerData[id];
        return _data.level;
    }

    function exp(uint id) external view returns (uint) {
        GameEntities.SummonerData memory _data = SummonerData[id];
        return _data.EXP;
    }

    function state(uint id) external view returns (GameEntities.SummonerState _state) {
        GameEntities.SummonerData memory _data = SummonerData[id];
        _state = _data.state;
    }
}
