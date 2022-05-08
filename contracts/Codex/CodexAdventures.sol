import "../Interfaces/GameObjects/IMonster.sol";
import "../Interfaces/GameObjects/IAdventure.sol";

pragma solidity ^0.8.0;

contract CodexAdventures {
    string constant public index = "Codex";
    string constant public class = "Adventures";
    string constant public version = "0.0.1";

    function adventure(uint _id, uint lvl) public pure returns (IAdventure.AdventureLevel memory) {
        if (_id == 1) {
            return DummyAdventureArea(lvl);
        }

        revert("invalid");
    }

    function DummyAdventureArea(uint lvl) public pure returns (IAdventure.AdventureLevel memory _adventureLvl) {
        // return level depending on difficulty of 1-21
    }
}
