pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import "../../Core/Security/Guard.sol";

contract FungibleInGameToken is ERC20, Guard, IFungibleInGameToken {

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {}

    function rewardToken(address _account, uint256 _amount) external override onlyGameContracts {
        _mint(_account, _amount);
    }

    function burnToken(address _account, uint256 _amount) external override onlyGameContracts {
        _burn(_account, _amount);
    }
}
