import "../Core/Common/Errors.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Interfaces/Summoners/ISummoners.sol";
import "../Interfaces/Core/Navigator/INavigator.sol";

pragma solidity ^0.8.0;

contract Attributes {
    ISummoners Summoners;
    INavigator Navigator;
    // @dev maps each summoner to their allocated stats

    mapping(uint => GameObjects.Stats) public SummonerStats;

    mapping(uint => uint) public UsedPoints;
    
    constructor (address _navigator) {
        Navigator = INavigator(_navigator);
        address summonersAddress = Navigator.getContractAddress(0);
        Summoners = ISummoners(summonersAddress);
    }
    
    function allocate (uint summoner) external {
        if(UsedPoints[summoner] > 0) revert AlreadyAllocated(summoner, "ALREADY ALLOCATED");
        if(!Summoners.senderIsOwner(summoner)) revert UnauthorizedSender(msg.sender, "CALLER IS NOT THE OWNER");
    }
}
