import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/NonFungibles/EquipableItems/IEquipableItems.sol";
import "../Interfaces/Crafting/ICraftingRecipe.sol";
import "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import "../Interfaces/NonFungibles/CraftingMaterials/ICraftingMaterialsToken.sol";
pragma solidity ^0.8.0;


interface Recipes {
    function recipe(uint itemId) external view returns (ICraftingRecipe.CraftingRecipe memory _recipe);
}

contract Crafting is Initializable, InitNavigator {

    function initialize(
        address _navigator
    ) external initializer {
        initializeNavigator(_navigator);
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
        IEquipableItems equipableContract = IEquipableItems(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS));

        equipableContract.mintItem(
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
            _recipe = Recipes(contractAddress(INavigator.CONTRACT.HELMET_RECIPES)).recipe(id);
        } else if (_type == GameObjects.ItemType.ARMOR) {
            _recipe = Recipes(contractAddress(INavigator.CONTRACT.ARMOR_RECIPES)).recipe(id);
        } else if (_type == GameObjects.ItemType.BOOTS) {
            _recipe = Recipes(contractAddress(INavigator.CONTRACT.BOOTS_RECIPES)).recipe(id);
        } else if (_type == GameObjects.ItemType.WEAPON) {
            _recipe = Recipes(contractAddress(INavigator.CONTRACT.WEAPON_RECIPES)).recipe(id);
        } else if (_type == GameObjects.ItemType.AMULET) {
            _recipe = Recipes(contractAddress(INavigator.CONTRACT.AMULET_RECIPES)).recipe(id);
        } else if (_type == GameObjects.ItemType.RING) {
            _recipe = Recipes(contractAddress(INavigator.CONTRACT.RING_RECIPES)).recipe(id);
        } else if (_type == GameObjects.ItemType.EARRING) {
            _recipe = Recipes(contractAddress(INavigator.CONTRACT.EARRING_RECIPES)).recipe(id);
        } else if (_type == GameObjects.ItemType.BELT) {
            _recipe = Recipes(contractAddress(INavigator.CONTRACT.BELT_RECIPES)).recipe(id);
        } else {
            // not implemented yet.
            revert("niy");
        }

        ICraftingMaterialsToken craftingMaterialContract = ICraftingMaterialsToken(contractAddress(INavigator.CONTRACT.CRAFTING_MATERIALS));
        for (uint i = 0; i < _recipe.materialRequirements.length; i++) {
            if (_recipe.materialRequirements[i].amount) {
                craftingMaterialContract.burnMaterial(
                    msg.sender,
                    uint(_recipe.materialRequirements[i].material),
                    _recipe.materialRequirements[i].amount
                );
            }
        }

        if (_recipe.requiredGold > 0) IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD)).burnToken(msg.sender, _recipe.requiredGold);
        if (_recipe.requiredEssence > 0) IFungibleInGameToken(contractAddress(INavigator.CONTRACT.ESSENCE)).burnToken(msg.sender, _recipe.requiredEssence);
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
}
