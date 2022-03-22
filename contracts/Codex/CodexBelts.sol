import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexBelts {
    string constant public index = "Codex";
    string constant public class = "Belts";
    string constant public version = "0.0.1";

    function belt(uint _id, uint _tier) public pure returns (GameObjects.Belt memory) {
        if (_id == 1) {
            return DummyBelt(_tier);
        }

        revert("invalid");
    }

    function DummyBelt(uint tier) public pure returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 1;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Dummy Belt";
        _belt.metadata.description = "Dummy Belt is best belt";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 1;
        _belt.requirement.classRequirement = new GameObjects.Class[](0);
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _belt.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
    }
}