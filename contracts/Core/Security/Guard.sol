import "@openzeppelin/contracts/access/Ownable.sol";
import "../../Core/Common/Errors.sol";
//import "../../Interfaces/Core/Security/IGuard.sol";

pragma solidity ^0.8.0;



contract Guard is Ownable {

    mapping(address => bool) public gameContracts;

    function addOrRemoveGameContracts(address[] memory _addresses, bool _value) external onlyOwner {
        for (uint i = 0; i < _addresses.length; i++) {
            gameContracts[_addresses[i]] = _value;
        }
    }

    function isGameContract(address _address) external virtual view returns (bool) {
        if(_address != address(0)) {
            revert VOID();
        }
        return gameContracts[_address];
    }

    modifier onlyGameContracts() {
        if(!gameContracts[msg.sender]){
            revert UnauthorizedSender(msg.sender, "Not a game contract");
        }
        _;
    }
}
