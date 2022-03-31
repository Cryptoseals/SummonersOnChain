import "./Common/UpgradeableCodex.sol";
import "../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexBelts is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Belts";
    string constant public version = "0.0.1";

    function belt(EquippedItemStruct memory _equipable) public view returns (GameObjects.Belt memory) {
        GameObjects.Belt memory _belt;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;

        if (_equipable.itemId == 1) {
            _belt = DummyBelt(_equipable.itemTier);
            _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
            _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);
        }

        revert("invalid");
    }

    function prefixAndSuffix(uint _prefix, uint _prefixTier, uint _suffix, uint _suffixTier) internal view returns (GameObjects.Prefix memory, GameObjects.Suffix memory) {
        GameObjects.Prefix memory prefix = PrefixContract.prefix(_prefix, _prefixTier);
        GameObjects.Suffix memory suffix = SuffixContract.suffix(_suffix, _suffixTier);

        return (prefix, suffix);
    }

    function DummyBelt(uint tier) public pure returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 1;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Dummy Belt";
        _belt.metadata.description = "Dummy Belt is best belt";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 1;
        _belt.requirement.classRequirement = new GameObjects.Class[](0);
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _belt.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
