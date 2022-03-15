pragma solidity ^0.8.0;

import "../Common/FungibleInGameToken.sol";

contract EXP is FungibleAndClaimableInGameToken {
    constructor(uint _interval, uint _reward, address _navigator)
    FungibleAndClaimableInGameToken("CryptoSeals EXP", "EXP", _interval, _reward, _navigator) {

    }
}
