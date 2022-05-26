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

    function allWeapons() external view returns (GameObjects.Weapon[] memory){
        GameObjects.Weapon[] memory result = new GameObjects.Weapon[](148);
        for (uint i = 1; i < 148; i++) {
            result[i - 1] = weaponCore(i, 1);
        }
        return result;
    }

    function weapon(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Weapon memory) {
        GameObjects.Weapon memory _weapon;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId > 0 && _equipable.itemId < 22) {
            // Swords
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.SWORD_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
            if (_equipable.element == GameObjects.Element.FIRE) {
                _weapon.elementalStats.ElementalAtk.FIRE_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.COLD) {
                _weapon.elementalStats.ElementalAtk.COLD_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.LIGHTNING) {
                _weapon.elementalStats.ElementalAtk.LIGHTNING_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.EARTH) {
                _weapon.elementalStats.ElementalAtk.EARTH_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.DARK) {
                _weapon.elementalStats.ElementalAtk.DARK_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.HOLY) {
                _weapon.elementalStats.ElementalAtk.HOLY_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.VOID) {
                _weapon.elementalStats.ElementalAtk.VOID_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.ARCANE) {
                _weapon.generatedStatBonus.M_ATK = _weapon.generatedStatBonus.P_ATK;
            }

        } else if (_equipable.itemId > 21 && _equipable.itemId < 43) {
            // Dagger
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.DAGGER_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
            if (_equipable.element == GameObjects.Element.FIRE) {
                _weapon.elementalStats.ElementalAtk.FIRE_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.COLD) {
                _weapon.elementalStats.ElementalAtk.COLD_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.LIGHTNING) {
                _weapon.elementalStats.ElementalAtk.LIGHTNING_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.EARTH) {
                _weapon.elementalStats.ElementalAtk.EARTH_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.DARK) {
                _weapon.elementalStats.ElementalAtk.DARK_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.HOLY) {
                _weapon.elementalStats.ElementalAtk.HOLY_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.VOID) {
                _weapon.elementalStats.ElementalAtk.VOID_ATK = _weapon.generatedStatBonus.P_ATK;
            }
        } else if (_equipable.itemId > 42 && _equipable.itemId < 64) {
            // Bow
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.BOW_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
            if (_equipable.element == GameObjects.Element.FIRE) {
                _weapon.elementalStats.ElementalAtk.FIRE_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.COLD) {
                _weapon.elementalStats.ElementalAtk.COLD_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.LIGHTNING) {
                _weapon.elementalStats.ElementalAtk.LIGHTNING_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.EARTH) {
                _weapon.elementalStats.ElementalAtk.EARTH_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.DARK) {
                _weapon.elementalStats.ElementalAtk.DARK_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.HOLY) {
                _weapon.elementalStats.ElementalAtk.HOLY_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.VOID) {
                _weapon.elementalStats.ElementalAtk.VOID_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.ARCANE) {
                _weapon.generatedStatBonus.M_ATK = _weapon.generatedStatBonus.P_ATK;
            }

        } else if (_equipable.itemId > 63 && _equipable.itemId < 85) {
            // Axe
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.BOW_STATS)).weapon(_equipable.itemId, _equipable.itemTier);

            if (_equipable.element == GameObjects.Element.FIRE) {
                _weapon.elementalStats.ElementalAtk.FIRE_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.COLD) {
                _weapon.elementalStats.ElementalAtk.COLD_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.LIGHTNING) {
                _weapon.elementalStats.ElementalAtk.LIGHTNING_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.EARTH) {
                _weapon.elementalStats.ElementalAtk.EARTH_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.DARK) {
                _weapon.elementalStats.ElementalAtk.DARK_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.HOLY) {
                _weapon.elementalStats.ElementalAtk.HOLY_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.VOID) {
                _weapon.elementalStats.ElementalAtk.VOID_ATK = _weapon.generatedStatBonus.P_ATK;
            } else if (_equipable.element == GameObjects.Element.ARCANE) {
                _weapon.generatedStatBonus.M_ATK = _weapon.generatedStatBonus.P_ATK;
            }

        } else if (_equipable.itemId > 84 && _equipable.itemId < 106) {
            // Staff
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.STAFF_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
            _weapon.elementalStats.ElementalAtk.FIRE_ATK = _weapon.generatedStatBonus.M_ATK;
            _weapon.elementalStats.ElementalAtk.COLD_ATK = _weapon.generatedStatBonus.M_ATK;
            _weapon.elementalStats.ElementalAtk.LIGHTNING_ATK = _weapon.generatedStatBonus.M_ATK;
            if (_equipable.element == GameObjects.Element.VOID) {
                _weapon.elementalStats.ElementalAtk.VOID_ATK = _weapon.generatedStatBonus.M_ATK;
            }
        } else if (_equipable.itemId > 105 && _equipable.itemId < 127) {
            // Focus
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.FOCUS_STATS)).weapon(_equipable.itemId, _equipable.itemTier);

            if (_equipable.element == GameObjects.Element.FIRE) {
                _weapon.elementalStats.ElementalAtk.FIRE_ATK = _weapon.generatedStatBonus.M_ATK;
            } else if (_equipable.element == GameObjects.Element.COLD) {
                _weapon.elementalStats.ElementalAtk.COLD_ATK = _weapon.generatedStatBonus.M_ATK;
            } else if (_equipable.element == GameObjects.Element.LIGHTNING) {
                _weapon.elementalStats.ElementalAtk.LIGHTNING_ATK = _weapon.generatedStatBonus.M_ATK;
            } else if (_equipable.element == GameObjects.Element.EARTH) {
                _weapon.elementalStats.ElementalAtk.EARTH_ATK = _weapon.generatedStatBonus.M_ATK;
            } else if (_equipable.element == GameObjects.Element.DARK) {
                _weapon.elementalStats.ElementalAtk.DARK_ATK = _weapon.generatedStatBonus.M_ATK;
            } else if (_equipable.element == GameObjects.Element.HOLY) {
                _weapon.elementalStats.ElementalAtk.HOLY_ATK = _weapon.generatedStatBonus.M_ATK;
            } else if (_equipable.element == GameObjects.Element.VOID) {
                _weapon.elementalStats.ElementalAtk.VOID_ATK = _weapon.generatedStatBonus.M_ATK;
            } else if (_equipable.element == GameObjects.Element.ARCANE) {
                _weapon.generatedStatBonus.M_ATK = _weapon.generatedStatBonus.M_ATK;
            }
        } else if (_equipable.itemId < 148) {
            // Shield
            _weapon = IndividualItems(contractAddress(INavigator.CONTRACT.SHIELD_STATS)).weapon(_equipable.itemId, _equipable.itemTier);
            if (_equipable.element == GameObjects.Element.VOID) {
                _weapon.elementalStats.ElementalDef.VOID_DEF = _weapon.generatedStatBonus.P_DEF;
            }

            // TODO, implement elemental bonus / minus for elements. eg. fire:20% fire res boost , cold res 20% down
        } else {
            revert("???");
        }
        if (_equipable.prefixId > 0 && _equipable.suffixId == 0) return applyPrefix(_prefix, _weapon);
        if (_equipable.prefixId == 0 && _equipable.suffixId > 0) return applySuffix(_suffix, _weapon);
        if (_equipable.prefixId > 0 && _equipable.suffixId > 0) return applyPrefixAndSuffix(_prefix, _suffix, _weapon);
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
        if (_pre.isPercentage) {
            _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_weapon.generatedStatBonus, _pre.generatedStatBonus);
            _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_weapon.elementalStats, _pre.elementalStats);
        } else {
            _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStats(_weapon.generatedStatBonus, _pre.generatedStatBonus);
            _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStats(_weapon.elementalStats, _pre.elementalStats);
        }

        if (_suf.isPercentage) {
            _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_weapon.generatedStatBonus, _suf.generatedStatBonus);
            _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_weapon.elementalStats, _suf.elementalStats);
        } else {
            _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStats(_weapon.generatedStatBonus, _suf.generatedStatBonus);
            _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStats(_weapon.elementalStats, _suf.elementalStats);
        }

        _weapon.statBonus = EquipableUtils.sumStats(_weapon.statBonus, _pre.statBonus);
        _weapon.statBonus = EquipableUtils.sumStats(_weapon.statBonus, _suf.statBonus);

        //        _weapon.metadata.name = string(abi.encodePacked(_pre.title, " ", _weapon.metadata.name, " ", _suf.title));
        return _weapon;
    }

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Weapon memory _weapon) public pure returns (GameObjects.Weapon memory) {
        if (_pre.isPercentage) {
            _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_weapon.generatedStatBonus, _pre.generatedStatBonus);
            _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_weapon.elementalStats, _pre.elementalStats);
        } else {
            _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStats(_weapon.generatedStatBonus, _pre.generatedStatBonus);
            _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStats(_weapon.elementalStats, _pre.elementalStats);
        }


        _weapon.statBonus = EquipableUtils.sumStats(_weapon.statBonus, _pre.statBonus);

        //        _weapon.metadata.name = string(abi.encodePacked(_pre.title, " ", _weapon.metadata.name));
        return _weapon;
    }

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Weapon memory _weapon) public pure returns (GameObjects.Weapon memory) {
        if (_suf.isPercentage) {
            _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_weapon.generatedStatBonus, _suf.generatedStatBonus);
            _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_weapon.elementalStats, _suf.elementalStats);
        } else {
            _weapon.generatedStatBonus = EquipableUtils.sumGeneratedStats(_weapon.generatedStatBonus, _suf.generatedStatBonus);
            _weapon.elementalStats = EquipableUtils.sumGeneratedElementalStats(_weapon.elementalStats, _suf.elementalStats);
        }

        _weapon.statBonus = EquipableUtils.sumStats(_weapon.statBonus, _suf.statBonus);
        //        _weapon.metadata.name = string(abi.encodePacked(_weapon.metadata.name, " ", _suf.title));
        return _weapon;
    }

}
