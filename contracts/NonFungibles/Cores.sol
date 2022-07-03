import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {Strings}from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC1155Upgradeable}from "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import {OwnableUpgradeable}from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {EnumerableSetUpgradeable}from "@openzeppelin/contracts-upgradeable/utils/structs/EnumerableSetUpgradeable.sol";
import {CodexCores, ICore} from "../Codex/CodexCores.sol";
pragma solidity ^0.8.0;

contract Cores is Initializable, OwnableUpgradeable, InitNavigator, ERC1155Upgradeable {
    using EnumerableSetUpgradeable for EnumerableSetUpgradeable.UintSet;
    using Strings for uint256;

    mapping(address => EnumerableSetUpgradeable.UintSet) AccountsActiveProcessings;

    function initialize(address _navigator, string memory uri) external initializer {
        initializeNavigator(_navigator);
        __ERC1155_init(uri);
        __Ownable_init();
    }

    function mintCore(uint core, address to, uint amount) external onlyGameContracts {
        require(amount > 0, "0");
        // TODO("put crafting requirements")
        _mint(to, uint(core), amount, new bytes(0));
    }

    // test purposes
    function mintDev(uint core, uint amount) external {
        _mint(msg.sender, uint(core), amount, new bytes(0));
    }

    function burnCore(address from, uint id, uint amount) external onlyGameContracts {
        require(amount > 0, "0");
        _burn(from, uint(id), amount);
    }


    function setURI(string memory __uri) external onlyOwner {
        _setURI(__uri);
    }

    function tokenURI(uint256 id) public view returns (string memory) {
        return string(abi.encodePacked(uri(id), id.toString()));
    }

    function coresOf(address account, uint[] memory ids) external view returns (uint[] memory) {
        uint[] memory result = new uint[](ids.length);
        uint i = 0;
        for (i; i < ids.length; i++) {
            result[i] = balanceOf(account, ids[i]);
        }
        return result;
    }
}
