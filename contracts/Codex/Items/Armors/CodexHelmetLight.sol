import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, Stats, GeneratedStats,ElementalStats, ElementalAtk, ElementalDef,Class, EquippedItemStruct, Prefix, Suffix, EquipableItem, Stats, ElementalDef, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexHelmetsLight is Initializable {
    uint[21] public BASE_STR;
//    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_VIT;
    uint[21] public BASE_INT;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_EDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;
    uint[21] public BASE_ACCURACY;


    function initialize(
        uint[21] memory _BASE_STR,
//        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_VIT,
        uint[21] memory _BASE_INT,
        uint[21] memory _BASE_DEF,
        uint[21] memory _BASE_MDEF,
        uint[21] memory _BASE_EDEF,
        uint[21] memory _BASE_HP,
        uint[21] memory _BASE_DODGE,
        uint[21] memory _BASE_ACCURACY
    ) external initializer {
        BASE_STR = _BASE_STR;
//        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_VIT = _BASE_VIT;
        BASE_INT = _BASE_INT;
        BASE_DEF = _BASE_DEF;
        BASE_MDEF = _BASE_MDEF;
        BASE_HP = _BASE_HP;
        BASE_DODGE = _BASE_DODGE;
        BASE_EDEF = _BASE_EDEF;
        BASE_ACCURACY = _BASE_ACCURACY;
    }

    function applyTier(EquipableItem memory _hat, uint tier, uint percentage) public view returns (EquipableItem memory){
        if (tier == 0) return _hat;
        _hat.statBonus = EquipableUtils.sumStatsAsTier(_hat.statBonus, tier * percentage);
        _hat.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_hat.generatedStatBonus, (tier) * percentage);
        _hat.elementalStats.ElementalDef = helmetEle(percentage);
        _hat.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_hat.elementalStats, (tier) * percentage);
        return _hat;
    }

    function helmet(uint id, uint tier) public view returns (EquipableItem memory) {
        require(tier < 10, "t");

        if (id == 43) {
            return applyTier(SoldiersHat(tier), tier, 1);
        } else if (id == 44) {
            return applyTier(PriestsHat(tier), tier, 1);
        } else if (id == 45) {
            return applyTier(FaithHat(tier), tier, 1);
        } else if (id == 46) {
            return applyTier(TraineesHat(tier), tier, 1);
        } else if (id == 47) {
            return applyTier(MagiciansHat(tier), tier, 1);
        } else if (id == 48) {
            return applyTier(SealedMask(tier), tier, 2);
        } else if (id == 49) {
            return applyTier(GateKeepersMask(tier), tier, 2);
        } else if (id == 50) {
            return applyTier(ElementalistsMask(tier), tier, 2);
        } else if (id == 51) {
            return applyTier(AlchemistsMask(tier), tier, 3);
        } else if (id == 52) {
            return applyTier(ArchmagesMask(tier), tier, 3);
        } else if (id == 53) {
            return applyTier(ElvenCirclet(tier), tier, 4);
        } else if (id == 54) {
            return applyTier(ChosensCirclet(tier), tier, 4);
        } else if (id == 55) {
            return applyTier(ProphetsCirclet(tier), tier, 5);
        } else if (id == 56) {
            return applyTier(EldersCirclet(tier), tier, 6);
        } else if (id == 57) {
            return applyTier(AncientCirclet(tier), tier, 7);
        } else if (id == 58) {
            return applyTier(MoonlightCirclet(tier), tier, 9);
        } else if (id == 59) {
            return applyTier(SunlightCirclet(tier), tier, 11);
        } else if (id == 60) {
            return applyTier(CycleCirclet(tier), tier, 13);
        } else if (id == 61) {
            return applyTier(DemonicCrown(tier), tier, 15);
        } else if (id == 62) {
            return applyTier(AngelicCrown(tier), tier, 19);
        } else if (id == 63) {
            return applyTier(EternalCrown(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersHat(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 43;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;

        // requirements here
        _hat.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _hat.requirement.classRequirement = classRequirement();

        //        _hat.requirement.statRequirement = Stats({
        //        STR : 0,
        //        DEX : 0,
        //        AGI : 0,
        //        INT : 0,
        //        VIT : 0,
        //        LUCK : 0});


        // bonuses here
        _hat.statBonus = helmetStats(0);
        _hat.generatedStatBonus = helmetGenStats(0);
        _hat.elementalStats.ElementalDef = helmetEle(0);
    }

    function PriestsHat(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 44;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 3;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(1);
        _hat.generatedStatBonus = helmetGenStats(1);
        _hat.elementalStats.ElementalDef = helmetEle(1);
    }

    function FaithHat(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 45;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 8;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(2);
        _hat.generatedStatBonus = helmetGenStats(2);
        _hat.elementalStats.ElementalDef = helmetEle(2);
    }

    function TraineesHat(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 46;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 13;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(3);
        _hat.generatedStatBonus = helmetGenStats(3);
        _hat.elementalStats.ElementalDef = helmetEle(3);
    }

    function MagiciansHat(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 47;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 18;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(4);
        _hat.generatedStatBonus = helmetGenStats(4);
        _hat.elementalStats.ElementalDef = helmetEle(4);
    }

    function SealedMask(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 48;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 23;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(5);
        _hat.generatedStatBonus = helmetGenStats(5);
        _hat.elementalStats.ElementalDef = helmetEle(5);
    }

    function GateKeepersMask(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 49;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 28;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(6);
        _hat.generatedStatBonus = helmetGenStats(6);
        _hat.elementalStats.ElementalDef = helmetEle(6);
    }

    function ElementalistsMask(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 50;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 33;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(7);
        _hat.generatedStatBonus = helmetGenStats(7);
        _hat.elementalStats.ElementalDef = helmetEle(7);
    }

    function AlchemistsMask(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 51;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 38;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(8);
        _hat.generatedStatBonus = helmetGenStats(8);
        _hat.elementalStats.ElementalDef = helmetEle(8);
    }

    function ArchmagesMask(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 52;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 43;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(9);
        _hat.generatedStatBonus = helmetGenStats(9);
        _hat.elementalStats.ElementalDef = helmetEle(9);
    }

    function ElvenCirclet(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 53;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 48;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(10);
        _hat.generatedStatBonus = helmetGenStats(10);
        _hat.elementalStats.ElementalDef = helmetEle(10);
    }

    function ChosensCirclet(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 54;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 53;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(11);
        _hat.generatedStatBonus = helmetGenStats(11);
        _hat.elementalStats.ElementalDef = helmetEle(11);
    }

    function ProphetsCirclet(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 55;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 58;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(12);
        _hat.generatedStatBonus = helmetGenStats(12);
        _hat.elementalStats.ElementalDef = helmetEle(12);
    }

    function EldersCirclet(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 56;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 63;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(13);
        _hat.generatedStatBonus = helmetGenStats(13);
        _hat.elementalStats.ElementalDef = helmetEle(13);
    }

    function AncientCirclet(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 57;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 68;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(14);
        _hat.generatedStatBonus = helmetGenStats(14);
        _hat.elementalStats.ElementalDef = helmetEle(14);
    }

    function MoonlightCirclet(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 58;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 73;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(15);
        _hat.generatedStatBonus = helmetGenStats(15);
        _hat.elementalStats.ElementalDef = helmetEle(15);
    }

    function SunlightCirclet(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 59;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 78;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(16);
        _hat.generatedStatBonus = helmetGenStats(16);
        _hat.elementalStats.ElementalDef = helmetEle(16);
    }

    function CycleCirclet(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 60;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 83;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(17);
        _hat.generatedStatBonus = helmetGenStats(17);
        _hat.elementalStats.ElementalDef = helmetEle(17);
    }

    function DemonicCrown(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 61;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 88;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(18);
        _hat.generatedStatBonus = helmetGenStats(18);
        _hat.elementalStats.ElementalDef = helmetEle(18);
    }

    function AngelicCrown(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 62;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 93;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(19);
        _hat.generatedStatBonus = helmetGenStats(19);
        _hat.elementalStats.ElementalDef = helmetEle(19);
    }

    function EternalCrown(uint tier) public view returns (EquipableItem memory _hat) {
        _hat.metadata.id = 63;
        _hat.metadata.baseType = ItemType.HELMET;
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 98;
        _hat.requirement.classRequirement = classRequirement();

        _hat.statBonus = helmetStats(20);
        _hat.generatedStatBonus = helmetGenStats(20);
        _hat.elementalStats.ElementalDef = helmetEle(20);
    }

    function helmetStats(uint index) internal view returns (Stats memory) {
        Stats memory stats = Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : 0,
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function helmetEle(uint index) internal view returns (ElementalDef memory) {
        ElementalDef memory stats = ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function helmetGenStats(uint index) internal view returns (GeneratedStats memory) {
        GeneratedStats memory stats = GeneratedStats({
        HP : BASE_HP[index],
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : BASE_DEF[index],
        M_DEF : BASE_MDEF[index],
        ACCURACY : BASE_ACCURACY[index],
        DODGE : BASE_DODGE[index],
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });
        return stats;
    }

    function classRequirement() internal view returns (Class[] memory) {
        Class[] memory _reqClass = new Class[](3);
        _reqClass[0] = Class.Wizard;
        _reqClass[1] = Class.Priest;
        _reqClass[2] = Class.Necromancer;
        return _reqClass;
    }
}
