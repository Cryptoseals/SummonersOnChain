import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {GameObjects, GameObjects_Equipments} from "../../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface IEquipableItems is IERC721 {
    function tier(uint id) external view returns (uint _tier);

    function item(uint256 id)
    external
    view
    returns (GameObjects.ItemType _type, uint _itemId, uint256 _tier, uint _prefix, uint _prefixTier, uint _suffix, uint _suffixTier, GameObjects.Element _element);

    function items(uint256[] memory ids)
    external
    view
    returns (GameObjects_Equipments.ItemDTO[] memory);

    function tiers(uint[] memory ids) external view returns (uint[] memory);

    function itemType(uint id) external view returns (GameObjects.ItemType _type);

    function upgrade(uint id) external;

    function enhance(address sender, uint id, uint core) external;

    function mintItem(
        address player,
        GameObjects.ItemType _type,
        uint256 id,
        uint256 prefix,
        uint256 prefixTier,
        uint256 suffix,
        uint256 suffixTier,
        GameObjects.Element element
    ) external;

    function prefixAndSuffix(uint id) external view returns (uint prefix, uint prefixTier, uint suffix, uint suffixTier);
}
