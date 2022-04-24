import "./../../Common/UpgradeableCodex.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexBelts is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Belts";
    string constant public version = "0.0.1";

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Belt memory _belt) public pure returns(GameObjects.Belt memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_belt.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _pre.statBonus);
        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_belt.elementalStats, _eleStatFromPreFixAndSuffix);
        _belt.metadata.name  = string(abi.encodePacked(_pre.title, _belt.metadata.name, _suf.title));
        return _belt;
    }

    function belt(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Belt memory) {
        GameObjects.Belt memory _belt;
        GameObjects.Prefix memory _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        GameObjects.Suffix memory _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);


        if (_equipable.itemId == 1) {
            _belt = DummyBelt(_equipable.itemTier);
        }

        return applyPrefixAndSuffix(_prefix, _suffix, _belt);
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
