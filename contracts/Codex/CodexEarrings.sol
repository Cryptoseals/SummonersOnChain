import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexEarrings {
    string constant public index = "Codex";
    string constant public class = "Earrings";
    string constant public version = "0.0.1";

    function earring(uint _id, uint _tier) public view returns (GameObjects.Earring memory) {
        if (_id == 1) {
            return DummyEarring();
        }

        revert("invalid");
    }

    function DummyEarring() public view returns (GameObjects.Earring memory _earring) {
        _earring.metadata.id = 1;
        _earring.metadata.baseType = GameObjects.ItemType.RING;
        _earring.metadata.name = "Dummy Earring 1";
        _earring.metadata.description = "Dummy Earring is best ring";
        _earring.metadata.upgradable = true;

        _earring.requirement.level = 6;
        _earring.requirement.classRequirement = new GameObjects.Class[](2);
        _earring.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _earring.requirement.classRequirement[1] = GameObjects.Class.Assassin;
        _earring.requirement.statRequirement = GameObjects.Stats({STR : 2, DEX : 0, AGI : 5, INT : 0, VIT : 0, LUCK : 0});

        _earring.statBonus = GameObjects.Stats({STR : 2, DEX : 2, AGI : 0, INT : 2, VIT : 0, LUCK : 0});
        _earring.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION: 0});
    }


}
