pragma solidity ^0.8.0;
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {FungibleInGameToken} from "../Common/FungibleInGameToken.sol";

contract Essence is FungibleInGameToken {
    function initialize(string memory _name, string memory _symbol, address _navigator) public initializer
    {
        initializeFungible(_name, _symbol, _navigator);
    }
}
