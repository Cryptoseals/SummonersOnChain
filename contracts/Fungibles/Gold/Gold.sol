pragma solidity ^0.8.0;

import "../Common/FungibleAndClaimableInGameToken.sol";

contract Gold is FungibleAndClaimableInGameToken {
    constructor(uint _interval, uint _reward, address _navigator)
    FungibleAndClaimableInGameToken("Gold", "GOLD", _interval, _reward, _navigator) {

    }
}