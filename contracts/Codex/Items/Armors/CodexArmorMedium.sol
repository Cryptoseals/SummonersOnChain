import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexArmorsMedium is Initializable {
    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_VIT;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;


    function initialize() external initializer {
        initializeSTR();
        initializeAGI();
        initializeDEX();
        initializeVIT();
        initializeDEF();
        initializeMDEF();
        initializeHP();
        initializeDODGE();
    }

    function initializeSTR() public {
        BASE_STR = [2,8,15,22,29,36,43,50,57,65,72,79,86,93,100,107,114,122,129,136,143];
    }

    function initializeAGI() public {
        BASE_AGI = [2,6,11,16,21,27,32,37,42,48,53,58,63,69,74,79,84,90,95,100,105];
    }


    function initializeDEX() public {
        BASE_DEX = [2,9,18,26,35,44,52,61,69,78,87,95,104,113,121,130,138,147,156,164,173];
    }

    function initializeVIT() public {
        BASE_VIT = [11,53,105,158,210,263,315,368,420,473,525,578,630,683,735,788,840,893,945,998,1050];
    }

    function initializeDEF() public {
        BASE_DEF = [30,35,42,50,60,71,87,104,126,152,184,223,271,329,399,485,589,716,870,1058,1286];
    }

    function initializeMDEF() public {
        BASE_MDEF = [12, 14, 17, 20, 24, 29, 35, 42, 51, 61, 74, 90, 109, 132, 160, 194, 236, 287, 348, 423, 515];}

    function initializeHP() public {
        BASE_HP = [88, 438, 875, 1313, 1750, 2188, 2625, 3063, 3500, 3938, 4375, 4813, 5250, 5688, 6125, 6563, 7000, 7438, 7875, 8313, 8750];
    }

    function initializeDODGE() public {
        BASE_DODGE = [115, 140, 178, 226, 288, 367, 467, 596, 759, 968, 1235, 1529, 2010, 2564, 3272, 4175, 5328, 6800, 8677, 11074, 14132];}


    function applyTier(GameObjects.Armor memory _armor, uint tier, uint percentage) public view returns (GameObjects.Armor memory){
        if (tier == 0) return _armor;
        _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_armor.generatedStatBonus, (tier) * percentage);
        _armor.elementalStats.ElementalDef = armorEle(percentage);
        _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_armor.elementalStats, (tier) * percentage);
        return _armor;
    }

    function armor(uint id, uint tier) public view returns (GameObjects.Armor memory) {
        require(tier < 10, "t");

        if (id == 22) {
            return applyTier(SoldiersCoat(tier), tier, 1);
        } else if (id == 23) {
            return applyTier(ExecutionerCoat(tier), tier, 1);
        } else if (id == 24) {
            return applyTier(KnightsCoat(tier), tier, 1);
        } else if (id == 25) {
            return applyTier(DwarvenCoat(tier), tier, 1);
        } else if (id == 26) {
            return applyTier(ScaleCoat(tier), tier, 1);
        } else if (id == 27) {
            return applyTier(WingedCoat(tier), tier, 2);
        } else if (id == 28) {
            return applyTier(DraconicCoat(tier), tier, 2);
        } else if (id == 29) {
            return applyTier(ArgentCoat(tier), tier, 2);
        } else if (id == 30) {
            return applyTier(GoldenCoat(tier), tier, 3);
        } else if (id == 31) {
            return applyTier(MidassCoat(tier), tier, 3);
        } else if (id == 32) {
            return applyTier(JuggernautCoat(tier), tier, 4);
        } else if (id == 33) {
            return applyTier(ChosensCoat(tier), tier, 4);
        } else if (id == 34) {
            return applyTier(TemplarCoat(tier), tier, 5);
        } else if (id == 35) {
            return applyTier(VanguardCoat(tier), tier, 6);
        } else if (id == 36) {
            return applyTier(VoidDwellerCoat(tier), tier, 7);
        } else if (id == 37) {
            return applyTier(SunCoat(tier), tier, 9);
        } else if (id == 38) {
            return applyTier(MoonCoat(tier), tier, 11);
        } else if (id == 39) {
            return applyTier(DemonicCoat(tier), tier, 13);
        } else if (id == 40) {
            return applyTier(AngelicCoat(tier), tier, 15);
        } else if (id == 41) {
            return applyTier(CycleCoat(tier), tier, 19);
        } else if (id == 42) {
            return applyTier(EternalCoat(tier), tier, 20);
        }

        revert("?hm");
    }

    function SoldiersCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 1;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Soldier's Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;

        // requirements here
        _armor.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _armor.requirement.classRequirement = classRequirement();

        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _armor.statBonus = armorStats(0);
        _armor.generatedStatBonus = armorGenStats(0);
        _armor.elementalStats.ElementalDef = armorEle(0);
    }

    function ExecutionerCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 2;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Executioner's Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 5;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(1);
        _armor.generatedStatBonus = armorGenStats(1);
        _armor.elementalStats.ElementalDef = armorEle(1);
    }

    function KnightsCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 3;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Knight's Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 10;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(2);
        _armor.generatedStatBonus = armorGenStats(2);
        _armor.elementalStats.ElementalDef = armorEle(2);
    }

    function DwarvenCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 4;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Dwarven Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 15;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(3);
        _armor.generatedStatBonus = armorGenStats(3);
        _armor.elementalStats.ElementalDef = armorEle(3);
    }

    function ScaleCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 5;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Scale Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 20;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(4);
        _armor.generatedStatBonus = armorGenStats(4);
        _armor.elementalStats.ElementalDef = armorEle(4);
    }

    function WingedCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 6;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Winged Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 25;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(5);
        _armor.generatedStatBonus = armorGenStats(5);
        _armor.elementalStats.ElementalDef = armorEle(5);
    }

    function DraconicCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 7;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Draconic Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 30;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(6);
        _armor.generatedStatBonus = armorGenStats(6);
        _armor.elementalStats.ElementalDef = armorEle(6);
    }

    function ArgentCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 8;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Argent Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 35;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(7);
        _armor.generatedStatBonus = armorGenStats(7);
        _armor.elementalStats.ElementalDef = armorEle(7);
    }

    function GoldenCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 9;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Golden Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 40;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(8);
        _armor.generatedStatBonus = armorGenStats(8);
        _armor.elementalStats.ElementalDef = armorEle(8);
    }

    function MidassCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 10;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Midas's Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 45;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(9);
        _armor.generatedStatBonus = armorGenStats(9);
        _armor.elementalStats.ElementalDef = armorEle(9);
    }

    function JuggernautCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 11;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Juggernaut Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 50;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(10);
        _armor.generatedStatBonus = armorGenStats(10);
        _armor.elementalStats.ElementalDef = armorEle(10);
    }

    function ChosensCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 12;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Chosen's Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 55;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(11);
        _armor.generatedStatBonus = armorGenStats(11);
        _armor.elementalStats.ElementalDef = armorEle(11);
    }

    function TemplarCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 13;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Templar Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 60;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(12);
        _armor.generatedStatBonus = armorGenStats(12);
        _armor.elementalStats.ElementalDef = armorEle(12);
    }

    function VanguardCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 14;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Vanguard Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 65;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(13);
        _armor.generatedStatBonus = armorGenStats(13);
        _armor.elementalStats.ElementalDef = armorEle(13);
    }

    function VoidDwellerCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 15;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Void Dweller Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 70;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(14);
        _armor.generatedStatBonus = armorGenStats(14);
        _armor.elementalStats.ElementalDef = armorEle(14);
    }

    function SunCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 16;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Sun Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 75;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(15);
        _armor.generatedStatBonus = armorGenStats(15);
        _armor.elementalStats.ElementalDef = armorEle(15);
    }

    function MoonCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 17;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Moon Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 80;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(16);
        _armor.generatedStatBonus = armorGenStats(16);
        _armor.elementalStats.ElementalDef = armorEle(16);
    }

    function DemonicCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 18;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Demonic Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 85;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(17);
        _armor.generatedStatBonus = armorGenStats(17);
        _armor.elementalStats.ElementalDef = armorEle(17);
    }

    function AngelicCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 19;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Angelic Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 90;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(18);
        _armor.generatedStatBonus = armorGenStats(18);
        _armor.elementalStats.ElementalDef = armorEle(18);
    }

    function CycleCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 20;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Cycle Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 95;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(19);
        _armor.generatedStatBonus = armorGenStats(19);
        _armor.elementalStats.ElementalDef = armorEle(19);
    }

    function EternalCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 21;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Eternal Coat";
        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 100;
        _armor.requirement.classRequirement = classRequirement();
        _armor.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(20);
        _armor.generatedStatBonus = armorGenStats(20);
        _armor.elementalStats.ElementalDef = armorEle(20);
    }

    function armorStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : 0,
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function armorEle(uint index) internal view returns (GameObjects.ElementalDef memory) {
        GameObjects.ElementalDef memory stats = GameObjects.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function armorGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
        GameObjects.GeneratedStats memory stats = GameObjects.GeneratedStats({
        HP : BASE_HP[index],
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : BASE_DEF[index],
        M_DEF : BASE_MDEF[index],
        ACCURACY : 0,
        DODGE : BASE_DODGE[index],
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });
        return stats;
    }

    function classRequirement() internal view returns (GameObjects.Class[] memory) {
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](3);
        _reqClass[0] = GameObjects.Class.Assassin;
        _reqClass[1] = GameObjects.Class.Ranger;
        _reqClass[2] = GameObjects.Class.Engineer;
        return _reqClass;
    }
}
