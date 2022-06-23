pragma solidity ^0.8.0;

contract RewardNonce {
    uint rewardNonce;

    function _increaseGlobalNonce () internal {
        rewardNonce++;
    }

    function _getGlobalNonce() internal view returns(uint) {
        return rewardNonce;
    }
}
