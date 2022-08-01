pragma solidity ^0.8.0;

interface IConsumablesAndArtifactsToken {
    function tier(uint id) external view returns (uint _tier);

    function tiers(uint[] memory ids) external view returns (uint[] memory);

    function itemType(uint id) external view returns (uint _type);

    function burnItem(uint tokenId) external returns (bool);

    function burnConsumableItem(address from, uint id, uint amount) external;

    function consumableItemTokenIdByTier(uint elixir_id, uint tier) external pure returns (uint);

    function decodeConsumableItem(uint tokenId) external pure returns (uint, uint);

    function balanceOf(address account, uint256 id) external view returns (uint256);

    function ownerOf(uint256 tokenId) external view returns (address owner);

}
