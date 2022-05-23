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
    uint[] expRewardsByLevel;

    function initialize(address _navigator, uint[] memory exps) external initializer {
        initializeNavigator(_navigator);
        RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        expRewardsByLevel = exps;
    }

    function reward(address to, uint summoner, uint level, IGameRewards.Reward memory _reward, uint multiplier, IGameRewards.CurrencyRewards memory _currencyRewards, uint optionalNonce) external onlyGameContracts {
        if (_currencyRewards.yieldsGold) rewardGold(to, _currencyRewards, multiplier, optionalNonce);
        if (_currencyRewards.yieldsEssence) rewardEssence(to, _currencyRewards, multiplier, optionalNonce + 2);
        if (_reward.pool.yieldsMiscItem) rewardMiscItem(to, _reward.rewards.miscItemRewards, multiplier, optionalNonce + 4);
        if (_currencyRewards.yieldsCraftingMaterial) rewardCraftingMaterial(to, _currencyRewards.materials, multiplier, optionalNonce + 5);
        rewardXP(summoner, level);
    }

    function rewardGold(address to, IGameRewards.CurrencyRewards memory _reward, uint multiplier, uint optionalNonce) internal {
        uint roll = RNG.dn(block.number + optionalNonce + nonce, _reward.goldRewards.maxAmount - _reward.goldRewards.minAmount);
        uint wODecimals = (roll - (roll % 1e17)) + _reward.goldRewards.minAmount;
        wODecimals = percentage(wODecimals, multiplier);
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD)).rewardToken(to, wODecimals);
        nonce++;
    }

    function rewardEssence(address to, IGameRewards.CurrencyRewards memory _reward, uint multiplier, uint optionalNonce) internal {
        uint roll = RNG.dn(block.number + optionalNonce + nonce,
            _reward.essenceRewards.maxAmount - _reward.essenceRewards.minAmount);
        uint wODecimals = (roll - (roll % 1e17)) + _reward.essenceRewards.minAmount;
        wODecimals = percentage(wODecimals, multiplier);
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.ESSENCE)).rewardToken(to, wODecimals);
        nonce++;
    }

    function rewardMiscItem(address to, IGameRewards.MiscItemRewards memory _miscRewards, uint multiplier, uint optionalNonce) internal {
        //         roll chance to drop
        uint dropRoll = RNG.d100(block.number + optionalNonce + nonce);
        if (dropRoll <= _miscRewards.chanceToDrop) {
            uint pick = RNG.dn(block.number + optionalNonce + 1, _miscRewards.rewards.length);

            uint amount = RNG.dn(block.number + optionalNonce + 2, _miscRewards.rewards[pick].maxAmount - _miscRewards.rewards[pick].minAmount);

            amount = percentage(amount, multiplier);

            IRewardNonFungible(contractAddress(INavigator.CONTRACT.MISC_ITEMS)).rewardMiscItem(
                to,
                _miscRewards.rewards[pick].miscType,
                amount + _miscRewards.rewards[pick].minAmount
            );
        }
        nonce++;
    }

    function rewardCraftingMaterial(address to, IGameRewards.CraftingMaterialReward[] memory rewards, uint multiplier, uint optionalNonce) internal {
        for (uint i = 0; i < rewards.length; i++) {
            uint roll = RNG.dn(block.number + optionalNonce + 10 + i + nonce,
                rewards[i].max - rewards[i].min
            );
            uint amount = roll + rewards[i].min;
            amount = percentage(amount, multiplier);
            CraftingMaterialContract(
                contractAddress(
                    INavigator.CONTRACT.CRAFTING_MATERIALS
                )
            ).mintMaterial(rewards[i].material, to, amount);
            nonce++;
        }
    }

    function percentage(uint val, uint perc) internal pure returns (uint){
        return (val * perc) / 100;
    }

    function rewardXP(uint summoner, uint level) internal {
        uint reward = expRewardsByLevel[level];
        ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).rewardXP(summoner, reward);
    }

    function halfRewardXP(uint summoner, uint level) public onlyGameContracts {
        uint reward = expRewardsByLevel[level] / 4;
        ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).rewardXP(summoner, reward);
    }
}
