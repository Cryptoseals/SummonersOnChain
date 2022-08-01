import "../Core/Navigator/InitNavigator.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Interfaces/Reward/IReward.sol";
import "../Interfaces/Codex/ICodexRandom.sol";
import "../Interfaces/Codex/ICodexAdventures.sol";

pragma solidity ^0.8.15;

contract Chests is
Initializable,
OwnableUpgradeable,
InitNavigator,
ERC721EnumerableUpgradeable {

    function initialize(
        address _navigator,
        string memory name,
        string memory symbol
    ) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
        __Ownable_init();
    }

    struct ChestProp {
        uint adventureArea;
        uint psuedoAdventureLevel;
    }

    struct Chest {
        uint multiplier;
        IGameRewards.Reward rewards;
        IGameRewards.CurrencyRewards currencyRewards;
    }

    mapping(uint => ChestProp) public tokenToChest;

    function psuedoChest(uint adventureArea, uint adventureLevel) internal view returns (Chest memory _chest) {
        IAdventure.AdventureLevel memory adventure = ICodexAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES_CODEX)).adventure(adventureArea, adventureLevel);
        _chest.rewards = adventure.Rewards;
        _chest.currencyRewards = adventure.CurrencyRewards;
        _chest.multiplier = adventure.Difficulty;
    }

    function determineRewardAndDisableOthers(Chest memory _chest) internal view returns (Chest memory) {
        uint roll = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).d100(block.number + _chest.multiplier);
        if (roll < 50) {
            // rewards currency
            _chest.rewards.pool.yieldsMiscItem = false;
            _chest.rewards.pool.yieldsArtifact = false;
            _chest.rewards.pool.yieldsConsumable = false;

            // determine currency type
            uint roll2 = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX)).d100(block.number + roll + 1);
            if (roll2 < 33) {
                // essence
                _chest.currencyRewards.yieldsEssence = true;
                _chest.currencyRewards.yieldsCraftingMaterial = false;
                _chest.currencyRewards.yieldsGold = false;
            } else if (roll < 66) {
                // gold
                _chest.currencyRewards.yieldsEssence = false;
                _chest.currencyRewards.yieldsCraftingMaterial = false;
                _chest.currencyRewards.yieldsGold = true;
            } else {
                // crafting mat
                _chest.currencyRewards.yieldsEssence = false;
                _chest.currencyRewards.yieldsCraftingMaterial = true;
                _chest.currencyRewards.yieldsGold = false;
            }
        } else {
            // pool
            _chest.currencyRewards.yieldsGold = false;
            _chest.currencyRewards.yieldsCraftingMaterial = false;
            _chest.currencyRewards.yieldsEssence = false;
        }
        return _chest;
    }

    function tokensOfOwner(address _owner) public view returns (uint[] memory) {
        uint[] memory _tokensOfOwner = new uint[](balanceOf(_owner));
        uint i;

        for (i = 0; i < _tokensOfOwner.length; i++) {
            _tokensOfOwner[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return (_tokensOfOwner);
    }
}
