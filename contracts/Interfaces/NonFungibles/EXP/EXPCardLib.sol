pragma solidity ^0.8.0;

library EXPCardLib {

    struct ExpCard {
        uint id;
        uint xpReward;
        address finder;
    }

    function cardIdToExp(uint _cardId) external view returns(uint) {
        // TODO, implement xp tokenomics later.

        if(_cardId == 0) {
            return 1e18;
        } else if (_cardId == 1) {
            return 2e18;
        }

        return 0;
    }

}
