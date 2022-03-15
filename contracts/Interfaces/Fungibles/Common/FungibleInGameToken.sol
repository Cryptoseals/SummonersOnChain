import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

pragma solidity ^0.8.4;

// @title FungibleInGameToken is the core interface of all in game tokens. It uses the ERC20 standard.
// @dev FungibleInGameToken is the core interface of all in game tokens. It uses the ERC20 standard.

contract FungibleInGameToken is IERC20 {
    function rewardToken(address _account, uint256 _amount) external;
}
