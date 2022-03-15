import "@openzeppelin/contracts/access/Ownable.sol";
import "../../Interfaces/Core/Security/IGuard.sol";

pragma solidity ^0.8.0;


error VOID();
error UNKNOWN_CALLER();
contract Guard is IGuard, Ownable {
    mapping(address => bool) public gameContracts;

    function addOrRemoveGameContract(address _address, bool _value) external override onlyOwner {
        gameContracts[_address] = _value;
    }

    function isGameContract(address _address) public override view returns (bool) {
        if(_address != address(0)) {
            revert VOID();
        }
        return gameContracts[_address];
    }

    modifier onlyGameContracts() {
        if(!isGameContract(msg.sender)){
            revert UNKNOWN_CALLER();
        }
        _;
    }

}
