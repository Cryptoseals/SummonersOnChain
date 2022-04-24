import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexShields is Initializable {

    uint[21] public BASE_STR;
    uint[21] public BASE_VIT;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_PDEF;
    uint[21] public BASE_ACCURACY;
    uint[21] public BASE_DODGE;

    function initialize() external initializer {
        initializeVIT();
        initializeSTR();
        initializeDODGE();
        initializeMDEF();
        initializePDEF();
        initializeACCURACY();
    }

    function initializeVIT() public {
        BASE_VIT = [1, 5, 9, 13, 17, 22, 26, 30, 34, 39, 43, 47, 51, 56, 60, 64, 68, 73, 77, 81, 85];
    }

    function initializeSTR() public {
        BASE_STR = [7, 33, 66, 99, 132, 165, 198, 231, 264, 297, 330, 363, 396, 429, 462, 495, 528, 561, 594, 627, 660];
    }

    function initializeDODGE() public {
        BASE_DODGE = [68, 82, 105, 133, 169, 215, 274, 350, 446, 568, 725, 898, 1180, 1505, 1921, 2451, 3128, 3991, 5093, 6500, 8295];
    }

    function initializeMDEF() public {
        BASE_MDEF = [12, 14, 17, 20, 24, 29, 35, 42, 51, 61, 74, 90, 109, 132, 160, 194, 236, 287, 348, 423, 515];
    }

    function initializePDEF() public {
        BASE_PDEF = [24, 28, 34, 40, 48, 57, 69, 84, 101, 122, 148, 179, 217, 263, 319, 388, 471, 573, 696, 846, 1029];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [48, 56, 68, 82, 99, 119, 144, 175, 212, 258, 313, 380, 462, 561, 682, 829, 1008, 1226, 1491, 1813, 2206];
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[1],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[1],
        LUCK : 0});

        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[0];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[0];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[0];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[0], EARTH_DEF : BASE_PDEF[0], COLD_DEF : BASE_PDEF[0], LIGHTNING_DEF : BASE_PDEF[0], DARK_DEF : BASE_PDEF[0], HOLY_DEF : BASE_PDEF[0], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[1],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[1],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[1];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[1];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[1];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[1], EARTH_DEF : BASE_PDEF[1], COLD_DEF : BASE_PDEF[1], LIGHTNING_DEF : BASE_PDEF[1], DARK_DEF : BASE_PDEF[1], HOLY_DEF : BASE_PDEF[1], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[2],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[2],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[2];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[2];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[2];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[2], EARTH_DEF : BASE_PDEF[2], COLD_DEF : BASE_PDEF[2], LIGHTNING_DEF : BASE_PDEF[2], DARK_DEF : BASE_PDEF[2], HOLY_DEF : BASE_PDEF[2], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[3],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[3],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[3];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[3];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[3];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[3], EARTH_DEF : BASE_PDEF[3], COLD_DEF : BASE_PDEF[3], LIGHTNING_DEF : BASE_PDEF[3], DARK_DEF : BASE_PDEF[3], HOLY_DEF : BASE_PDEF[3], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[4],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[4],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[4];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[4];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[4];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[4], EARTH_DEF : BASE_PDEF[4], COLD_DEF : BASE_PDEF[4], LIGHTNING_DEF : BASE_PDEF[4], DARK_DEF : BASE_PDEF[4], HOLY_DEF : BASE_PDEF[4], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[5],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[5],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[5];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[5];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[5];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[5], EARTH_DEF : BASE_PDEF[5], COLD_DEF : BASE_PDEF[5], LIGHTNING_DEF : BASE_PDEF[5], DARK_DEF : BASE_PDEF[5], HOLY_DEF : BASE_PDEF[5], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[6],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[6],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[6];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[6];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[6];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[6], EARTH_DEF : BASE_PDEF[6], COLD_DEF : BASE_PDEF[6], LIGHTNING_DEF : BASE_PDEF[6], DARK_DEF : BASE_PDEF[6], HOLY_DEF : BASE_PDEF[6], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[7],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[7],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[7];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[7];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[7];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[7], EARTH_DEF : BASE_PDEF[7], COLD_DEF : BASE_PDEF[7], LIGHTNING_DEF : BASE_PDEF[7], DARK_DEF : BASE_PDEF[7], HOLY_DEF : BASE_PDEF[7], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[8],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[8],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[8];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[8];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[8];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[8], EARTH_DEF : BASE_PDEF[8], COLD_DEF : BASE_PDEF[8], LIGHTNING_DEF : BASE_PDEF[8], DARK_DEF : BASE_PDEF[8], HOLY_DEF : BASE_PDEF[8], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[9],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[9],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[9];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[9];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[9];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[9], EARTH_DEF : BASE_PDEF[9], COLD_DEF : BASE_PDEF[9], LIGHTNING_DEF : BASE_PDEF[9], DARK_DEF : BASE_PDEF[9], HOLY_DEF : BASE_PDEF[9], VOID_DEF :0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[10],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[10],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[10];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[10];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[10];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[10], EARTH_DEF : BASE_PDEF[10], COLD_DEF : BASE_PDEF[10], LIGHTNING_DEF : BASE_PDEF[10], DARK_DEF : BASE_PDEF[10], HOLY_DEF : BASE_PDEF[10], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[11],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[11],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[11];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[11];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[11];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[11], EARTH_DEF : BASE_PDEF[11], COLD_DEF : BASE_PDEF[11], LIGHTNING_DEF : BASE_PDEF[11], DARK_DEF : BASE_PDEF[11], HOLY_DEF : BASE_PDEF[11], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[12],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[12],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[12];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[12];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[12];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[12], EARTH_DEF : BASE_PDEF[12], COLD_DEF : BASE_PDEF[12], LIGHTNING_DEF : BASE_PDEF[12], DARK_DEF : BASE_PDEF[12], HOLY_DEF : BASE_PDEF[12], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[13],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[13],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[13];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[13];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[13];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[13], EARTH_DEF : BASE_PDEF[13], COLD_DEF : BASE_PDEF[13], LIGHTNING_DEF : BASE_PDEF[13], DARK_DEF : BASE_PDEF[13], HOLY_DEF : BASE_PDEF[13], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[14],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[14],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[14];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[14];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[14];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[14], EARTH_DEF : BASE_PDEF[14], COLD_DEF : BASE_PDEF[14], LIGHTNING_DEF : BASE_PDEF[14], DARK_DEF : BASE_PDEF[14], HOLY_DEF : BASE_PDEF[14], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[15],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[15],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[15];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[15];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[15];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[15], EARTH_DEF : BASE_PDEF[15], COLD_DEF : BASE_PDEF[15], LIGHTNING_DEF : BASE_PDEF[15], DARK_DEF : BASE_PDEF[15], HOLY_DEF : BASE_PDEF[15], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[16],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[16],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[16];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[16];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[16];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[16], EARTH_DEF : BASE_PDEF[16], COLD_DEF : BASE_PDEF[16], LIGHTNING_DEF : BASE_PDEF[16], DARK_DEF : BASE_PDEF[16], HOLY_DEF : BASE_PDEF[16], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[17],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[17],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[17];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[17];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[17];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[17], EARTH_DEF : BASE_PDEF[17], COLD_DEF : BASE_PDEF[17], LIGHTNING_DEF : BASE_PDEF[17], DARK_DEF : BASE_PDEF[17], HOLY_DEF : BASE_PDEF[17], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[18],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[18],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[18];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[18];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[18];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[18], EARTH_DEF : BASE_PDEF[18], COLD_DEF : BASE_PDEF[18], LIGHTNING_DEF : BASE_PDEF[18], DARK_DEF : BASE_PDEF[18], HOLY_DEF : BASE_PDEF[18], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[19],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[19],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[19];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[19];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[19];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[19], EARTH_DEF : BASE_PDEF[19], COLD_DEF : BASE_PDEF[19], LIGHTNING_DEF : BASE_PDEF[19], DARK_DEF : BASE_PDEF[19], HOLY_DEF : BASE_PDEF[19], VOID_DEF : 0});
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
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[20],
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : BASE_VIT[20],
        LUCK : 0});
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[20];
        _weapon.generatedStatBonus.M_DEF = BASE_MDEF[20];
        _weapon.generatedStatBonus.P_DEF = BASE_PDEF[20];
        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_PDEF[20], EARTH_DEF : BASE_PDEF[20], COLD_DEF : BASE_PDEF[20], LIGHTNING_DEF : BASE_PDEF[20], DARK_DEF : BASE_PDEF[20], HOLY_DEF : BASE_PDEF[20], VOID_DEF : 0});
    }

    function classRequirement () internal view returns(GameObjects.Class[] memory) {
        GameObjects.Class[] memory classRequirement = new GameObjects.Class[](7);
        classRequirement[0] = GameObjects.Class.Barbarian;
        classRequirement[1] = GameObjects.Class.Paladin;


        classRequirement[3] = GameObjects.Class.Wizard;
        classRequirement[4] = GameObjects.Class.Priest;
        classRequirement[5] = GameObjects.Class.Engineer;
        classRequirement[6] = GameObjects.Class.Necromancer;
        return classRequirement;
    }
}
