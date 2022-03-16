pragma solidity ^0.8.0;

library EXPCardLib {

    struct EXPCard {
        uint id;
        uint xpReward;
        address finder;
    }

    function cardIdToExp(uint _cardId) public view returns (uint) {
        if (_cardId == 1) {
            return 1e18;
        } else if (_cardId == 2) {
            return 2e18;
        } else if (_cardId == 3) {
            return 3e18;
        } else if (_cardId == 4) {
            return 4e18;
        } else if (_cardId == 5) {
            return 5e18;
        }

        return 0;
    }

}
