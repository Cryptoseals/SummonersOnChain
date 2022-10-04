import {ReentrancyGuardUpgradeable} from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import {ILand, Seed, AnimalsL} from "../Interfaces/Lands/ILand.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";
import {ICodexLands} from "../Interfaces/Codex/ICodexLands.sol";
import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {ILandsToken} from "../Interfaces/NonFungibles/Lands/ILandsToken.sol";
import {IAnimalsToken} from "../Interfaces/NonFungibles/Lands/IAnimalsToken.sol";
import {ISeedToken} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ISeed.sol";
import {ICookingItems} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItems.sol";
import {IAlchemyItems, IAlchemyItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IAlchemyItems.sol";
import {ICodexRandom} from "../Interfaces/Codex/ICodexRandom.sol";
import {IFungibleInGameToken} from "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
pragma solidity ^0.8.0;

contract Trader is InitNavigator, ReentrancyGuardUpgradeable {
    ICodexLands public landCodex;
    ILandsToken public landToken;
    IAnimalsToken public animalToken;
    ICookingItems public cookingItemToken;
    IAlchemyItems public alchemyItemToken;
    ISeedToken public seedToken;
    IFungibleInGameToken public gold;
    IFungibleInGameToken public essence;

    modifier isOwned(uint256 landId, address owner) {
        require(landToken.ownerOf(landId) == owner, "o");
        _;
    }

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        __ReentrancyGuard_init();
    }

    function initializeContracts() external {
        landCodex = ICodexLands(
            contractAddress(INavigator.CONTRACT.LANDS_CODEX)
        );
        landToken = ILandsToken(contractAddress(INavigator.CONTRACT.LANDS));
        animalToken = IAnimalsToken(
            contractAddress(INavigator.CONTRACT.ANIMALS)
        );
        cookingItemToken = ICookingItems(
            contractAddress(INavigator.CONTRACT.COOKING_ITEMS)
        );
        alchemyItemToken = IAlchemyItems(
            contractAddress(INavigator.CONTRACT.ALCHEMY_ITEMS)
        );
        seedToken = ISeedToken(contractAddress(INavigator.CONTRACT.SEEDS));
        gold = IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD));
        essence = IFungibleInGameToken(
            contractAddress(INavigator.CONTRACT.ESSENCE)
        );
    }

    function buySeed(
        uint256 landId,
        Seed.List seed,
        uint256 amount
    ) external isOwned(landId, msg.sender) nonReentrant {
        require(uint256(seed) > 0 && amount > 0, "a");
        ILand.Seed memory _seed = landCodex.seed(uint256(seed));
        uint256 price = 0;
        price += _seed.buyPrice * amount;
        require(price > 0, "?");
        gold.burnToken(msg.sender, price);
        seedToken.mintSeed(seed, msg.sender, amount);
    }

    function buyAnimal(
        uint256 landId,
        uint256 id,
        uint256 amount
    ) external nonReentrant isOwned(landId, msg.sender) {
        require(amount > 0, "a");
        AnimalsL.BabyAnimal memory _animal = landCodex.babyAnimal(id);

        uint256 price = 0;
        price += _animal.buyPrice * amount;
        require(price > 0, "?");
        gold.burnToken(msg.sender, price);
        animalToken.mintAnimal(msg.sender, id, amount);
    }

    function buyCookingIngredient(
        uint256 landId,
        ICookingItem.List item,
        uint256 amount
    ) external nonReentrant isOwned(landId, msg.sender) {
        if (
            item == ICookingItem.List.Sea_Fish ||
            item == ICookingItem.List.Ocean_Fish ||
            item == ICookingItem.List.Wine ||
            item == ICookingItem.List.Salt ||
            item == ICookingItem.List.Chocolate ||
            item == ICookingItem.List.Butter ||
            item == ICookingItem.List.Sugar ||
            item == ICookingItem.List.Olive_Oil ||
            item == ICookingItem.List.Sunflower_Oil
        ) {
            gold.burnToken(msg.sender, amount * 25e18);
            cookingItemToken.rewardCookingItem(msg.sender, item, amount);
        } else {
            revert("cant buy this item");
        }
    }

    function buyAlchemyItems(
        uint256 landId,
        IAlchemyItem.List item,
        uint256 amount
    ) external nonReentrant isOwned(landId, msg.sender) {
        uint256 price;
        if (item == IAlchemyItem.List.Roots) {
            price = 1;
        } else if (item == IAlchemyItem.List.Cone) {
            price = 1;
        } else if (item == IAlchemyItem.List.Frozen_Cube) {
            price = 2;
        } else if (item == IAlchemyItem.List.Burning_Cube) {
            price = 2;
        } else if (item == IAlchemyItem.List.Gold_Dust) {
            price = 2;
        } else {
            revert("cant buy this item");
        }

        essence.burnToken(msg.sender, amount * price);
        alchemyItemToken.rewardAlchemyItem(msg.sender, item, amount);
    }
}
