pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "../../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import "../../Core/Security/Guard.sol";
import "../../Core/Navigator/InitNavigator.sol";

contract FungibleInGameToken is ERC20Upgradeable,
OwnableUpgradeable, IFungibleInGameToken, InitNavigator {

    function initializeFungible(string memory _name, string memory _symbol, address _navigator)
    internal {
        __ERC20_init(_name, _symbol);
        initializeNavigator(_navigator);
        __Ownable_init();
    }

    function rewardToken(address _account, uint256 _amount) external onlyGameContracts override {
        _mint(_account, _amount);
    }

    function burnToken(address _account, uint256 _amount) external onlyGameContracts override {
        _burn(_account, _amount);
    }

    function spendToken(address _account, address _to, uint256 _amount) external onlyGameContracts override {
        _transfer(_account, _to, _amount);
    }
}
