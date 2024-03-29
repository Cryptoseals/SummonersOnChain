pragma solidity ^0.8.4;

// @title FungibleInGameToken
// @notice is the core interface of all in game tokens. It uses the ERC20 standard.
// @dev FungibleInGameToken is the core interface of all in game tokens. It uses the ERC20 standard.

interface IFungibleInGameToken {
    function rewardToken(address _account, uint256 _amount) external;
    function burnToken(address _account, uint256 _amount) external;
    function spendToken(address _account, address _to, uint256 _amount) external;
}
