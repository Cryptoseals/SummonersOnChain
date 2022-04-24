import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexHelmetsMedium is Initializable {
    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_INT;
    uint[21] public BASE_DEX;
    uint[21] public BASE_VIT;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;
    uint[21] public BASE_ACCURACY;
    uint[21] public BASE_ELE_DEF;


    function initialize() external initializer {
        initializeSTR();
        initializeAGI();
        initializeDEX();
        initializeVIT();
        initializeDEF();
        initializeMDEF();
        initializeHP();
        initializeDODGE();
        initializeACCURACY();
        initializeELE_DEF();
    }

    function initializeSTR() public {
        BASE_STR = [2, 9, 17, 25, 33, 42, 50, 58, 66, 75, 83, 91, 99, 108, 116, 124, 132, 141, 149, 157, 165];
    }

    function initializeAGI() public {
        BASE_AGI = [2, 7, 14, 21, 27, 34, 41, 48, 54, 61, 68, 75, 81, 88, 95, 102, 108, 115, 122, 129, 135];
    }

    function initializeINT() public {
        BASE_INT = [4, 19, 38, 57, 76, 95, 114, 133, 152, 171, 190, 209, 228, 247, 266, 285, 304, 323, 342, 361, 380];
    }

    function initializeDEX() public {
        BASE_DEX = [1, 5, 9, 14, 18, 23, 27, 32, 36, 41, 45, 50, 54, 59, 63, 68, 72, 77, 81, 86, 90];
    }

    function initializeVIT() public {
        BASE_VIT = [7, 33, 66, 99, 132, 165, 198, 231, 264, 297, 330, 363, 396, 429, 462, 495, 528, 561, 594, 627, 660];
    }

    function initializeDEF() public {
        BASE_DEF = [24, 28, 34, 40, 48, 57, 69, 84, 101, 122, 148, 179, 217, 263, 319, 388, 471, 573, 696, 846, 1029];
    }

    function initializeMDEF() public {
        BASE_MDEF = [10, 12, 14, 16, 19, 23, 28, 33, 40, 49, 59, 71, 86, 104, 127, 154, 187, 227, 276, 335, 407];
    }

    function initializeHP() public {
        BASE_HP = [50, 250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000];
    }

    function initializeDODGE() public {
        BASE_DODGE = [45, 55, 70, 89, 113, 144, 183, 233, 297, 379, 483, 599, 787, 1004, 1281, 1634, 2085, 2661, 3396, 4334, 5530];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [22, 26, 31, 37, 45, 54, 65, 79, 96, 116, 141, 171, 208, 253, 307, 373, 454, 552, 671, 816, 993];
    }

    function initializeELE_DEF() public {
        BASE_ELE_DEF = [5, 5, 6, 7, 9, 10, 12, 15, 17, 21, 25, 31, 37, 45, 54, 66, 80, 97, 118, 143, 174];
    }


    function applyTier(GameObjects.Helmet memory _helmet, uint tier, uint percentage) public view returns (GameObjects.Helmet memory){
        if (tier == 0) return _helmet;
        _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_helmet.generatedStatBonus, (tier) * percentage);
        _helmet.elementalStats.ElementalDef = hoodieEle(percentage);
        _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_helmet.elementalStats, (tier) * percentage);
        return _helmet;
    }

    function helmet(uint id, uint tier) public view returns (GameObjects.Helmet memory) {
        require(tier < 10, "t");

        if (id == 1) {
            return applyTier(SoldiersHoodie(tier), tier, 1);
        } else if (id == 2) {
            return applyTier(ExecutionerHoodie(tier), tier, 1);
        } else if (id == 3) {
            return applyTier(KnightsHoodie(tier), tier, 1);
        } else if (id == 4) {
            return applyTier(DwarvenHoodie(tier), tier, 1);
        } else if (id == 5) {
            return applyTier(ScaleHoodie(tier), tier, 1);
        } else if (id == 6) {
            return applyTier(WingedHoodie(tier), tier, 2);
        } else if (id == 7) {
            return applyTier(DraconicHoodie(tier), tier, 2);
        } else if (id == 8) {
            return applyTier(ArgentHoodie(tier), tier, 2);
        } else if (id == 9) {
            return applyTier(GoldenHoodie(tier), tier, 3);
        } else if (id == 10) {
            return applyTier(MidassHoodie(tier), tier, 3);
        } else if (id == 11) {
            return applyTier(JuggernautHoodie(tier), tier, 4);
        } else if (id == 12) {
            return applyTier(ChosensHoodie(tier), tier, 4);
        } else if (id == 13) {
            return applyTier(TemplarHoodie(tier), tier, 5);
        } else if (id == 14) {
            return applyTier(VanguardHoodie(tier), tier, 6);
        } else if (id == 15) {
            return applyTier(VoidDwellerHoodie(tier), tier, 7);
        } else if (id == 16) {
            return applyTier(SunHoodie(tier), tier, 9);
        } else if (id == 17) {
            return applyTier(MoonHoodie(tier), tier, 11);
        } else if (id == 18) {
            return applyTier(DemonicHoodie(tier), tier, 13);
        } else if (id == 19) {
            return applyTier(AngelicHoodie(tier), tier, 15);
        } else if (id == 20) {
            return applyTier(CycleHoodie(tier), tier, 19);
        } else if (id == 21) {
            return applyTier(EternalHoodie(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 1;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Soldier's Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;

        // requirements here
        _helmet.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _helmet.statBonus = hoodieStats(0);
        _helmet.generatedStatBonus = hoodieGenStats(0);
        _helmet.elementalStats.ElementalDef = hoodieEle(0);
    }

    function ExecutionerHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 2;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Executioner's Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 5;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(1);
        _helmet.generatedStatBonus = hoodieGenStats(1);
        _helmet.elementalStats.ElementalDef = hoodieEle(1);
    }

    function KnightsHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 3;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Knight's Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 10;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(2);
        _helmet.generatedStatBonus = hoodieGenStats(2);
        _helmet.elementalStats.ElementalDef = hoodieEle(2);
    }

    function DwarvenHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 4;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Dwarven Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 15;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(3);
        _helmet.generatedStatBonus = hoodieGenStats(3);
        _helmet.elementalStats.ElementalDef = hoodieEle(3);
    }

    function ScaleHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 5;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Scale Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 20;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(4);
        _helmet.generatedStatBonus = hoodieGenStats(4);
        _helmet.elementalStats.ElementalDef = hoodieEle(4);
    }

    function WingedHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 6;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Winged Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 25;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(5);
        _helmet.generatedStatBonus = hoodieGenStats(5);
        _helmet.elementalStats.ElementalDef = hoodieEle(5);
    }

    function DraconicHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 7;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Draconic Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 30;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(6);
        _helmet.generatedStatBonus = hoodieGenStats(6);
        _helmet.elementalStats.ElementalDef = hoodieEle(6);
    }

    function ArgentHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 8;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Argent Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 35;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(7);
        _helmet.generatedStatBonus = hoodieGenStats(7);
        _helmet.elementalStats.ElementalDef = hoodieEle(7);
    }

    function GoldenHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 9;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Golden Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 40;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(8);
        _helmet.generatedStatBonus = hoodieGenStats(8);
        _helmet.elementalStats.ElementalDef = hoodieEle(8);
    }

    function MidassHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 10;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Midas's Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 45;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(9);
        _helmet.generatedStatBonus = hoodieGenStats(9);
        _helmet.elementalStats.ElementalDef = hoodieEle(9);
    }

    function JuggernautHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 11;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Juggernaut Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 50;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(10);
        _helmet.generatedStatBonus = hoodieGenStats(10);
        _helmet.elementalStats.ElementalDef = hoodieEle(10);
    }

    function ChosensHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 12;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Chosen's Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 55;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(11);
        _helmet.generatedStatBonus = hoodieGenStats(11);
        _helmet.elementalStats.ElementalDef = hoodieEle(11);
    }

    function TemplarHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 13;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Templar Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 60;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(12);
        _helmet.generatedStatBonus = hoodieGenStats(12);
        _helmet.elementalStats.ElementalDef = hoodieEle(12);
    }

    function VanguardHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 14;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Vanguard Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 65;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(13);
        _helmet.generatedStatBonus = hoodieGenStats(13);
        _helmet.elementalStats.ElementalDef = hoodieEle(13);
    }

    function VoidDwellerHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 15;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Void Dweller Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 70;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(14);
        _helmet.generatedStatBonus = hoodieGenStats(14);
        _helmet.elementalStats.ElementalDef = hoodieEle(14);
    }

    function SunHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 16;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Sun Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 75;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(15);
        _helmet.generatedStatBonus = hoodieGenStats(15);
        _helmet.elementalStats.ElementalDef = hoodieEle(15);
    }

    function MoonHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 17;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Moon Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 80;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(16);
        _helmet.generatedStatBonus = hoodieGenStats(16);
        _helmet.elementalStats.ElementalDef = hoodieEle(16);
    }

    function DemonicHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 18;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Demonic Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 85;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(17);
        _helmet.generatedStatBonus = hoodieGenStats(17);
        _helmet.elementalStats.ElementalDef = hoodieEle(17);
    }

    function AngelicHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 19;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Angelic Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 90;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(18);
        _helmet.generatedStatBonus = hoodieGenStats(18);
        _helmet.elementalStats.ElementalDef = hoodieEle(18);
    }

    function CycleHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 20;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Cycle Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 95;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(19);
        _helmet.generatedStatBonus = hoodieGenStats(19);
        _helmet.elementalStats.ElementalDef = hoodieEle(19);
    }

    function EternalHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 21;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Eternal Hoodie";
        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 100;
        _helmet.requirement.classRequirement = classRequirement();
        _helmet.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(20);
        _helmet.generatedStatBonus = hoodieGenStats(20);
        _helmet.elementalStats.ElementalDef = hoodieEle(20);
    }

    function hoodieStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function hoodieEle(uint index) internal view returns (GameObjects.ElementalDef memory) {
        GameObjects.ElementalDef memory stats = GameObjects.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function hoodieGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
        GameObjects.GeneratedStats memory stats = GameObjects.GeneratedStats({
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
        _reqClass[0] = GameObjects.Class.Barbarian;
        _reqClass[1] = GameObjects.Class.Paladin;
        _reqClass[2] = GameObjects.Class.Necromancer;
        return _reqClass;
    }
}
