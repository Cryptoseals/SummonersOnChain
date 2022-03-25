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

pragma solidity ^0.8.0;

contract Reward is InitNavigator {

    uint nonce;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function reward(address to, IGameRewards.Reward memory _reward) external onlyGameContracts {
        if (_reward.pool.yieldsGold) rewardGold(to, _reward.rewards.goldRewards.minAmount, _reward.rewards.goldRewards.maxAmount);
        if (_reward.pool.yieldsEssence) rewardEssence(to, _reward.rewards.essenceRewards.minAmount, _reward.rewards.essenceRewards.maxAmount);
        if (_reward.pool.yieldsMiscItem) rewardMiscItem(to, _reward.rewards.miscItemRewards.miscType, _reward.rewards.miscItemRewards.minAmount, _reward.rewards.miscItemRewards.maxAmount);
    }

    function rewardGold(address to, uint min, uint max) internal {
        uint roll = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).dn(block.number + max + nonce, max - min);
        uint wODecimals = roll / 1e18;
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD)).rewardToken(to, wODecimals + min);
        nonce++;
    }

    function rewardEssence(address to, uint min, uint max) internal {
        uint roll = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).dn(block.number + max + nonce, max - min);
        uint wODecimals = roll / 1e18;
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.ESSENCE)).rewardToken(to, wODecimals + min);
        nonce++;
    }

    function rewardMiscItem(address to, uint itemId, uint min, uint max) internal {
        uint roll = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).dn(block.number + max + nonce, max - min);
        IRewardNonFungible(contractAddress(INavigator.CONTRACT.MISC_ITEMS)).rewardMiscItem(to, itemId, roll+min);
    }


}
