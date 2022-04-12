import "./Common/UpgradeableCodex.sol";
import "../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexEarrings is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Earrings";
    string constant public version = "0.0.1";

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Earring memory _earring) public pure returns(GameObjects.Earring memory) {
        _earring.generatedStatBonus = EquipableUtils.sumGeneratedStats(_earring.generatedStatBonus, _pre.generatedStatBonus);
        _earring.generatedStatBonus = EquipableUtils.sumGeneratedStats(_earring.generatedStatBonus, _suf.generatedStatBonus);

        _earring.statBonus = EquipableUtils.sumStats(_earring.statBonus, _pre.statBonus);
        _earring.statBonus = EquipableUtils.sumStats(_earring.statBonus, _suf.statBonus);

        _earring.elementalStats = EquipableUtils.sumGeneratedElementalStats(_earring.elementalStats, _pre.elementalStats);
        _earring.elementalStats = EquipableUtils.sumGeneratedElementalStats(_earring.elementalStats, _suf.elementalStats);
        _earring.metadata.name  = string(abi.encodePacked(_pre.title, _earring.metadata.name, _suf.title));
        return _earring;
    }

    function earrings(EquippedItemStruct memory _equipable) public view returns (GameObjects.Earring memory) {
        GameObjects.Earring memory _earring;
        GameObjects.Prefix memory _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        GameObjects.Suffix memory _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);


        if (_equipable.itemId == 1) {
            _earring = DummyEarring(_equipable.itemTier);
        }

        return applyPrefixAndSuffix(_prefix, _suffix, _earring);

    }


    function DummyEarring(uint tier) public pure returns (GameObjects.Earring memory _earring) {
        _earring.metadata.id = 1;
        _earring.metadata.baseType = GameObjects.ItemType.EARRING;
        _earring.metadata.name = "Dummy Earring";
        _earring.metadata.description = "Dummy Earring is best belt";
        _earring.metadata.upgradable = true;

        _earring.requirement.level = 1;
        _earring.requirement.classRequirement = new GameObjects.Class[](0);
        _earring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earring.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _earring.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
