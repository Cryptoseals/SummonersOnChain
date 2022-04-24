import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexBows is Initializable {

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
        BASE_AGI = [1, 3, 5, 8, 10, 13, 15, 18, 20, 23, 25, 28, 30, 33, 35, 38, 40, 43, 45, 48, 50];
    }

    function initializeDEX() public {
        BASE_DEX = [2, 6, 11, 17, 22, 28, 33, 39, 44, 50, 55, 61, 66, 72, 77, 83, 88, 94, 99, 105, 110];
    }

    function initializeLUCK() public {
        BASE_LUCK = [3, 14, 27, 40, 53, 66, 79, 92, 105, 119, 132, 145, 158, 171, 184, 197, 210, 224, 237, 250, 263];
    }

    function initializeATK() public {
        BASE_ATK = [44, 53, 67, 84, 106, 133, 169, 206, 273, 348, 442, 563, 717, 914, 1165, 1485, 1895, 2418, 3084, 3935, 5020];
    }

    function initializeCRIT() public {
        BASE_CRIT = [7, 7, 7, 7, 7, 8, 10, 11, 12, 14, 15, 16, 18, 19, 20, 22, 23, 24, 26, 27, 28];
    }

    function initializeCRITMULTI() public {
        BASE_CRITMULTI = [113, 122, 133, 144, 157, 172, 187, 205, 223, 245, 268, 294, 300, 300, 300, 300, 300, 300, 300, 300, 300];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [126, 146, 177, 214, 258, 313, 378, 459, 556, 676, 821, 997, 1211, 1472, 1790, 2176, 2646, 3217, 3913, 4760, 5790];
    }

    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "t");

        if (id == 43) {
            return applyTier(SimpleBow(tier), tier, 4);
        } else if (id == 44) {
            return applyTier(Crossbow(tier), tier, 5);
        } else if (id == 45) {
            return applyTier(GreatBow(tier), tier, 5);
        } else if (id == 46) {
            return applyTier(SteelBow(tier), tier, 5);
        } else if (id == 47) {
            return applyTier(RecurveCrossbow(tier), tier, 5);
        } else if (id == 48) {
            return applyTier(TitaniumCrossbow(tier), tier, 5);
        } else if (id == 49) {
            return applyTier(GoldenBow(tier), tier, 5);
        } else if (id == 50) {
            return applyTier(VerdantBow(tier), tier, 5);
        } else if (id == 51) {
            return applyTier(TemplarsCrossbow(tier), tier, 5);
        } else if (id == 52) {
            return applyTier(ElvenBow(tier), tier, 5);
        } else if (id == 53) {
            return applyTier(Moonbow(tier), tier, 5);
        } else if (id == 54) {
            return applyTier(Sunbow(tier), tier, 5);
        } else if (id == 55) {
            return applyTier(CycleBow(tier), tier, 5);
        } else if (id == 56) {
            return applyTier(PhantasmalBow(tier), tier, 5);
        } else if (id == 57) {
            return applyTier(AncientBow(tier), tier, 5);
        } else if (id == 58) {
            return applyTier(ObsidianCrossbow(tier), tier, 5);
        } else if (id == 59) {
            return applyTier(Ghostbolt(tier), tier, 5);
        } else if (id == 60) {
            return applyTier(SkeletalBolter(tier), tier, 5);
        } else if (id == 61) {
            return applyTier(Astrarrow(tier), tier, 5);
        } else if (id == 62) {
            return applyTier(Comet(tier), tier, 5);
        } else if (id == 63) {
            return applyTier(Deathwhisperer(tier), tier, 5);
        }

        revert("?b");
    }

    function applyTier(GameObjects.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function SimpleBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Simple Bow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;


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
    }

    function Crossbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 2;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Crossbow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function GreatBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 3;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Great Bow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function SteelBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 4;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Steel Bow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function RecurveCrossbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 5;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Recurve Crossbow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function TitaniumCrossbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 6;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Titanium Crossbow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function GoldenBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 7;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Golden Bow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function VerdantBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 8;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Verdant Bow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function TemplarsCrossbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 9;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Templar's Crossbow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function ElvenBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 10;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Elven Bow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function Moonbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 11;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Moonbow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function Sunbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 12;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Dagger of Sunlight";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function CycleBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 13;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Cycle Bow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function PhantasmalBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 14;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Phantasmal Bow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function AncientBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 15;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Ancient Bow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function ObsidianCrossbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 16;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Obsidian Crossbow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function Ghostbolt(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 17;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Ghostbolt";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function SkeletalBolter(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 18;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Skeletal Bolter";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function Astrarrow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 20;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Astrarrow";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function Comet(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 21;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Comet";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }

    function Deathwhisperer(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 22;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Deathwhisperer";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = new GameObjects.Class[](2);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Ranger;
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
    }
}
