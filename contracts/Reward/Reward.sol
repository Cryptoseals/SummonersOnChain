import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import "../Interfaces/Codex/ICodexRandom.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/GameObjects/IGameRewards.sol";
import "../Interfaces/NonFungibles/Common/IRewardNonFungible.sol";


interface CraftingMaterialContract {
    function mintMaterial(ICraftingMaterials.CraftingMaterial material, address to, uint amount) external;
}

pragma solidity ^0.8.0;

contract Reward is InitNavigator {
    ICodexRandom RNG;
    uint nonce;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
    }

    function reward(address to, IGameRewards.Reward memory _reward, IGameRewards.CurrencyRewards memory _currencyRewards, uint optionalNonce) external onlyGameContracts {
        if (_currencyRewards.yieldsGold) rewardGold(to, _currencyRewards, optionalNonce);
        if (_currencyRewards.yieldsEssence) rewardEssence(to, _currencyRewards, optionalNonce + 2);
        if (_reward.pool.yieldsMiscItem) rewardMiscItem(to, _reward.rewards.miscItemRewards, optionalNonce + 4);
        if (_currencyRewards.yieldsCraftingMaterial) rewardCraftingMaterial(to, _currencyRewards.materials, optionalNonce + 5);
    }

    function rewardGold(address to, IGameRewards.CurrencyRewards memory _reward, uint optionalNonce) internal {
        uint roll = RNG.dn(block.number + optionalNonce + nonce, _reward.goldRewards.maxAmount - _reward.goldRewards.minAmount);
        uint wODecimals = roll - (roll % 1e17);
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD)).rewardToken(to, wODecimals + _reward.goldRewards.minAmount);
        nonce++;
    }

    function rewardEssence(address to, IGameRewards.CurrencyRewards memory _reward, uint optionalNonce) internal {
        uint roll = RNG.dn(block.number + optionalNonce + nonce,
            _reward.essenceRewards.maxAmount - _reward.essenceRewards.minAmount);
        uint wODecimals = roll - (roll % 1e17);
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.ESSENCE)).rewardToken(to, wODecimals + _reward.essenceRewards.minAmount);
        nonce++;
    }

    function rewardMiscItem(address to, IGameRewards.MiscItemRewards memory _miscRewards, uint optionalNonce) internal {
        //         roll chance to drop
        uint dropRoll = RNG.d100(block.number + optionalNonce + nonce);
        if (dropRoll <= _miscRewards.chanceToDrop) {
            uint pick = RNG.dn(block.number + optionalNonce + 1, _miscRewards.rewards.length);

            uint amount = RNG.dn(block.number + optionalNonce + 2, _miscRewards.rewards[pick].maxAmount - _miscRewards.rewards[pick].minAmount);

            IRewardNonFungible(contractAddress(INavigator.CONTRACT.MISC_ITEMS)).rewardMiscItem(
                to,
                _miscRewards.rewards[pick].miscType,
                amount + _miscRewards.rewards[pick].minAmount
            );
        }
        nonce++;
    }

    function rewardCraftingMaterial(address to, IGameRewards.CraftingMaterialReward[] memory rewards, uint optionalNonce) internal {
        for (uint i = 0; i < rewards.length; i++) {
            uint roll = RNG.dn(block.number + optionalNonce + 10 + i + nonce,
                rewards[i].max - rewards[i].min
            );
            CraftingMaterialContract(
                contractAddress(
                    INavigator.CONTRACT.CRAFTING_MATERIALS
                )
            ).mintMaterial(rewards[i].material, to, roll + rewards[i].min);
            nonce++;
        }
    }


}
