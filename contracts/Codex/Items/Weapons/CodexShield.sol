import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments} from "../../../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexShields is Initializable {

    uint[21] public BASE_STR;
    uint[21] public BASE_ATK;
    uint[21] public BASE_VIT;
    uint[21] public BASE_HP;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_PDEF;
    //    uint[21] public BASE_ACCURACY;
    uint[21] public BASE_DODGE;

    function initialize(
        uint[21] memory _BASE_STR,
        uint[21] memory _BASE_ATK,
        uint[21] memory _BASE_VIT,
        uint[21] memory _BASE_HP,
        uint[21] memory _BASE_MDEF,
        uint[21] memory _BASE_PDEF,
    //        uint[21] memory _BASE_ACCURACY,
        uint[21] memory _BASE_DODGE
    ) external initializer {
        BASE_STR = _BASE_STR;
        BASE_ATK = _BASE_ATK;
        BASE_VIT = _BASE_VIT;
        BASE_HP = _BASE_HP;
        BASE_MDEF = _BASE_MDEF;
        BASE_PDEF = _BASE_PDEF;
        //        BASE_ACCURACY = _BASE_ACCURACY;
        BASE_DODGE = _BASE_DODGE;
    }


    function weapon(uint id, uint tier) public view returns (GameObjects_Equipments.Weapon memory) {
        require(tier < 10, "t");

        if (id == 127) {
            return applyTier(SmallWoodenShield(tier), tier, 4);
        } else if (id == 128) {
            return applyTier(SmallCopperShield(tier), tier, 5);
        } else if (id == 129) {
            return applyTier(MediumCopperShield(tier), tier, 5);
        } else if (id == 130) {
            return applyTier(SmallTinShield(tier), tier, 5);
        } else if (id == 131) {
            return applyTier(MediumTinShield(tier), tier, 5);
        } else if (id == 132) {
            return applyTier(SilverShield(tier), tier, 5);
        } else if (id == 133) {
            return applyTier(GoldenShield(tier), tier, 5);
        } else if (id == 134) {
            return applyTier(MythrilShield(tier), tier, 5);
        } else if (id == 135) {
            return applyTier(DarksteelShield(tier), tier, 5);
        } else if (id == 136) {
            return applyTier(OricalchumShield(tier), tier, 5);
        } else if (id == 137) {
            return applyTier(MoonlightShield(tier), tier, 5);
        } else if (id == 138) {
            return applyTier(SunlightShield(tier), tier, 5);
        } else if (id == 139) {
            return applyTier(CycleShield(tier), tier, 5);
        } else if (id == 140) {
            return applyTier(PhantasmalShield(tier), tier, 5);
        } else if (id == 141) {
            return applyTier(HolyPaladinsShield(tier), tier, 5);
        } else if (id == 142) {
            return applyTier(LuminousShield(tier), tier, 5);
        } else if (id == 143) {
            return applyTier(ShieldOfCalamity(tier), tier, 5);
        } else if (id == 144) {
            return applyTier(Reflector(tier), tier, 5);
        } else if (id == 145) {
            return applyTier(EssenceCapacitorShield(tier), tier, 5);
        } else if (id == 146) {
            return applyTier(AetherealShield(tier), tier, 5);
        } else if (id == 147) {
            return applyTier(TheProtector(tier), tier, 5);
        }

        revert("?sh");
    }

    function applyTier(GameObjects_Equipments.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects_Equipments.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function SmallWoodenShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 127;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Small Wooden Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
        _weapon.elementalStats.ElementalDef = weaponEle(1);
    }

    function SmallCopperShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 128;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Small Copper Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 4;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
        _weapon.elementalStats.ElementalDef = weaponEle(1);
    }

    function MediumCopperShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 129;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Medium Copper Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 9;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
        _weapon.elementalStats.ElementalDef = weaponEle(2);
    }

    function SmallTinShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 130;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Small Tin Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 14;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
        _weapon.elementalStats.ElementalDef = weaponEle(3);
    }

    function MediumTinShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 131;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Medium Tin Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 19;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
        _weapon.elementalStats.ElementalDef = weaponEle(4);
    }

    function SilverShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 132;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        // _weapon.metadata.name = "Silver Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 24;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
        _weapon.elementalStats.ElementalDef = weaponEle(5);
    }

    function GoldenShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 133;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Chitin Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 29;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
        _weapon.elementalStats.ElementalDef = weaponEle(6);
    }

    function MythrilShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 134;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Mythril Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 34;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
        _weapon.elementalStats.ElementalDef = weaponEle(7);
    }

    function DarksteelShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 135;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //   _weapon.metadata.name = "Darksteel Shield";
        //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 39;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
        _weapon.elementalStats.ElementalDef = weaponEle(8);
    }

    function OricalchumShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 136;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Oricalchum Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 44;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
        _weapon.elementalStats.ElementalDef = weaponEle(9);
    }

    function MoonlightShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 137;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Moonlightshield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 49;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
        _weapon.elementalStats.ElementalDef = weaponEle(10);
    }

    function SunlightShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 138;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Sunlightshield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 54;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
        _weapon.elementalStats.ElementalDef = weaponEle(11);
    }

    function CycleShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 139;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Cycle Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 59;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
        _weapon.elementalStats.ElementalDef = weaponEle(12);
    }

    function PhantasmalShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 140;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Phantasmal Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 64;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
        _weapon.elementalStats.ElementalDef = weaponEle(13);
    }

    function HolyPaladinsShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 141;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Holy Paladin's Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 69;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
        _weapon.elementalStats.ElementalDef = weaponEle(14);
    }

    function LuminousShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 142;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Luminous Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 74;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
        _weapon.elementalStats.ElementalDef = weaponEle(15);
    }

    function ShieldOfCalamity(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 143;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Shield of Calamity";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 79;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
        _weapon.elementalStats.ElementalDef = weaponEle(16);
    }

    function Reflector(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 144;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Reflector";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 84;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
        _weapon.elementalStats.ElementalDef = weaponEle(17);
    }

    function EssenceCapacitorShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 145;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Essence Capacitor Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 89;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
        _weapon.elementalStats.ElementalDef = weaponEle(18);
    }

    function AetherealShield(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 146;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        //  _weapon.metadata.name = "Aethereal Shield";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 94;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
        _weapon.elementalStats.ElementalDef = weaponEle(19);
    }

    function TheProtector(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 147;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        // _weapon.metadata.name = "TheProtector";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 99;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(20);
        _weapon.generatedStatBonus = weaponGenStats(20);
        _weapon.elementalStats.ElementalDef = weaponEle(20);
    }

    function weaponEle(uint index) internal view returns (GameObjects_Stats.ElementalDef memory) {
        GameObjects_Stats.ElementalDef memory stats = GameObjects_Stats.ElementalDef({FIRE_DEF : BASE_PDEF[index], EARTH_DEF : BASE_PDEF[index], COLD_DEF : BASE_PDEF[index], LIGHTNING_DEF : BASE_PDEF[index], DARK_DEF : BASE_PDEF[index], HOLY_DEF : BASE_PDEF[index], VOID_DEF : 0});
        return stats;
    }

    function weaponStats(uint index) internal view returns (GameObjects_Stats.Stats memory) {
        GameObjects_Stats.Stats memory stats = GameObjects_Stats.Stats({
        STR : BASE_STR[index],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function weaponGenStats(uint index) internal view returns (GameObjects_Stats.GeneratedStats memory) {
        GameObjects_Stats.GeneratedStats memory stats = GameObjects_Stats.GeneratedStats({
        HP : BASE_HP[index],
        P_ATK : BASE_ATK[index],
        M_ATK : 0,
        P_DEF : BASE_PDEF[index],
        M_DEF : BASE_MDEF[index],
        ACCURACY : 0, //BASE_ACCURACY[index],
        DODGE : BASE_DODGE[index],
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });
        return stats;
    }

    function classRequirement() internal view returns (GameObjects.Class[] memory) {
        GameObjects.Class[] memory classRequirement = new GameObjects.Class[](7);
        classRequirement[0] = GameObjects.Class.Barbarian;
        classRequirement[1] = GameObjects.Class.Paladin;
        classRequirement[2] = GameObjects.Class.Wizard;
        classRequirement[3] = GameObjects.Class.Priest;
        classRequirement[4] = GameObjects.Class.Engineer;
        classRequirement[5] = GameObjects.Class.Necromancer;
        classRequirement[6] = GameObjects.Class.Ranger;
        return classRequirement;
    }
}
