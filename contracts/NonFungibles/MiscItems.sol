import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/Codex/ICodexMisc.sol";

pragma solidity ^0.8.0;

contract MiscItems is Initializable, OwnableUpgradeable, InitNavigator, ERC1155Upgradeable {

    using Strings for uint256;

    function initialize(address _navigator, string memory uri) external initializer {
        initializeNavigator(_navigator);
        __ERC1155_init(uri);
        __Ownable_init();
    }

    function rewardMiscItem(address to, uint id, uint amount) external onlyGameContracts {
//        if (id < 1) revert InvalidItem("invalid item");
        _mint(to, id, amount, new bytes(0));

    }

    function burnMiscItem(address from, uint id, uint amount) external onlyGameContracts {
        _burn(from, id, amount);
    }

    function setURI(string memory __uri) external onlyOwner {
        _setURI(__uri);
    }

    function tokenURI(uint256 id) public view returns (string memory) {
        return string(abi.encodePacked(uri(id), id.toString()));
    }
}
