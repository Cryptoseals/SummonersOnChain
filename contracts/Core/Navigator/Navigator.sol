pragma solidity ^0.8.0;

import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../Security/Guard.sol";

contract Navigator is Guard, INavigator {

    mapping(uint => address) public CONTRACTS;

    function setGameContracts(address[] memory _gameContractAddresses) external override onlyOwner {
        for (uint i = 0; i < _gameContractAddresses.length; i++) {
            CONTRACTS[i] = _gameContractAddresses[i];
        }
    }

    function getContractAddress (uint _contractId) external override view returns(address){
        return CONTRACTS[_contractId];
    }
}
