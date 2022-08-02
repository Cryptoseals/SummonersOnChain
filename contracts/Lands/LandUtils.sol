import {ICodexLands} from "../Interfaces/Codex/ICodexLands.sol";
import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {ILandsToken} from "../Interfaces/NonFungibles/Lands/ILandsToken.sol";
import {IAnimalsToken} from "../Interfaces/NonFungibles/Lands/IAnimalsToken.sol";
pragma solidity ^0.8.0;


contract LandUtils is InitNavigator {
    ICodexLands public landCodex;
    ILandsToken public landToken;
    IAnimalsToken public animalToken;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function initializeContracts() external {
        landCodex = ICodexLands(contractAddress(INavigator.CONTRACT.LANDS_CODEX));
        landToken = ILandsToken(contractAddress(INavigator.CONTRACT.LANDS));
        animalToken = IAnimalsToken(contractAddress(INavigator.CONTRACT.ANIMALS));
    }

    modifier isOwned(uint landId) {
        require(landToken.ownerOf(landId) == msg.sender, "o");
        _;
    }
}
