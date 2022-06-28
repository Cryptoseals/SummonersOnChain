import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Common/Errors.sol";
//import "../../Interfaces/Core/Security/IGuard.sol";

pragma solidity ^0.8.0;


contract Guard is Initializable {

    mapping(address => bool) public gameContracts;

    function addOrRemoveGameContracts(address[] memory _addresses, bool _value) internal {
        for (uint i = 0; i < _addresses.length; i++) {
            gameContracts[_addresses[i]] = _value;
        }
    }

    function addOrRemoveGameContract(address _address, bool _value) internal {
        gameContracts[_address] = _value;
    }
}
