import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {ERC721EnumerableUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import {IFungibleInGameToken} from "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import {ICodexRandom} from "../Interfaces/Codex/ICodexRandom.sol";
import {GameObjects_Elixir} from "../Interfaces/GameObjects/IGameObjects.sol";
import {GameEntities} from "../Interfaces/GameObjects/IGameEntities.sol";
import {InitNavigator, INavigator, ISummoners} from "../Core/Navigator/InitNavigator.sol";
import {IGameRewards, ICraftingMaterials} from "../Interfaces/GameObjects/IGameRewards.sol";
import {IRewardNonFungible} from "../Interfaces/NonFungibles/Common/IRewardNonFungible.sol";
import {IElixirAndArtifactSlots} from "../Interfaces/Inventory/IElixirAndArtifactSlots.sol";

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

    function reward(address to, uint summoner, uint level, IGameRewards.Reward memory _reward, IGameRewards.CurrencyRewards memory _currencyRewards, uint optionalNonce) external onlyGameContracts {
        (GameObjects_Elixir.ElixirBonusEffect memory _fx,,,) = IElixirAndArtifactSlots(contractAddress(INavigator.CONTRACT.INVENTORY)).activeElixirs(summoner);

        if (_currencyRewards.yieldsGold) rewardGold(to, _currencyRewards, _reward.bonus + _fx.BonusGoldPercentage, optionalNonce);
        if (_currencyRewards.yieldsEssence) rewardEssence(to, _currencyRewards, _reward.bonus + _fx.BonusEssencePercentage, optionalNonce + 2);
        if (_reward.pool.yieldsMiscItem) rewardMiscItem(to, _reward.rewards.miscItemRewards, _reward.bonus, optionalNonce + 4);
        if (_currencyRewards.yieldsCraftingMaterial) rewardCraftingMaterial(to, _currencyRewards.materials, _reward.bonus + _fx.BonusMaterialPercentage, optionalNonce + 5);
        rewardXP(summoner, level, _fx.BonusEXPPercentage);
    }

    function rewardGold(address to, IGameRewards.CurrencyRewards memory _reward, uint multiplier, uint optionalNonce) internal {
        uint roll = RNG.dn(block.number + optionalNonce + nonce,
            _reward.goldRewards.maxAmount - _reward.goldRewards.minAmount);
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

            amount = percentage(amount + _miscRewards.rewards[pick].minAmount, multiplier);

            IRewardNonFungible(contractAddress(INavigator.CONTRACT.MISC_ITEMS)).rewardMiscItem(
                to,
                _miscRewards.rewards[pick].miscType,
                amount
            );
        }
        nonce++;
    }

    function rewardCraftingMaterial(address to, IGameRewards.CraftingMaterialReward[] memory rewards, uint multiplier, uint optionalNonce) internal {

        CraftingMaterialContract mats = CraftingMaterialContract(
            contractAddress(
                INavigator.CONTRACT.CRAFTING_MATERIALS
            )
        );
        for (uint i = 0; i < rewards.length; i++) {
            uint roll = RNG.dn(block.number + optionalNonce + 10 + i + nonce,
                rewards[i].max - rewards[i].min
            );
            uint amount = roll + rewards[i].min;
            amount = percentage(amount, multiplier);
            if (amount > 0) {
                mats.mintMaterial(rewards[i].material, to, amount);
            }
            nonce++;
        }
    }

    function percentage(uint val, uint perc) internal pure returns (uint){
        require(perc >= 100, "100%");
        return (val * perc) / 100;
    }

    function rewardXP(uint summoner, uint level, uint multiplier) internal {
        uint reward = expRewardsByLevel[level];
        reward += percentage(reward, multiplier);
        ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).rewardXP(summoner, reward);
    }

    function halfRewardXP(uint summoner, uint level) public onlyGameContracts {
        uint reward = expRewardsByLevel[level] / 4;
        ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).rewardXP(summoner, reward);
    }
}
