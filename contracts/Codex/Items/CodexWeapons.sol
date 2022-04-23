import "./../Common/UpgradeableCodex.sol";
import "../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;


//    enum WeaponType {
//        SWORD,
//        DAGGER,
//        STAFF,
//        AXE,
//        BOWANDCROSSBOW,
//        FOCUS,
//        SHIELD
//    }

interface IndividualItems {
    function weapon(uint id, uint tier) external view returns (GameObjects.Weapon memory);
}

contract CodexWeapons is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "Weapons";
    string constant public version = "0.0.1";

    function weapon(EquippedItemStruct memory _equipable) public view returns (GameObjects.Weapon memory) {
        GameObjects.Weapon memory _weapon;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId > 0 && _equipable.itemId < 22) {
            // Swords
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.SWORD_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 21 && _equipable.itemId < 43) {
            // Dagger
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.DAGGER_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 42 && _equipable.itemId < 64) {
            // Bow
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.BOW_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 63 && _equipable.itemId < 85) {
            // Axe
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.AXE_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 84 && _equipable.itemId < 106) {
            // Staff
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.STAFF_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId > 105 && _equipable.itemId < 127) {
            // Focus
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.FOCUS_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
        } else if (_equipable.itemId < 148) {
            // Shield
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.SHIELD_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
        } else {
            revert("???");
        }
        if(_equipable.prefixId > 0 && _equipable.suffixId == 0) return applyPrefix(_prefix, _weapon);
        if(_equipable.prefixId == 0 && _equipable.suffixId > 0) return applySuffix(_suffix, _weapon);
        if(_equipable.prefixId > 0 && _equipable.suffixId > 0) return applyPrefixAndSuffix(_prefix, _suffix, _weapon);
        return _weapon;
    }

    function weaponCore(uint itemId, uint itemTier) public view returns (GameObjects.Weapon memory) {
        GameObjects.Weapon memory _weapon;
        //        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        //        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (itemId > 0 && itemId < 22) {
            // Swords
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.SWORD_STATS)).weapon(itemId, itemTier);
        } else if (itemId > 21 && itemId < 43) {
            // Dagger
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.DAGGER_STATS)).weapon(itemId, itemTier);
        } else if (itemId > 42 && itemId < 64) {
            // Bow
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.BOW_STATS)).weapon(itemId, itemTier);
        } else if (itemId > 63 && itemId < 85) {
            // Axe
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.AXE_STATS)).weapon(itemId, itemTier);
        } else if (itemId > 84 && itemId < 106) {
            // Staff
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.STAFF_STATS)).weapon(itemId, itemTier);
        } else if (itemId > 105 && itemId < 127) {
            // Focus
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.FOCUS_STATS)).weapon(itemId, itemTier);
        } else if (itemId < 148) {
            // Shield
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.SHIELD_STATS)).weapon(itemId, itemTier);
        } else {
            revert("invalid");
        }

        return _weapon;
    }

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Weapon memory _weapon) public pure returns (GameObjects.Weapon memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_weapon.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _weapon.statBonus = EquipableUtils.sumStats(_weapon.statBonus, _pre.statBonus);
        _weapon.statBonus = EquipableUtils.sumStats(_weapon.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_weapon.elementalStats, _eleStatFromPreFixAndSuffix);
        _weapon.metadata.name = string(abi.encodePacked(_pre.title, " ", _weapon.metadata.name, " ", _suf.title));
        return _weapon;
    }

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Weapon memory _weapon) public pure returns (GameObjects.Weapon memory) {
        _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_weapon.generatedStatBonus, _pre.generatedStatBonus);

        _weapon.statBonus = EquipableUtils.sumStats(_weapon.statBonus, _pre.statBonus);


        _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_weapon.elementalStats, _pre.elementalStats);
        _weapon.metadata.name = string(abi.encodePacked(_pre.title, " ", _weapon.metadata.name));
        return _weapon;
    }

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Weapon memory _weapon) public pure returns (GameObjects.Weapon memory) {
        _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_weapon.generatedStatBonus, _suf.generatedStatBonus);

        _weapon.statBonus = EquipableUtils.sumStats(_weapon.statBonus, _suf.statBonus);


        _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_weapon.elementalStats, _suf.elementalStats);
        _weapon.metadata.name = string(abi.encodePacked(_weapon.metadata.name, " ", _suf.title));
        return _weapon;
    }

}
