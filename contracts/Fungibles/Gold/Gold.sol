pragma solidity ^0.8.0;

import "../Common/FungibleInGameToken.sol";

contract Gold is FungibleInGameToken {
    constructor(string memory _name, string memory _symbol) FungibleInGameToken(_name, _symbol) {

    }
}