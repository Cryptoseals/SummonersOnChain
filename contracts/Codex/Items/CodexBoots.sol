import {UpgradeableCodex, INavigator, ICodexPrefixAndSuffix} from "./../Common/UpgradeableCodex.sol";
import {EquippedItemStruct, EquipableItem, Prefix, Suffix } from "../../Interfaces/GameObjects/IGameObjects.sol";
import {EquipableUtils} from "../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;


interface IndividualItems {
    function boots(uint id, uint tier) external view returns (EquipableItem memory);
}

contract CodexBoots is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Boots";
    string constant public version = "0.0.1";


    IndividualItems HEAVY_BOOTS_STATS;
    IndividualItems MEDIUM_BOOTS_STATS;
    IndividualItems LIGHT_BOOTS_STATS;

    function initializeContracts() external {
        PrefixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.PREFIX_CODEX));
        SuffixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.SUFFIX_CODEX));
        HEAVY_BOOTS_STATS = IndividualItems(contractAddress(INavigator.CONTRACT.HEAVY_BOOTS_STATS));
        MEDIUM_BOOTS_STATS = IndividualItems(contractAddress(INavigator.CONTRACT.MEDIUM_BOOTS_STATS));
        LIGHT_BOOTS_STATS = IndividualItems(contractAddress(INavigator.CONTRACT.LIGHT_BOOTS_STATS));
    }

    function allBoots() external view returns (EquipableItem[] memory){
        EquipableItem[] memory result = new EquipableItem[](64);
        for (uint i = 1; i < 64; i++) {
            result[i - 1] = bootsCore(i, 0);
        }
        return result;
    }

    function boots(EquippedItemStruct memory _equipable) public view returns (EquipableItem memory) {
        EquipableItem memory _boots;
        Prefix memory _prefix;
        Suffix memory _suffix;

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);
        if (_equipable.itemId > 0 && _equipable.itemId < 22) {
            // H
            _boots = HEAVY_BOOTS_STATS.boots(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 21 && _equipable.itemId < 43) {
            // M
            _boots = MEDIUM_BOOTS_STATS.boots(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 42 && _equipable.itemId < 64) {
            // L
            _boots = LIGHT_BOOTS_STATS.boots(_equipable.itemId, _equipable.itemTier);
        } else {
            revert("???");
        }

        if (_equipable.prefixId > 0) _boots = applyPrefix(_prefix, _boots);
        if (_equipable.suffixId > 0) _boots = applySuffix(_suffix, _boots);
        return _boots;
    }

    function bootsCore(uint itemId, uint itemTier) public view returns (EquipableItem memory) {
        EquipableItem memory _boots;
        //        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        //        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (itemId > 0 && itemId < 22) {
            // H
            _boots = HEAVY_BOOTS_STATS.boots(itemId, itemTier);
        } else if (itemId > 21 && itemId < 43) {
            // M
            _boots = MEDIUM_BOOTS_STATS.boots(itemId, itemTier);
        } else if (itemId > 42 && itemId < 64) {
            // L
            _boots = LIGHT_BOOTS_STATS.boots(itemId, itemTier);
        } else {
            revert("invalid");
        }

        return _boots;
    }

    function applyPrefixAndSuffix(Prefix memory _pre, Suffix memory _suf, EquipableItem memory _boots) public pure returns (EquipableItem memory) {
        if (_pre.isPercentage) {
            _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_boots.generatedStatBonus, _pre.generatedStatBonus);
            _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_boots.elementalStats, _pre.elementalStats);
        } else {
            _boots.generatedStatBonus = EquipableUtils.sumGeneratedStats(_boots.generatedStatBonus, _pre.generatedStatBonus);
            _boots.elementalStats = EquipableUtils.sumGeneratedElementalStats(_boots.elementalStats, _pre.elementalStats);
        }

        if (_suf.isPercentage) {
            _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_boots.generatedStatBonus, _suf.generatedStatBonus);
            _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_boots.elementalStats, _suf.elementalStats);
        } else {
            _boots.generatedStatBonus = EquipableUtils.sumGeneratedStats(_boots.generatedStatBonus, _suf.generatedStatBonus);
            _boots.elementalStats = EquipableUtils.sumGeneratedElementalStats(_boots.elementalStats, _suf.elementalStats);
        }

        _boots.statBonus = EquipableUtils.sumStats(_boots.statBonus, _pre.statBonus);
        _boots.statBonus = EquipableUtils.sumStats(_boots.statBonus, _suf.statBonus);

        //        _boots.metadata.name = string(abi.encodePacked(_pre.title, " ", _boots.metadata.name, " ", _suf.title));
        return _boots;
    }

    function applyPrefix(Prefix memory _pre, EquipableItem memory _boots) public pure returns (EquipableItem memory) {
        if (_pre.isPercentage) {
            _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_boots.generatedStatBonus, _pre.generatedStatBonus);
            _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_boots.elementalStats, _pre.elementalStats);
        } else {
            _boots.generatedStatBonus = EquipableUtils.sumGeneratedStats(_boots.generatedStatBonus, _pre.generatedStatBonus);
            _boots.elementalStats = EquipableUtils.sumGeneratedElementalStats(_boots.elementalStats, _pre.elementalStats);
        }

        _boots.statBonus = EquipableUtils.sumStats(_boots.statBonus, _pre.statBonus);

        //        _boots.metadata.name = string(abi.encodePacked(_pre.title, " ", _boots.metadata.name));
        return _boots;
    }

    function applySuffix(Suffix memory _suf, EquipableItem memory _boots) public pure returns (EquipableItem memory) {
        if (_suf.isPercentage) {
            _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_boots.generatedStatBonus, _suf.generatedStatBonus);
            _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_boots.elementalStats, _suf.elementalStats);
        } else {
            _boots.generatedStatBonus = EquipableUtils.sumGeneratedStats(_boots.generatedStatBonus, _suf.generatedStatBonus);
            _boots.elementalStats = EquipableUtils.sumGeneratedElementalStats(_boots.elementalStats, _suf.elementalStats);
        }


        _boots.statBonus = EquipableUtils.sumStats(_boots.statBonus, _suf.statBonus);
        //        _boots.metadata.name = string(abi.encodePacked(_boots.metadata.name, " ", _suf.title));
        return _boots;
    }

}
