import "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

interface IAdventures {
    function attack(uint summoner, uint multiplier) external;
    function settleBattle(uint summoner) external;
    function flee(uint summoner) external;
}

contract AdventureControls is InitNavigator {

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function basicAttack(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        IAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES)).attack(summoner, 100);
    }

    function settleBattle(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        IAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES)).settleBattle(summoner);
    }

    function flee(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        IAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES)).flee(summoner);
    }
}
