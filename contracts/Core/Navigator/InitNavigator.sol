import "../../Core/Common/Errors.sol";
import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../../Interfaces/Summoners/ISummoners.sol";

pragma solidity ^0.8.0;

contract InitNavigator {
    INavigator Navigator;
    ISummoners Summoners;
    constructor (address _navigator) {
        Navigator = INavigator(_navigator);
        address summonersAddress = Navigator.getContractAddress(INavigator.CONTRACT.SUMMONERS);
        Summoners = ISummoners(summonersAddress);
    }

    modifier ensureNotPaused() {
        require(!Navigator.isPaused(), "Paused");
        _;
    }

    modifier senderIsSummonerOwner(uint summoner) {
        if (!Summoners.senderIsOwner(summoner)) revert UnauthorizedSender(msg.sender, "CALLER IS NOT THE OWNER");
        _;
    }

    function ownerOfSummoner(uint summoner) public returns(address) {
        return Summoners.ownerOf(summoner);
    }

    function contractAddress(INavigator.CONTRACT _contract) public view returns(address) {
        return Navigator.getContractAddress(_contract);
    }

    modifier sealIsOwned(uint summoner) {
        Navigator.sealIsOwned(summoner);
        _;
    }

    modifier hasNFT(address _address, uint _tokenId) {
        Navigator.nftIsOwned(_address, _tokenId);
        _;
    }

    modifier onlyGameContracts() {
        Navigator.onlyGameContracts();
        _;
    }
}
