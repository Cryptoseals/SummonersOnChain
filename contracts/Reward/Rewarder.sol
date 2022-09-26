import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {ERC721EnumerableUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import {IFungibleInGameToken} from "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import {ICodexRandom} from "../Interfaces/Codex/ICodexRandom.sol";
import {ElixirBonusEffect} from "../Interfaces/GameObjects/IGameObjects.sol";
import {GameEntities} from "../Interfaces/GameObjects/IGameEntities.sol";
import {InitNavigator, INavigator, ISummoners} from "../Core/Navigator/InitNavigator.sol";
import {Reward, CurrencyRewards, CraftingMaterialReward, ArtifactRewards, ConsumableRewards, EquipableItemRewards, MiscItemRewards} from "../Interfaces/GameObjects/IGameRewards.sol";
import {CraftingMaterial} from "../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
import {IRewardNonFungible} from "../Interfaces/NonFungibles/Common/IRewardNonFungible.sol";
import {IConsumablesAndArtifacts} from "../Interfaces/Inventory/IConsumablesAndArtifacts.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {IMiscs} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IMisc.sol";

interface CraftingMaterialContract {
    function mintMaterial(
        CraftingMaterial material,
        address to,
        uint256 amount
    ) external;
}

pragma solidity ^0.8.0;

contract Rewarder is InitNavigator, OwnableUpgradeable {
    ICodexRandom RNG;
    CraftingMaterialContract mats;
    IConsumablesAndArtifacts elixirInventory;
    IFungibleInGameToken gold;
    IFungibleInGameToken essence;
    IRewardNonFungible misc;
    uint256 nonce;
    uint256[] expRewardsByLevel;

    function initialize(address _navigator, uint256[] memory exps)
        external
        initializer
    {
        initializeNavigator(_navigator);
        __Ownable_init();
        expRewardsByLevel = exps;
    }

    function setExp(uint256[] memory exps) external onlyOwner {
        expRewardsByLevel = exps;
    }

    function initializeContracts() external {
        mats = CraftingMaterialContract(
            contractAddress(INavigator.CONTRACT.CRAFTING_MATERIALS)
        );
        RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        elixirInventory = IConsumablesAndArtifacts(
            contractAddress(INavigator.CONTRACT.INVENTORY)
        );
        gold = IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD));
        essence = IFungibleInGameToken(
            contractAddress(INavigator.CONTRACT.ESSENCE)
        );
        misc = IRewardNonFungible(
            contractAddress(INavigator.CONTRACT.MISC_ITEMS)
        );
    }

    function reward(
        address to,
        uint256 summoner,
        uint256 level,
        Reward memory _reward,
        CurrencyRewards memory _currencyRewards,
        uint256 optionalNonce
    ) external onlyGameContracts {
        (ElixirBonusEffect memory _fx, , , ) = elixirInventory
            .activeConsumableEffects(summoner);

        if (_currencyRewards.yieldsGold)
            rewardGold(
                to,
                _currencyRewards,
                _reward.bonus + _fx.BonusGoldPercentage,
                optionalNonce
            );
        if (_currencyRewards.yieldsEssence)
            rewardEssence(
                to,
                _currencyRewards,
                _reward.bonus + _fx.BonusEssencePercentage,
                optionalNonce + 2
            );
        if (_reward.pool.yieldsMiscItem)
            rewardMiscItem(
                to,
                _reward.rewards.miscItemRewards,
                _reward.bonus,
                optionalNonce + 4
            );
        if (_currencyRewards.yieldsCraftingMaterial)
            rewardCraftingMaterial(
                to,
                _currencyRewards.materials,
                _reward.bonus + _fx.BonusMaterialPercentage,
                optionalNonce + 5
            );
        rewardXP(summoner, level, _fx.BonusEXPPercentage);
    }

    function rewardGold(
        address to,
        CurrencyRewards memory _reward,
        uint256 multiplier,
        uint256 optionalNonce
    ) internal {
        uint256 roll = RNG.dn(
            block.number + optionalNonce + nonce,
            _reward.goldRewards.maxAmount - _reward.goldRewards.minAmount
        );
        uint256 wODecimals = (roll - (roll % 1e17)) +
            _reward.goldRewards.minAmount;
        wODecimals = percentage(wODecimals, multiplier);
        gold.rewardToken(to, wODecimals);
        nonce++;
    }

    function rewardEssence(
        address to,
        CurrencyRewards memory _reward,
        uint256 multiplier,
        uint256 optionalNonce
    ) internal {
        uint256 roll = RNG.dn(
            block.number + optionalNonce + nonce,
            _reward.essenceRewards.maxAmount - _reward.essenceRewards.minAmount
        );
        uint256 wODecimals = (roll - (roll % 1e17)) +
            _reward.essenceRewards.minAmount;
        wODecimals = percentage(wODecimals, multiplier);
        essence.rewardToken(to, wODecimals);
        nonce++;
    }

    function rewardMiscItem(
        address to,
        MiscItemRewards memory _miscRewards,
        uint256 multiplier,
        uint256 optionalNonce
    ) internal {
        //         roll chance to drop
        uint256 dropRoll = RNG.d100(block.number + optionalNonce + nonce);
        if (dropRoll <= _miscRewards.chanceToDrop) {
            uint256 pick = RNG.dn(
                block.number + optionalNonce + 1,
                uint256(type(IMiscs.List).max)
            );

            uint256 amount = RNG.dn(block.number + optionalNonce + 2, 3);

            amount = percentage(
                amount + _miscRewards.rewards[pick].minAmount,
                multiplier
            );

            misc.rewardMiscItem(to, IMiscs.List(pick + 1), amount);
        } else {
            misc.rewardMiscItem(to, IMiscs.List(0), 1);
        }
        nonce++;
    }

    function rewardCraftingMaterial(
        address to,
        CraftingMaterialReward[] memory rewards,
        uint256 multiplier,
        uint256 optionalNonce
    ) internal {
        for (uint256 i = 0; i < rewards.length; i++) {
            uint256 roll = RNG.dn(
                block.number + optionalNonce + 10 + i + nonce,
                rewards[i].max - rewards[i].min
            );
            uint256 amount = roll + rewards[i].min;
            amount = percentage(amount, multiplier);
            if (amount > 0) {
                mats.mintMaterial(rewards[i].material, to, amount);
            }
            nonce++;
        }
    }

    function percentage(uint256 val, uint256 perc)
        internal
        pure
        returns (uint256)
    {
        require(perc >= 100, "100%");
        return (val * perc) / 100;
    }

    function rewardXP(
        uint256 summoner,
        uint256 level,
        uint256 multiplier
    ) internal {
        uint256 reward = expRewardsByLevel[level - 1];
        reward = percentage(reward, 100 + multiplier);
        Summoners.rewardXP(summoner, reward);
    }

    function halfRewardXP(uint256 summoner, uint256 level)
        public
        onlyGameContracts
    {
        uint256 reward = expRewardsByLevel[level] / 4;
        Summoners.rewardXP(summoner, reward);
    }
}
