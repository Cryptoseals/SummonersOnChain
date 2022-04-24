import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexHelmetsLight is Initializable {
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
    }

    function initializeSTR() public {
        BASE_STR = [2, 7, 14, 21, 27, 34, 41, 48, 54, 61, 68, 75, 81, 88, 95, 102, 108, 115, 122, 129, 135];
    }

    function initializeAGI() public {
        BASE_AGI = [1, 3, 6, 9, 11, 14, 17, 20, 22, 25, 28, 31, 33, 36, 39, 42, 44, 47, 50, 53, 55];
    }

    function initializeINT() public {
        BASE_INT = [6, 28, 55, 83, 110, 137, 165, 192, 220, 247, 274, 302, 329, 357, 384, 411, 439, 466, 494, 521, 548];
    }

    function initializeDEX() public {
        BASE_DEX = [2, 6, 11, 16, 21, 27, 32, 37, 42, 48, 53, 58, 63, 69, 74, 79, 84, 90, 95, 100, 105];
    }

    function initializeVIT() public {
        BASE_VIT = [6, 27, 54, 81, 108, 135, 162, 189, 216, 243, 270, 297, 324, 351, 378, 405, 432, 459, 486, 513, 540];
    }

    function initializeDEF() public {
        BASE_DEF = [17, 20, 24, 29, 34, 41, 49, 59, 72, 87, 105, 127, 154, 186, 226, 275, 334, 406, 493, 600, 729];
    }

    function initializeMDEF() public {
        BASE_MDEF = [18, 21, 25, 30, 36, 43, 52, 63, 76, 92, 111, 134, 163, 197, 240, 291, 354, 430, 522, 635, 772];
    }

    function initializeHP() public {
        BASE_HP = [50, 250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000];
    }

    function initializeDODGE() public {
        BASE_DODGE = [53, 64, 81, 104, 132, 168, 214, 272, 347, 442, 564, 698, 918, 1171, 1494, 1906, 2433, 3104, 3962, 5056, 6452];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [29, 34, 41, 49, 59, 72, 87, 105, 128, 155, 188, 228, 277, 337, 409, 498, 605, 736, 895, 1088, 1324];
    }


    function applyTier(GameObjects.Helmet memory _hat, uint tier, uint percentage) public view returns (GameObjects.Helmet memory){
        if (tier == 0) return _hat;
        _hat.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_hat.generatedStatBonus, (tier) * percentage);
        _hat.elementalStats.ElementalDef = helmetEle(percentage);
        _hat.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_hat.elementalStats, (tier) * percentage);
        return _hat;
    }

    function helmet(uint id, uint tier) public view returns (GameObjects.Helmet memory) {
        require(tier < 10, "t");

        if (id == 1) {
            return applyTier(SoldiersHat(tier), tier, 1);
        } else if (id == 2) {
            return applyTier(ExecutionerHat(tier), tier, 1);
        } else if (id == 3) {
            return applyTier(KnightsHat(tier), tier, 1);
        } else if (id == 4) {
            return applyTier(DwarvenHat(tier), tier, 1);
        } else if (id == 5) {
            return applyTier(ScaleHat(tier), tier, 1);
        } else if (id == 6) {
            return applyTier(WingedHat(tier), tier, 2);
        } else if (id == 7) {
            return applyTier(DraconicHat(tier), tier, 2);
        } else if (id == 8) {
            return applyTier(ArgentHat(tier), tier, 2);
        } else if (id == 9) {
            return applyTier(GoldenHat(tier), tier, 3);
        } else if (id == 10) {
            return applyTier(MidassHat(tier), tier, 3);
        } else if (id == 11) {
            return applyTier(JuggernautHat(tier), tier, 4);
        } else if (id == 12) {
            return applyTier(ChosensHat(tier), tier, 4);
        } else if (id == 13) {
            return applyTier(TemplarHat(tier), tier, 5);
        } else if (id == 14) {
            return applyTier(VanguardHat(tier), tier, 6);
        } else if (id == 15) {
            return applyTier(VoidDwellerHat(tier), tier, 7);
        } else if (id == 16) {
            return applyTier(SunHat(tier), tier, 9);
        } else if (id == 17) {
            return applyTier(MoonHat(tier), tier, 11);
        } else if (id == 18) {
            return applyTier(DemonicHat(tier), tier, 13);
        } else if (id == 19) {
            return applyTier(AngelicHat(tier), tier, 15);
        } else if (id == 20) {
            return applyTier(CycleHat(tier), tier, 19);
        } else if (id == 21) {
            return applyTier(EternalHat(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 1;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Soldier's Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;

        // requirements here
        _hat.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _hat.requirement.classRequirement = classRequirement();

        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _hat.statBonus = helmetStats(0);
        _hat.generatedStatBonus = helmetGenStats(0);
        _hat.elementalStats.ElementalDef = helmetEle(0);
    }

    function ExecutionerHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 2;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Executioner's Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 5;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(1);
        _hat.generatedStatBonus = helmetGenStats(1);
        _hat.elementalStats.ElementalDef = helmetEle(1);
    }

    function KnightsHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 3;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Knight's Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 10;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(2);
        _hat.generatedStatBonus = helmetGenStats(2);
        _hat.elementalStats.ElementalDef = helmetEle(2);
    }

    function DwarvenHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 4;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Dwarven Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 15;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(3);
        _hat.generatedStatBonus = helmetGenStats(3);
        _hat.elementalStats.ElementalDef = helmetEle(3);
    }

    function ScaleHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 5;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Scale Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 20;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(4);
        _hat.generatedStatBonus = helmetGenStats(4);
        _hat.elementalStats.ElementalDef = helmetEle(4);
    }

    function WingedHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 6;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Winged Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 25;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(5);
        _hat.generatedStatBonus = helmetGenStats(5);
        _hat.elementalStats.ElementalDef = helmetEle(5);
    }

    function DraconicHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 7;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Draconic Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 30;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(6);
        _hat.generatedStatBonus = helmetGenStats(6);
        _hat.elementalStats.ElementalDef = helmetEle(6);
    }

    function ArgentHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 8;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Argent Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 35;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(7);
        _hat.generatedStatBonus = helmetGenStats(7);
        _hat.elementalStats.ElementalDef = helmetEle(7);
    }

    function GoldenHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 9;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Golden Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 40;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(8);
        _hat.generatedStatBonus = helmetGenStats(8);
        _hat.elementalStats.ElementalDef = helmetEle(8);
    }

    function MidassHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 10;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Midas's Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 45;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(9);
        _hat.generatedStatBonus = helmetGenStats(9);
        _hat.elementalStats.ElementalDef = helmetEle(9);
    }

    function JuggernautHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 11;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Juggernaut Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 50;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(10);
        _hat.generatedStatBonus = helmetGenStats(10);
        _hat.elementalStats.ElementalDef = helmetEle(10);
    }

    function ChosensHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 12;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Chosen's Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 55;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(11);
        _hat.generatedStatBonus = helmetGenStats(11);
        _hat.elementalStats.ElementalDef = helmetEle(11);
    }

    function TemplarHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 13;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Templar Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 60;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(12);
        _hat.generatedStatBonus = helmetGenStats(12);
        _hat.elementalStats.ElementalDef = helmetEle(12);
    }

    function VanguardHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 14;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Vanguard Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 65;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(13);
        _hat.generatedStatBonus = helmetGenStats(13);
        _hat.elementalStats.ElementalDef = helmetEle(13);
    }

    function VoidDwellerHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 15;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Void Dweller Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 70;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(14);
        _hat.generatedStatBonus = helmetGenStats(14);
        _hat.elementalStats.ElementalDef = helmetEle(14);
    }

    function SunHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 16;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Sun Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 75;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(15);
        _hat.generatedStatBonus = helmetGenStats(15);
        _hat.elementalStats.ElementalDef = helmetEle(15);
    }

    function MoonHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 17;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Moon Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 80;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(16);
        _hat.generatedStatBonus = helmetGenStats(16);
        _hat.elementalStats.ElementalDef = helmetEle(16);
    }

    function DemonicHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 18;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Demonic Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 85;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(17);
        _hat.generatedStatBonus = helmetGenStats(17);
        _hat.elementalStats.ElementalDef = helmetEle(17);
    }

    function AngelicHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 19;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Angelic Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 90;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(18);
        _hat.generatedStatBonus = helmetGenStats(18);
        _hat.elementalStats.ElementalDef = helmetEle(18);
    }

    function CycleHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 20;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Cycle Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 95;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(19);
        _hat.generatedStatBonus = helmetGenStats(19);
        _hat.elementalStats.ElementalDef = helmetEle(19);
    }

    function EternalHat(uint tier) public view returns (GameObjects.Helmet memory _hat) {
        _hat.metadata.id = 21;
        _hat.metadata.baseType = GameObjects.ItemType.HELMET;
        _hat.metadata.name = "Eternal Hat";
        _hat.metadata.description = "";
        _hat.metadata.upgradable = true;
        _hat.requirement.level = 100;
        _hat.requirement.classRequirement = classRequirement();
        _hat.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _hat.statBonus = helmetStats(20);
        _hat.generatedStatBonus = helmetGenStats(20);
        _hat.elementalStats.ElementalDef = helmetEle(20);
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
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](2);
        _reqClass[0] = GameObjects.Class.Wizard;
        _reqClass[1] = GameObjects.Class.Priest;
        return _reqClass;
    }
}
