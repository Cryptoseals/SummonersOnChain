pragma solidity ^0.8.0;

contract Rarity {

    function rarity(uint _id) public pure returns (string memory) {
        if (_id == 1) {
            return "Common";
        } else if (_id == 2) {
            return "Uncommon";
        } else if (_id == 3) {
            return "Rare";
        } else if (_id == 4) {
            return "Exotic";
        } else if (_id == 5) {
            return "Legendary";
        }
        return "";
    }

}
