import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/Core/Navigator/INavigator.sol";
import "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";

pragma solidity ^0.8.0;

contract Names is
    Initializable,
    OwnableUpgradeable,
    InitNavigator,
    ERC721EnumerableUpgradeable
{
    uint256 public constant GOLD_COST = 50e18;
    mapping(uint256 => uint256) internal SummonerToName;
    mapping(uint256 => uint256) internal NameToSummoner;
    mapping(string => uint256) public NamesToToken;
    mapping(uint => string) public TokenToName;

    event ChangeName(uint summoner, uint nameId, string name);
    function initialize(
        address _navigator,
        string memory name,
        string memory symbol
    ) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
    }

    function mintName(address player, string memory _name)
        external
        onlyGameContracts
    {
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD))
            .burnToken(player, GOLD_COST);
        uint256 nextToken = totalSupply() + 1;
        require(NamesToToken[_name] != 0, "taken");
        NamesToToken[_name] = nextToken;
        TokenToName[nextToken] = _name;
        _mint(player, nextToken);
    }

    function setSummonerName(uint256 summoner, uint256 nameToken)
        external
        senderIsSummonerOwner(summoner)
    {
        require(ownerOf(nameToken) == msg.sender, "must own");
        SummonerToName[summoner] = nameToken;
        NameToSummoner[nameToken] = summoner;
        emit ChangeName(summoner, nameToken, TokenToName[nameToken]);
    }

    function nameOf(uint summoner) external view returns(string memory _name) {
        uint token = SummonerToName[summoner];
        if(ownerOfSummoner(summoner) == ownerOf(token)) {
            _name = TokenToName[token];
        }
    }
}
