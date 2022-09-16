import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {ICodexPrefixAndSuffix} from "../../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import {InitNavigator, INavigator} from "../../../Core/Navigator/InitNavigator.sol";
import {Class, Element, Stats, GeneratedStats, ElementalStats, ElementalAtk, ElementalDef, EquippedItemStruct, Prefix, Suffix, EquipableItem, Stats, ItemType} from "../../../Interfaces/GameObjects/IGameObjects.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexBelts is InitNavigator, OwnableUpgradeable {
    ICodexPrefixAndSuffix PrefixContract;
    ICodexPrefixAndSuffix SuffixContract;

    string constant public index = "Codex";
    string constant public class = "Belts";
    string constant public version = "0.0.1";

    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_INT;
    uint[21] public BASE_VIT;
    uint[21] public BASE_LUK;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_EDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;
    uint[21] public BASE_ACC;


    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        __Ownable_init();
    }

    function initializeContracts() external {
        PrefixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.PREFIX_CODEX));
        SuffixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.SUFFIX_CODEX));
    }

    function initializeCodex1(
        uint[21] memory _BASE_STR,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_INT,
        uint[21] memory _BASE_VIT,
        uint[21] memory _BASE_LUK
    ) external onlyOwner {
        BASE_STR = _BASE_STR;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_INT = _BASE_INT;
        BASE_VIT = _BASE_VIT;
        BASE_LUK = _BASE_LUK;
    }

    function initializeCodex2(
        uint[21] memory _BASE_DEF,
        uint[21] memory _BASE_MDEF,
        uint[21] memory _BASE_EDEF,
        uint[21] memory _BASE_HP,
        uint[21] memory _BASE_DODGE,
        uint[21] memory _BASE_ACC
    ) external onlyOwner {
        BASE_DEF = _BASE_DEF;
        BASE_MDEF = _BASE_MDEF;
        BASE_EDEF = _BASE_EDEF;
        BASE_HP = _BASE_HP;
        BASE_DODGE = _BASE_DODGE;
        BASE_ACC = _BASE_ACC;
    }


    function applyPrefixAndSuffix(Prefix memory _pre, Suffix memory _suf, EquipableItem memory _belt) public view returns (EquipableItem memory) {
        if (_pre.isPercentage) {
            _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_belt.generatedStatBonus, _pre.generatedStatBonus);
            _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_belt.elementalStats, _pre.elementalStats);
        } else {
            _belt.generatedStatBonus = EquipableUtils.sumGeneratedStats(_belt.generatedStatBonus, _pre.generatedStatBonus);
            _belt.elementalStats = EquipableUtils.sumGeneratedElementalStats(_belt.elementalStats, _pre.elementalStats);
        }

        if (_suf.isPercentage) {
            _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_belt.generatedStatBonus, _suf.generatedStatBonus);
            _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_belt.elementalStats, _suf.elementalStats);
        } else {
            _belt.generatedStatBonus = EquipableUtils.sumGeneratedStats(_belt.generatedStatBonus, _suf.generatedStatBonus);
            _belt.elementalStats = EquipableUtils.sumGeneratedElementalStats(_belt.elementalStats, _suf.elementalStats);
        }
        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _pre.statBonus);
        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _suf.statBonus);


        return _belt;
    }

    function applyPrefix(Prefix memory _pre, EquipableItem memory _belt) public view returns (EquipableItem memory) {
        if (_pre.isPercentage) {
            _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_belt.generatedStatBonus, _pre.generatedStatBonus);
            _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_belt.elementalStats, _pre.elementalStats);
        } else {
            _belt.generatedStatBonus = EquipableUtils.sumGeneratedStats(_belt.generatedStatBonus, _pre.generatedStatBonus);
            _belt.elementalStats = EquipableUtils.sumGeneratedElementalStats(_belt.elementalStats, _pre.elementalStats);
        }

        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _pre.statBonus);


        return _belt;
    }

    function applySuffix(Suffix memory _suf, EquipableItem memory _belt) public view returns (EquipableItem memory) {
        if (_suf.isPercentage) {
            _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_belt.generatedStatBonus, _suf.generatedStatBonus);
            _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_belt.elementalStats, _suf.elementalStats);
        } else {
            _belt.generatedStatBonus = EquipableUtils.sumGeneratedStats(_belt.generatedStatBonus, _suf.generatedStatBonus);
            _belt.elementalStats = EquipableUtils.sumGeneratedElementalStats(_belt.elementalStats, _suf.elementalStats);
        }

        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _suf.statBonus);
        return _belt;
    }

    function applyTier(EquipableItem memory _belt, uint tier, uint percentage) public view returns (EquipableItem memory){
        if (tier == 0) return _belt;
        _belt.statBonus = EquipableUtils.sumStatsAsTier(_belt.statBonus, tier * percentage);
        _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_belt.generatedStatBonus, (tier) * percentage);
        _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_belt.elementalStats, (tier) * percentage);
        return _belt;
    }

    function allBelt() external view returns (EquipableItem[] memory){
        EquipableItem[] memory result = new EquipableItem[](21);
        for (uint i = 1; i < 22; i++) {
            result[i - 1] = beltCore(i, 1);
        }
        return result;
    }

    function belt(EquippedItemStruct memory _equipable) public view returns (EquipableItem memory _belt) {
        EquipableItem memory base;
        Prefix memory _prefix;
        Suffix memory _suffix;
        require(_equipable.itemTier < 10, "tier");

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _belt = applyTier(FrailBelt(_equipable.itemTier), _equipable.itemTier, 500);
            base = FrailBelt(_equipable.itemTier);
            _belt.statBonus.STR = base.statBonus.STR + ((_belt.statBonus.STR * 350) / 1000);
            _belt.statBonus.DEX = base.statBonus.DEX + ((_belt.statBonus.DEX * 350) / 1000);
            _belt.statBonus.AGI = base.statBonus.AGI + ((_belt.statBonus.AGI * 350) / 1000);
            _belt.statBonus.VIT = base.statBonus.VIT + ((_belt.statBonus.VIT * 350) / 1000);
            _belt.statBonus.INT = base.statBonus.INT + ((_belt.statBonus.INT * 350) / 1000);
            _belt.statBonus.LUCK = base.statBonus.LUCK + ((_belt.statBonus.LUCK * 350) / 1000);

            //            _belt.generatedStatBonus.CRIT_MULTIPLIER = base.generatedStatBonus.CRIT_MULTIPLIER + ((_belt.generatedStatBonus.CRIT_MULTIPLIER * 10) / 1000) ;
            _belt.generatedStatBonus.ACCURACY = base.generatedStatBonus.ACCURACY + ((_belt.generatedStatBonus.ACCURACY * 20) / 1000);
            //            _belt.generatedStatBonus.P_ATK = base.generatedStatBonus.P_ATK + ((_belt.generatedStatBonus.P_ATK * 10) / 1000) ;
            //            _belt.generatedStatBonus.M_ATK = base.generatedStatBonus.M_ATK + ((_belt.generatedStatBonus.M_ATK * 10) / 1000) ;
            _belt.generatedStatBonus.P_DEF = base.generatedStatBonus.P_DEF + ((_belt.generatedStatBonus.P_DEF * 10) / 1000);
            _belt.generatedStatBonus.M_DEF = base.generatedStatBonus.M_DEF + ((_belt.generatedStatBonus.M_DEF * 10) / 1000);
            _belt.generatedStatBonus.DODGE = base.generatedStatBonus.DODGE + ((_belt.generatedStatBonus.DODGE * 10) / 1000);

            //            _belt.elementalStats.ElementalAtk.FIRE_ATK = base.elementalStats.ElementalAtk.FIRE_ATK + ((_belt.elementalStats.ElementalAtk.FIRE_ATK * 10) / 1000) ;
            //            _belt.elementalStats.ElementalAtk.COLD_ATK = base.elementalStats.ElementalAtk.COLD_ATK + ((_belt.elementalStats.ElementalAtk.COLD_ATK * 10) / 1000) ;
            //            _belt.elementalStats.ElementalAtk.EARTH_ATK = base.elementalStats.ElementalAtk.EARTH_ATK + ((_belt.elementalStats.ElementalAtk.EARTH_ATK * 10) / 1000) ;
            //            _belt.elementalStats.ElementalAtk.LIGHTNING_ATK = base.elementalStats.ElementalAtk.LIGHTNING_ATK + ((_belt.elementalStats.ElementalAtk.LIGHTNING_ATK * 10) / 1000) ;
            //            _belt.elementalStats.ElementalAtk.DARK_ATK = base.elementalStats.ElementalAtk.DARK_ATK + ((_belt.elementalStats.ElementalAtk.DARK_ATK * 10) / 1000) ;
            //            _belt.elementalStats.ElementalAtk.HOLY_ATK = base.elementalStats.ElementalAtk.HOLY_ATK + ((_belt.elementalStats.ElementalAtk.HOLY_ATK * 10) / 1000) ;

            _belt.elementalStats.ElementalDef.FIRE_DEF = base.elementalStats.ElementalDef.FIRE_DEF + ((_belt.elementalStats.ElementalDef.FIRE_DEF * 10) / 1000);
            _belt.elementalStats.ElementalDef.COLD_DEF = base.elementalStats.ElementalDef.COLD_DEF + ((_belt.elementalStats.ElementalDef.COLD_DEF * 10) / 1000);
            _belt.elementalStats.ElementalDef.EARTH_DEF = base.elementalStats.ElementalDef.EARTH_DEF + ((_belt.elementalStats.ElementalDef.EARTH_DEF * 10) / 1000);
            _belt.elementalStats.ElementalDef.LIGHTNING_DEF = base.elementalStats.ElementalDef.LIGHTNING_DEF + ((_belt.elementalStats.ElementalDef.LIGHTNING_DEF * 10) / 1000);
            _belt.elementalStats.ElementalDef.DARK_DEF = base.elementalStats.ElementalDef.DARK_DEF + ((_belt.elementalStats.ElementalDef.DARK_DEF * 10) / 1000);
            _belt.elementalStats.ElementalDef.HOLY_DEF = base.elementalStats.ElementalDef.HOLY_DEF + ((_belt.elementalStats.ElementalDef.HOLY_DEF * 10) / 1000);
        } else if (_equipable.itemId == 2) {
            _belt = applyTier(AntiqueBelt(_equipable.itemTier), _equipable.itemTier, 130);
        } else if (_equipable.itemId == 3) {
            _belt = applyTier(PurgeBelt(_equipable.itemTier), _equipable.itemTier, 70);
        } else if (_equipable.itemId == 4) {
            _belt = applyTier(BarbedBelt(_equipable.itemTier), _equipable.itemTier, 40);
        } else if (_equipable.itemId == 5) {
            _belt = applyTier(ReflectiveBelt(_equipable.itemTier), _equipable.itemTier, 32);
        } else if (_equipable.itemId == 6) {
            _belt = applyTier(StormForgedBelt(_equipable.itemTier), _equipable.itemTier, 22);
        } else if (_equipable.itemId == 7) {
            _belt = applyTier(VerdantBelt(_equipable.itemTier), _equipable.itemTier, 20);
        } else if (_equipable.itemId == 8) {
            _belt = applyTier(ShadowfallBelt(_equipable.itemTier), _equipable.itemTier, 18);
        } else if (_equipable.itemId == 9) {
            _belt = applyTier(MalignantBelt(_equipable.itemTier), _equipable.itemTier, 15);
        } else if (_equipable.itemId == 10) {
            _belt = applyTier(SealedBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 11) {
            _belt = applyTier(TemplarBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 12) {
            _belt = applyTier(ChannelerBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 13) {
            _belt = applyTier(ChosensBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 14) {
            _belt = applyTier(AstraBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 15) {
            _belt = applyTier(SoulbinderBelt(_equipable.itemTier), _equipable.itemTier, 7);
        } else if (_equipable.itemId == 16) {
            _belt = applyTier(MoonlightBelt(_equipable.itemTier), _equipable.itemTier, 7);
        } else if (_equipable.itemId == 17) {
            _belt = applyTier(SunlightBelt(_equipable.itemTier), _equipable.itemTier, 7);
        } else if (_equipable.itemId == 18) {
            _belt = applyTier(CycleBelt(_equipable.itemTier), _equipable.itemTier, 5);
        } else if (_equipable.itemId == 19) {
            _belt = applyTier(InfernalBelt(_equipable.itemTier), _equipable.itemTier, 5);
        } else if (_equipable.itemId == 20) {
            _belt = applyTier(DivineBelt(_equipable.itemTier), _equipable.itemTier, 4);
        } else if (_equipable.itemId == 21) {
            _belt = applyTier(EternalBelt(_equipable.itemTier), _equipable.itemTier, 4);
        } else {
            revert("?b");
        }

        if (_equipable.element == Element.VOID) {
            _belt.elementalStats.ElementalDef.VOID_DEF = _belt.generatedStatBonus.M_DEF;
        }

        if (_equipable.prefixId > 0) _belt = applyPrefix(_prefix, _belt);
        if (_equipable.suffixId > 0) _belt = applySuffix(_suffix, _belt);
        return _belt;
    }

    function beltCore(uint itemId, uint itemTier) public view returns (EquipableItem memory) {
        EquipableItem memory _belt;
        require(itemTier < 10, "tier");


        if (itemId == 1) {
            _belt = applyTier(FrailBelt(itemTier), itemTier, 500);
        } else if (itemId == 2) {
            _belt = applyTier(AntiqueBelt(itemTier), itemTier, 130);
        } else if (itemId == 3) {
            _belt = applyTier(PurgeBelt(itemTier), itemTier, 70);
        } else if (itemId == 4) {
            _belt = applyTier(BarbedBelt(itemTier), itemTier, 40);
        } else if (itemId == 5) {
            _belt = applyTier(ReflectiveBelt(itemTier), itemTier, 32);
        } else if (itemId == 6) {
            _belt = applyTier(StormForgedBelt(itemTier), itemTier, 22);
        } else if (itemId == 7) {
            _belt = applyTier(VerdantBelt(itemTier), itemTier, 20);
        } else if (itemId == 8) {
            _belt = applyTier(ShadowfallBelt(itemTier), itemTier, 18);
        } else if (itemId == 9) {
            _belt = applyTier(MalignantBelt(itemTier), itemTier, 15);
        } else if (itemId == 10) {
            _belt = applyTier(SealedBelt(itemTier), itemTier, 10);
        } else if (itemId == 11) {
            _belt = applyTier(TemplarBelt(itemTier), itemTier, 10);
        } else if (itemId == 12) {
            _belt = applyTier(ChannelerBelt(itemTier), itemTier, 10);
        } else if (itemId == 13) {
            _belt = applyTier(ChosensBelt(itemTier), itemTier, 10);
        } else if (itemId == 14) {
            _belt = applyTier(AstraBelt(itemTier), itemTier, 10);
        } else if (itemId == 15) {
            _belt = applyTier(SoulbinderBelt(itemTier), itemTier, 7);
        } else if (itemId == 16) {
            _belt = applyTier(MoonlightBelt(itemTier), itemTier, 7);
        } else if (itemId == 17) {
            _belt = applyTier(SunlightBelt(itemTier), itemTier, 7);
        } else if (itemId == 18) {
            _belt = applyTier(CycleBelt(itemTier), itemTier, 5);
        } else if (itemId == 19) {
            _belt = applyTier(InfernalBelt(itemTier), itemTier, 5);
        } else if (itemId == 20) {
            _belt = applyTier(DivineBelt(itemTier), itemTier, 4);
        } else if (itemId == 21) {
            _belt = applyTier(EternalBelt(itemTier), itemTier, 4);
        }

        return _belt;
    }

    function FrailBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 1;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 1;
        _belt.requirement.classRequirement = new Class[](0);
        // _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(0);
        _belt.generatedStatBonus = beltGenStats(0);
        _belt.elementalStats = beltEleStats(0);
    }

    function AntiqueBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 2;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 7;
        // _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(1);
        _belt.generatedStatBonus = beltGenStats(1);
        _belt.elementalStats = beltEleStats(1);
    }

    function PurgeBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 3;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 12;
        // _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(2);
        _belt.generatedStatBonus = beltGenStats(2);
        _belt.elementalStats = beltEleStats(2);
    }

    function BarbedBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 4;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 17;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(3);
        _belt.generatedStatBonus = beltGenStats(3);
        _belt.elementalStats = beltEleStats(3);
    }

    function ReflectiveBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 5;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 22;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(4);
        _belt.generatedStatBonus = beltGenStats(4);
        _belt.elementalStats = beltEleStats(4);
    }

    function StormForgedBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 6;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 27;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(5);
        _belt.generatedStatBonus = beltGenStats(5);
        _belt.elementalStats = beltEleStats(5);
    }

    function VerdantBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 7;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 32;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(6);
        _belt.generatedStatBonus = beltGenStats(6);
        _belt.elementalStats = beltEleStats(6);
    }

    function ShadowfallBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 8;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 37;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(7);
        _belt.generatedStatBonus = beltGenStats(7);
        _belt.elementalStats = beltEleStats(7);
    }

    function MalignantBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 9;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 42;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(8);
        _belt.generatedStatBonus = beltGenStats(8);
        _belt.elementalStats = beltEleStats(8);
    }

    function SealedBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 10;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 47;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(9);
        _belt.generatedStatBonus = beltGenStats(9);
        _belt.elementalStats = beltEleStats(9);
    }

    function TemplarBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 11;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 52;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(10);
        _belt.generatedStatBonus = beltGenStats(10);
        _belt.elementalStats = beltEleStats(10);
    }

    function ChannelerBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 12;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 57;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(11);
        _belt.generatedStatBonus = beltGenStats(11);
        _belt.elementalStats = beltEleStats(11);
    }

    function ChosensBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 13;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 62;
        // _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(12);
        _belt.generatedStatBonus = beltGenStats(12);
        _belt.elementalStats = beltEleStats(12);
    }

    function AstraBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 14;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 67;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(13);
        _belt.generatedStatBonus = beltGenStats(13);
        _belt.elementalStats = beltEleStats(13);
    }

    function SoulbinderBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 15;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 72;
        // _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(14);
        _belt.generatedStatBonus = beltGenStats(14);
        _belt.elementalStats = beltEleStats(14);
    }

    function MoonlightBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 16;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 77;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(15);
        _belt.generatedStatBonus = beltGenStats(15);
        _belt.elementalStats = beltEleStats(15);
    }

    function SunlightBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 17;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 82;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(16);
        _belt.generatedStatBonus = beltGenStats(16);
        _belt.elementalStats = beltEleStats(16);
    }

    function CycleBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 18;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 87;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(17);
        _belt.generatedStatBonus = beltGenStats(17);
        _belt.elementalStats = beltEleStats(17);
    }

    function InfernalBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 19;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 92;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(18);
        _belt.generatedStatBonus = beltGenStats(18);
        _belt.elementalStats = beltEleStats(18);
    }

    function DivineBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 20;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 97;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(19);
        _belt.generatedStatBonus = beltGenStats(19);
        _belt.elementalStats = beltEleStats(19);
    }

    function EternalBelt(uint tier) public view returns (EquipableItem memory _belt) {
        _belt.metadata.id = 21;
        _belt.metadata.baseType = ItemType.BELT;
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 100;
        //  _belt.requirement.statRequirement = Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(20);
        _belt.generatedStatBonus = beltGenStats(20);
        _belt.elementalStats = beltEleStats(20);
    }


    function beltStats(uint _index) internal view returns (Stats memory) {
        Stats memory stats = Stats({
        STR : BASE_STR[_index],
        DEX : BASE_DEX[_index],
        AGI : BASE_AGI[_index],
        INT : BASE_INT[_index],
        VIT : BASE_VIT[_index],
        LUCK : BASE_LUK[_index]});
        return stats;
    }

    function beltEle(uint _index) internal view returns (ElementalDef memory) {
        ElementalDef memory stats = ElementalDef({FIRE_DEF : BASE_EDEF[_index], EARTH_DEF : BASE_EDEF[_index], COLD_DEF : BASE_EDEF[_index], LIGHTNING_DEF : BASE_EDEF[_index], DARK_DEF : BASE_EDEF[_index], HOLY_DEF : BASE_EDEF[_index], VOID_DEF : 0});
        return stats;
    }

    function beltGenStats(uint _index) internal view returns (GeneratedStats memory) {
        GeneratedStats memory stats = GeneratedStats({
        HP : BASE_HP[_index],
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : BASE_DEF[_index],
        M_DEF : BASE_MDEF[_index],
        ACCURACY : BASE_ACC[_index],
        DODGE : BASE_DODGE[_index],
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });
        return stats;
    }

    function beltEleStats(uint _index) internal view returns (ElementalStats memory _genStats) {
        _genStats.ElementalDef = ElementalDef({FIRE_DEF : BASE_EDEF[_index], EARTH_DEF : BASE_EDEF[_index], COLD_DEF : BASE_EDEF[_index], LIGHTNING_DEF : BASE_EDEF[_index], DARK_DEF : BASE_EDEF[_index], HOLY_DEF : BASE_EDEF[_index], VOID_DEF : 0});
    }
}
