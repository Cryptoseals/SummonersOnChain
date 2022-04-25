import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexBootsLight is Initializable {
    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_VIT;
    uint[21] public BASE_INT;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;


    function initialize() external initializer {
        initializeSTR();
        initializeAGI();
        initializeDEX();
        initializeVIT();
        initializeINT();
        initializeDEF();
        initializeMDEF();
        initializeHP();
        initializeDODGE();
    }

    function initializeSTR() public {
        BASE_STR = [2, 7, 14, 21, 27, 34, 41, 48, 54, 61, 68, 75, 81, 88, 95, 102, 108, 115, 122, 129, 135];
    }

    function initializeAGI() public {
        BASE_AGI = [3, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165, 176, 187, 198, 209, 220];
    }


    function initializeDEX() public {
        BASE_DEX = [2, 8, 16, 24, 32, 40, 48, 56, 63, 71, 79, 87, 95, 103, 111, 119, 126, 134, 142, 150, 158];
    }

    function initializeVIT() public {
        BASE_VIT = [6, 27, 54, 81, 108, 135, 162, 189, 216, 243, 270, 297, 324, 351, 378, 405, 432, 459, 486, 513, 540];
    }

    function initializeINT() public {
        BASE_VIT = [3, 14, 28, 42, 55, 69, 83, 96, 110, 124, 137, 151, 165, 179, 192, 206, 220, 233, 247, 261, 274];
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
        BASE_DODGE = [158, 191, 243, 310, 394, 502, 640, 815, 1040, 1326, 1691, 2094, 2752, 3511, 4481, 5718, 7297, 9312, 11884, 15166, 19355];
    }


    function applyTier(GameObjects.Boots memory _grieves, uint tier, uint percentage) public view returns (GameObjects.Boots memory){
        if (tier == 0) return _grieves;
        _grieves.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_grieves.generatedStatBonus, (tier) * percentage);
        _grieves.elementalStats.ElementalDef = armorEle(percentage);
        _grieves.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_grieves.elementalStats, (tier) * percentage);
        return _grieves;
    }

    function boots(uint id, uint tier) public view returns (GameObjects.Boots memory) {
        require(tier < 10, "t");

        if (id == 1) {
            return applyTier(SoldiersSandals(tier), tier, 1);
        } else if (id == 2) {
            return applyTier(ExecutionerSandals(tier), tier, 1);
        } else if (id == 3) {
            return applyTier(KnightsSandals(tier), tier, 1);
        } else if (id == 4) {
            return applyTier(DwarvenSandals(tier), tier, 1);
        } else if (id == 5) {
            return applyTier(ScaleSandals(tier), tier, 1);
        } else if (id == 6) {
            return applyTier(WingedSandals(tier), tier, 2);
        } else if (id == 7) {
            return applyTier(DraconicSandals(tier), tier, 2);
        } else if (id == 8) {
            return applyTier(ArgentSandals(tier), tier, 2);
        } else if (id == 9) {
            return applyTier(GoldenSandals(tier), tier, 3);
        } else if (id == 10) {
            return applyTier(MidassSandals(tier), tier, 3);
        } else if (id == 11) {
            return applyTier(JuggernautSandals(tier), tier, 4);
        } else if (id == 12) {
            return applyTier(ChosensSandals(tier), tier, 4);
        } else if (id == 13) {
            return applyTier(TemplarSandals(tier), tier, 5);
        } else if (id == 14) {
            return applyTier(VanguardSandals(tier), tier, 6);
        } else if (id == 15) {
            return applyTier(VoidDwellerSandals(tier), tier, 7);
        } else if (id == 16) {
            return applyTier(SunSandals(tier), tier, 9);
        } else if (id == 17) {
            return applyTier(MoonSandals(tier), tier, 11);
        } else if (id == 18) {
            return applyTier(DemonicSandals(tier), tier, 13);
        } else if (id == 19) {
            return applyTier(AngelicSandals(tier), tier, 15);
        } else if (id == 20) {
            return applyTier(CycleSandals(tier), tier, 19);
        } else if (id == 21) {
            return applyTier(EternalSandals(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 1;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Soldier's Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;

        // requirements here
        _grieves.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _grieves.requirement.classRequirement = classRequirement();

        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _grieves.statBonus = armorStats(0);
        _grieves.generatedStatBonus = armorGenStats(0);
        _grieves.elementalStats.ElementalDef = armorEle(0);
    }

    function ExecutionerSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 2;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Executioner's Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 5;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(1);
        _grieves.generatedStatBonus = armorGenStats(1);
        _grieves.elementalStats.ElementalDef = armorEle(1);
    }

    function KnightsSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 3;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Knight's Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 10;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(2);
        _grieves.generatedStatBonus = armorGenStats(2);
        _grieves.elementalStats.ElementalDef = armorEle(2);
    }

    function DwarvenSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 4;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Dwarven Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 15;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(3);
        _grieves.generatedStatBonus = armorGenStats(3);
        _grieves.elementalStats.ElementalDef = armorEle(3);
    }

    function ScaleSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 5;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Scale Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 20;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(4);
        _grieves.generatedStatBonus = armorGenStats(4);
        _grieves.elementalStats.ElementalDef = armorEle(4);
    }

    function WingedSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 6;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Winged Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 25;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(5);
        _grieves.generatedStatBonus = armorGenStats(5);
        _grieves.elementalStats.ElementalDef = armorEle(5);
    }

    function DraconicSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 7;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Draconic Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 30;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(6);
        _grieves.generatedStatBonus = armorGenStats(6);
        _grieves.elementalStats.ElementalDef = armorEle(6);
    }

    function ArgentSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 8;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Argent Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 35;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(7);
        _grieves.generatedStatBonus = armorGenStats(7);
        _grieves.elementalStats.ElementalDef = armorEle(7);
    }

    function GoldenSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 9;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Golden Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 40;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(8);
        _grieves.generatedStatBonus = armorGenStats(8);
        _grieves.elementalStats.ElementalDef = armorEle(8);
    }

    function MidassSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 10;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Midas's Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 45;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(9);
        _grieves.generatedStatBonus = armorGenStats(9);
        _grieves.elementalStats.ElementalDef = armorEle(9);
    }

    function JuggernautSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 11;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Juggernaut Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 50;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(10);
        _grieves.generatedStatBonus = armorGenStats(10);
        _grieves.elementalStats.ElementalDef = armorEle(10);
    }

    function ChosensSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 12;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Chosen's Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 55;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(11);
        _grieves.generatedStatBonus = armorGenStats(11);
        _grieves.elementalStats.ElementalDef = armorEle(11);
    }

    function TemplarSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 13;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Templar Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 60;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(12);
        _grieves.generatedStatBonus = armorGenStats(12);
        _grieves.elementalStats.ElementalDef = armorEle(12);
    }

    function VanguardSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 14;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Vanguard Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 65;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(13);
        _grieves.generatedStatBonus = armorGenStats(13);
        _grieves.elementalStats.ElementalDef = armorEle(13);
    }

    function VoidDwellerSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 15;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Void Dweller Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 70;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(14);
        _grieves.generatedStatBonus = armorGenStats(14);
        _grieves.elementalStats.ElementalDef = armorEle(14);
    }

    function SunSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 16;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Sun Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 75;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(15);
        _grieves.generatedStatBonus = armorGenStats(15);
        _grieves.elementalStats.ElementalDef = armorEle(15);
    }

    function MoonSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 17;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Moon Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 80;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(16);
        _grieves.generatedStatBonus = armorGenStats(16);
        _grieves.elementalStats.ElementalDef = armorEle(16);
    }

    function DemonicSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 18;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Demonic Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 85;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(17);
        _grieves.generatedStatBonus = armorGenStats(17);
        _grieves.elementalStats.ElementalDef = armorEle(17);
    }

    function AngelicSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 19;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Angelic Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 90;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(18);
        _grieves.generatedStatBonus = armorGenStats(18);
        _grieves.elementalStats.ElementalDef = armorEle(18);
    }

    function CycleSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 20;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Cycle Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 95;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(19);
        _grieves.generatedStatBonus = armorGenStats(19);
        _grieves.elementalStats.ElementalDef = armorEle(19);
    }

    function EternalSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 21;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _grieves.metadata.name = "Eternal Sandals";
        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 100;
        _grieves.requirement.classRequirement = classRequirement();
        _grieves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(20);
        _grieves.generatedStatBonus = armorGenStats(20);
        _grieves.elementalStats.ElementalDef = armorEle(20);
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
