import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexShields is Initializable {

    uint[21] public BASE_STR;
    uint[21] public BASE_ATK;
    uint[21] public BASE_VIT;
    uint[21] public BASE_HP;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_PDEF;
    uint[21] public BASE_ACCURACY;
    uint[21] public BASE_DODGE;

    function initialize(
        uint[21] memory _BASE_STR,
        uint[21] memory _BASE_ATK,
        uint[21] memory _BASE_VIT,
        uint[21] memory _BASE_HP,
        uint[21] memory _BASE_MDEF,
        uint[21] memory _BASE_PDEF,
        uint[21] memory _BASE_ACCURACY,
        uint[21] memory _BASE_DODGE
    ) external initializer {
        BASE_STR = _BASE_STR;
        BASE_ATK = _BASE_ATK;
        BASE_VIT = _BASE_VIT;
        BASE_HP = _BASE_HP;
        BASE_MDEF = _BASE_MDEF;
        BASE_PDEF = _BASE_PDEF;
        BASE_ACCURACY = _BASE_ACCURACY;
        BASE_DODGE = _BASE_DODGE;
    }


    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "t");

        if (id == 127) {
            return applyTier(SmallWoodenShield(tier), tier, 4);
        } else if (id == 128) {
            return applyTier(SmallCopperShield(tier), tier, 5);
        } else if (id == 129) {
            return applyTier(SmallBronzeShield(tier), tier, 5);
        } else if (id == 130) {
            return applyTier(MediumCopperShield(tier), tier, 5);
        } else if (id == 131) {
            return applyTier(MediumBronzeShield(tier), tier, 5);
        } else if (id == 132) {
            return applyTier(TitaniumShield(tier), tier, 5);
        } else if (id == 133) {
            return applyTier(ChitinShield(tier), tier, 5);
        } else if (id == 134) {
            return applyTier(ChromiumShield(tier), tier, 5);
        } else if (id == 135) {
            return applyTier(DarksteelShield(tier), tier, 5);
        } else if (id == 136) {
            return applyTier(TungstenShield(tier), tier, 5);
        } else if (id == 137) {
            return applyTier(Moonshield(tier), tier, 5);
        } else if (id == 138) {
            return applyTier(Sunshield(tier), tier, 5);
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

    function applyTier(GameObjects.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function SmallWoodenShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Small Wooden Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }

        _weapon.requirement.classRequirement = classRequirement();


        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
        _weapon.elementalStats.ElementalDef = weaponEle(1);
    }

    function SmallCopperShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 2;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Small Copper Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
        _weapon.elementalStats.ElementalDef = weaponEle(1);
    }

    function SmallBronzeShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 3;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Small Bronze Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
        _weapon.elementalStats.ElementalDef = weaponEle(2);
    }

    function MediumCopperShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 4;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Medium Copper Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
        _weapon.elementalStats.ElementalDef = weaponEle(3);
    }

    function MediumBronzeShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 5;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Medium Bronze Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
        _weapon.elementalStats.ElementalDef = weaponEle(4);
    }

    function TitaniumShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 6;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Titanium Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
        _weapon.elementalStats.ElementalDef = weaponEle(5);
    }

    function ChitinShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 7;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Chitin Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
        _weapon.elementalStats.ElementalDef = weaponEle(6);
    }

    function ChromiumShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 8;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Chromium Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
        _weapon.elementalStats.ElementalDef = weaponEle(7);
    }

    function DarksteelShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 9;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Darksteel Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
        _weapon.elementalStats.ElementalDef = weaponEle(8);
    }

    function TungstenShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 10;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Tungsten Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
        _weapon.elementalStats.ElementalDef = weaponEle(9);
    }

    function Moonshield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 11;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Moonshield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
        _weapon.elementalStats.ElementalDef = weaponEle(10);
    }

    function Sunshield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 12;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Sunshield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
        _weapon.elementalStats.ElementalDef = weaponEle(11);
    }

    function CycleShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 13;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Cycle Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
        _weapon.elementalStats.ElementalDef = weaponEle(12);
    }

    function PhantasmalShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 14;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Phantasmal Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
        _weapon.elementalStats.ElementalDef = weaponEle(13);
    }

    function HolyPaladinsShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 15;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Holy Paladin's Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
        _weapon.elementalStats.ElementalDef = weaponEle(14);
    }

    function LuminousShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 16;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Luminous Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
        _weapon.elementalStats.ElementalDef = weaponEle(15);
    }

    function ShieldOfCalamity(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 17;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Shield of Calamity";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
        _weapon.elementalStats.ElementalDef = weaponEle(16);
    }

    function Reflector(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 18;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Reflector";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;

        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
        _weapon.elementalStats.ElementalDef = weaponEle(17);
    }

    function EssenceCapacitorShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 20;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Essence Capacitor Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
        _weapon.elementalStats.ElementalDef = weaponEle(18);
    }

    function AetherealShield(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 21;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "Aethereal Shield";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
        _weapon.elementalStats.ElementalDef = weaponEle(19);
    }

    function TheProtector(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 22;
        _weapon.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _weapon.metadata.name = "TheProtector";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = classRequirement();
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = weaponStats(20);
        _weapon.generatedStatBonus = weaponGenStats(20);
        _weapon.elementalStats.ElementalDef = weaponEle(20);
    }

    function weaponEle(uint index) internal view returns (GameObjects.ElementalDef memory) {
        GameObjects.ElementalDef memory stats = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[index], EARTH_DEF : BASE_PDEF[index], COLD_DEF : BASE_PDEF[index], LIGHTNING_DEF : BASE_PDEF[index], DARK_DEF : BASE_PDEF[index], HOLY_DEF : BASE_PDEF[index], VOID_DEF : 0});
        return stats;
    }

    function weaponStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function weaponGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
        GameObjects.GeneratedStats memory stats = GameObjects.GeneratedStats({
        HP : BASE_HP[index],
        P_ATK : BASE_ATK[index],
        M_ATK : 0,
        P_DEF : BASE_PDEF[index],
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
