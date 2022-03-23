import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/Core/Constants/Constants.sol";

pragma solidity ^0.8.0;

contract Summoners is ERC721EnumerableUpgradeable, InitNavigator {
    mapping(uint => GameEntities.SummonerMetadata) public SummonerMetadatas;
    mapping(uint => GameEntities.SummonerData) public SummonerData;
    mapping(uint => GameEntities.SummonerState) public SummonerState;

    mapping(uint => uint) public SummonerEXP;
    mapping(uint => uint) public SummonerLevels;

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
        __ERC721_init("Summoners on Chain Season 1", "SoC1");
    }

    function senderIsOwner(uint summonerId, address sender) external returns (bool) {
        return ownerOf(summonerId) == sender;
    }


    function levelUp(uint id) external {
        if (!(ownerOf(id) == msg.sender)) revert UnauthorizedSender(msg.sender, "NOT OWNED");
        _levelUp(id);
    }

    function levelUpSummoner(uint id) external onlyGameContracts {
        _levelUp(id);
    }

    function _levelUp(uint id) internal {
        uint nextLevel = SummonerLevels[id] + 1;
        uint requiredXP = nextLevel * GameConstants.XP_PER_LEVEL;
        require(SummonerEXP[id] >= requiredXP, "NOT ENOUGH XP");
        _spendXP(id, requiredXP);
        SummonerLevels[id]++;
    }


    function setSummonerState(uint summoner, GameEntities.SummonerState _state) public onlyGameContracts {
        SummonerState[summoner] = _state;
    }

    function rewardXP(uint summoner, uint xp) public onlyGameContracts {
        SummonerEXP[summoner] += xp;
    }

    function spendXP(uint summoner, uint xp) public onlyGameContracts {
        _spendXP(summoner, xp);
    }

    function _spendXP(uint summoner, uint xp) internal onlyGameContracts {
        SummonerEXP[summoner] -= xp;
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

    function summonerData(uint id) external view returns (GameEntities.SummonerData memory) {
        GameEntities.SummonerData memory _data = GameEntities.SummonerData({
        level : SummonerLevels[id],
        state : SummonerState[id],
        EXP : SummonerEXP[id]
        });
        return _data;
    }
}
