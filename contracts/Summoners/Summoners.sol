import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/Core/Constants/Constants.sol";




pragma solidity ^0.8.0;


interface Equipables {
    function mintBeginnerSet(uint summoner, address to, GameObjects.Class _class) external;
}

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

        Equipables(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS)).mintBeginnerSet(tokenId, msg.sender, _class);
        _mint(msg.sender, tokenId);
    }

    function senderIsOwner(uint summonerId, address sender) external returns (bool) {
        return ownerOf(summonerId) == sender;
    }


    function levelUp(uint id) external {
        require((ownerOf(id) == msg.sender), "unauth");
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


    function setSummonerState(uint summoner, GameEntities.SummonerState _state) external onlyGameContracts {
        SummonerState[summoner] = _state;
    }

    function rewardXP(uint summoner, uint xp) external onlyGameContracts {
        SummonerEXP[summoner] += xp;
    }

    function spendXP(uint summoner, uint xp) external onlyGameContracts {
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
        class : SummonerClasses[id],
        state : SummonerState[id],
        EXP : SummonerEXP[id]
        });
        return _data;
    }

    function summonerDatas(uint[] memory ids) external view returns (GameEntities.SummonerData[] memory) {
        GameEntities.SummonerData[] memory _data = new GameEntities.SummonerData[](ids.length);
        for (uint i = 0; i < ids.length; i++) {
            _data[i] = GameEntities.SummonerData({
            level : SummonerLevels[ids[i]],
            class : SummonerClasses[ids[i]],
            state : SummonerState[ids[i]],
            EXP : SummonerEXP[ids[i]]
            });
        }
        return _data;
    }

    function summonerFullDetails(uint id)
    external view returns (
        GameEntities.SummonerData memory _data,
        GameEntities.SummonerMetadata memory _metadata,
        GameEntities.SummonerState _state,
        GameObjects.Stats memory _stats,
        GameObjects.GeneratedStats memory _gen_stats,
        GameObjects.ElementalStats memory _ele_stats
    ){
        _data.level = SummonerLevels[id];
        _data.class = SummonerClasses[id];
        _data.state = SummonerState[id];
        _data.EXP = SummonerEXP[id];

        _metadata.summonerName;

    }

    function tokensOfOwner(address _owner) public view returns (uint[] memory) {
        uint[] memory _tokensOfOwner = new uint[](balanceOf(_owner));
        uint i;

        for (i = 0; i < _tokensOfOwner.length; i++) {
            _tokensOfOwner[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return (_tokensOfOwner);
    }
}
