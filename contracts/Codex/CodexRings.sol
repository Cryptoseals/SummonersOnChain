import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexRings {
    string constant public index = "Codex";
    string constant public class = "Rings";
    string constant public version = "0.0.1";

    function ring(uint _id, uint _tier) external pure returns (GameObjects.Ring memory) {
        if (_id == 1) {
            return DummyRing();
        }

        revert("invalid");
    }

    function DummyRing() public pure returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 1;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Dummy Ring 1";
        _ring.metadata.description = "Dummy Ring is best ring";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 6;
        _ring.requirement.classRequirement = new GameObjects.Class[](2);
        _ring.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _ring.requirement.classRequirement[1] = GameObjects.Class.Assassin;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 2, DEX : 0, AGI : 5, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = GameObjects.Stats({STR : 2, DEX : 2, AGI : 0, INT : 2, VIT : 0, LUCK : 0});
        _ring.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
    }


}
