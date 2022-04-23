import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexDaggers is Initializable {

    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_LUCK;
    uint[21] public BASE_ATK;
    uint[21] public BASE_CRIT;
    uint[21] public BASE_CRITMULTI;
    uint[21] public BASE_ACCURACY;

    function initialize() external initializer {
        initializeSTR();
        initializeAGI();
        initializeDEX();
        initializeLUCK();
        initializeATK();
        initializeCRIT();
        initializeCRITMULTI();
        initializeACCURACY();
    }

    function initializeSTR() public {
        BASE_STR = [9, 45, 90, 135, 180, 225, 270, 315, 360, 405, 450, 495, 540, 585, 630, 675, 720, 765, 810, 855, 900];
    }

    function initializeAGI() public {
        BASE_AGI = [2, 6, 11, 16, 21, 27, 32, 37, 42, 48, 53, 58, 63, 69, 74, 79, 84, 90, 95, 100, 105];
    }

    function initializeDEX() public {
        BASE_DEX = [2, 6, 11, 17, 22, 28, 33, 39, 44, 50, 55, 61, 66, 72, 77, 83, 88, 94, 99, 105, 110];
    }

    function initializeLUCK() public {
        BASE_LUCK = [3, 14, 27, 40, 53, 66, 79, 92, 105, 119, 132, 145, 158, 171, 184, 197, 210, 224, 237, 250, 263];
    }

    function initializeATK() public {
        BASE_AGI = [44, 53, 67, 84, 106, 133, 169, 206, 273, 348, 442, 563, 717, 914, 1165, 1485, 1895, 2418, 3084, 3935, 5020];
    }

    function initializeCRIT() public {
        BASE_CRIT = [8, 8, 8, 8, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 24, 26, 27, 29, 30, 32];
    }

    function initializeCRITMULTI() public {
        BASE_CRITMULTI = [120, 130, 142, 154, 168, 184, 200, 220, 240, 262, 288, 316, 320, 320, 320, 320, 320, 320, 320, 320, 320];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [147, 171, 206, 249, 301, 365, 441, 535, 649, 788, 957, 1163, 1413, 1717, 2088, 2539, 3087, 3753, 4565, 5553, 6755];
    }

    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "t");

        if (id == 22) {
            return applyTier(BreadKnife(tier), tier, 4);
        } else if (id == 23) {
            return applyTier(SilverDagger(tier), tier, 5);
        } else if (id == 24) {
            return applyTier(Twinkle(tier), tier, 5);
        } else if (id == 25) {
            return applyTier(Razor(tier), tier, 5);
        } else if (id == 26) {
            return applyTier(Quickblade(tier), tier, 5);
        } else if (id == 27) {
            return applyTier(GoldenStiletto(tier), tier, 5);
        } else if (id == 28) {
            return applyTier(ShadowsteelKris(tier), tier, 5);
        } else if (id == 29) {
            return applyTier(PocketKiller(tier), tier, 5);
        } else if (id == 30) {
            return applyTier(NightfallDagger(tier), tier, 5);
        } else if (id == 31) {
            return applyTier(Voidslasher(tier), tier, 5);
        } else if (id == 32) {
            return applyTier(DaggerOfMoonlight(tier), tier, 5);
        } else if (id == 33) {
            return applyTier(DaggerOfSunlight(tier), tier, 5);
        } else if (id == 34) {
            return applyTier(CycleDagger(tier), tier, 5);
        } else if (id == 35) {
            return applyTier(PhantasmalDagger(tier), tier, 5);
        } else if (id == 36) {
            return applyTier(DefilingRazor(tier), tier, 5);
        } else if (id == 37) {
            return applyTier(DaggerOfTheSuccubus(tier), tier, 5);
        } else if (id == 38) {
            return applyTier(Pyrodagger(tier), tier, 5);
        } else if (id == 39) {
            return applyTier(PointOfZero(tier), tier, 5);
        } else if (id == 40) {
            return applyTier(DaggerOfIncursion(tier), tier, 5);
        } else if (id == 41) {
            return applyTier(Kingmaker(tier), tier, 5);
        } else if (id == 42) {
            return applyTier(Blooddrainer(tier), tier, 5);
        }

        revert("?d");
    }

    function applyTier(GameObjects.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier + 1) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier + 1) * percentage);
        return weapon;
    }

    function BreadKnife(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Bread Knife";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;


        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[0],
        DEX : BASE_DEX[0],
        AGI : BASE_AGI[0],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[20]});

        _weapon.generatedStatBonus.P_ATK = BASE_ATK[0];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[0];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[0];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[0];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[0];
    }

    function SilverDagger(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 2;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Silver Dagger";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[1],
        DEX : BASE_DEX[1],
        AGI : BASE_AGI[1],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[1]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[1];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[1];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[1];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[1];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[1];
    }

    function Twinkle(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 3;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Twinkle";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[2],
        DEX : BASE_DEX[2],
        AGI : BASE_AGI[2],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[2]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[2];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[2];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[2];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[2];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[2];
    }

    function Razor(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 4;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Razor";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[3],
        DEX : BASE_DEX[3],
        AGI : BASE_AGI[3],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[3]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[3];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[3];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[3];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[3];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[3];
    }

    function Quickblade(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 5;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Quickblade";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[4]});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[4],
        DEX : BASE_DEX[4],
        AGI : BASE_AGI[4],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[4]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[4];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[4];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[4];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[4];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[4];
    }

    function GoldenStiletto(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 6;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Golden Stiletto";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[5],
        DEX : BASE_DEX[5],
        AGI : BASE_AGI[5],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[5]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[5];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[5];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[5];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[5];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[5];
    }

    function ShadowsteelKris(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 7;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Shadowsteel Kris";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[6],
        DEX : BASE_DEX[6],
        AGI : BASE_AGI[6],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[6]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[6];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[6];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[6];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[6];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[6];
    }

    function PocketKiller(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 8;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Pocket Killer";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[7],
        DEX : BASE_DEX[7],
        AGI : BASE_AGI[7],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[7]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[7];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[7];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[7];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[7];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[7];
    }

    function NightfallDagger(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 9;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Nightfall Dagger";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[8],
        DEX : BASE_DEX[8],
        AGI : BASE_AGI[8],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[8]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[8];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[8];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[8];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[8];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[8];
    }

    function Voidslasher(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 10;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Voidslasher";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[9],
        DEX : BASE_DEX[9],
        AGI : BASE_AGI[9],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[9]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[9];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[9];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[9];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[9];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[9];
    }

    function DaggerOfMoonlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 11;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Dagger of Moonlight";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[10],
        DEX : BASE_DEX[10],
        AGI : BASE_AGI[10],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[10]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[10];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[10];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[10];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[10];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[10];
    }

    function DaggerOfSunlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 12;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Dagger of Sunlight";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[11],
        DEX : BASE_DEX[11],
        AGI : BASE_AGI[11],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[11]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[11];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[11];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[11];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[11];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[11];
    }

    function CycleDagger(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 13;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Cycle Dagger";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[12],
        DEX : BASE_DEX[12],
        AGI : BASE_AGI[12],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[12]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[12];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[12];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[12];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[12];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[12];
    }

    function PhantasmalDagger(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 14;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Phantasmal Dagger";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[13],
        DEX : BASE_DEX[13],
        AGI : BASE_AGI[13],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[13]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[13];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[13];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[13];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[13];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[13];
    }

    function DefilingRazor(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 15;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Defiling Razor";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[14],
        DEX : BASE_DEX[14],
        AGI : BASE_AGI[14],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[14]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[14];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[14];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[14];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[14];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[14];
    }

    function DaggerOfTheSuccubus(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 16;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Dagger of the Succubus";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[15],
        DEX : BASE_DEX[15],
        AGI : BASE_AGI[15],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[15]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[15];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[15];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[15];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[15];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[15];
    }

    function Pyrodagger(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 17;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Pyrodagger";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[16],
        DEX : BASE_DEX[16],
        AGI : BASE_AGI[16],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[16]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[16];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[16];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[16];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[16];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[16];
    }

    function PointOfZero(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 18;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Point Of Zero";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[17],
        DEX : BASE_DEX[17],
        AGI : BASE_AGI[17],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[17]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[17];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[17];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[17];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[17];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[17];
    }

    function DaggerOfIncursion(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 20;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Dagger of Incursion";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[18],
        DEX : BASE_DEX[18],
        AGI : BASE_AGI[18],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[18]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[18];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[18];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[18];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[18];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[18];
    }

    function Kingmaker(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 21;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Kingmaker";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[19],
        DEX : BASE_DEX[19],
        AGI : BASE_AGI[19],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[19]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[19];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[19];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[19];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[19];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[19];
    }

    function Blooddrainer(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 22;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Blooddrainer";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Necromancer;

        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[20],
        DEX : BASE_DEX[20],
        AGI : BASE_AGI[20],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[20]});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[20];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[20];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[20];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[20];
        _weapon.generatedStatBonus.M_ATK = BASE_ATK[20];
    }
}
