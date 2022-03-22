import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Common/Errors.sol";
import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../../Interfaces/Summoners/ISummoners.sol";

pragma solidity ^0.8.0;

contract InitNavigator is Initializable {
    INavigator Navigator;
    ISummoners Summoners;

    function initializeNavigator(address _navigator) internal {
        Navigator = INavigator(_navigator);
    }

    modifier ensureNotPaused() {
        require(!Navigator.isPaused(), "Paused");
        _;
    }

    modifier senderIsSummonerOwner(uint summoner) {
        ISummoners Summoners = ISummoners(Navigator.getContractAddress(INavigator.CONTRACT.SUMMONERS));
        if (!Summoners.senderIsOwner(summoner, msg.sender)) revert UnauthorizedSender(msg.sender, "CALLER IS NOT THE OWNER");
        _;
    }

    function ownerOfSummoner(uint summoner) public view returns (address) {
        ISummoners Summoners = ISummoners(Navigator.getContractAddress(INavigator.CONTRACT.SUMMONERS));
        return Summoners.ownerOf(summoner);
    }

    function contractAddress(INavigator.CONTRACT _contract) public view returns (address) {
        return Navigator.getContractAddress(_contract);
    }

    function navigator() public view returns (address) {
        return address(Navigator);
    }

    modifier sealIsOwned(uint summoner) {
        Navigator.sealIsOwned(summoner, msg.sender);
        _;
    }

    modifier hasNFT(address _address, uint _tokenId) {
        Navigator.nftIsOwned(_address, msg.sender, _tokenId);
        _;
    }

    modifier onlyGameContracts() {
        require(Navigator.isGameContract(msg.sender), "UNAUTHORIZED");
        _;
    }
}
