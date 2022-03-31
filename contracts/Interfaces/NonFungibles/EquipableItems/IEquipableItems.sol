import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "../../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface IEquipableItems is IERC721 {
    function tier(uint id) external view returns(uint _tier);
    function item(uint id) external view returns (GameObjects.ItemType _type, uint _tier);
    function tiers(uint[] memory ids) external view returns (uint[] memory);
    function itemType(uint id) external view returns(GameObjects.ItemType _type);
    function upgrade(uint id) external;
    function mintItem(address player, GameObjects.ItemType _type, uint id, uint prefix, uint prefixTier, uint suffix, uint suffixTier) external;
    function prefixAndSuffix(uint id) external view returns (uint prefix, uint prefixTier, uint suffix, uint suffixTier);
}
