import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import "../Interfaces/Codex/ICodexRandom.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/Core/Navigator/INavigator.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/Core/Constants/Constants.sol";
import "../Interfaces/GameObjects/IGameRewards.sol";
import "../Interfaces/NonFungibles/Common/IRewardNonFungible.sol";


interface CraftingMaterialContract {
    function mintMaterial(ICraftingMaterials.CraftingMaterial material, address to, uint amount) external;
}

pragma solidity ^0.8.0;

contract Reward is InitNavigator {

    uint nonce;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function reward(address to, IGameRewards.Reward memory _reward, uint optionalNonce) external onlyGameContracts {
        if (_reward.pool.yieldsGold) rewardGold(to, _reward.rewards.goldRewards.minAmount, _reward.rewards.goldRewards.maxAmount, optionalNonce);
        if (_reward.pool.yieldsEssence) rewardEssence(to, _reward.rewards.essenceRewards.minAmount, _reward.rewards.essenceRewards.maxAmount, optionalNonce);
        if (_reward.pool.yieldsMiscItem) rewardMiscItem(to, _reward.rewards.miscItemRewards.miscType, _reward.rewards.miscItemRewards.minAmount, _reward.rewards.miscItemRewards.maxAmount, optionalNonce);
        if (_reward.pool.yieldsCraftingMaterial) rewardCraftingMaterial(to, _reward.rewards.craftingMaterialRewards.materialIds, _reward.rewards.craftingMaterialRewards.min, _reward.rewards.craftingMaterialRewards.max, optionalNonce);
    }

    function rewardGold(address to, uint min, uint max, uint optionalNonce) internal {
        //        uint globalNonce = Navigator.getGlobalNonce();
        uint roll = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).dn(block.number + optionalNonce + nonce, max - min);
        //        increaseGlobalNonce();
        uint wODecimals = roll - (roll % 1e18);
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD)).rewardToken(to, wODecimals + min);
        nonce++;
    }

    function rewardEssence(address to, uint min, uint max, uint optionalNonce) internal {
        //        uint globalNonce = Navigator.getGlobalNonce();
        uint roll = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).dn(block.number + optionalNonce + nonce, max - min);
        //        increaseGlobalNonce();
        uint wODecimals = roll / 1e18;
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.ESSENCE)).rewardToken(to, wODecimals + min);
        nonce++;
    }

    function rewardMiscItem(address to, uint itemId, uint min, uint max, uint optionalNonce) internal {
        //        uint globalNonce = Navigator.getGlobalNonce();
        uint roll = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).dn(block.number + optionalNonce + nonce, max - min);
        //        increaseGlobalNonce();
        IRewardNonFungible(contractAddress(INavigator.CONTRACT.MISC_ITEMS)).rewardMiscItem(to, itemId, roll + min);
    }

    function rewardCraftingMaterial(address to, ICraftingMaterials.CraftingMaterial[] memory itemIds, uint[] memory mins, uint[] memory maxs, uint optionalNonce) internal {
        //        uint globalNonce = Navigator.getGlobalNonce();
        uint itemTypeRoll = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).dn(uint256(uint160(msg.sender)) + optionalNonce + block.number + itemIds.length + nonce, itemIds.length);
        ICraftingMaterials.CraftingMaterial itemType = itemIds[itemTypeRoll];
        uint roll = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).dn(block.number + uint(itemType) + nonce + 1, maxs[itemTypeRoll] - mins[itemTypeRoll]);
        //        increaseGlobalNonce();
        CraftingMaterialContract(contractAddress(INavigator.CONTRACT.CRAFTING_MATERIALS)).mintMaterial(itemType, msg.sender, roll + mins[itemTypeRoll]);
    }


}
