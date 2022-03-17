import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexWeapons {
    string constant public index = "Codex";
    string constant public class = "Weapons";

    function weapon(uint _id, uint8 _tier) public pure returns (GameObjects.Weapon memory) {
        if (_id == 1) {
            return DummyWeapon(_tier);
        }

        revert("invalid");
    }

    function DummyWeapon(uint8 tier) public pure returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.ARMOR;
        _weapon.metadata.name = "Dummy Weapon";
        _weapon.metadata.description = "Dummy Weapon is best armor";
        _weapon.metadata.upgradable = true;

        _weapon.requirement.level = 1;
        _weapon.requirement.classRequirement = new GameObjects.Class[](0);
        _weapon.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _weapon.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
    }
}
