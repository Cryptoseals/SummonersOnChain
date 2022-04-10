import "./Common/UpgradeableCodex.sol";
import "../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexBoots is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Boots";
    string constant public version = "0.0.1";

    function boots(EquippedItemStruct memory _equipable) public view returns (GameObjects.Boots memory) {
        GameObjects.Earring memory _boots;
        GameObjects.Prefix memory _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        GameObjects.Suffix memory _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            return DummyBoots(_equipable.itemTier);
        }

        revert("invalid");
    }

    function DummyBoots(uint tier) public pure returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 1;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Dummy Boots";
        _boots.metadata.description = "Dummy Boots is best armor";
        _boots.metadata.upgradable = true;

        _boots.requirement.level = 1;
        _boots.requirement.classRequirement = new GameObjects.Class[](0);
        _boots.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _boots.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _boots.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
