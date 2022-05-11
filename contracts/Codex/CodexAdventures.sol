import "../Interfaces/GameObjects/IMonster.sol";
import "../Interfaces/GameObjects/IAdventure.sol";
import "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract CodexAdventures is InitNavigator {
    string constant public index = "Codex";
    string constant public class = "Adventures";
    string constant public version = "0.0.1";

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function adventure(uint _id, uint lvl) public view returns (IAdventure.AdventureLevel memory) {
        if (_id == 1) {
            return Area1(lvl);
        }  else if (_id == 2) {
            return Area2(lvl);
        }  else if (_id == 3) {
            return Area3(lvl);
        }  else if (_id == 4) {
            return Area4(lvl);
        }  else if (_id == 5) {
            return Area5(lvl);
        }

        revert("invalid");
    }

    function Area1(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return IAdventure(contractAddress(INavigator.CONTRACT.AREA_1)).adventureLevel(lvl);
    }

    function Area2(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return IAdventure(contractAddress(INavigator.CONTRACT.AREA_2)).adventureLevel(lvl);
    }

    function Area3(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return IAdventure(contractAddress(INavigator.CONTRACT.AREA_3)).adventureLevel(lvl);
    }

    function Area4(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return IAdventure(contractAddress(INavigator.CONTRACT.AREA_4)).adventureLevel(lvl);
    }

    function Area5(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return IAdventure(contractAddress(INavigator.CONTRACT.AREA_5)).adventureLevel(lvl);
    }
}
