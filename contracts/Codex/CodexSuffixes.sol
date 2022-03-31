import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexSuffixes {
    string constant public index = "Codex";
    string constant public class = "Suffixes";
    string constant public version = "0.0.1";

    function suffix(uint _id, uint _tier) public pure returns (GameObjects.Suffix memory) {
        if (_id == 1) {
            return DummySuffix(_tier);
        }

        revert("invalid");
    }

    function DummySuffix(uint tier) public pure returns (GameObjects.Suffix memory _suffix) {
        _suffix.title = "Dummy Suffix";
        _suffix.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _suffix.generatedStatBonus = GameObjects.GeneratedStats({HP : 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION: 0});
    }
}
