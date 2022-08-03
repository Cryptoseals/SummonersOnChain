import {ReentrancyGuardUpgradeable} from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import {ICodexLands} from "../Interfaces/Codex/ICodexLands.sol";
import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {ILandsToken} from "../Interfaces/NonFungibles/Lands/ILandsToken.sol";
import {IAnimalsToken} from "../Interfaces/NonFungibles/Lands/IAnimalsToken.sol";
import {ICookingItems} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItems.sol";
pragma solidity ^0.8.0;


contract LandUtils is InitNavigator, ReentrancyGuardUpgradeable {
    ICodexLands public landCodex;
    ILandsToken public landToken;
    IAnimalsToken public animalToken;
    ICookingItems public cookingItemToken;


    // TODO, edit this on deploy
    uint DairyProdTime;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        __ReentrancyGuard_init();
        DairyProdTime = 3 minutes;
    }

    function initializeContracts() external {
        landCodex = ICodexLands(contractAddress(INavigator.CONTRACT.LANDS_CODEX));
        landToken = ILandsToken(contractAddress(INavigator.CONTRACT.LANDS));
        animalToken = IAnimalsToken(contractAddress(INavigator.CONTRACT.ANIMALS));
        cookingItemToken = ICookingItems(contractAddress(INavigator.CONTRACT.COOKING_ITEMS));
    }

    modifier isOwned(uint landId) {
        require(landToken.ownerOf(landId) == msg.sender, "o");
        _;
    }
}
