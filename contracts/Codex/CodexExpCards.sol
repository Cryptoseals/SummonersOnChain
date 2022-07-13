import {Rarity} from "./Common/Rarity.sol";
import {EXPCardLib} from "../Interfaces/NonFungibles/EXP/EXPCardLib.sol";

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract CodexExpCards is Rarity {
    string constant public index = "Codex";
    string constant public class = "ExpCards";
    string constant public version = "0.0.1";

    function getAllCards() external view returns (EXPCardLib.EXPCard[] memory) {
        EXPCardLib.EXPCard[] memory result = new EXPCardLib.EXPCard[](5);
        for (uint i = 1; i <= 5; i++) {
            result[i - 1] = item(i);
        }
        return result;
    }

    function item(uint _id) public view returns (EXPCardLib.EXPCard memory _misc) {
        if (_id == 1) {
            return ExpCard1();
        } else if (_id == 2) {
            return ExpCard2();
        } else if (_id == 3) {
            return ExpCard3();
        } else if (_id == 4) {
            return ExpCard4();
        } else if (_id == 5) {
            return ExpCard5();
        }

        revert("wrong");
    }

    function ExpCard1() public view returns (EXPCardLib.EXPCard memory _expCard) {
        _expCard.id = 1;
        _expCard.xpReward = EXPCardLib.cardIdToExp(1);
    }

    function ExpCard2() public view returns (EXPCardLib.EXPCard memory _expCard) {
        _expCard.id = 2;
        _expCard.xpReward = EXPCardLib.cardIdToExp(2);
    }

    function ExpCard3() public view returns (EXPCardLib.EXPCard memory _expCard) {
        _expCard.id = 3;
        _expCard.xpReward = EXPCardLib.cardIdToExp(3);
    }

    function ExpCard4() public view returns (EXPCardLib.EXPCard memory _expCard) {
        _expCard.id = 4;
        _expCard.xpReward = EXPCardLib.cardIdToExp(4);
    }

    function ExpCard5() public view returns (EXPCardLib.EXPCard memory _expCard) {
        _expCard.id = 5;
        _expCard.xpReward = EXPCardLib.cardIdToExp(5);
    }

}