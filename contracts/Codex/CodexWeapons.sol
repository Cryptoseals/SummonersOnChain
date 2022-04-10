import "./Common/UpgradeableCodex.sol";
import "../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexWeapons is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Weapons";
    string constant public version = "0.0.1";

    function weapon(EquippedItemStruct memory _equipable) public view returns (GameObjects.Weapon memory) {
        GameObjects.Weapon memory _weapon;
        GameObjects.Prefix memory _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        GameObjects.Suffix memory _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _weapon = DummyWeapon(_equipable.itemTier);
        }

        revert("invalid");
    }


    function DummyWeapon(uint tier) public pure returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Dummy Weapon";
        _weapon.metadata.description = "Dummy Weapon is best ring";
        _weapon.metadata.upgradable = true;

        _weapon.requirement.level = 1;
        _weapon.requirement.classRequirement = new GameObjects.Class[](0);
        _weapon.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _weapon.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _weapon.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
