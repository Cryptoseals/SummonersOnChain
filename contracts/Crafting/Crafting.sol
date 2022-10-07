import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {INavigator, InitNavigator} from "../Core/Navigator/InitNavigator.sol";
import {ItemType, BuffEffectRecipe, Element, CoreRecipe} from "../Interfaces/GameObjects/IGameObjects.sol";
import {IEquipableItems} from "../Interfaces/NonFungibles/EquipableItems/IEquipableItems.sol";
import {CraftingRecipe} from "../Interfaces/Crafting/ICraftingRecipe.sol";
import {IFungibleInGameToken} from "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import {ICraftingMaterialsToken} from "../Interfaces/NonFungibles/CraftingMaterials/ICraftingMaterialsToken.sol";
import {ICodexRandom} from "../Interfaces/Codex/ICodexRandom.sol";
import {IMiscBurnable, IAlchemyBurnable, ICookingBurnable} from "../Interfaces/Crafting/IBurnables.sol";
pragma solidity ^0.8.0;

interface Recipes {
    function recipe(uint256 itemId)
        external
        view
        returns (CraftingRecipe memory _recipe);
}

interface CoreRecipes {
    function recipe_by_id(uint256 itemId)
        external
        view
        returns (CoreRecipe memory _recipe);
}

contract Crafting is Initializable, InitNavigator {
    Recipes HELMET_RECIPES;
    Recipes ARMOR_RECIPES;
    Recipes BOOTS_RECIPES;
    Recipes WEAPON_RECIPES;
    Recipes AMULET_RECIPES;
    Recipes RING_RECIPES;
    Recipes EARRING_RECIPES;
    Recipes BELT_RECIPES;
    CoreRecipes CORE_RECIPES;
    IFungibleInGameToken goldContract;
    IFungibleInGameToken essenceContract;
    IMiscBurnable miscs;
    IAlchemyBurnable alchemy;
    ICookingBurnable cooking;
    CraftingConsumable consumables;
    CraftingArtifact artifacts;
    CraftingCore cores;
    IEquipableItems equipments;
    ICraftingMaterialsToken craftingMaterialContract;
    ICodexRandom rng;

    uint256 lastRoll;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function initializeContracts() external {
        HELMET_RECIPES = Recipes(
            contractAddress(INavigator.CONTRACT.HELMET_RECIPES)
        );
        ARMOR_RECIPES = Recipes(
            contractAddress(INavigator.CONTRACT.ARMOR_RECIPES)
        );
        BOOTS_RECIPES = Recipes(
            contractAddress(INavigator.CONTRACT.BOOTS_RECIPES)
        );
        WEAPON_RECIPES = Recipes(
            contractAddress(INavigator.CONTRACT.WEAPON_RECIPES)
        );
        AMULET_RECIPES = Recipes(
            contractAddress(INavigator.CONTRACT.AMULET_RECIPES)
        );
        RING_RECIPES = Recipes(
            contractAddress(INavigator.CONTRACT.RING_RECIPES)
        );
        EARRING_RECIPES = Recipes(
            contractAddress(INavigator.CONTRACT.EARRING_RECIPES)
        );
        BELT_RECIPES = Recipes(
            contractAddress(INavigator.CONTRACT.BELT_RECIPES)
        );
        CORE_RECIPES = CoreRecipes(
            contractAddress(INavigator.CONTRACT.CORE_RECIPES)
        );
        goldContract = IFungibleInGameToken(
            contractAddress(INavigator.CONTRACT.GOLD)
        );
        essenceContract = IFungibleInGameToken(
            contractAddress(INavigator.CONTRACT.ESSENCE)
        );
        miscs = IMiscBurnable(contractAddress(INavigator.CONTRACT.MISC_ITEMS));
        cooking = ICookingBurnable(
            contractAddress(INavigator.CONTRACT.COOKING_ITEMS)
        );
        alchemy = IAlchemyBurnable(
            contractAddress(INavigator.CONTRACT.ALCHEMY_ITEMS)
        );
        consumables = CraftingConsumable(
            contractAddress(INavigator.CONTRACT.CONSUMABLES)
        );
        artifacts = CraftingArtifact(
            contractAddress(INavigator.CONTRACT.ARTIFACTS)
        );
        equipments = IEquipableItems(
            contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS)
        );
        cores = CraftingCore(contractAddress(INavigator.CONTRACT.CORES));
        craftingMaterialContract = ICraftingMaterialsToken(
            contractAddress(INavigator.CONTRACT.CRAFTING_MATERIALS)
        );
        rng = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
    }

    function craft(
        ItemType _type,
        uint256 id,
        uint256[] memory coreIds
    ) external {
        validateId(_type, id);

        CraftingRecipe memory _recipe = getRecipe(_type, id);
        burnRecipeItems(_recipe, 100);

        uint256 prefix;
        uint256 prefixTier;
        uint256 suffix;
        uint256 suffixTier;
        Element element;

        equipments.mintItem(
            msg.sender,
            _type,
            id,
            prefix,
            prefixTier,
            suffix,
            suffixTier,
            element
        );
    }

    function upgrade(uint256 tokenId) external {
        // todo burn reqs.
        (
            ItemType _type,
            uint256 _itemId,
            uint256 _tier,
            ,
            ,
            ,
            ,
            Element _element
        ) = equipments.item(tokenId);

        uint256 nextTier = _tier + 1;

        require(nextTier < 10, "exceeds");

        uint256 costPercentage = nextTier * 10;

        CraftingRecipe memory _recipe = getRecipe(_type, _itemId);
        burnRecipeItems(_recipe, costPercentage);

        uint256 chance = itemUpgradeChance(nextTier);
        uint256 roll = rng.d100(
            lastRoll +
                block.number +
                tokenId +
                1 +
                nextTier +
                _itemId +
                costPercentage
        );
        if (roll + 1 <= chance) {
            equipments.upgrade(tokenId);
        }
        lastRoll = roll;
    }

    function enhance(uint256 tokenId, uint256 coreId) external {
        equipments.enhance(msg.sender, tokenId, coreId);
    }

    function getRecipe(ItemType _type, uint256 id)
        internal
        view
        returns (CraftingRecipe memory _recipe)
    {
        if (_type == ItemType.HELMET) {
            _recipe = HELMET_RECIPES.recipe(id);
        } else if (_type == ItemType.ARMOR) {
            _recipe = ARMOR_RECIPES.recipe(id);
        } else if (_type == ItemType.BOOTS) {
            _recipe = BOOTS_RECIPES.recipe(id);
        } else if (_type == ItemType.WEAPON) {
            _recipe = WEAPON_RECIPES.recipe(id);
        } else if (_type == ItemType.OFFHAND) {
            _recipe = WEAPON_RECIPES.recipe(id);
        } else if (_type == ItemType.AMULET) {
            _recipe = AMULET_RECIPES.recipe(id);
        } else if (_type == ItemType.RING) {
            _recipe = RING_RECIPES.recipe(id);
        } else if (_type == ItemType.EARRING) {
            _recipe = EARRING_RECIPES.recipe(id);
        } else if (_type == ItemType.BELT) {
            _recipe = BELT_RECIPES.recipe(id);
        } else {
            // not implemented yet.
            revert("niy");
        }
    }

    function burnRecipeItems(CraftingRecipe memory _recipe, uint256 percentage)
        internal
    {
        for (uint256 i = 0; i < _recipe.materialRequirements.length; i++) {
            if (_recipe.materialRequirements[i].amount > 0) {
                craftingMaterialContract.burnMaterial(
                    msg.sender,
                    uint256(_recipe.materialRequirements[i].material),
                    (_recipe.materialRequirements[i].amount * percentage) / 100
                );
            }
        }

        if (_recipe.requiredGold > 0)
            goldContract.burnToken(
                msg.sender,
                (_recipe.requiredGold * percentage) / 100
            );
        if (_recipe.requiredEssence > 0)
            essenceContract.burnToken(
                msg.sender,
                (_recipe.requiredEssence * percentage) / 100
            );
    }

    function validateId(ItemType _type, uint256 id) internal view {
        // check if id is valid
        if (
            _type == ItemType.HELMET ||
            _type == ItemType.ARMOR ||
            _type == ItemType.BOOTS
        ) {
            require((id > 0 && id < 64), "invalid ar");
        } else if (_type == ItemType.WEAPON) {
            require((id > 0 && id < 106), "invalid w");
        } else if (_type == ItemType.OFFHAND) {
            require((id > 105 && id < 148), "invalid o");
        } else if (
            _type == ItemType.AMULET ||
            _type == ItemType.RING ||
            _type == ItemType.EARRING ||
            _type == ItemType.BELT
        ) {
            require((id > 0 && id < 22), "invalid acc");
        } else {
            revert("niy");
        }
    }

    function craftCore(uint256 id, uint256 amount) external {
        CoreRecipe memory recipe = CORE_RECIPES.recipe_by_id(id);
        if (recipe.id == 0 || amount == 0) revert("invalid");

        if (recipe.requiredMiscItems.length > 0) {
            for (uint256 i = 0; i < recipe.requiredMiscItems.length; i++) {
                miscs.burnMiscItem(
                    msg.sender,
                    recipe.requiredMiscItems[i].id,
                    recipe.requiredMiscItems[i].amount * amount
                );
            }
        }

        for (uint256 i = 0; i < recipe.requiredMaterials.length; i++) {
            if (recipe.requiredMaterials[i].amount > 0) {
                craftingMaterialContract.burnMaterial(
                    msg.sender,
                    uint256(recipe.requiredMaterials[i].material),
                    recipe.requiredMaterials[i].amount
                );
            }
        }

        if (recipe.requiredAlchemyItems.length > 0) {
            for (uint256 i = 0; i < recipe.requiredAlchemyItems.length; i++) {
                alchemy.burnAlchemyItem(
                    msg.sender,
                    recipe.requiredAlchemyItems[i].id,
                    recipe.requiredAlchemyItems[i].amount * amount
                );
            }
        }

        if (recipe.requiredEssence > 0) {
            essenceContract.burnToken(
                msg.sender,
                recipe.requiredEssence * amount
            );
        }

        consumables.mintConsumable(id, 0, msg.sender, amount);
    }

    function craftArtifact() external {
        // TODO get reqs, burn stuff etc.
        artifacts.mintItem(msg.sender, 1);
    }

    function craftConsumable(uint256 consumable, uint256 amount) external {
        require(amount > 0 && amount <= 10, "minmax");
        // require(consumable % 10 == 0, ":D");
        BuffEffectRecipe memory recipe = CraftingConsumable(
            contractAddress(INavigator.CONTRACT.CONSUMABLE_RECIPES)
        ).recipe_by_id(consumable);
        if (recipe.id == 0) revert("invalid");

        if (recipe.requiredMiscItems.length > 0) {
            for (uint256 i = 0; i < recipe.requiredMiscItems.length; i++) {
                miscs.burnMiscItem(
                    msg.sender,
                    recipe.requiredMiscItems[i].id,
                    recipe.requiredMiscItems[i].amount * amount
                );
            }
        }

        if (recipe.requiredCookingItems.length > 0) {
            for (uint256 i = 0; i < recipe.requiredCookingItems.length; i++) {
                cooking.burnCookingItem(
                    msg.sender,
                    recipe.requiredCookingItems[i].id,
                    recipe.requiredCookingItems[i].amount * amount
                );
            }
        }

        if (recipe.requiredAlchemyItems.length > 0) {
            for (uint256 i = 0; i < recipe.requiredAlchemyItems.length; i++) {
                alchemy.burnAlchemyItem(
                    msg.sender,
                    recipe.requiredAlchemyItems[i].id,
                    recipe.requiredAlchemyItems[i].amount * amount
                );
            }
        }

        if (recipe.requiredGold > 0) {
            goldContract.burnToken(msg.sender, recipe.requiredGold * amount);
        }
        if (recipe.requiredEssence > 0) {
            essenceContract.burnToken(
                msg.sender,
                recipe.requiredEssence * amount
            );
        }

        uint256 tier = rollConsumableTier(lastRoll + 1881);
        consumables.mintConsumable(consumable, tier, msg.sender, amount);
    }

    function rollConsumableTier(uint256 seed) internal view returns (uint256) {
        uint256 roll = rng.d100(seed + block.number) + 1;
        if (roll > 98) return 5;
        if (roll > 85) return 4;
        if (roll > 75) return 3;
        if (roll > 65) return 2;
        if (roll > 35) return 1;
        return 0;
    }

    function itemUpgradeChance(uint256 tier)
        internal
        pure
        returns (uint256 _chance)
    {
        if (tier == 1) _chance = 100;
        if (tier == 2) _chance = 90;
        if (tier == 3) _chance = 85;
        if (tier == 4) _chance = 80;
        if (tier == 5) _chance = 65;
        if (tier == 6) _chance = 40;
        if (tier == 7) _chance = 25;
        if (tier == 8) _chance = 10;
        if (tier == 9) _chance = 5;
    }
}

interface CraftingArtifact {
    function mintItem(address player, uint256 artifactTier) external;
}

interface CraftingCore {
    function mintItem(address player, uint256 artifactTier) external;
}

interface CraftingConsumable {
    function recipe_by_id(uint256 _id)
        external
        pure
        returns (BuffEffectRecipe memory _recipe);

    function mintConsumable(
        uint256 consumable_id,
        uint256 consumable_tier,
        address to,
        uint256 amount
    ) external;
}
