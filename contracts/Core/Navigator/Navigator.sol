pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "../../Interfaces/Core/Navigator/INavigator.sol";
import "./RewardNonce.sol";
import "../Security/Guard.sol";


interface ERC721 {
    function ownerOf(uint256 tokenId) external view returns (address);
}

contract Navigator is Initializable, OwnableUpgradeable, Guard, INavigator, RewardNonce {
    ERC721 Seals;

    bool public _isPaused;
    uint public _endingDate;

    mapping(uint => address) public CONTRACTS;

    function initialize(address _seals, uint _end) external initializer {
        Seals = ERC721(_seals);
        __Ownable_init();
        _endingDate = block.timestamp + (_end * 1 days);
    }

    function extendGameTime(uint _end) external onlyOwner override {
        _endingDate = block.timestamp + (_end * 1 days);
    }

    function setGameContractsAddresses(address[] memory _gameContractAddresses, bool value) external override onlyOwner {
        for (uint i = 0; i < _gameContractAddresses.length; i++) {
            CONTRACTS[i] = _gameContractAddresses[i];
        }
        addOrRemoveGameContracts(_gameContractAddresses, value);
    }

    function setGameContractsById(INavigator.CONTRACT _contractId, address _address, bool value) external override onlyOwner {
        CONTRACTS[uint(_contractId)] = _address;
        addOrRemoveGameContract(_address, value);
    }

    function getContractAddress(INavigator.CONTRACT _contractId) external override view returns (address){
        return CONTRACTS[uint(_contractId)];
    }

    function isGameContract(address _address) external override view returns (bool) {
        return gameContracts[_address];
    }

    function flipGameState() external onlyOwner {
        _isPaused = !_isPaused;
    }

    function isPaused() public virtual view override returns (bool) {
        return _isPaused || _endingDate < block.timestamp;
    }

    function sealIsOwned(uint summoner, address sender) external view override returns (bool) {
        if (Seals.ownerOf(summoner) == sender) {
            return true;
        } else revert UnauthorizedSender(msg.sender, "CALLER IS NOT THE OWNER");
    }

    function nftIsOwned(address _address, address _sender, uint _tokenId) external view override returns (bool) {
        if (ERC721(_address).ownerOf(_tokenId) == _sender) {
            return true;
        } else revert UnauthorizedSender(_sender, "NOT OWNED");
    }

    function onlyGameContracts() external override _onlyGameContracts returns (bool) {
        return true;
    }

    modifier _onlyGameContracts() {
        if (!gameContracts[msg.sender]) {
            revert UnauthorizedSender(tx.origin, "Not a game contract");
        }
        _;
    }

    function increaseGlobalNonce () external override _onlyGameContracts {
        _increaseGlobalNonce();
    }

    function getGlobalNonce() public view override returns(uint) {
        return _getGlobalNonce();
    }
}
