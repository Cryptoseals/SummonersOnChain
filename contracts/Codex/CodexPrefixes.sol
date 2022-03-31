import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexPrefixes {
    string constant public index = "Codex";
    string constant public class = "Prefixes";
    string constant public version = "0.0.1";

    function prefix(uint _id, uint _tier) public pure returns (GameObjects.Prefix memory) {
        if (_id == 1) {
            return DummyPrefix(_tier);
        }

        revert("invalid");
    }

    function DummyPrefix(uint tier) public pure returns (GameObjects.Prefix memory _prefix) {
        _prefix.title = "Dummy Prefix";
        _prefix.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _prefix.generatedStatBonus = GameObjects.GeneratedStats({HP : 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION: 0});
    }
}
