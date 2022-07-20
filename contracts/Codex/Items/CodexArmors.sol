import {UpgradeableCodex, INavigator, ICodexPrefixAndSuffix} from "./../Common/UpgradeableCodex.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {EquipableUtils} from "../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;


interface IndividualItems {
    function armor(uint id, uint tier) external view returns (GameObjects_Equipments.EquipableItem memory);
}

contract CodexArmors is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "BodyArmors";
    string constant public version = "0.0.1";

    IndividualItems HEAVY_ARMOR_STATS;
    IndividualItems MEDIUM_ARMOR_STATS;
    IndividualItems LIGHT_ARMOR_STATS;

    function initializeContracts() external {
        PrefixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.PREFIX_CODEX));
        SuffixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.SUFFIX_CODEX));
        HEAVY_ARMOR_STATS = IndividualItems(contractAddress(INavigator.CONTRACT.HEAVY_ARMOR_STATS));
        MEDIUM_ARMOR_STATS = IndividualItems(contractAddress(INavigator.CONTRACT.MEDIUM_ARMOR_STATS));
        LIGHT_ARMOR_STATS = IndividualItems(contractAddress(INavigator.CONTRACT.LIGHT_ARMOR_STATS));
    }

    function allArmor() external view returns (GameObjects_Equipments.EquipableItem[] memory){
        GameObjects_Equipments.EquipableItem[] memory result = new GameObjects_Equipments.EquipableItem[](64);
        for (uint i = 1; i < 64; i++) {
            result[i - 1] = armorCore(i, 1);
        }
        return result;
    }

    function armor(GameObjects_Equipments.EquippedItemStruct memory _equipable) public view returns (GameObjects_Equipments.EquipableItem memory) {
        GameObjects_Equipments.EquipableItem memory _armor;
        GameObjects_Equipments.Prefix memory _prefix;
        GameObjects_Equipments.Suffix memory _suffix;

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);
        if (_equipable.itemId > 0 && _equipable.itemId < 22) {
            // H
            _armor = HEAVY_ARMOR_STATS.armor(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 21 && _equipable.itemId < 43) {
            // M
            _armor = MEDIUM_ARMOR_STATS.armor(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 42 && _equipable.itemId < 64) {
            // L
            _armor = LIGHT_ARMOR_STATS.armor(_equipable.itemId, _equipable.itemTier);
        } else {
            revert("???");
        }

        if (_equipable.prefixId > 0) return _armor = applyPrefix(_prefix, _armor);
        if (_equipable.suffixId > 0) return _armor = applySuffix(_suffix, _armor);
        return _armor;
    }

    function armorCore(uint itemId, uint itemTier) public view returns (GameObjects_Equipments.EquipableItem memory) {
        GameObjects_Equipments.EquipableItem memory _armor;
        //        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        //        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (itemId > 0 && itemId < 22) {
            // HEAVY_ARMOR_STATS
            _armor = HEAVY_ARMOR_STATS.armor(itemId, itemTier);
        } else if (itemId > 21 && itemId < 43) {
            // MEDIUM_ARMOR_STATS
            _armor = MEDIUM_ARMOR_STATS.armor(itemId, itemTier);
        } else if (itemId > 42 && itemId < 64) {
            // LIGHT_ARMOR_STATS
            _armor = LIGHT_ARMOR_STATS.armor(itemId, itemTier);
        } else {
            revert("invalid");
        }

        return _armor;
    }

    function applyPrefixAndSuffix(GameObjects_Equipments.Prefix memory _pre, GameObjects_Equipments.Suffix memory _suf, GameObjects_Equipments.EquipableItem memory _armor) public pure returns (GameObjects_Equipments.EquipableItem memory) {
        if (_pre.isPercentage) {
            _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_armor.generatedStatBonus, _pre.generatedStatBonus);
            _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_armor.elementalStats, _pre.elementalStats);
        } else {
            _armor.generatedStatBonus = EquipableUtils.sumGeneratedStats(_armor.generatedStatBonus, _pre.generatedStatBonus);
            _armor.elementalStats = EquipableUtils.sumGeneratedElementalStats(_armor.elementalStats, _pre.elementalStats);
        }

        if (_suf.isPercentage) {
            _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_armor.generatedStatBonus, _suf.generatedStatBonus);
            _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_armor.elementalStats, _suf.elementalStats);
        } else {
            _armor.generatedStatBonus = EquipableUtils.sumGeneratedStats(_armor.generatedStatBonus, _suf.generatedStatBonus);
            _armor.elementalStats = EquipableUtils.sumGeneratedElementalStats(_armor.elementalStats, _suf.elementalStats);
        }

        _armor.statBonus = EquipableUtils.sumStats(_armor.statBonus, _pre.statBonus);
        _armor.statBonus = EquipableUtils.sumStats(_armor.statBonus, _suf.statBonus);

        //        _armor.metadata.name = string(abi.encodePacked(_pre.title, " ", _armor.metadata.name, " ", _suf.title));
        return _armor;
    }

    function applyPrefix(GameObjects_Equipments.Prefix memory _pre, GameObjects_Equipments.EquipableItem memory _armor) public pure returns (GameObjects_Equipments.EquipableItem memory) {
        if (_pre.isPercentage) {
            _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_armor.generatedStatBonus, _pre.generatedStatBonus);
            _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_armor.elementalStats, _pre.elementalStats);
        } else {
            _armor.generatedStatBonus = EquipableUtils.sumGeneratedStats(_armor.generatedStatBonus, _pre.generatedStatBonus);
            _armor.elementalStats = EquipableUtils.sumGeneratedElementalStats(_armor.elementalStats, _pre.elementalStats);
        }

        _armor.statBonus = EquipableUtils.sumStats(_armor.statBonus, _pre.statBonus);
        //        _armor.metadata.name = string(abi.encodePacked(_pre.title, " ", _armor.metadata.name));
        return _armor;
    }

    function applySuffix(GameObjects_Equipments.Suffix memory _suf, GameObjects_Equipments.EquipableItem memory _armor) public pure returns (GameObjects_Equipments.EquipableItem memory) {
        if (_suf.isPercentage) {
            _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_armor.generatedStatBonus, _suf.generatedStatBonus);
            _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_armor.elementalStats, _suf.elementalStats);
        } else {
            _armor.generatedStatBonus = EquipableUtils.sumGeneratedStats(_armor.generatedStatBonus, _suf.generatedStatBonus);
            _armor.elementalStats = EquipableUtils.sumGeneratedElementalStats(_armor.elementalStats, _suf.elementalStats);
        }

        _armor.statBonus = EquipableUtils.sumStats(_armor.statBonus, _suf.statBonus);


        //        _armor.metadata.name = string(abi.encodePacked(_armor.metadata.name, " ", _suf.title));
        return _armor;
    }

}
