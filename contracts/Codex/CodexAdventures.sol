import {IAdventure} from "../Interfaces/GameObjects/IAdventure.sol";
import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract CodexAdventures is InitNavigator {
    string constant public index = "Codex";
    string constant public class = "Adventures";
    string constant public version = "0.0.1";
    IAdventure AREA_1;
    IAdventure AREA_2;
    IAdventure AREA_3;
    IAdventure AREA_4;
    IAdventure AREA_5;
    IAdventure AREA_6;
    IAdventure AREA_7;
    IAdventure AREA_8;
    IAdventure AREA_9;
    IAdventure AREA_10;
    IAdventure AREA_11;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function initializeContracts() external {
        AREA_1 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_1));
        AREA_2 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_2));
        AREA_3 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_3));
        AREA_4 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_4));
        AREA_5 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_5));
        AREA_6 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_6));
        AREA_7 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_7));
        AREA_8 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_8));
        AREA_9 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_9));
        AREA_10 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_10));
        AREA_11 = IAdventure(contractAddress(INavigator.CONTRACT.AREA_11));
    }

    function adventure(uint _id, uint lvl) public view returns (IAdventure.AdventureLevel memory) {
        if (_id == 1) {
            return Area1(lvl);
        } else if (_id == 2) {
            return Area2(lvl);
        } else if (_id == 3) {
            return Area3(lvl);
        } else if (_id == 4) {
            return Area4(lvl);
        } else if (_id == 5) {
            return Area5(lvl);
        } else if (_id == 6) {
            return Area6(lvl);
        } else if (_id == 7) {
            return Area7(lvl);
        } else if (_id == 8) {
            return Area8(lvl);
        } else if (_id == 9) {
            return Area9(lvl);
        } else if (_id == 10) {
            return Area10(lvl);
        } else if (_id == 11) {
            return Area11(lvl);
        }

        revert("invalid");
    }

    function Area1(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_1.adventureLevel(lvl);
    }

    function Area2(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_2.adventureLevel(lvl);
    }

    function Area3(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_3.adventureLevel(lvl);
    }

    function Area4(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_4.adventureLevel(lvl);
    }

    function Area5(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_5.adventureLevel(lvl);
    }

    function Area6(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_6.adventureLevel(lvl);
    }

    function Area7(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_7.adventureLevel(lvl);
    }

    function Area8(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_8.adventureLevel(lvl);
    }

    function Area9(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_9.adventureLevel(lvl);
    }

    function Area10(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_10.adventureLevel(lvl);
    }

    function Area11(uint lvl) public view returns (IAdventure.AdventureLevel memory _adventureLvl) {
        return AREA_11.adventureLevel(lvl);
    }
}
