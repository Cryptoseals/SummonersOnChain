pragma solidity ^0.8.0;
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Common/FungibleAndClaimableInGameToken.sol";

contract Gold is FungibleAndClaimableInGameToken {
    function initialize(string memory _name, string memory _symbol, uint _interval, uint _reward, address _navigator) public initializer{
        initializeFungibleClaimable(_name, _symbol, _interval, _reward, _navigator);
    }
}