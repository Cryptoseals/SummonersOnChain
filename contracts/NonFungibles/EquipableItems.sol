import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import {GameObjects, GameObjects_Equipments} from "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Codex/IAllCodexViews.sol";
import {ICore} from "../Interfaces/GameObjects/ICore.sol";
import {Base64} from "../Lib/Base64.sol";

pragma solidity ^0.8.0;

interface ICores {
    function balanceOf(address account, uint256 id) external view returns (uint256);

    function burnCore(address from, uint id, uint amount) external;
}

contract EquipableItems is Initializable, OwnableUpgradeable, InitNavigator, ERC721EnumerableUpgradeable
{
    ICores coreContract;
    IAllCodexViews coreCodex;
    IAllCodexViews elixircodex;
    IAllCodexViews artifactCodex;
    IAllCodexViews HELMETS_CODEX;
    IAllCodexViews BODY_ARMORS_CODEX;
    IAllCodexViews BOOTS_CODEX;
    IAllCodexViews AMULETS_CODEX;
    IAllCodexViews RINGS_CODEX;
    IAllCodexViews EARRINGS_CODEX;
    IAllCodexViews BELTS_CODEX;
    IAllCodexViews WEAPONS_CODEX;
    mapping(uint256 => GameObjects.ItemType) public tokenToType;
    mapping(uint256 => uint256) public tokenToItemId;
    mapping(uint256 => uint256) public tokenToEnchantmentLevel;
    mapping(uint256 => uint256) public tokenPrefix;
    mapping(uint256 => uint256) public tokenPrefixTier;
    mapping(uint256 => uint256) public tokenSuffix;
    mapping(uint256 => uint256) public tokenSuffixTier;
    mapping(uint256 => GameObjects.Element) public tokenElement;

    function initialize(
        address _navigator,
        string memory name,
        string memory symbol
    ) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
        __Ownable_init();
    }

    function initializeContracts() external {
        coreContract = ICores(contractAddress(INavigator.CONTRACT.CORES));
        coreCodex = IAllCodexViews(contractAddress(INavigator.CONTRACT.CORE_CODEX));
        HELMETS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.HELMETS_CODEX));
        BODY_ARMORS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.BODY_ARMORS_CODEX));
        BOOTS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.BOOTS_CODEX));
        AMULETS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.AMULETS_CODEX));
        RINGS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.RINGS_CODEX));
        EARRINGS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.EARRINGS_CODEX));
        BELTS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.BELTS_CODEX));
        WEAPONS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX));
    }

    function mintItem(
        address player,
        GameObjects.ItemType _type,
        uint256 id,
        uint256 prefix,
        uint256 prefixTier,
        uint256 suffix,
        uint256 suffixTier,
        GameObjects.Element element
    ) external onlyGameContracts {
        uint256 nextToken = totalSupply() + 1;
        tokenToType[nextToken] = _type;
        tokenToItemId[nextToken] = id;
        tokenPrefix[nextToken] = prefix;
        tokenSuffix[nextToken] = suffix;
        tokenElement[nextToken] = element;
        _mint(player, nextToken);
    }

    function mintBeginnerSet(uint summoner, address to, GameObjects.Class _class) external onlyGameContracts {
        uint256 nextToken = totalSupply() + 1;
        (uint weaponId, uint armorId, uint offhandId, GameObjects.Element ele) = getDefaultItems(_class);

        tokenToType[nextToken] = GameObjects.ItemType.WEAPON;
        tokenToItemId[nextToken] = weaponId;
        tokenElement[nextToken] = ele;
        _mint(to, nextToken);
        nextToken++;

        tokenToType[nextToken] = GameObjects.ItemType.OFFHAND;
        tokenToItemId[nextToken] = offhandId;
        _mint(to, nextToken);
        nextToken++;

        tokenToType[nextToken] = GameObjects.ItemType.HELMET;
        tokenToItemId[nextToken] = armorId;
        _mint(to, nextToken);
        nextToken++;

        tokenToType[nextToken] = GameObjects.ItemType.ARMOR;
        tokenToItemId[nextToken] = armorId;
        _mint(to, nextToken);
        nextToken++;
        tokenToType[nextToken] = GameObjects.ItemType.BOOTS;
        tokenToItemId[nextToken] = armorId;
        _mint(to, nextToken);


        // COMMON
        // amulet
        nextToken++;
        tokenToType[nextToken] = GameObjects.ItemType.AMULET;
        tokenToItemId[nextToken] = 1;
        _mint(to, nextToken);

        // ring
        nextToken++;
        tokenToType[nextToken] = GameObjects.ItemType.RING;
        tokenToItemId[nextToken] = 1;
        _mint(to, nextToken);
        // earring
        nextToken++;
        tokenToType[nextToken] = GameObjects.ItemType.EARRING;
        tokenToItemId[nextToken] = 1;
        _mint(to, nextToken);
        // belt
        nextToken++;
        tokenToType[nextToken] = GameObjects.ItemType.BELT;
        tokenToItemId[nextToken] = 1;
        _mint(to, nextToken);

    }

    function getDefaultItems(GameObjects.Class _class) internal view returns (uint weaponId, uint armorId, uint offhandId, GameObjects.Element _wEle) {
        if (_class == GameObjects.Class.Barbarian) {
            weaponId = 1;
            armorId = 1;
            offhandId = 127;
            // shield
        } else if (_class == GameObjects.Class.Paladin) {
            weaponId = 1;
            armorId = 1;
            offhandId = 127;
            // shield
        } else if (_class == GameObjects.Class.Assassin) {
            weaponId = 22;
            armorId = 22;
            offhandId = 106;
        } else if (_class == GameObjects.Class.Wizard) {
            weaponId = 85;
            armorId = 43;
            offhandId = 106;
            _wEle = GameObjects.Element.ARCANE;
        } else if (_class == GameObjects.Class.Necromancer) {
            weaponId = 64;
            armorId = 43;
            offhandId = 106;
            _wEle = GameObjects.Element.ARCANE;
        } else if (_class == GameObjects.Class.Priest) {
            weaponId = 85;
            armorId = 43;
            offhandId = 106;
            _wEle = GameObjects.Element.ARCANE;
        } else if (_class == GameObjects.Class.Engineer) {
            weaponId = 1;
            armorId = 22;
            offhandId = 106;
        } else if (_class == GameObjects.Class.Ranger) {
            weaponId = 43;
            armorId = 22;
            offhandId = 127;
        }
    }

    function burnItem(uint256 tokenId) external onlyGameContracts {
        _burn(tokenId);
    }

    function upgrade(uint256 id) external onlyGameContracts {
        // @TODO implement upgrade costs and burners.
        require(_exists(id), "h4x0r");
        require(tokenToEnchantmentLevel[id] + 1 < 10, "exceeds");
        tokenToEnchantmentLevel[id]++;
    }

    function enhance(address sender, uint256 tokenId, uint256 coreId) external onlyGameContracts {
        require(ownerOf(tokenId) == sender, "not owned");
        // check balance
        coreContract.burnCore(msg.sender, coreId, 1);
        uint itemId = tokenToItemId[tokenId];

        GameObjects.ItemType _type = tokenToType[tokenId];

        // get core data.
        ICore.Core memory core = coreCodex.core(coreId);
        // check requirements.
        GameObjects_Equipments.EquipableItem memory _equipableItem;
        GameObjects_Equipments.Weapon memory _equipableItemW;
        if (_type == GameObjects.ItemType.HELMET) {
            _equipableItem = HELMETS_CODEX.helmetCore(itemId, 1);
        } else if (_type == GameObjects.ItemType.ARMOR) {
            _equipableItem = BODY_ARMORS_CODEX.armorCore(itemId, 1);
        } else if (_type == GameObjects.ItemType.WEAPON) {
            _equipableItemW = WEAPONS_CODEX.weaponCore(itemId, 1);
        } else if (_type == GameObjects.ItemType.OFFHAND) {
            _equipableItemW = WEAPONS_CODEX.weaponCore(itemId, 1);
        } else if (_type == GameObjects.ItemType.BOOTS) {
            _equipableItem = BOOTS_CODEX.bootsCore(itemId, 1);
        } else if (_type == GameObjects.ItemType.AMULET) {
            _equipableItem = AMULETS_CODEX.amuletCore(itemId, 1);
        } else if (_type == GameObjects.ItemType.RING) {
            _equipableItem = RINGS_CODEX.ringCore(itemId, 1);
        } else if (_type == GameObjects.ItemType.EARRING) {
            _equipableItem = EARRINGS_CODEX.earringsCore(itemId, 1);
        } else if (_type == GameObjects.ItemType.BELT) {
            _equipableItem = BELTS_CODEX.beltCore(itemId, 1);
        } else {
            revert InvalidItem("Not Implemented");
        }
        if (_type == GameObjects.ItemType.WEAPON ||
            _type == GameObjects.ItemType.OFFHAND) {
            require(_equipableItemW.requirement.level >= core.minItemLvl, "lowlvl");
        } else {
            require(_equipableItem.requirement.level >= core.minItemLvl, "lowlvl");
        }

        _enhance(tokenId, core.fx);
    }

    function _enhance(uint tokenId, ICore.Effect memory fx) internal {
        if (fx.fxType == ICore.EffectType.OVERRIDE_PREFIX) {
            tokenPrefix[fx.prefixToAdd];
        } else if (fx.fxType == ICore.EffectType.OVERRIDE_SUFFIX) {
            tokenPrefix[fx.suffixToAdd];
        } else if (fx.fxType == ICore.EffectType.OVERRIDE_ELEMENT) {
            tokenElement[tokenId] = fx.elementToAdd;
        } else {
            revert("critical.err");
        }
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
    public
    view
    returns (GameObjects.ItemType _type)
    {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        _type = tokenToType[id];
    }

    function item(uint256 id)
    external
    view
    returns (GameObjects.ItemType _type, uint _itemId, uint256 _tier, uint _prefix, uint _prefixTier, uint _suffix, uint _suffixTier, GameObjects.Element _element)
    {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");

        _type = tokenToType[id];
        _itemId = tokenToItemId[id];
        _tier = tokenToEnchantmentLevel[id];
        _element = tokenElement[id];
        _prefix = tokenPrefix[id];
        _prefixTier = tokenPrefixTier[id];
        _suffix = tokenSuffix [id];
        _suffixTier = tokenSuffixTier[id];
    }

    function items(uint256[] memory ids)
    external
    view
    returns (GameObjects_Equipments.ItemDTO[] memory)
    {
        GameObjects_Equipments.ItemDTO[] memory _dtos = new GameObjects_Equipments.ItemDTO[](ids.length);
        for (uint i = 0; i < ids.length; i++) {
            if (!_exists(ids[i])) revert InvalidItem("DOES NOT EXIST");
            _dtos[i]._type = tokenToType[ids[i]];
            _dtos[i]._itemId = tokenToItemId[ids[i]];
            _dtos[i]._tier = tokenToEnchantmentLevel[ids[i]];
            _dtos[i]._element = tokenElement[ids[i]];
            _dtos[i]._prefix = tokenPrefix[ids[i]];
            _dtos[i]._prefixTier = tokenPrefixTier[ids[i]];
            _dtos[i]._suffix = tokenSuffix [ids[i]];
            _dtos[i]._suffixTier = tokenSuffixTier[ids[i]];
        }

        return _dtos;
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

    // implement later.
    function tokenURI(uint256 tokenId)
    public
    view
    override
    returns (string memory tokenURI)
    {
        // string memory name = itemName(tokenId);

        string[5] memory parts;
        parts[
        0
        ] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">';

        parts[1] = string(abi.encodePacked("Name", " "));

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
                        '{"name: "', "",
                        '", "description": "text here.", "image": "data:image/svg+xml;base64,',
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

    function tokensOfOwner(address _owner) public view returns (uint[] memory) {
        uint[] memory _tokensOfOwner = new uint[](balanceOf(_owner));
        uint i;

        for (i = 0; i < _tokensOfOwner.length; i++) {
            _tokensOfOwner[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return (_tokensOfOwner);
    }
}
