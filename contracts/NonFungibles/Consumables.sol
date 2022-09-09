import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {Strings}from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC1155Upgradeable}from "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import {OwnableUpgradeable}from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
pragma solidity ^0.8.0;

contract ConsumableItems is Initializable, OwnableUpgradeable, InitNavigator, ERC1155Upgradeable {
    using Strings for uint256;

    uint constant precision = 10000;

    function initialize(address _navigator, string memory uri) external initializer {
        initializeNavigator(_navigator);
        __ERC1155_init(uri);
        __Ownable_init();
    }

    function mintConsumable(uint consumable_id, uint consumable_tier, address to, uint amount) external onlyGameContracts {
        require(amount > 0, "0");
        uint id = consumableItemTokenIdByTier(consumable_id, consumable_tier);
        _mint(to, id, amount, new bytes(0));
    }

    // test purposes
    function mintDev(uint consumable, uint amount) external onlyOwner {
        _mint(msg.sender, uint(consumable), amount, new bytes(0));
    }

    function burnConsumableItem(address from, uint id, uint amount) external onlyGameContracts {
        require(amount > 0, "0");
        _burn(from, uint(id), amount);
    }


    function setURI(string memory __uri) external onlyOwner {
        _setURI(__uri);
    }

    function tokenURI(uint256 id) public view returns (string memory) {
        return string(abi.encodePacked(uri(id), id.toString()));
    }

    function consumablesOf(address account, uint[] memory ids) external view returns (uint[] memory) {
        uint[] memory result = new uint[](ids.length);
        uint i = 0;
        for (i; i < ids.length; i++) {
            result[i] = balanceOf(account, ids[i]);
        }
        return result;
    }

    function consumableItemTokenIdByTier(uint consumable_id, uint tier) public pure returns (uint) {
        return (consumable_id * precision) + tier;
    }

    function decodeConsumableItem(uint tokenId) external pure returns (uint, uint) {
        require(tokenId > 0, "?");
        return ((tokenId - tokenId % precision) / precision, tokenId % precision);
    }
}
