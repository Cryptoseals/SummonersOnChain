import {ReentrancyGuardUpgradeable} from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import {ICodexLands} from "../Interfaces/Codex/ICodexLands.sol";
import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {ILandsToken} from "../Interfaces/NonFungibles/Lands/ILandsToken.sol";
import {IAnimalsToken} from "../Interfaces/NonFungibles/Lands/IAnimalsToken.sol";
import {ISeedToken} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ISeed.sol";
import {ICookingItems} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItems.sol";
import {IAlchemyItems} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IAlchemyItems.sol";
import {ICodexRandom} from "../Interfaces/Codex/ICodexRandom.sol";
import {IFungibleInGameToken} from "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
pragma solidity ^0.8.0;


contract LandUtils is InitNavigator, ReentrancyGuardUpgradeable {
    ICodexLands public landCodex;
    ILandsToken public landToken;
    IAnimalsToken public animalToken;
    ICookingItems public cookingItemToken;
    IAlchemyItems public alchemyItemToken;
    ISeedToken public seedToken;
    ICodexRandom public rng;
    IFungibleInGameToken public gold;


    uint DairyProdTime;
    mapping(uint => uint) public LandExperiences;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        __ReentrancyGuard_init();
        // TODO, edit this on deploy
        DairyProdTime = 10 minutes;
    }

    function initializeContracts() external {
        landCodex = ICodexLands(contractAddress(INavigator.CONTRACT.LANDS_CODEX));
        landToken = ILandsToken(contractAddress(INavigator.CONTRACT.LANDS));
        animalToken = IAnimalsToken(contractAddress(INavigator.CONTRACT.ANIMALS));
        cookingItemToken = ICookingItems(contractAddress(INavigator.CONTRACT.COOKING_ITEMS));
        alchemyItemToken = IAlchemyItems(contractAddress(INavigator.CONTRACT.ALCHEMY_ITEMS));
        seedToken = ISeedToken(contractAddress(INavigator.CONTRACT.SEEDS));
        rng = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        gold = IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD));
    }

    modifier isOwned(uint landId, address owner) {
        require(landToken.ownerOf(landId) == owner, "o");
        _;
    }
}
