pragma solidity ^0.8.0;

import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../Security/Guard.sol";

contract Navigator is Guard, INavigator {

    bool public _isPaused;

    mapping(uint => address) public CONTRACTS;

    function setGameContractsAddresses(address[] memory _gameContractAddresses, bool value) external override onlyOwner {
        for (uint i = 0; i < _gameContractAddresses.length; i++) {
            CONTRACTS[i] = _gameContractAddresses[i];
            gameContracts[_gameContractAddresses[i]] = value;
        }
    }

    function getContractAddress(uint _contractId) external override view returns (address){
        return CONTRACTS[_contractId];
    }

    function isGameContract(address _address) external virtual view override(Guard, INavigator) returns (bool) {
        return gameContracts[_address];
    }

    function flipGameState() external onlyOwner {
        _isPaused = !_isPaused;
    }

    function isPaused() external virtual view override returns (bool) {
        return _isPaused;
    }
}
