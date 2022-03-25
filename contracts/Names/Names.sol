import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract Names is
    Initializable,
    OwnableUpgradeable,
    InitNavigator,
    ERC721EnumerableUpgradeable
{
    mapping(uint256 => uint256) public NameToSummoner;
    mapping(string => uint) public NamesToToken;

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
        uint256 nextToken = totalSupply()+1;
        require(NamesToToken[_name] != 0, "taken");
        NamesToToken[_name] = nextToken;
        _mint(player, nextToken);
    }
}
