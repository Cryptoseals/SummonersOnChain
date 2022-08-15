import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Common/Errors.sol";
import {INavigator} from "../../Interfaces/Core/Navigator/INavigator.sol";
import {ISummoners} from "../../Interfaces/Summoners/ISummoners.sol";
import {GameEntities} from "../../Interfaces/GameObjects/IGameEntities.sol";

pragma solidity ^0.8.0;

contract InitNavigator is Initializable {
    INavigator Navigator;
    ISummoners Summoners;

    function initializeNavigator(address _navigator) internal {
        Navigator = INavigator(_navigator);
        Summoners = ISummoners(Navigator.getContractAddress(INavigator.CONTRACT.SUMMONERS));
    }

    function initializeNavigatorOnly(address _navigator) internal {
        Navigator = INavigator(_navigator);
    }

    function initSummonerContract() external {
        Summoners = ISummoners(Navigator.getContractAddress(INavigator.CONTRACT.SUMMONERS));
    }

    modifier ensureNotPaused() {
        require(!Navigator.isPaused(), "Paused");
        _;
    }

    modifier senderIsSummonerOwner(uint summoner) {

        if (!Summoners.senderIsOwner(summoner, msg.sender)) revert UnauthorizedSender(msg.sender, "CALLER IS NOT THE OWNER");
        _;
    }

    function ownerOfSummoner(uint summoner) public view returns (address) {
        return Summoners.ownerOf(summoner);
    }

    function contractAddress(INavigator.CONTRACT _contract) public view returns (address) {
        return Navigator.getContractAddress(_contract);
    }

    function navigator() public view returns (address) {
        return address(Navigator);
    }

    modifier sealIsOwned(uint summoner) {
        require(Navigator.sealIsOwned(summoner, msg.sender), "UNAUTHORIZED");
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

    modifier notInFight(uint summoner) {
        require(Summoners.state(summoner) != GameEntities.SummonerState.IN_FIGHT, "IN_FIGHT");
        _;
    }
}
