import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments} from "../../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexBootsMedium is Initializable {
    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_VIT;
    uint[21] public BASE_INT;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_EDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;


    function initialize(
        uint[21] memory _BASE_STR,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_VIT,
        uint[21] memory _BASE_INT,
        uint[21] memory _BASE_DEF,
        uint[21] memory _BASE_MDEF,
        uint[21] memory _BASE_EDEF,
        uint[21] memory _BASE_HP,
        uint[21] memory _BASE_DODGE
    ) external initializer {
        BASE_STR = _BASE_STR;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_VIT = _BASE_VIT;
        BASE_INT = _BASE_INT;
        BASE_DEF = _BASE_DEF;
        BASE_MDEF = _BASE_MDEF;
        BASE_HP = _BASE_HP;
        BASE_DODGE = _BASE_DODGE;
        BASE_EDEF = _BASE_EDEF;
    }

    function applyTier(GameObjects_Equipments.EquipableItem memory _greaves, uint tier, uint percentage) public view returns (GameObjects_Equipments.EquipableItem memory){
        if (tier == 0) return _greaves;
        _greaves.statBonus = EquipableUtils.sumStatsAsTier(_greaves.statBonus, tier * percentage);
        _greaves.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_greaves.generatedStatBonus, (tier) * percentage);
        _greaves.elementalStats.ElementalDef = armorEle(percentage);
        _greaves.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_greaves.elementalStats, (tier) * percentage);
        return _greaves;
    }

    function boots(uint id, uint tier) public view returns (GameObjects_Equipments.EquipableItem memory) {
        require(tier < 10, "t");

        if (id == 22) {
            return applyTier(SoldiersSandals(tier), tier, 1);
        } else if (id == 23) {
            return applyTier(ExecutionersSandals(tier), tier, 1);
        } else if (id == 24) {
            return applyTier(HuntersSandals(tier), tier, 1);
        } else if (id == 25) {
            return applyTier(RangerSandals(tier), tier, 1);
        } else if (id == 26) {
            return applyTier(MercenaryShoes(tier), tier, 1);
        } else if (id == 27) {
            return applyTier(NobleShoes(tier), tier, 2);
        } else if (id == 28) {
            return applyTier(BloodstainedShoes(tier), tier, 2);
        } else if (id == 29) {
            return applyTier(ShoesOfDusk(tier), tier, 2);
        } else if (id == 30) {
            return applyTier(ShadowBoots(tier), tier, 3);
        } else if (id == 31) {
            return applyTier(HeadmastersBoots(tier), tier, 3);
        } else if (id == 32) {
            return applyTier(ElvenBoots(tier), tier, 4);
        } else if (id == 33) {
            return applyTier(ChosensBoots(tier), tier, 4);
        } else if (id == 34) {
            return applyTier(ProphetsBoots(tier), tier, 5);
        } else if (id == 35) {
            return applyTier(EldersBoots(tier), tier, 6);
        } else if (id == 36) {
            return applyTier(AncientShoes(tier), tier, 7);
        } else if (id == 37) {
            return applyTier(MoonlightShoes(tier), tier, 9);
        } else if (id == 38) {
            return applyTier(SunlightShoes(tier), tier, 11);
        } else if (id == 39) {
            return applyTier(CycleShoes(tier), tier, 13);
        } else if (id == 40) {
            return applyTier(DemonicGreaves(tier), tier, 15);
        } else if (id == 41) {
            return applyTier(AngelicGreaves(tier), tier, 19);
        } else if (id == 42) {
            return applyTier(EternalGreaves(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersSandals(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 22;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Soldier's Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;

        // requirements here
        _greaves.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _greaves.requirement.classRequirement = classRequirement();

        //  _greaves.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});


        // bonuses here
        _greaves.statBonus = armorStats(0);
        _greaves.generatedStatBonus = armorGenStats(0);
        _greaves.elementalStats.ElementalDef = armorEle(0);
    }

    function ExecutionersSandals(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 23;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Executioner's Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 3;
        _greaves.requirement.classRequirement = classRequirement();
        //    _greaves.requirement.statRequirement = GameObjects.Stats({
        //    STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(1);
        _greaves.generatedStatBonus = armorGenStats(1);
        _greaves.elementalStats.ElementalDef = armorEle(1);
    }

    function HuntersSandals(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 24;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Knight's Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 8;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(2);
        _greaves.generatedStatBonus = armorGenStats(2);
        _greaves.elementalStats.ElementalDef = armorEle(2);
    }

    function RangerSandals(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 25;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Dwarven Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 13;
        _greaves.requirement.classRequirement = classRequirement();
        //  _greaves.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(3);
        _greaves.generatedStatBonus = armorGenStats(3);
        _greaves.elementalStats.ElementalDef = armorEle(3);
    }

    function MercenaryShoes(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 26;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Scale Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 18;
        _greaves.requirement.classRequirement = classRequirement();
        // _greaves.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(4);
        _greaves.generatedStatBonus = armorGenStats(4);
        _greaves.elementalStats.ElementalDef = armorEle(4);
    }

    function NobleShoes(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 27;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Winged Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 23;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //  DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(5);
        _greaves.generatedStatBonus = armorGenStats(5);
        _greaves.elementalStats.ElementalDef = armorEle(5);
    }

    function BloodstainedShoes(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 28;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Draconic Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 28;
        _greaves.requirement.classRequirement = classRequirement();
        //  _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //    LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(6);
        _greaves.generatedStatBonus = armorGenStats(6);
        _greaves.elementalStats.ElementalDef = armorEle(6);
    }

    function ShoesOfDusk(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 29;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Argent Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 33;
        _greaves.requirement.classRequirement = classRequirement();
        //  _greaves.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(7);
        _greaves.generatedStatBonus = armorGenStats(7);
        _greaves.elementalStats.ElementalDef = armorEle(7);
    }

    function ShadowBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 30;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Golden Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 38;
        _greaves.requirement.classRequirement = classRequirement();
        //  _greaves.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(8);
        _greaves.generatedStatBonus = armorGenStats(8);
        _greaves.elementalStats.ElementalDef = armorEle(8);
    }

    function HeadmastersBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 31;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Midas's Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 43;
        _greaves.requirement.classRequirement = classRequirement();
        //  _greaves.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(9);
        _greaves.generatedStatBonus = armorGenStats(9);
        _greaves.elementalStats.ElementalDef = armorEle(9);
    }

    function ElvenBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 32;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Juggernaut Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 48;
        _greaves.requirement.classRequirement = classRequirement();
        //  _greaves.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(10);
        _greaves.generatedStatBonus = armorGenStats(10);
        _greaves.elementalStats.ElementalDef = armorEle(10);
    }

    function ChosensBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 33;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Chosen's Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 53;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //    LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(11);
        _greaves.generatedStatBonus = armorGenStats(11);
        _greaves.elementalStats.ElementalDef = armorEle(11);
    }

    function ProphetsBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 34;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Templar Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 58;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(12);
        _greaves.generatedStatBonus = armorGenStats(12);
        _greaves.elementalStats.ElementalDef = armorEle(12);
    }

    function EldersBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 35;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Vanguard Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 63;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(13);
        _greaves.generatedStatBonus = armorGenStats(13);
        _greaves.elementalStats.ElementalDef = armorEle(13);
    }

    function AncientShoes(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 36;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Void Dweller Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 68;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(14);
        _greaves.generatedStatBonus = armorGenStats(14);
        _greaves.elementalStats.ElementalDef = armorEle(14);
    }

    function MoonlightShoes(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 37;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Sun Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 73;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(15);
        _greaves.generatedStatBonus = armorGenStats(15);
        _greaves.elementalStats.ElementalDef = armorEle(15);
    }

    function SunlightShoes(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 38;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Moon Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 78;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(16);
        _greaves.generatedStatBonus = armorGenStats(16);
        _greaves.elementalStats.ElementalDef = armorEle(16);
    }

    function CycleShoes(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 39;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Demonic Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 83;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(17);
        _greaves.generatedStatBonus = armorGenStats(17);
        _greaves.elementalStats.ElementalDef = armorEle(17);
    }

    function DemonicGreaves(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 40;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Angelic Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 88;
        _greaves.requirement.classRequirement = classRequirement();
        //   _greaves.requirement.statRequirement = GameObjects.Stats({
        //    STR : 0,
        //    DEX : 0,
        //    AGI : 0,
        //    INT : 0,
        //    VIT : 0,
        //    LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(18);
        _greaves.generatedStatBonus = armorGenStats(18);
        _greaves.elementalStats.ElementalDef = armorEle(18);
    }

    function AngelicGreaves(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 41;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Cycle Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 93;
        _greaves.requirement.classRequirement = classRequirement();
        //    _greaves.requirement.statRequirement = GameObjects.Stats({
        //    STR : 0,
        //    DEX : 0,
        //    AGI : 0,
        //    INT : 0,
        //    VIT : 0,
        //    LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(19);
        _greaves.generatedStatBonus = armorGenStats(19);
        _greaves.elementalStats.ElementalDef = armorEle(19);
    }

    function EternalGreaves(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _greaves) {
        _greaves.metadata.id = 42;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        //        _greaves.metadata.name = "Eternal Greaves";
        //        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 98;
        _greaves.requirement.classRequirement = classRequirement();
        //    _greaves.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //    DEX : 0,
        //    AGI : 0,
        //    INT : 0,
        //    VIT : 0,
        //    LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(20);
        _greaves.generatedStatBonus = armorGenStats(20);
        _greaves.elementalStats.ElementalDef = armorEle(20);
    }

    function armorStats(uint index) internal view returns (GameObjects_Stats.Stats memory) {
        GameObjects_Stats.Stats memory stats = GameObjects_Stats.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function armorEle(uint index) internal view returns (GameObjects_Stats.ElementalDef memory) {
        GameObjects_Stats.ElementalDef memory stats = GameObjects_Stats.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function armorGenStats(uint index) internal view returns (GameObjects_Stats.GeneratedStats memory) {
        GameObjects_Stats.GeneratedStats memory stats = GameObjects_Stats.GeneratedStats({
        HP : BASE_HP[index],
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : BASE_DEF[index],
        M_DEF : BASE_MDEF[index],
        ACCURACY : 0,
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
