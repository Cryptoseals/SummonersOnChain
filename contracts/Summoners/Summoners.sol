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
    mapping(uint => GameEntities.SummonerState) public SummonerState;
    mapping(uint => GameObjects.Class) public SummonerClasses;

    mapping(uint => uint) public SummonerEXP;
    mapping(uint => uint) public SummonerLevels;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init("Summoners on Chain Season 1", "SoC1");
    }

    function mintSummoner(GameObjects.Class _class) external {
        uint tokenId = totalSupply();
        SummonerState[tokenId] = GameEntities.SummonerState.FREE;
        SummonerClasses[tokenId] = _class;
        SummonerMetadatas[tokenId].id = tokenId;
        SummonerMetadatas[tokenId].summonedBy = msg.sender;
        SummonerLevels[tokenId] = 1;
        _mint(msg.sender, tokenId);
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
    function class(uint id) external view returns (GameObjects.Class) {
        return SummonerClasses[id];
    }

    function level(uint id) external view returns (uint) {
        return SummonerLevels[id];
    }

    function exp(uint id) external view returns (uint) {
        return SummonerEXP[id];
    }

    function state(uint id) external view returns (GameEntities.SummonerState) {
        return SummonerState[id];
    }

    function summonerData(uint id) external view returns (GameEntities.SummonerData memory) {
        GameEntities.SummonerData memory _data = GameEntities.SummonerData({
        level : SummonerLevels[id],
        class: SummonerClasses[id],
        state : SummonerState[id],
        EXP : SummonerEXP[id]
        });
        return _data;
    }
}
