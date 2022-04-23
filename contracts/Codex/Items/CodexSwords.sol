import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexSwords is Initializable {

    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_ATK;
    uint[21] public BASE_CRIT;
    uint[21] public BASE_CRITMULTI;
    uint[21] public BASE_ACCURACY;

    function initialize() external initializer {
        initializeSTR();
        initializeAGI();
        initializeDEX();
        initializeATK();
        initializeCRIT();
        initializeCRITMULTI();
        initializeACCURACY();
    }

    function initializeSTR() public {
        BASE_STR = [10, 48, 95, 142, 189, 237, 284, 331, 378, 426, 473, 520, 567, 615, 662, 709, 756, 804, 851, 898, 945];
    }

    function initializeAGI() public {
        BASE_AGI = [1, 3, 6, 9, 11, 14, 17, 20, 22, 25, 28, 31, 33, 36, 39, 42, 44, 47, 50, 53, 55];
    }

    function initializeDEX() public {
        BASE_DEX = [2, 6, 11, 16, 21, 27, 32, 37, 42, 48, 53, 58, 63, 69, 74, 79, 84, 90, 95, 100, 105];
    }

    function initializeATK() public {
        BASE_ATK = [44, 53, 67, 84, 106, 133, 169, 206, 273, 348, 442, 563, 717, 914, 1165, 1485, 1895, 2418, 3084, 3935, 5020];
    }

    function initializeCRIT() public {
        BASE_CRIT = [3, 3, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 12];
    }

    function initializeCRITMULTI() public {
        BASE_CRITMULTI = [90, 98, 106, 115, 126, 138, 150, 165, 180, 196, 216, 237, 240, 240, 240, 240, 240, 240, 240, 240, 240];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [126, 146, 177, 214, 258, 313, 378, 459, 556, 676, 821, 997, 1211, 1472, 1790, 2176, 2646, 3217, 3913, 4760, 5790];
    }

    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "t");

        if (id == 1) {
            return applyTier(WoodenSword(tier), tier, 4);
        } else if (id == 2) {
            return applyTier(SilverSword(tier), tier, 5);
        } else if (id == 3) {
            return applyTier(Katana(tier), tier, 5);
        } else if (id == 4) {
            return applyTier(Needle(tier), tier, 5);
        } else if (id == 5) {
            return applyTier(Scimitar(tier), tier, 5);
        } else if (id == 6) {
            return applyTier(Falchion(tier), tier, 5);
        } else if (id == 7) {
            return applyTier(EmeraldSword(tier), tier, 5);
        } else if (id == 8) {
            return applyTier(VerdantSword(tier), tier, 5);
        } else if (id == 9) {
            return applyTier(SwordOfTemplar(tier), tier, 5);
        } else if (id == 10) {
            return applyTier(HollowSword(tier), tier, 5);
        } else if (id == 11) {
            return applyTier(SwordOfMoonlight(tier), tier, 5);
        } else if (id == 12) {
            return applyTier(SwordOfSunlight(tier), tier, 5);
        } else if (id == 13) {
            return applyTier(Cycle(tier), tier, 5);
        } else if (id == 14) {
            return applyTier(PhantasmalSword(tier), tier, 5);
        } else if (id == 15) {
            return applyTier(GhostBreaker(tier), tier, 5);
        } else if (id == 16) {
            return applyTier(SwordOfTheUndeadKing(tier), tier, 5);
        } else if (id == 17) {
            return applyTier(Pyroblade(tier), tier, 5);
        } else if (id == 18) {
            return applyTier(PointOfNoReturn(tier), tier, 5);
        } else if (id == 19) {
            return applyTier(SwordOfIncursion(tier), tier, 5);
        } else if (id == 20) {
            return applyTier(Murasame(tier), tier, 5);
        } else if (id == 21) {
            return applyTier(Deathbringer(tier), tier, 5);
        }

        revert("?s");
    }

    function applyTier(GameObjects.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function WoodenSword(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Wooden Sword";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;


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
        LUCK : 0});

        _weapon.generatedStatBonus.P_ATK = BASE_ATK[0];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[0];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[0];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[0];
    }

    function SilverSword(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 2;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Silver Sword";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[1];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[1];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[1];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[1];
    }

    function Katana(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 3;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Katana";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[2];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[2];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[2];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[2];
    }

    function Needle(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 4;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Needle";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[3];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[3];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[3];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[3];
    }

    function Scimitar(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 5;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Scimitar";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[4],
        DEX : BASE_DEX[4],
        AGI : BASE_AGI[4],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[4];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[4];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[4];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[4];
    }

    function Falchion(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 6;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Falchion";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[5];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[5];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[5];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[5];
    }

    function EmeraldSword(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 7;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Emerald Sword";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[6];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[6];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[6];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[6];
    }

    function VerdantSword(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 8;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Verdant Sword";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[7];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[7];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[7];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[7];
    }

    function SwordOfTemplar(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 9;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Sword of Templar";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[8];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[8];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[8];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[8];
    }

    function HollowSword(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 10;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Hollow Sword";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[9];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[9];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[9];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[9];
    }

    function SwordOfMoonlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 11;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Sword of Moonlight";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[10];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[10];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[10];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[10];
    }

    function SwordOfSunlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 12;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Sword of Sunlight";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[11];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[11];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[11];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[11];
    }

    function Cycle(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 13;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Cycle";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[12];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[12];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[12];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[12];
    }

    function PhantasmalSword(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 14;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Phantasmal Sword";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[13];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[13];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[13];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[13];
    }

    function GhostBreaker(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 15;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Ghost Breaker";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[14];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[14];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[14];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[14];
    }

    function SwordOfTheUndeadKing(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 16;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Sword of the Undead King";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[15];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[15];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[15];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[15];
    }

    function Pyroblade(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 17;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Pyroblade";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[16];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[16];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[16];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[16];
    }

    function PointOfNoReturn(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 18;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Point Of No Return";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[17];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[17];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[17];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[17];
    }

    function SwordOfIncursion(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 20;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Sword of Incursion";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[18];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[18];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[18];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[18];
    }

    function Murasame(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 21;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Murasame";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[19];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[19];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[19];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[19];
    }

    function Deathbringer(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 22;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Deathbringer";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;
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
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[20];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[20];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[20];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[20];
    }
}
