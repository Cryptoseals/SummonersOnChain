pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import "../../Core/Security/Guard.sol";
import "../../Interfaces/Core/Navigator/INavigator.sol";

contract FungibleInGameToken is ERC20, IFungibleInGameToken {
    INavigator Navigator;

    constructor(string memory _name, string memory _symbol, address _navigator)
    ERC20(_name, _symbol) {
        Navigator = INavigator(_navigator);
    }

    function rewardToken(address _account, uint256 _amount) external override {
        if(!Navigator.isGameContract(msg.sender)) revert UnauthorizedSender(msg.sender, "NOT A GAME CONTRACT");
        _mint(_account, _amount);
    }

    function burnToken(address _account, uint256 _amount) external override {
        if(!Navigator.isGameContract(msg.sender)) revert UnauthorizedSender(msg.sender, "NOT A GAME CONTRACT");
        _burn(_account, _amount);
    }

    function spendToken(address _account, address _to, uint256 _amount) external override {
        if(!Navigator.isGameContract(msg.sender)) revert UnauthorizedSender(msg.sender, "NOT A GAME CONTRACT");
        _transfer(_account, _to, _amount);
    }
}
