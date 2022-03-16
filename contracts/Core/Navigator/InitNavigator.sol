import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../../Interfaces/Summoners/ISummoners.sol";

pragma solidity ^0.8.0;

contract InitNavigator {
    INavigator Navigator;
    ISummoners Summoners;
    constructor (address _navigator) {
        Navigator = INavigator(_navigator);
        address summonersAddress = Navigator.getContractAddress(0);
        Summoners = ISummoners(summonersAddress);
    }

    modifier ensureNotPaused() {
        require(Navigator.isPaused(), "Paused");
        _;
    }
}
