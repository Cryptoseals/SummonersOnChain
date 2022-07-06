pragma solidity ^0.8.0;

interface IElixirsAndArtifacts {
    function tier(uint id) external view returns (uint _tier);

    function tiers(uint[] memory ids) external view returns (uint[] memory);

    function itemType(uint id) external view returns (uint _type);

    function burnItem(uint tokenId) external returns(bool);

    function ownerOf(uint256 tokenId) external view returns (address owner);

}
