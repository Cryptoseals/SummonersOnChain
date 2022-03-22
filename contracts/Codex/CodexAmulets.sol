import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexAmulets {
    string constant public index = "Codex";
    string constant public class = "Amulets";

    function amulet(uint _id, uint _tier) public pure returns (GameObjects.Amulet memory) {
        if (_id == 1) {
            return DummyAmulet(_tier);
        }

        revert("invalid");
    }

    function DummyAmulet(uint tier) public pure returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 1;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.name = "Dummy Amulet";
        _amulet.metadata.description = "Dummy Amulet is best amulet";
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 1;
        _amulet.requirement.classRequirement = new GameObjects.Class[](0);
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _amulet.generatedStatBonus = GameObjects.GeneratedStats({HP : 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
    }
}
