import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import {GameObjects} from "../Interfaces/GameObjects/IGameObjects.sol";
import {IAllCodexViews} from "../Interfaces/Codex/IAllCodexViews.sol";

pragma solidity ^0.8.0;

contract Lands is Initializable, OwnableUpgradeable, InitNavigator, ERC721EnumerableUpgradeable {
    function initialize(
        address _navigator,
        string memory name,
        string memory symbol
    ) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
        __Ownable_init();
    }

    function mintItem(address player) external onlyGameContracts {
        uint nextToken = totalSupply() + 1;
        _mint(player, nextToken);
    }
}
