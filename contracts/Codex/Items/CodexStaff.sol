import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexStaves is Initializable {

    uint[21] public BASE_INT;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_LUK;
    uint[21] public BASE_MATK;
    uint[21] public BASE_CRIT;
    uint[21] public BASE_CRITMULTI;
    uint[21] public BASE_ACCURACY;


    function initialize() external initializer {
        initializeINT();
        initializeAGI();
        initializeDEX();
        initializeLUK();
        initializeMATK();
        initializeCRIT();
        initializeCRITMULTI();
        initializeACCURACY();
    }

    function initializeINT() public {
        BASE_INT = [10, 48, 95, 143, 190, 238, 285, 333, 380, 428, 475, 523, 570, 618, 665, 713, 760, 808, 855, 903, 950];
    }

    function initializeAGI() public {
        BASE_AGI = [1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100];
    }

    function initializeDEX() public {
        BASE_DEX = [1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100];
    }

    function initializeLUK() public {
        BASE_LUK = [2, 7, 14, 20, 27, 33, 40, 46, 53, 60, 66, 73, 79, 86, 92, 99, 105, 112, 119, 125, 132];
    }

    function initializeMATK() public {
        BASE_MATK = [32, 39, 49, 61, 77, 97, 123, 150, 199, 253, 322, 410, 522, 665, 848, 1080, 1378, 1759, 2243, 2862, 3651];
    }

    function initializeCRIT() public {
        BASE_CRIT = [7, 7, 7, 7, 7, 8, 9, 10, 12, 13, 14, 15, 17, 18, 19, 20, 22, 23, 24, 25, 27];
    }

    function initializeCRITMULTI() public {
        BASE_CRITMULTI = [90, 98, 107, 116, 126, 138, 150, 164, 179, 197, 215, 236, 240, 240, 240, 240, 240, 240, 240, 240, 240];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [105, 122, 147, 178, 215, 261, 315, 382, 464, 563, 684, 831, 1009, 1226, 1491, 1813, 2205, 2681, 3261, 3966, 4825];
    }

    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "t");

        if (id == 85) {
            return applyTier(WoodenStaff(tier), tier, 4);
        } else if (id == 86) {
            return applyTier(MarbleStaff(tier), tier, 5);
        } else if (id == 87) {
            return applyTier(TotemicStaff(tier), tier, 5);
        } else if (id == 88) {
            return applyTier(AuraStaff(tier), tier, 5);
        } else if (id == 89) {
            return applyTier(BattleseenStaff(tier), tier, 5);
        } else if (id == 90) {
            return applyTier(WizardStaff(tier), tier, 5);
        } else if (id == 91) {
            return applyTier(RubyStaff(tier), tier, 5);
        } else if (id == 92) {
            return applyTier(VerdantStaff(tier), tier, 5);
        } else if (id == 93) {
            return applyTier(StarfallensStaff(tier), tier, 5);
        } else if (id == 94) {
            return applyTier(Lightbringer(tier), tier, 5);
        } else if (id == 95) {
            return applyTier(StaffOfMoonlight(tier), tier, 5);
        } else if (id == 96) {
            return applyTier(StaffOfSunlight(tier), tier, 5);
        } else if (id == 97) {
            return applyTier(CycleStaff(tier), tier, 5);
        } else if (id == 98) {
            return applyTier(PhantasmalStaff(tier), tier, 5);
        } else if (id == 99) {
            return applyTier(WarlocksStaff(tier), tier, 5);
        } else if (id == 100) {
            return applyTier(LuminescentStaff(tier), tier, 5);
        } else if (id == 101) {
            return applyTier(AncientElementalistsStaff(tier), tier, 5);
        } else if (id == 102) {
            return applyTier(Spellcatcher(tier), tier, 5);
        } else if (id == 103) {
            return applyTier(IncursionStaff(tier), tier, 5);
        } else if (id == 104) {
            return applyTier(EldersMark(tier), tier, 5);
        } else if (id == 105) {
            return applyTier(Soultrapper(tier), tier, 5);
        }

        revert("?st");
    }

    function applyTier(GameObjects.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier + 1) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier + 1) * percentage);
        return weapon;
    }

    function WoodenStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Wooden Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;


        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[0],
        AGI : BASE_AGI[0],
        INT : BASE_INT[0],
        VIT : 0,
        LUCK : BASE_LUK[0]});

        _weapon.generatedStatBonus.M_ATK = BASE_MATK[0];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[0];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[0];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[0];
    }

    function MarbleStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 2;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Marble Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[1],
        AGI : BASE_AGI[1],
        INT : BASE_INT[1],
        VIT : 0,
        LUCK : BASE_LUK[1]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[1];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[1];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[1];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[1];
    }

    function TotemicStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 3;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Totemic Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[2],
        AGI : BASE_AGI[2],
        INT : BASE_INT[2],
        VIT : 0,
        LUCK : BASE_LUK[2]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[2];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[2];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[2];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[2];
    }

    function AuraStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 4;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Aura Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[3],
        AGI : BASE_AGI[3],
        INT : BASE_INT[3],
        VIT : 0,
        LUCK : BASE_LUK[3]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[3];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[3];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[3];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[3];
    }

    function BattleseenStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 5;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Battleseen Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[4],
        AGI : BASE_AGI[4],
        INT : BASE_INT[4],
        VIT : 0,
        LUCK : BASE_LUK[4]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[4];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[4];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[4];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[4];
    }

    function WizardStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 6;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Wizard Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[5],
        AGI : BASE_AGI[5],
        INT : BASE_INT[5],
        VIT : 0,
        LUCK : BASE_LUK[5]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[5];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[5];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[5];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[5];
    }

    function RubyStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 7;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Ruby Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[6],
        AGI : BASE_AGI[6],
        INT : BASE_INT[6],
        VIT : 0,
        LUCK : BASE_LUK[6]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[6];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[6];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[6];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[6];
    }

    function VerdantStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 8;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Verdant Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[7],
        AGI : BASE_AGI[7],
        INT : BASE_INT[7],
        VIT : 0,
        LUCK : BASE_LUK[7]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[7];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[7];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[7];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[7];
    }

    function StarfallensStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 9;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Starfallen's Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[8],
        AGI : BASE_AGI[8],
        INT : BASE_INT[8],
        VIT : 0,
        LUCK : BASE_LUK[8]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[8];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[8];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[8];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[8];
    }

    function Lightbringer(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 10;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Lightbringer";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[9],
        AGI : BASE_AGI[9],
        INT : BASE_INT[9],
        VIT : 0,
        LUCK : BASE_LUK[9]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[9];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[9];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[9];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[9];
    }

    function StaffOfMoonlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 11;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Staff of Moonlight";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[10],
        AGI : BASE_AGI[10],
        INT : BASE_INT[10],
        VIT : 0,
        LUCK : BASE_LUK[10]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[10];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[10];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[10];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[10];
    }

    function StaffOfSunlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 12;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Staff of Sunlight";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[11],
        AGI : BASE_AGI[11],
        INT : BASE_INT[11],
        VIT : 0,
        LUCK : BASE_LUK[11]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[11];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[11];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[11];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[11];
    }

    function CycleStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 13;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Cycle Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[12],
        AGI : BASE_AGI[12],
        INT : BASE_INT[12],
        VIT : 0,
        LUCK : BASE_LUK[12]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[12];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[12];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[12];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[12];
    }

    function PhantasmalStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 14;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Phantasmal Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[13],
        AGI : BASE_AGI[13],
        INT : BASE_INT[13],
        VIT : 0,
        LUCK : BASE_LUK[13]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[13];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[13];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[13];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[13];
    }

    function WarlocksStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 15;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Warlock's Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[14],
        AGI : BASE_AGI[14],
        INT : BASE_INT[14],
        VIT : 0,
        LUCK : BASE_LUK[14]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[14];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[14];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[14];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[14];
    }

    function LuminescentStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 16;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Luminescent Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[15],
        AGI : BASE_AGI[15],
        INT : BASE_INT[15],
        VIT : 0,
        LUCK : BASE_LUK[15]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[15];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[15];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[15];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[15];
    }

    function AncientElementalistsStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 17;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Ancient Elementalist's Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[16],
        AGI : BASE_AGI[16],
        INT : BASE_INT[16],
        VIT : 0,
        LUCK : BASE_LUK[16]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[16];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[16];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[16];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[16];
    }

    function Spellcatcher(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 18;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Spellcatcher";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[17],
        AGI : BASE_AGI[17],
        INT : BASE_INT[17],
        VIT : 0,
        LUCK : BASE_LUK[17]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[17];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[17];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[17];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[17];
    }

    function IncursionStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 20;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Incursion Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[18],
        AGI : BASE_AGI[18],
        INT : BASE_INT[18],
        VIT : 0,
        LUCK : BASE_LUK[18]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[18];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[18];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[18];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[18];
    }

    function EldersMark(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 21;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Elder's Mark";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[19],
        AGI : BASE_AGI[19],
        INT : BASE_INT[19],
        VIT : 0,
        LUCK : BASE_LUK[19]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[19];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[19];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[19];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[19];
    }

    function Soultrapper(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 22;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Soultrapper";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[20],
        AGI : BASE_AGI[20],
        INT : BASE_INT[20],
        VIT : 0,
        LUCK : BASE_LUK[20]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[20];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[20];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[20];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[20];
    }
}
