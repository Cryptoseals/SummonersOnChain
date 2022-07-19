import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments} from "../../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexHelmetsMedium is Initializable {
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


    function applyTier(GameObjects_Equipments.EquipableItem memory _helmet, uint tier, uint percentage) public view returns (GameObjects_Equipments.EquipableItem memory){
        if (tier == 0) return _helmet;
        _helmet.statBonus = EquipableUtils.sumStatsAsTier(_helmet.statBonus, tier * percentage);
        _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_helmet.generatedStatBonus, (tier) * percentage);
        _helmet.elementalStats.ElementalDef = hoodieEle(percentage);
        _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_helmet.elementalStats, (tier) * percentage);
        return _helmet;
    }

    function helmet(uint id, uint tier) public view returns (GameObjects_Equipments.EquipableItem memory) {
        require(tier < 10, "t");

        if (id == 22) {
            return applyTier(SoldiersCap(tier), tier, 1);
        } else if (id == 23) {
            return applyTier(ExecutionersCap(tier), tier, 1);
        } else if (id == 24) {
            return applyTier(HuntersBandana(tier), tier, 1);
        } else if (id == 25) {
            return applyTier(RangerBandana(tier), tier, 1);
        } else if (id == 26) {
            return applyTier(MercenaryCap(tier), tier, 1);
        } else if (id == 27) {
            return applyTier(NobleCap(tier), tier, 2);
        } else if (id == 28) {
            return applyTier(BloodstainedHood(tier), tier, 2);
        } else if (id == 29) {
            return applyTier(HoodOfDusk(tier), tier, 2);
        } else if (id == 30) {
            return applyTier(ShadowMask(tier), tier, 3);
        } else if (id == 31) {
            return applyTier(HeadmastersHood(tier), tier, 3);
        } else if (id == 32) {
            return applyTier(ElvenHood(tier), tier, 4);
        } else if (id == 33) {
            return applyTier(ChosensHood(tier), tier, 4);
        } else if (id == 34) {
            return applyTier(ProphetsHood(tier), tier, 5);
        } else if (id == 35) {
            return applyTier(EldersHood(tier), tier, 6);
        } else if (id == 36) {
            return applyTier(AncientMask(tier), tier, 7);
        } else if (id == 37) {
            return applyTier(MoonlightHood(tier), tier, 9);
        } else if (id == 38) {
            return applyTier(SunlightHood(tier), tier, 11);
        } else if (id == 39) {
            return applyTier(CycleHood(tier), tier, 13);
        } else if (id == 40) {
            return applyTier(DemonicHood(tier), tier, 15);
        } else if (id == 41) {
            return applyTier(AngelicHood(tier), tier, 19);
        } else if (id == 42) {
            return applyTier(EternalHood(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersCap(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 22;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Soldier's Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;

        // requirements here
        _helmet.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(0);
        _helmet.generatedStatBonus = hoodieGenStats(0);
        _helmet.elementalStats.ElementalDef = hoodieEle(0);
    }

    function ExecutionersCap(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 23;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Executioner's Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 3;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(1);
        _helmet.generatedStatBonus = hoodieGenStats(1);
        _helmet.elementalStats.ElementalDef = hoodieEle(1);
    }

    function HuntersBandana(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 24;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Knight's Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 8;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(2);
        _helmet.generatedStatBonus = hoodieGenStats(2);
        _helmet.elementalStats.ElementalDef = hoodieEle(2);
    }

    function RangerBandana(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 25;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Dwarven Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 13;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(3);
        _helmet.generatedStatBonus = hoodieGenStats(3);
        _helmet.elementalStats.ElementalDef = hoodieEle(3);
    }

    function MercenaryCap(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 26;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Scale Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 18;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(4);
        _helmet.generatedStatBonus = hoodieGenStats(4);
        _helmet.elementalStats.ElementalDef = hoodieEle(4);
    }

    function NobleCap(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 27;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Winged Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 23;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(5);
        _helmet.generatedStatBonus = hoodieGenStats(5);
        _helmet.elementalStats.ElementalDef = hoodieEle(5);
    }

    function BloodstainedHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 28;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Draconic Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 28;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(6);
        _helmet.generatedStatBonus = hoodieGenStats(6);
        _helmet.elementalStats.ElementalDef = hoodieEle(6);
    }

    function HoodOfDusk(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 29;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Argent Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 33;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(7);
        _helmet.generatedStatBonus = hoodieGenStats(7);
        _helmet.elementalStats.ElementalDef = hoodieEle(7);
    }

    function ShadowMask(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 30;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Golden Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 38;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(8);
        _helmet.generatedStatBonus = hoodieGenStats(8);
        _helmet.elementalStats.ElementalDef = hoodieEle(8);
    }

    function HeadmastersHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 31;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Midas's Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 43;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(9);
        _helmet.generatedStatBonus = hoodieGenStats(9);
        _helmet.elementalStats.ElementalDef = hoodieEle(9);
    }

    function ElvenHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 32;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Juggernaut Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 48;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(10);
        _helmet.generatedStatBonus = hoodieGenStats(10);
        _helmet.elementalStats.ElementalDef = hoodieEle(10);
    }

    function ChosensHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 33;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Chosen's Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 53;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(11);
        _helmet.generatedStatBonus = hoodieGenStats(11);
        _helmet.elementalStats.ElementalDef = hoodieEle(11);
    }

    function ProphetsHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 34;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Templar Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 58;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(12);
        _helmet.generatedStatBonus = hoodieGenStats(12);
        _helmet.elementalStats.ElementalDef = hoodieEle(12);
    }

    function EldersHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 35;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Vanguard Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 63;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(13);
        _helmet.generatedStatBonus = hoodieGenStats(13);
        _helmet.elementalStats.ElementalDef = hoodieEle(13);
    }

    function AncientMask(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 36;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Void Dweller Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 68;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(14);
        _helmet.generatedStatBonus = hoodieGenStats(14);
        _helmet.elementalStats.ElementalDef = hoodieEle(14);
    }

    function MoonlightHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 37;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Sun Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 73;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(15);
        _helmet.generatedStatBonus = hoodieGenStats(15);
        _helmet.elementalStats.ElementalDef = hoodieEle(15);
    }

    function SunlightHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 38;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Moon Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 78;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(16);
        _helmet.generatedStatBonus = hoodieGenStats(16);
        _helmet.elementalStats.ElementalDef = hoodieEle(16);
    }

    function CycleHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 39;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Demonic Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 83;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(17);
        _helmet.generatedStatBonus = hoodieGenStats(17);
        _helmet.elementalStats.ElementalDef = hoodieEle(17);
    }

    function DemonicHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 40;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Angelic Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 88;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(18);
        _helmet.generatedStatBonus = hoodieGenStats(18);
        _helmet.elementalStats.ElementalDef = hoodieEle(18);
    }

    function AngelicHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 41;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Cycle Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 93;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(19);
        _helmet.generatedStatBonus = hoodieGenStats(19);
        _helmet.elementalStats.ElementalDef = hoodieEle(19);
    }

    function EternalHood(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _helmet) {
        _helmet.metadata.id = 42;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        //        _helmet.metadata.name = "Eternal Hoodie";
        //        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 98;
        _helmet.requirement.classRequirement = classRequirement();

        // bonuses here
        _helmet.statBonus = hoodieStats(20);
        _helmet.generatedStatBonus = hoodieGenStats(20);
        _helmet.elementalStats.ElementalDef = hoodieEle(20);
    }

    function hoodieStats(uint index) internal view returns (GameObjects_Stats.Stats memory) {
        GameObjects_Stats.Stats memory stats = GameObjects_Stats.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : 0,
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function hoodieEle(uint index) internal view returns (GameObjects_Stats.ElementalDef memory) {
        GameObjects_Stats.ElementalDef memory stats = GameObjects_Stats.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function hoodieGenStats(uint index) internal view returns (GameObjects_Stats.GeneratedStats memory) {
        GameObjects_Stats.GeneratedStats memory stats = GameObjects_Stats.GeneratedStats({
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

    function classRequirement() internal view returns (GameObjects.Class[] memory) {
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](3);
        _reqClass[0] = GameObjects.Class.Assassin;
        _reqClass[1] = GameObjects.Class.Ranger;
        _reqClass[2] = GameObjects.Class.Engineer;
        return _reqClass;
    }
}
