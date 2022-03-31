import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract EquipableItems is Initializable, OwnableUpgradeable, InitNavigator, ERC721EnumerableUpgradeable {

    mapping(uint => GameObjects.ItemType) public tokenToType;
    mapping(uint => uint) public tokenToItemId;
    mapping(uint => uint) public tokenToEnchantmentLevel;
    mapping(uint => uint) public tokenPrefix;
    mapping(uint => uint) public tokenPrefixTier;
    mapping(uint => uint) public tokenSuffix;
    mapping(uint => uint) public tokenSuffixTier;

    function initialize(address _navigator, string memory name, string memory symbol) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
        __Ownable_init();
    }

    function mintItem(address player,
        GameObjects.ItemType _type,
        uint id, uint prefix, uint prefixTier, uint suffix, uint suffixTier) external onlyGameContracts {
        uint nextToken = totalSupply() + 1;
        tokenToType[nextToken] = _type;
        tokenToItemId[nextToken] = id;
        tokenPrefix[nextToken] = prefix;
        tokenSuffix[nextToken] = suffix;
        _mint(player, nextToken);
    }

    function burnItem(uint tokenId) external onlyGameContracts {
        _burn(tokenId);
    }

    function upgrade(uint id) external onlyGameContracts {
        // @TODO implement upgrade costs and burners.
        tokenToEnchantmentLevel[id]++;
    }

    function tier(uint id) public view returns (uint _tier) {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        _tier = tokenToEnchantmentLevel[id];
    }

    function tiers(uint[] memory ids) external view returns (uint[] memory) {
        uint[] memory result = new uint[](ids.length);
        for (uint i = 0; i < ids.length; i++) {
            if (!_exists(ids[i])) revert InvalidItem("DOES NOT EXIST");
            result[i] = tier(ids[i]);
        }
        return result;
    }

    function itemType(uint id) external view returns (GameObjects.ItemType _type) {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        _type = tokenToType[id];
    }
    function item(uint id) external view returns (GameObjects.ItemType _type, uint _tier) {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        _type = tokenToType[id];
        _tier = tokenToEnchantmentLevel[id];
    }

    function prefixAndSuffix(uint id) external view returns (uint prefix, uint prefixTier, uint suffix, uint suffixTier) {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        prefix = tokenPrefix[id];
        prefixTier = tokenPrefixTier[id];
        suffix= tokenSuffix[id];
        suffixTier = tokenSuffixTier[id];
    }
}
