pragma solidity ^0.8.0;

import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../Security/Guard.sol";


interface ERC721 {
    function ownerOf(uint256 tokenId) external view returns (address);
}

contract Navigator is Guard, INavigator {
    ERC721 Seals;

    constructor(address _seals) {
        Seals = ERC721(_seals);
    }

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

    function sealIsOwned(uint summoner) external override returns (bool) {
        if (Seals.ownerOf(summoner) == msg.sender) {
            return true;
        } else revert UnauthorizedSender(msg.sender, "CALLER IS NOT THE OWNER");
    }
    function nftIsOwned(address _address, uint _tokenId) external override returns (bool) {
        if (ERC721(_address).ownerOf(_tokenId) == msg.sender) {
            return true;
        } else revert UnauthorizedSender(msg.sender, "CALLER IS NOT THE OWNER");
    }

    function onlyGameContracts() external override _onlyGameContracts returns(bool) {
        return true;
    }

    modifier _onlyGameContracts() {
        if(!gameContracts[msg.sender]){
            revert UnauthorizedSender(msg.sender, "Not a game contract");
        }
        _;
    }
}
