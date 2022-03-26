import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexSpells {
    string constant public index = "Codex";
    string constant public class = "Spells";
    string constant public version = "0.0.1";

    function spell(uint _id, uint _tier) public pure returns (GameObjects.Spell memory) {
        if (_id == 1) {
            return BasicAttack(_tier);
        }

        revert("invalid");
    }

    function BasicAttack(uint tier) public pure returns (GameObjects.Spell memory _spell) {
        _spell.id = 1;
        _spell.metadata.name = "Basic Attack";
        _spell.metadata.description = "Deal damage with your weapon.";

        _spell.isElemental = false;
        _spell.damageMultiplier = 20; //%

        _spell.requirement.level = 1;
        _spell.requirement.classRequirement = new GameObjects.Class[](0); // everyone
        _spell.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
    }
}
