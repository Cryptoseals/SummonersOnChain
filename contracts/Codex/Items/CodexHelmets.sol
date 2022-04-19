import "./../Common/UpgradeableCodex.sol";
import "../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexHelmets is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Helmets";
    string constant public version = "0.0.1";



    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Helmet memory _helmet) public pure returns(GameObjects.Helmet memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_helmet.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _helmet.statBonus = EquipableUtils.sumStats(_helmet.statBonus, _pre.statBonus);
        _helmet.statBonus = EquipableUtils.sumStats(_helmet.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_helmet.elementalStats, _eleStatFromPreFixAndSuffix);
        _helmet.metadata.name  = string(abi.encodePacked(_pre.title, _helmet.metadata.name, _suf.title));
        return _helmet;
    }


    function helmet(EquippedItemStruct memory _equipable) public view returns (GameObjects.Helmet memory) {
        GameObjects.Helmet memory _helmet;
        GameObjects.Prefix memory _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        GameObjects.Suffix memory _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _helmet = DummyHelmet(_equipable.itemTier);
        }

        return applyPrefixAndSuffix(_prefix, _suffix, _helmet);
    }

    function DummyHelmet(uint tier) public pure returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 1;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Dummy Helmet";
        _helmet.metadata.description = "Dummy Helmet is best helmet";
        _helmet.metadata.upgradable = true;

        _helmet.requirement.level = 1;
        _helmet.requirement.classRequirement = new GameObjects.Class[](0);
        _helmet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _helmet.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _helmet.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
