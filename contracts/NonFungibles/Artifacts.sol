import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract Artifacts is Initializable, OwnableUpgradeable, InitNavigator, ERC721EnumerableUpgradeable {

    mapping(uint => uint) public tokenToArtifactId;
    mapping(uint => uint) public tokenToEnchantmentLevel;

    function initialize(address _navigator, string memory name, string memory symbol) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
    }

    function mintItem(address player, uint artifactId, uint artifactTier) external onlyGameContracts {
        uint nextToken = totalSupply() + 1;
        tokenToArtifactId[nextToken] = artifactId;
        tokenToEnchantmentLevel[nextToken] = artifactTier;
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

    function itemType(uint id) external view returns (uint _type) {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        _type = tokenToArtifactId[id];
    }

}
