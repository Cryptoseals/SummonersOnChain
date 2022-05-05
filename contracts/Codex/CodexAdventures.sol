import "../Interfaces/GameObjects/IMonster.sol";
import "../Interfaces/GameObjects/IAdventure.sol";

pragma solidity ^0.8.0;

contract CodexAdventures {
    string constant public index = "Codex";
    string constant public class = "Adventures";
    string constant public version = "0.0.1";

    function adventure(uint _id, uint difficulty) public pure returns (IAdventure.AdventureArea memory) {
        if (_id == 1) {
            return DummyAdventureArea(difficulty);
        }

        revert("invalid");
    }

    function DummyAdventureArea(uint difficulty) public pure returns (IAdventure.AdventureArea memory _adventure) {

    }
}
