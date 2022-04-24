import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexHelmetsHeavy is Initializable {
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
        _helmet.elementalStats.ElementalDef = helmetEle(percentage);
        _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_helmet.elementalStats, (tier) * percentage);
        return _helmet;
    }

    function helmet(uint id, uint tier) public view returns (GameObjects.Helmet memory) {
        require(tier < 10, "t");

        if (id == 1) {
            return applyTier(SoldiersHelmet(tier), tier, 1);
        } else if (id == 2) {
            return applyTier(ExecutionerHelmet(tier), tier, 1);
        } else if (id == 3) {
            return applyTier(KnightsHelmet(tier), tier, 1);
        } else if (id == 4) {
            return applyTier(DwarvenHelmet(tier), tier, 1);
        } else if (id == 5) {
            return applyTier(ScaleHelmet(tier), tier, 1);
        } else if (id == 6) {
            return applyTier(WingedHelmet(tier), tier, 2);
        } else if (id == 7) {
            return applyTier(DraconicHelmet(tier), tier, 2);
        } else if (id == 8) {
            return applyTier(ArgentHelmet(tier), tier, 2);
        } else if (id == 9) {
            return applyTier(GoldenHelmet(tier), tier, 3);
        } else if (id == 10) {
            return applyTier(MidassHelmet(tier), tier, 3);
        } else if (id == 11) {
            return applyTier(JuggernautHelmet(tier), tier, 4);
        } else if (id == 12) {
            return applyTier(ChosensHelmet(tier), tier, 4);
        } else if (id == 13) {
            return applyTier(TemplarHelmet(tier), tier, 5);
        } else if (id == 14) {
            return applyTier(VanguardHelmet(tier), tier, 6);
        } else if (id == 15) {
            return applyTier(VoidDwellerHelmet(tier), tier, 7);
        } else if (id == 16) {
            return applyTier(SunHelmet(tier), tier, 9);
        } else if (id == 17) {
            return applyTier(MoonHelmet(tier), tier, 11);
        } else if (id == 18) {
            return applyTier(DemonicHelmet(tier), tier, 13);
        } else if (id == 19) {
            return applyTier(AngelicHelmet(tier), tier, 15);
        } else if (id == 20) {
            return applyTier(CycleHelmet(tier), tier, 19);
        } else if (id == 21) {
            return applyTier(EternalHelmet(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 1;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Soldier's Helmet";
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
        _helmet.statBonus = helmetStats(0);
        _helmet.generatedStatBonus = helmetGenStats(0);
        _helmet.elementalStats.ElementalDef = helmetEle(0);
    }

    function ExecutionerHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 2;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Executioner's Helmet";
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
        _helmet.statBonus = helmetStats(1);
        _helmet.generatedStatBonus = helmetGenStats(1);
        _helmet.elementalStats.ElementalDef = helmetEle(1);
    }

    function KnightsHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 3;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Knight's Helmet";
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
        _helmet.statBonus = helmetStats(2);
        _helmet.generatedStatBonus = helmetGenStats(2);
        _helmet.elementalStats.ElementalDef = helmetEle(2);
    }

    function DwarvenHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 4;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Dwarven Helmet";
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
        _helmet.statBonus = helmetStats(3);
        _helmet.generatedStatBonus = helmetGenStats(3);
        _helmet.elementalStats.ElementalDef = helmetEle(3);
    }

    function ScaleHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 5;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Scale Helmet";
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
        _helmet.statBonus = helmetStats(4);
        _helmet.generatedStatBonus = helmetGenStats(4);
        _helmet.elementalStats.ElementalDef = helmetEle(4);
    }

    function WingedHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 6;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Winged Helmet";
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
        _helmet.statBonus = helmetStats(5);
        _helmet.generatedStatBonus = helmetGenStats(5);
        _helmet.elementalStats.ElementalDef = helmetEle(5);
    }

    function DraconicHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 7;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Draconic Helmet";
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
        _helmet.statBonus = helmetStats(6);
        _helmet.generatedStatBonus = helmetGenStats(6);
        _helmet.elementalStats.ElementalDef = helmetEle(6);
    }

    function ArgentHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 8;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Argent Helmet";
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
        _helmet.statBonus = helmetStats(7);
        _helmet.generatedStatBonus = helmetGenStats(7);
        _helmet.elementalStats.ElementalDef = helmetEle(7);
    }

    function GoldenHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 9;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Golden Helmet";
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
        _helmet.statBonus = helmetStats(8);
        _helmet.generatedStatBonus = helmetGenStats(8);
        _helmet.elementalStats.ElementalDef = helmetEle(8);
    }

    function MidassHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 10;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Midas's Helmet";
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
        _helmet.statBonus = helmetStats(9);
        _helmet.generatedStatBonus = helmetGenStats(9);
        _helmet.elementalStats.ElementalDef = helmetEle(9);
    }

    function JuggernautHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 11;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Juggernaut Helmet";
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
        _helmet.statBonus = helmetStats(10);
        _helmet.generatedStatBonus = helmetGenStats(10);
        _helmet.elementalStats.ElementalDef = helmetEle(10);
    }

    function ChosensHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 12;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Chosen's Helmet";
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
        _helmet.statBonus = helmetStats(11);
        _helmet.generatedStatBonus = helmetGenStats(11);
        _helmet.elementalStats.ElementalDef = helmetEle(11);
    }

    function TemplarHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 13;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Templar Helmet";
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
        _helmet.statBonus = helmetStats(12);
        _helmet.generatedStatBonus = helmetGenStats(12);
        _helmet.elementalStats.ElementalDef = helmetEle(12);
    }

    function VanguardHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 14;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Vanguard Helmet";
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
        _helmet.statBonus = helmetStats(13);
        _helmet.generatedStatBonus = helmetGenStats(13);
        _helmet.elementalStats.ElementalDef = helmetEle(13);
    }

    function VoidDwellerHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 15;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Void Dweller Helmet";
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
        _helmet.statBonus = helmetStats(14);
        _helmet.generatedStatBonus = helmetGenStats(14);
        _helmet.elementalStats.ElementalDef = helmetEle(14);
    }

    function SunHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 16;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Sun Helmet";
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
        _helmet.statBonus = helmetStats(15);
        _helmet.generatedStatBonus = helmetGenStats(15);
        _helmet.elementalStats.ElementalDef = helmetEle(15);
    }

    function MoonHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 17;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Moon Helmet";
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
        _helmet.statBonus = helmetStats(16);
        _helmet.generatedStatBonus = helmetGenStats(16);
        _helmet.elementalStats.ElementalDef = helmetEle(16);
    }

    function DemonicHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 18;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Demonic Helmet";
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
        _helmet.statBonus = helmetStats(17);
        _helmet.generatedStatBonus = helmetGenStats(17);
        _helmet.elementalStats.ElementalDef = helmetEle(17);
    }

    function AngelicHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 19;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Angelic Helmet";
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
        _helmet.statBonus = helmetStats(18);
        _helmet.generatedStatBonus = helmetGenStats(18);
        _helmet.elementalStats.ElementalDef = helmetEle(18);
    }

    function CycleHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 20;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Cycle Helmet";
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
        _helmet.statBonus = helmetStats(19);
        _helmet.generatedStatBonus = helmetGenStats(19);
        _helmet.elementalStats.ElementalDef = helmetEle(19);
    }

    function EternalHelmet(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 21;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
        _helmet.metadata.name = "Eternal Helmet";
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
        _helmet.statBonus = helmetStats(20);
        _helmet.generatedStatBonus = helmetGenStats(20);
        _helmet.elementalStats.ElementalDef = helmetEle(20);
    }

    function helmetStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function helmetEle(uint index) internal view returns (GameObjects.ElementalDef memory) {
        GameObjects.ElementalDef memory stats = GameObjects.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function helmetGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
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
