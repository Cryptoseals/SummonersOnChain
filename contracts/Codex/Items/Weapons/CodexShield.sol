import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, ElementalAtk, ElementalDef, Class, Weapon, Stats, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";
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


    function weapon(uint id, uint tier) public view returns (Weapon memory _weapon) {
        require(tier < 10, "t");
        Weapon memory base;

        if (id == 127) {
            _weapon = applyTier(SmallWoodenShield(tier), tier, 550);
            base = SmallWoodenShield(tier);
            //            _weapon.generatedStatBonus.CRIT_MULTIPLIER = base.generatedStatBonus.CRIT_MULTIPLIER + ((_weapon.generatedStatBonus.CRIT_MULTIPLIER * 12) / 100);
            _weapon.generatedStatBonus.ACCURACY = base.generatedStatBonus.ACCURACY + ((_weapon.generatedStatBonus.ACCURACY * 10) / 1000);
            _weapon.generatedStatBonus.DODGE = base.generatedStatBonus.DODGE + ((_weapon.generatedStatBonus.DODGE * 10) / 1000);
            _weapon.generatedStatBonus.P_ATK = base.generatedStatBonus.P_ATK + ((_weapon.generatedStatBonus.P_ATK * 10) / 1000);
            _weapon.generatedStatBonus.P_DEF = base.generatedStatBonus.P_DEF + ((_weapon.generatedStatBonus.P_DEF * 15) / 1000);
            _weapon.generatedStatBonus.M_DEF = base.generatedStatBonus.M_DEF + ((_weapon.generatedStatBonus.M_DEF * 15) / 1000);

            _weapon.statBonus.STR = base.statBonus.STR + ((_weapon.statBonus.STR * 350) / 1000);
            _weapon.statBonus.VIT = base.statBonus.VIT + ((_weapon.statBonus.VIT * 350) / 1000);
            //            _weapon.generatedStatBonus.HP = base.generatedStatBonus.HP + (_weapon.generatedStatBonus.HP * 10) / 1000;
        } else if (id == 128) {
            _weapon = applyTier(SmallCopperShield(tier), tier, 150);
        } else if (id == 129) {
            _weapon = applyTier(MediumCopperShield(tier), tier, 70);
        } else if (id == 130) {
            _weapon = applyTier(SmallTinShield(tier), tier, 50);
        } else if (id == 131) {
            _weapon = applyTier(MediumTinShield(tier), tier, 36);
        } else if (id == 132) {
            _weapon = applyTier(SilverShield(tier), tier, 28);
        } else if (id == 133) {
            _weapon = applyTier(GoldenShield(tier), tier, 25);
        } else if (id == 134) {
            _weapon = applyTier(MythrilShield(tier), tier, 21);
        } else if (id == 135) {
            _weapon = applyTier(DarksteelShield(tier), tier, 18);
        } else if (id == 136) {
            _weapon = applyTier(OricalchumShield(tier), tier, 15);
        } else if (id == 137) {
            _weapon = applyTier(MoonlightShield(tier), tier, 15);
        } else if (id == 138) {
            _weapon = applyTier(SunlightShield(tier), tier, 12);
        } else if (id == 139) {
            _weapon = applyTier(CycleShield(tier), tier, 12);
        } else if (id == 140) {
            _weapon = applyTier(PhantasmalShield(tier), tier, 12);
        } else if (id == 141) {
            _weapon = applyTier(HolyPaladinsShield(tier), tier, 10);
        } else if (id == 142) {
            _weapon = applyTier(LuminousShield(tier), tier, 10);
        } else if (id == 143) {
            _weapon = applyTier(ShieldOfCalamity(tier), tier, 9);
        } else if (id == 144) {
            _weapon = applyTier(Reflector(tier), tier, 8);
        } else if (id == 145) {
            _weapon = applyTier(EssenceCapacitorShield(tier), tier, 8);
        } else if (id == 146) {
            _weapon = applyTier(AetherealShield(tier), tier, 7);
        } else if (id == 147) {
            _weapon = applyTier(TheProtector(tier), tier, 7);
        } else {
            revert("?sh");
        }

    }

    function applyTier(Weapon memory weapon, uint tier, uint percentage) public view returns (Weapon memory){
        if (tier == 0) return weapon;
        weapon.statBonus = EquipableUtils.sumStatsAsTier(weapon.statBonus, tier * percentage);
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function SmallWoodenShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 127;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(0);
        _weapon.generatedStatBonus = weaponGenStats(0);
        _weapon.elementalStats.ElementalDef = weaponEle(0);
    }

    function SmallCopperShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 128;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 4;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
        _weapon.elementalStats.ElementalDef = weaponEle(1);
    }

    function MediumCopperShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 129;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 9;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
        _weapon.elementalStats.ElementalDef = weaponEle(2);
    }

    function SmallTinShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 130;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 14;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
        _weapon.elementalStats.ElementalDef = weaponEle(3);
    }

    function MediumTinShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 131;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 19;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
        _weapon.elementalStats.ElementalDef = weaponEle(4);
    }

    function SilverShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 132;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 24;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
        _weapon.elementalStats.ElementalDef = weaponEle(5);
    }

    function GoldenShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 133;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 29;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
        _weapon.elementalStats.ElementalDef = weaponEle(6);
    }

    function MythrilShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 134;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 34;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
        _weapon.elementalStats.ElementalDef = weaponEle(7);
    }

    function DarksteelShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 135;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 39;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
        _weapon.elementalStats.ElementalDef = weaponEle(8);
    }

    function OricalchumShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 136;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 44;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
        _weapon.elementalStats.ElementalDef = weaponEle(9);
    }

    function MoonlightShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 137;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 49;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
        _weapon.elementalStats.ElementalDef = weaponEle(10);
    }

    function SunlightShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 138;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 54;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
        _weapon.elementalStats.ElementalDef = weaponEle(11);
    }

    function CycleShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 139;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 59;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
        _weapon.elementalStats.ElementalDef = weaponEle(12);
    }

    function PhantasmalShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 140;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 64;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
        _weapon.elementalStats.ElementalDef = weaponEle(13);
    }

    function HolyPaladinsShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 141;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 69;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
        _weapon.elementalStats.ElementalDef = weaponEle(14);
    }

    function LuminousShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 142;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 74;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
        _weapon.elementalStats.ElementalDef = weaponEle(15);
    }

    function ShieldOfCalamity(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 143;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 79;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
        _weapon.elementalStats.ElementalDef = weaponEle(16);
    }

    function Reflector(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 144;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 84;

        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
        _weapon.elementalStats.ElementalDef = weaponEle(17);
    }

    function EssenceCapacitorShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 145;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 89;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
        _weapon.elementalStats.ElementalDef = weaponEle(18);
    }

    function AetherealShield(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 146;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 94;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
        _weapon.elementalStats.ElementalDef = weaponEle(19);
    }

    function TheProtector(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 147;
        _weapon.metadata.baseType = ItemType.OFFHAND;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 99;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(20);
        _weapon.generatedStatBonus = weaponGenStats(20);
        _weapon.elementalStats.ElementalDef = weaponEle(20);
    }

    function weaponEle(uint index) internal view returns (ElementalDef memory) {
        ElementalDef memory stats = ElementalDef({FIRE_DEF : BASE_PDEF[index], EARTH_DEF : BASE_PDEF[index], COLD_DEF : BASE_PDEF[index], LIGHTNING_DEF : BASE_PDEF[index], DARK_DEF : BASE_PDEF[index], HOLY_DEF : BASE_PDEF[index], VOID_DEF : 0});
        return stats;
    }

    function weaponStats(uint index) internal view returns (Stats memory) {
        Stats memory stats = Stats({
        STR : BASE_STR[index],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function weaponGenStats(uint index) internal view returns (GeneratedStats memory) {
        GeneratedStats memory stats = GeneratedStats({
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

    function classRequirement() internal view returns (Class[] memory) {
        Class[] memory classRequirement = new Class[](7);
        classRequirement[0] = Class.Barbarian;
        classRequirement[1] = Class.Paladin;
        classRequirement[2] = Class.Wizard;
        classRequirement[3] = Class.Priest;
        classRequirement[4] = Class.Engineer;
        classRequirement[5] = Class.Necromancer;
        classRequirement[6] = Class.Ranger;
        return classRequirement;
    }
}
