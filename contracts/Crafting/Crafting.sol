import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {INavigator, InitNavigator} from "../Core/Navigator/InitNavigator.sol";
import {GameObjects, GameObjects_Elixir} from "../Interfaces/GameObjects/IGameObjects.sol";
import {IEquipableItems} from "../Interfaces/NonFungibles/EquipableItems/IEquipableItems.sol";
import {ICraftingRecipe, ICraftingMaterials} from "../Interfaces/Crafting/ICraftingRecipe.sol";
import {IFungibleInGameToken} from "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import {ICraftingMaterialsToken} from "../Interfaces/NonFungibles/CraftingMaterials/ICraftingMaterialsToken.sol";
pragma solidity ^0.8.0;


interface Recipes {
    function recipe(uint itemId) external view returns (ICraftingRecipe.CraftingRecipe memory _recipe);
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
    IFungibleInGameToken goldContract;
    IFungibleInGameToken essenceContract;
    IMiscItems miscs;
    CraftingElixir elixirs;
    CraftingArtifact artifacts;
    IEquipableItems equipments;
    ICraftingMaterialsToken craftingMaterialContract;

    function initialize(
        address _navigator
    ) external initializer {
        initializeNavigator(_navigator);
    }

    function initializeContracts() external {
        HELMET_RECIPES = Recipes(contractAddress(INavigator.CONTRACT.HELMET_RECIPES));
        ARMOR_RECIPES = Recipes(contractAddress(INavigator.CONTRACT.ARMOR_RECIPES));
        BOOTS_RECIPES = Recipes(contractAddress(INavigator.CONTRACT.BOOTS_RECIPES));
        WEAPON_RECIPES = Recipes(contractAddress(INavigator.CONTRACT.WEAPON_RECIPES));
        AMULET_RECIPES = Recipes(contractAddress(INavigator.CONTRACT.AMULET_RECIPES));
        RING_RECIPES = Recipes(contractAddress(INavigator.CONTRACT.RING_RECIPES));
        EARRING_RECIPES = Recipes(contractAddress(INavigator.CONTRACT.EARRING_RECIPES));
        BELT_RECIPES = Recipes(contractAddress(INavigator.CONTRACT.BELT_RECIPES));
        goldContract = IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD));
        essenceContract = IFungibleInGameToken(contractAddress(INavigator.CONTRACT.ESSENCE));
        miscs = IMiscItems(contractAddress(INavigator.CONTRACT.MISC_ITEMS));
        elixirs = CraftingElixir(contractAddress(INavigator.CONTRACT.ELIXIRS));
        artifacts = CraftingArtifact(contractAddress(INavigator.CONTRACT.ARTIFACTS));
        equipments = IEquipableItems(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS));
        craftingMaterialContract = ICraftingMaterialsToken(contractAddress(INavigator.CONTRACT.CRAFTING_MATERIALS));
    }

    function craft(
        GameObjects.ItemType _type,
        uint id,
        uint[] memory coreIds
    ) external {
        validateId(_type, id);
        burnRecipeItems(_type, id);
        uint prefix;
        uint prefixTier;
        uint suffix;
        uint suffixTier;
        GameObjects.Element element;

        equipments.mintItem(
            msg.sender,
            _type,
            id,
            prefix,
            prefixTier,
            suffix,
            suffixTier, element);
    }

    function burnRecipeItems(GameObjects.ItemType _type, uint id) internal {
        ICraftingRecipe.CraftingRecipe memory _recipe;
        if (_type == GameObjects.ItemType.HELMET) {
            _recipe = HELMET_RECIPES.recipe(id);
        } else if (_type == GameObjects.ItemType.ARMOR) {
            _recipe = ARMOR_RECIPES.recipe(id);
        } else if (_type == GameObjects.ItemType.BOOTS) {
            _recipe = BOOTS_RECIPES.recipe(id);
        } else if (_type == GameObjects.ItemType.WEAPON) {
            _recipe = WEAPON_RECIPES.recipe(id);
        } else if (_type == GameObjects.ItemType.AMULET) {
            _recipe = AMULET_RECIPES.recipe(id);
        } else if (_type == GameObjects.ItemType.RING) {
            _recipe = RING_RECIPES.recipe(id);
        } else if (_type == GameObjects.ItemType.EARRING) {
            _recipe = EARRING_RECIPES.recipe(id);
        } else if (_type == GameObjects.ItemType.BELT) {
            _recipe = BELT_RECIPES.recipe(id);
        } else {
            // not implemented yet.
            revert("niy");
        }

        for (uint i = 0; i < _recipe.materialRequirements.length; i++) {
            if (_recipe.materialRequirements[i].amount > 0) {
                craftingMaterialContract.burnMaterial(
                    msg.sender,
                    uint(_recipe.materialRequirements[i].material),
                    _recipe.materialRequirements[i].amount
                );
            }
        }

        if (_recipe.requiredGold > 0) goldContract.burnToken(msg.sender, _recipe.requiredGold);
        if (_recipe.requiredEssence > 0) essenceContract.burnToken(msg.sender, _recipe.requiredEssence);
    }

    function validateId(GameObjects.ItemType _type, uint id) internal view {
        // check if id is valid
        if (
            _type == GameObjects.ItemType.HELMET ||
            _type == GameObjects.ItemType.ARMOR ||
            _type == GameObjects.ItemType.BOOTS
        ) {
            require((id > 0 && id < 64), "invalid ar");
        } else if (_type == GameObjects.ItemType.WEAPON) {
            require((id > 0 && id < 106), "invalid w");
        } else if (_type == GameObjects.ItemType.OFFHAND) {
            require((id > 105 && id < 148), "invalid o");
        } else if (
            _type == GameObjects.ItemType.AMULET ||
            _type == GameObjects.ItemType.RING ||
            _type == GameObjects.ItemType.EARRING ||
            _type == GameObjects.ItemType.BELT
        ) {
            require((id > 0 && id < 22), "invalid acc");
        } else {
            revert("niy");
        }
    }


    function craftArtifact() external {
        // TODO get reqs, burn stuff etc.
        artifacts.mintItem(msg.sender, 1);
    }

    function craftElixir(uint elixir, uint amount) external {
        GameObjects_Elixir.ElixirRecipe memory recipe = CraftingElixir(contractAddress(INavigator.CONTRACT.ELIXIR_RECIPES)).recipe_by_id(elixir);
        if (recipe.id == 0) revert("invalid");
        for (uint i = 0; i < recipe.requiredMiscItemIDs.length; i++) {
            miscs.burnMiscItem(msg.sender, recipe.requiredMiscItemIDs[i], 1);
        }
        goldContract.burnToken(msg.sender, recipe.requiredGold);
        essenceContract.burnToken(msg.sender, recipe.requiredEssence);
        elixirs.mintElixir(elixir, 1, msg.sender, amount);
    }

}

interface IMiscItems {
    function burnMiscItem(address from, uint id, uint amount) external;
}

interface CraftingArtifact {
    function mintItem(address player, uint artifactTier) external;
}


interface CraftingElixir {
    function recipe_by_id(uint _id) external pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe);

    function mintElixir(uint elixir_id, uint elixir_tier, address to, uint amount) external;
}
