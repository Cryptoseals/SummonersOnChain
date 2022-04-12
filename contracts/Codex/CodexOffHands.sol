import "./Common/UpgradeableCodex.sol";
import "../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexOffHands is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "OffHands";
    string constant public version = "0.0.1";


    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.OffHand memory _offHand) public pure returns(GameObjects.OffHand memory) {
        _offHand.generatedStatBonus = EquipableUtils.sumGeneratedStats(_offHand.generatedStatBonus, _pre.generatedStatBonus);
        _offHand.generatedStatBonus = EquipableUtils.sumGeneratedStats(_offHand.generatedStatBonus, _suf.generatedStatBonus);

        _offHand.statBonus = EquipableUtils.sumStats(_offHand.statBonus, _pre.statBonus);
        _offHand.statBonus = EquipableUtils.sumStats(_offHand.statBonus, _suf.statBonus);

        _offHand.elementalStats = EquipableUtils.sumGeneratedElementalStats(_offHand.elementalStats, _pre.elementalStats);
        _offHand.elementalStats = EquipableUtils.sumGeneratedElementalStats(_offHand.elementalStats, _suf.elementalStats);
        _offHand.metadata.name  = string(abi.encodePacked(_pre.title, _offHand.metadata.name, _suf.title));
        return _offHand;
    }
    
    function offHand(EquippedItemStruct memory _equipable) public view returns (GameObjects.OffHand memory) {
        GameObjects.OffHand memory _offHand;
        GameObjects.Prefix memory _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        GameObjects.Suffix memory _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _offHand = DummyOffHand(_equipable.itemTier);
        }

        return applyPrefixAndSuffix(_prefix, _suffix, _offHand);
    }

    function DummyOffHand(uint tier) public pure returns (GameObjects.OffHand memory _offHand) {
        _offHand.metadata.id = 1;
        _offHand.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _offHand.metadata.name = "Dummy OffHand";
        _offHand.metadata.description = "Dummy OffHand is best offHand";
        _offHand.metadata.upgradable = true;

        _offHand.requirement.level = 1;
        _offHand.requirement.classRequirement = new GameObjects.Class[](0);
        _offHand.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _offHand.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _offHand.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
