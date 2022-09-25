import {Reward, CurrencyRewards} from "../GameObjects/IGameRewards.sol";

pragma solidity ^0.8.0;

interface IReward {
    function reward(
        address to,
        uint256 summoner,
        uint256 level,
        Reward memory _reward,
        CurrencyRewards memory _currencyRewards,
        uint256 optionalNonce
    ) external;

    function halfRewardXP(uint256 summoner, uint256 level) external;
}
