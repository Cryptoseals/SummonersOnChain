import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexWeapons {
    string constant public index = "Codex";
    string constant public class = "Weapons";
    string constant public version = "0.0.1";

    function weapon(uint _id) public view returns (GameObjects.Weapon memory) {
        if (_id == 1) {
            return DummyWeapon();
        }

        revert("invalid");
    }

    function DummyWeapon() public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Dummy Weapon 1";
        _weapon.metadata.description = "Dummy Weapon is besttt weapon";
        _weapon.metadata.upgradable = true;

        _weapon.requirement.level = 6;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({STR : 2, DEX : 0, AGI : 5, INT : 0, VIT : 0, LUCK : 0});

        _weapon.statBonus = GameObjects.Stats({STR : 2, DEX : 2, AGI : 0, INT : 2, VIT : 0, LUCK : 0});
        _weapon.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
    }


}
