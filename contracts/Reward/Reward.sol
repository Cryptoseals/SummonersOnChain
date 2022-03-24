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

pragma solidity ^0.8.0;

contract Reward is InitNavigator {
    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function reward(address to, IGameRewards.Reward memory _reward) external onlyGameContracts {
        
    }

    function rewardGold(address to, uint amount) internal {
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.GOLD)).rewardToken(to, amount);
    }

    function rewardEssence(address to, uint amount) internal {
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.ESSENCE)).rewardToken(to, amount);
    }
}
