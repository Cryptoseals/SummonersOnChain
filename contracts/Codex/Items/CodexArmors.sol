import "./../Common/UpgradeableCodex.sol";
import "../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexArmors is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Armors";
    string constant public version = "0.0.1";

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Armor memory _armor) public pure returns(GameObjects.Armor memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_armor.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _armor.statBonus = EquipableUtils.sumStats(_armor.statBonus, _pre.statBonus);
        _armor.statBonus = EquipableUtils.sumStats(_armor.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_armor.elementalStats, _eleStatFromPreFixAndSuffix);
        _armor.metadata.name  = string(abi.encodePacked(_pre.title, _armor.metadata.name, _suf.title));
        return _armor;
    }


    function armor(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Armor memory) {
        GameObjects.Armor memory _armor;
        GameObjects.Prefix memory _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        GameObjects.Suffix memory _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _armor = DummyArmor(_equipable.itemTier);
        }

        return applyPrefixAndSuffix(_prefix, _suffix, _armor);
    }

    function DummyArmor(uint tier) public pure returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 1;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Dummy Armor";
        _armor.metadata.description = "Dummy Armor is best amulet";
        _armor.metadata.upgradable = true;

        _armor.requirement.level = 1;
        _armor.requirement.classRequirement = new GameObjects.Class[](0);
        _armor.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _armor.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _armor.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
