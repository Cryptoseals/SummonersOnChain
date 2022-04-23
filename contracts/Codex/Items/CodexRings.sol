import "./../Common/UpgradeableCodex.sol";
import "../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexRings is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Rings";
    string constant public version = "0.0.1";

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Ring memory _ring) public pure returns(GameObjects.Ring memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_ring.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _pre.statBonus);
        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ring.elementalStats, _eleStatFromPreFixAndSuffix);
        _ring.metadata.name  = string(abi.encodePacked(_pre.title, _ring.metadata.name, _suf.title));
        return _ring;
    }

    function ring(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Ring memory) {
        GameObjects.Ring memory _ring;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;

        if (_equipable.itemId == 1) {
            _ring = DummyRing(_equipable.itemTier);
            _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
            _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);
        }

        revert("invalid");
    }


    function DummyRing(uint tier) public pure returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 1;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Dummy Ring";
        _ring.metadata.description = "Dummy Ring is best ring";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 1;
        _ring.requirement.classRequirement = new GameObjects.Class[](0);
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _ring.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
