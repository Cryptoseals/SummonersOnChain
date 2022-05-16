import "../GameObjects/IGameRewards.sol";

pragma solidity ^0.8.0;

interface IReward {
    function reward(address to, IGameRewards.Reward memory _reward, IGameRewards.CurrencyRewards memory _currencyRewards, uint optionalNonce) external;
}
