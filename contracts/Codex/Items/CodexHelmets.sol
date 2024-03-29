import {UpgradeableCodex, INavigator, ICodexPrefixAndSuffix} from "./../Common/UpgradeableCodex.sol";
import {EquippedItemStruct, EquipableItem, Prefix, Suffix} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {EquipableUtils} from "../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;


interface IndividualItems {
    function helmet(uint id, uint tier) external view returns (EquipableItem memory);
}

contract CodexHelmets is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Helmets";
    string constant public version = "0.0.1";
    IndividualItems HEAVY_HELMET_STATS;
    IndividualItems MEDIUM_HELMET_STATS;
    IndividualItems LIGHT_HELMET_STATS;

    function initializeContracts() external {
        PrefixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.PREFIX_CODEX));
        SuffixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.SUFFIX_CODEX));
        HEAVY_HELMET_STATS = IndividualItems(contractAddress(INavigator.CONTRACT.HEAVY_HELMET_STATS));
        MEDIUM_HELMET_STATS = IndividualItems(contractAddress(INavigator.CONTRACT.MEDIUM_HELMET_STATS));
        LIGHT_HELMET_STATS = IndividualItems(contractAddress(INavigator.CONTRACT.LIGHT_HELMET_STATS));
    }

    function allHelmets() external view returns (EquipableItem[] memory){
        EquipableItem[] memory result = new EquipableItem[](64);
        for (uint i = 1; i < 64; i++) {
            result[i - 1] = helmetCore(i, 0);
        }
        return result;
    }

    function helmet(EquippedItemStruct memory _equipable) public view returns (EquipableItem memory) {
        EquipableItem memory _helmet;
        Prefix memory _prefix;
        Suffix memory _suffix;

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);
        if (_equipable.itemId > 0 && _equipable.itemId < 22) {
            // H
            _helmet = HEAVY_HELMET_STATS.helmet(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 21 && _equipable.itemId < 43) {
            // M
            _helmet = MEDIUM_HELMET_STATS.helmet(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 42 && _equipable.itemId < 64) {
            // L
            _helmet = LIGHT_HELMET_STATS.helmet(_equipable.itemId, _equipable.itemTier);
        } else {
            revert("???");
        }

        if (_equipable.prefixId > 0) _helmet = applyPrefix(_prefix, _helmet);
        if (_equipable.suffixId > 0) _helmet = applySuffix(_suffix, _helmet);
        return _helmet;
    }

    function helmetCore(uint itemId, uint itemTier) public view returns (EquipableItem memory) {
        EquipableItem memory _helmet;
        //        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        //        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (itemId > 0 && itemId < 22) {
            // H
            _helmet = HEAVY_HELMET_STATS.helmet(itemId, itemTier);
        } else if (itemId > 21 && itemId < 43) {
            // M
            _helmet = MEDIUM_HELMET_STATS.helmet(itemId, itemTier);
        } else if (itemId > 42 && itemId < 64) {
            // L
            _helmet = LIGHT_HELMET_STATS.helmet(itemId, itemTier);
        } else {
            revert("invalid");
        }

        return _helmet;
    }

    function applyPrefixAndSuffix(Prefix memory _pre, Suffix memory _suf, EquipableItem memory _helmet) public pure returns (EquipableItem memory) {
        if (_pre.isPercentage) {
            _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_helmet.generatedStatBonus, _pre.generatedStatBonus);
            _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_helmet.elementalStats, _pre.elementalStats);
        } else {
            _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_helmet.generatedStatBonus, _pre.generatedStatBonus);
            _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_helmet.elementalStats, _pre.elementalStats);
        }

        if (_suf.isPercentage) {
            _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_helmet.generatedStatBonus, _suf.generatedStatBonus);
            _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_helmet.elementalStats, _suf.elementalStats);
        } else {
            _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_helmet.generatedStatBonus, _suf.generatedStatBonus);
            _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_helmet.elementalStats, _suf.elementalStats);
        }

        _helmet.statBonus = EquipableUtils.sumStats(_helmet.statBonus, _pre.statBonus);
        _helmet.statBonus = EquipableUtils.sumStats(_helmet.statBonus, _suf.statBonus);

        //        _helmet.metadata.name = string(abi.encodePacked(_pre.title, " ", _helmet.metadata.name, " ", _suf.title));
        return _helmet;
    }

    function applyPrefix(Prefix memory _pre, EquipableItem memory _helmet) public pure returns (EquipableItem memory) {
        if (_pre.isPercentage) {
            _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_helmet.generatedStatBonus, _pre.generatedStatBonus);
            _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_helmet.elementalStats, _pre.elementalStats);
        } else {
            _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_helmet.generatedStatBonus, _pre.generatedStatBonus);
            _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_helmet.elementalStats, _pre.elementalStats);
        }

        _helmet.statBonus = EquipableUtils.sumStats(_helmet.statBonus, _pre.statBonus);

        //        _helmet.metadata.name = string(abi.encodePacked(_pre.title, " ", _helmet.metadata.name));
        return _helmet;
    }

    function applySuffix(Suffix memory _suf, EquipableItem memory _helmet) public pure returns (EquipableItem memory) {

        if (_suf.isPercentage) {
            _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_helmet.generatedStatBonus, _suf.generatedStatBonus);
            _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_helmet.elementalStats, _suf.elementalStats);
        } else {
            _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_helmet.generatedStatBonus, _suf.generatedStatBonus);
            _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_helmet.elementalStats, _suf.elementalStats);
        }

        _helmet.statBonus = EquipableUtils.sumStats(_helmet.statBonus, _suf.statBonus);

        //        _helmet.metadata.name = string(abi.encodePacked(_helmet.metadata.name, " ", _suf.title));
        return _helmet;
    }

}
