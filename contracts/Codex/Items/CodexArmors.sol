import {UpgradeableCodex, INavigator} from "./../Common/UpgradeableCodex.sol";
import {EquipableUtils,GameObjects} from "../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;


interface IndividualItems {
    function armor(uint id, uint tier) external view returns (GameObjects.Armor memory);
}

contract CodexArmors is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "BodyArmors";
    string constant public version = "0.0.1";

    function allArmor() external view returns (GameObjects.Armor[] memory){
        GameObjects.Armor[] memory result = new GameObjects.Armor[](64);
        for (uint i = 1; i < 64; i++) {
            result[i - 1] = armorCore(i, 1);
        }
        return result;
    }

    function armor(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Armor memory) {
        GameObjects.Armor memory _armor;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);
        if (_equipable.itemId > 0 && _equipable.itemId < 22) {
            // H
            _armor = IndividualItems(contractAddress(INavigator.CONTRACT.HEAVY_ARMOR_STATS)).armor(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 21 && _equipable.itemId < 43) {
            // M
            _armor = IndividualItems(contractAddress(INavigator.CONTRACT.MEDIUM_ARMOR_STATS)).armor(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 42 && _equipable.itemId < 64) {
            // L
            _armor = IndividualItems(contractAddress(INavigator.CONTRACT.LIGHT_ARMOR_STATS)).armor(_equipable.itemId, _equipable.itemTier);
        } else {
            revert("???");
        }

        if (_equipable.prefixId > 0 && _equipable.suffixId == 0) return applyPrefix(_prefix, _armor);
        if (_equipable.prefixId == 0 && _equipable.suffixId > 0) return applySuffix(_suffix, _armor);
        if (_equipable.prefixId > 0 && _equipable.suffixId > 0) return applyPrefixAndSuffix(_prefix, _suffix, _armor);
        return _armor;
    }

    function armorCore(uint itemId, uint itemTier) public view returns (GameObjects.Armor memory) {
        GameObjects.Armor memory _armor;
        //        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        //        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (itemId > 0 && itemId < 22) {
            // HEAVY_ARMOR_STATS
            _armor = IndividualItems(contractAddress(INavigator.CONTRACT.HEAVY_ARMOR_STATS)).armor(itemId, itemTier);
        } else if (itemId > 21 && itemId < 43) {
            // MEDIUM_ARMOR_STATS
            _armor = IndividualItems(contractAddress(INavigator.CONTRACT.MEDIUM_ARMOR_STATS)).armor(itemId, itemTier);
        } else if (itemId > 42 && itemId < 64) {
            // LIGHT_ARMOR_STATS
            _armor = IndividualItems(contractAddress(INavigator.CONTRACT.LIGHT_ARMOR_STATS)).armor(itemId, itemTier);
        } else {
            revert("invalid");
        }

        return _armor;
    }

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Armor memory _armor) public pure returns (GameObjects.Armor memory) {
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

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Armor memory _armor) public pure returns (GameObjects.Armor memory) {
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

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Armor memory _armor) public pure returns (GameObjects.Armor memory) {
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
