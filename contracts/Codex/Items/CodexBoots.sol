import "./../Common/UpgradeableCodex.sol";
import "../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;


interface IndividualItems {
    function boots(uint id, uint tier) external view returns (GameObjects.Boots memory);
}

contract CodexBoots is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Boots";
    string constant public version = "0.0.1";

    function boots(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Boots memory) {
        GameObjects.Boots memory _boots;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);
        if (_equipable.itemId > 0 && _equipable.itemId < 22) {
            // H
            _boots = IndividualItems(contractAddress(INavigator.CONTRACT.HEAVY_BOOTS_STATS)).boots(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 21 && _equipable.itemId < 43) {
            // M
            _boots = IndividualItems(contractAddress(INavigator.CONTRACT.MEDIUM_BOOTS_STATS)).boots(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 42 && _equipable.itemId < 64) {
            // L
            _boots = IndividualItems(contractAddress(INavigator.CONTRACT.LIGHT_BOOTS_STATS)).boots(_equipable.itemId, _equipable.itemTier);
        } else {
            revert("???");
        }

        if (_equipable.prefixId > 0 && _equipable.suffixId == 0) return applyPrefix(_prefix, _boots);
        if (_equipable.prefixId == 0 && _equipable.suffixId > 0) return applySuffix(_suffix, _boots);
        if (_equipable.prefixId > 0 && _equipable.suffixId > 0) return applyPrefixAndSuffix(_prefix, _suffix, _boots);
        return _boots;
    }

    function bootsCore(uint itemId, uint itemTier) public view returns (GameObjects.Boots memory) {
        GameObjects.Boots memory _boots;
        //        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        //        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (itemId > 0 && itemId < 22) {
            // H
            _boots = IndividualItems(contractAddress(INavigator.CONTRACT.HEAVY_BOOTS_STATS)).boots(itemId, itemTier);
        } else if (itemId > 21 && itemId < 43) {
            // M
            _boots = IndividualItems(contractAddress(INavigator.CONTRACT.MEDIUM_BOOTS_STATS)).boots(itemId, itemTier);
        } else if (itemId > 42 && itemId < 64) {
            // L
            _boots = IndividualItems(contractAddress(INavigator.CONTRACT.LIGHT_BOOTS_STATS)).boots(itemId, itemTier);
        } else {
            revert("invalid");
        }

        return _boots;
    }

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Boots memory _boots) public pure returns (GameObjects.Boots memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_boots.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _boots.statBonus = EquipableUtils.sumStats(_boots.statBonus, _pre.statBonus);
        _boots.statBonus = EquipableUtils.sumStats(_boots.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_boots.elementalStats, _eleStatFromPreFixAndSuffix);
        _boots.metadata.name = string(abi.encodePacked(_pre.title, " ", _boots.metadata.name, " ", _suf.title));
        return _boots;
    }

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Boots memory _boots) public pure returns (GameObjects.Boots memory) {
        _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_boots.generatedStatBonus, _pre.generatedStatBonus);

        _boots.statBonus = EquipableUtils.sumStats(_boots.statBonus, _pre.statBonus);


        _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_boots.elementalStats, _pre.elementalStats);
        _boots.metadata.name = string(abi.encodePacked(_pre.title, " ", _boots.metadata.name));
        return _boots;
    }

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Boots memory _boots) public pure returns (GameObjects.Boots memory) {
        _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_boots.generatedStatBonus, _suf.generatedStatBonus);

        _boots.statBonus = EquipableUtils.sumStats(_boots.statBonus, _suf.statBonus);


        _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_boots.elementalStats, _suf.elementalStats);
        _boots.metadata.name = string(abi.encodePacked(_boots.metadata.name, " ", _suf.title));
        return _boots;
    }

}
