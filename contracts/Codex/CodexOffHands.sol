import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexOffHands {
    string constant public index = "Codex";
    string constant public class = "OffHands";

    function offHand(uint _id, uint _tier) public pure returns (GameObjects.OffHand memory) {
        if (_id == 1) {
            return DummyShield(_tier);
        }

        revert("invalid");
    }

    function DummyShield(uint tier) public pure returns (GameObjects.OffHand memory _offHand) {
        _offHand.metadata.id = 1;
        _offHand.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _offHand.metadata.name = "Dummy Shield";
        _offHand.metadata.description = "Dummy Shield is best armor";
        _offHand.metadata.upgradable = true;

        _offHand.requirement.level = 1;
        _offHand.requirement.classRequirement = new GameObjects.Class[](0);
        _offHand.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _offHand.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
    }
}
