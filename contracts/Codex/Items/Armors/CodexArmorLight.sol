import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexArmorsLight is Initializable {
    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_INT;
    uint[21] public BASE_VIT;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;


    function initialize() external initializer {
        initializeSTR();
        initializeAGI();
        initializeINT();
        initializeDEX();
        initializeVIT();
        initializeDEF();
        initializeMDEF();
        initializeHP();
        initializeDODGE();
    }

    function initializeSTR() public {
        BASE_STR = [2, 7, 14, 21, 27, 34, 41, 48, 54, 61, 68, 75, 81, 88, 95, 102, 108, 115, 122, 129, 135];
    }

    function initializeAGI() public {
        BASE_AGI = [2, 6, 11, 17, 22, 28, 33, 39, 44, 50, 55, 61, 66, 72, 77, 83, 88, 94, 99, 105, 110];
    }

    function initializeINT() public {
        BASE_INT = [3, 14, 28, 42, 55, 69, 83, 96, 110, 124, 137, 151, 165, 179, 192, 206, 220, 233, 247, 261, 274];
    }

    function initializeDEX() public {
        BASE_DEX = [2, 8, 16, 24, 32, 40, 48, 56, 63, 71, 79, 87, 95, 103, 111, 119, 126, 134, 142, 150, 158];
    }

    function initializeVIT() public {
        BASE_VIT = [10, 48, 95, 142, 189, 237, 284, 331, 378, 426, 473, 520, 567, 615, 662, 709, 756, 804, 851, 898, 945];
    }

    function initializeDEF() public {
        BASE_DEF = [26, 30, 36, 43, 51, 61, 74, 89, 107, 130, 157, 190, 230, 279, 339, 412, 501, 608, 740, 899, 1093];
    }

    function initializeMDEF() public {
        BASE_MDEF = [22, 26, 30, 36, 43, 51, 62, 75, 91, 110, 133, 161, 195, 237, 288, 349, 424, 515, 627, 762, 926];
    }

    function initializeHP() public {
        BASE_HP = [88, 438, 875, 1313, 1750, 2188, 2625, 3063, 3500, 3938, 4375, 4813, 5250, 5688, 6125, 6563, 7000, 7438, 7875, 8313, 8750];
    }

    function initializeDODGE() public {
        BASE_DODGE = [105, 128, 162, 207, 263, 335, 427, 544, 693, 884, 1127, 1396, 1835, 2341, 2988, 3812, 4865, 6208, 7923, 10111, 12904];
    }


    function applyTier(GameObjects.Armor memory _armor, uint tier, uint percentage) public view returns (GameObjects.Armor memory){
        if (tier == 0) return _armor;
        _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_armor.generatedStatBonus, (tier) * percentage);
        _armor.elementalStats.ElementalDef = armorEle(percentage);
        _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_armor.elementalStats, (tier) * percentage);
        return _armor;
    }

    function armor(uint id, uint tier) public view returns (GameObjects.Armor memory) {
        require(tier < 10, "t");

        if (id == 43) {
            return applyTier(SoldiersRobe(tier), tier, 1);
        } else if (id == 44) {
            return applyTier(ExecutionerRobe(tier), tier, 1);
        } else if (id == 45) {
            return applyTier(KnightsRobe(tier), tier, 1);
        } else if (id == 46) {
            return applyTier(DwarvenRobe(tier), tier, 1);
        } else if (id == 47) {
            return applyTier(ScaleRobe(tier), tier, 1);
        } else if (id == 48) {
            return applyTier(WingedRobe(tier), tier, 2);
        } else if (id == 49) {
            return applyTier(DraconicRobe(tier), tier, 2);
        } else if (id == 50) {
            return applyTier(ArgentRobe(tier), tier, 2);
        } else if (id == 51) {
            return applyTier(GoldenRobe(tier), tier, 3);
        } else if (id == 52) {
            return applyTier(MidassRobe(tier), tier, 3);
        } else if (id == 53) {
            return applyTier(JuggernautRobe(tier), tier, 4);
        } else if (id == 54) {
            return applyTier(ChosensRobe(tier), tier, 4);
        } else if (id == 55) {
            return applyTier(TemplarRobe(tier), tier, 5);
        } else if (id == 56) {
            return applyTier(VanguardRobe(tier), tier, 6);
        } else if (id == 57) {
            return applyTier(VoidDwellerRobe(tier), tier, 7);
        } else if (id == 58) {
            return applyTier(SunRobe(tier), tier, 9);
        } else if (id == 59) {
            return applyTier(MoonRobe(tier), tier, 11);
        } else if (id == 60) {
            return applyTier(DemonicRobe(tier), tier, 13);
        } else if (id == 61) {
            return applyTier(AngelicRobe(tier), tier, 15);
        } else if (id == 62) {
            return applyTier(CycleRobe(tier), tier, 19);
        } else if (id == 63) {
            return applyTier(EternalRobe(tier), tier, 20);
        }

        revert("?hm");
    }

    function SoldiersRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 1;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Soldier's Robe";
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

    function ExecutionerRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 2;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Executioner's Robe";
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

    function KnightsRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 3;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Knight's Robe";
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

    function DwarvenRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 4;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Dwarven Robe";
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

    function ScaleRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 5;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Scale Robe";
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

    function WingedRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 6;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Winged Robe";
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

    function DraconicRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 7;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Draconic Robe";
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

    function ArgentRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 8;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Argent Robe";
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

    function GoldenRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 9;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Golden Robe";
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

    function MidassRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 10;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Midas's Robe";
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

    function JuggernautRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 11;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Juggernaut Robe";
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

    function ChosensRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 12;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Chosen's Robe";
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

    function TemplarRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 13;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Templar Robe";
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

    function VanguardRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 14;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Vanguard Robe";
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

    function VoidDwellerRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 15;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Void Dweller Robe";
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

    function SunRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 16;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Sun Robe";
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

    function MoonRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 17;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Moon Robe";
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

    function DemonicRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 18;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Demonic Robe";
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

    function AngelicRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 19;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Angelic Robe";
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

    function CycleRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 20;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Cycle Robe";
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

    function EternalRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 21;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
        _armor.metadata.name = "Eternal Robe";
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
        INT : BASE_INT[index],
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
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](2);
        _reqClass[0] = GameObjects.Class.Wizard;
        _reqClass[1] = GameObjects.Class.Priest;
        return _reqClass;
    }
}
