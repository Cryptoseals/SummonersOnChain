import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexArmors {
    string constant public index = "Codex";
    string constant public class = "Armors";

    function armor(uint _id, uint _tier) public pure returns (GameObjects.Armor memory) {
        if (_id == 1) {
            return DummyArmor(_tier);
        }

        revert("invalid");
    }

    function DummyArmor(uint tier) public pure returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 1;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Dummy Armor";
        _armor.metadata.description = "Dummy Armor is best armor";
        _armor.metadata.upgradable = true;

        _armor.requirement.level = 1;
        _armor.requirement.classRequirement = new GameObjects.Class[](0);
        _armor.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _armor.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _armor.generatedStatBonus = GameObjects.GeneratedStats({P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
    }
}
