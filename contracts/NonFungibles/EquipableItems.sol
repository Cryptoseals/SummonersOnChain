import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Codex/IAllCodexViews.sol";
import "../Lib/Base64.sol";
pragma solidity ^0.8.0;

contract EquipableItems is
    Initializable,
    OwnableUpgradeable,
    InitNavigator,
    ERC721EnumerableUpgradeable
{
    mapping(uint256 => GameObjects.ItemType) public tokenToType;
    mapping(uint256 => uint256) public tokenToItemId;
    mapping(uint256 => uint256) public tokenToEnchantmentLevel;
    mapping(uint256 => uint256) public tokenPrefix;
    mapping(uint256 => uint256) public tokenPrefixTier;
    mapping(uint256 => uint256) public tokenSuffix;
    mapping(uint256 => uint256) public tokenSuffixTier;

    function initialize(
        address _navigator,
        string memory name,
        string memory symbol
    ) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
        __Ownable_init();
    }

    function mintItem(
        address player,
        GameObjects.ItemType _type,
        uint256 id,
        uint256 prefix,
        uint256 prefixTier,
        uint256 suffix,
        uint256 suffixTier
    ) external onlyGameContracts {
        uint256 nextToken = totalSupply() + 1;
        tokenToType[nextToken] = _type;
        tokenToItemId[nextToken] = id;
        tokenPrefix[nextToken] = prefix;
        tokenSuffix[nextToken] = suffix;
        _mint(player, nextToken);
    }

    function burnItem(uint256 tokenId) external onlyGameContracts {
        _burn(tokenId);
    }

    function upgrade(uint256 id) external onlyGameContracts {
        // @TODO implement upgrade costs and burners.
        tokenToEnchantmentLevel[id]++;
    }

    function tier(uint256 id) public view returns (uint256 _tier) {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        _tier = tokenToEnchantmentLevel[id];
    }

    function tiers(uint256[] memory ids)
        external
        view
        returns (uint256[] memory)
    {
        uint256[] memory result = new uint256[](ids.length);
        for (uint256 i = 0; i < ids.length; i++) {
            if (!_exists(ids[i])) revert InvalidItem("DOES NOT EXIST");
            result[i] = tier(ids[i]);
        }
        return result;
    }

    function itemType(uint256 id)
        external
        view
        returns (GameObjects.ItemType _type)
    {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        _type = tokenToType[id];
    }

    function item(uint256 id)
        external
        view
        returns (GameObjects.ItemType _type, uint _itemId, uint256 _tier)
    {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        _type = tokenToType[id];
        _itemId = tokenToItemId[id];
        _tier = tokenToEnchantmentLevel[id];
    }

    function prefixAndSuffix(uint256 id)
        external
        view
        returns (
            uint256 prefix,
            uint256 prefixTier,
            uint256 suffix,
            uint256 suffixTier
        )
    {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        prefix = tokenPrefix[id];
        prefixTier = tokenPrefixTier[id];
        suffix = tokenSuffix[id];
        suffixTier = tokenSuffixTier[id];
    }

    function itemName(uint256 tokenId) public view returns (string memory) {
        GameObjects.Prefix memory prefix = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.PREFIX_CODEX)
        ).prefix(tokenPrefix[tokenId], 1);
        GameObjects.Suffix memory suffix = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.SUFFIX_CODEX)
        ).suffix(tokenSuffix[tokenId], 1);
        GameObjects.Weapon memory weapon = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)
        ).weaponCore(tokenToItemId[tokenId]);
        return
            string(
                abi.encodePacked(
                    prefix.title,
                    weapon.metadata.name,
                    suffix.title
                )
            );
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory tokenURI)
    {
        string memory name = itemName(tokenId);

        string[5] memory parts;
        parts[
            0
        ] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">';

        parts[1] = string(abi.encodePacked("Name", " ", name));

        parts[2] = '</text><text x="10" y="40" class="base">';

        parts[3] = string(
            abi.encodePacked(
                "Enchantment Level",
                " ",
                Base64.toString(tokenToEnchantmentLevel[tokenId])
            )
        );

        parts[4] = "</text></svg>";

        string memory output = string(
            abi.encodePacked(
                parts[0],
                parts[1],
                parts[2],
                parts[3],
                parts[4]
            )
        );

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name: "', name,
                        '", "description": "Rarity is achieved via an active economy, summoners must level, gain feats, learn spells, to be able to craft gear. This allows for market driven rarity while allowing an ever growing economy. Feats, spells, and summoner gear is ommitted as part of further expansions.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(output)),
                        '"}'
                    )
                )
            )
        );
        output = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        return output;
    }
}
