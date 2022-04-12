import "./Common/UpgradeableCodex.sol";
import "../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexAmulets is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Amulets";
    string constant public version = "0.0.1";


    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Amulet memory _amulet) public pure returns(GameObjects.Amulet memory) {
        _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_amulet.generatedStatBonus, _pre.generatedStatBonus);
        _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_amulet.generatedStatBonus, _suf.generatedStatBonus);

        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _pre.statBonus);
        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _suf.statBonus);

        _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_amulet.elementalStats, _pre.elementalStats);
        _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_amulet.elementalStats, _suf.elementalStats);
        _amulet.metadata.name  = string(abi.encodePacked(_pre.title, _amulet.metadata.name, _suf.title));
        return _amulet;
    }

    function amulet(EquippedItemStruct memory _equipable) public view returns (GameObjects.Amulet memory) {
        GameObjects.Amulet memory _amulet;
        GameObjects.Prefix memory _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        GameObjects.Suffix memory _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _amulet = DummyAmulet(_equipable.itemTier);
        }

        return applyPrefixAndSuffix(_prefix, _suffix, _amulet);
    }


    function DummyAmulet(uint tier) public pure returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 1;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.name = "Dummy Amulet";
        _amulet.metadata.description = "Dummy Amulet is best amulet";
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 1;
        _amulet.requirement.classRequirement = new GameObjects.Class[](0);
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _amulet.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
