import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexHelmetsMedium is Initializable {
    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_VIT;
    uint[21] public BASE_INT;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_EDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;
    uint[21] public BASE_ACCURACY;


    function initialize(
        uint[21] memory _BASE_STR,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_VIT,
        uint[21] memory _BASE_INT,
        uint[21] memory _BASE_DEF,
        uint[21] memory _BASE_MDEF,
        uint[21] memory _BASE_EDEF,
        uint[21] memory _BASE_HP,
        uint[21] memory _BASE_DODGE,
        uint[21] memory _BASE_ACCURACY
    ) external initializer {
        BASE_STR = _BASE_STR;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_VIT = _BASE_VIT;
        BASE_INT = _BASE_INT;
        BASE_DEF = _BASE_DEF;
        BASE_MDEF = _BASE_MDEF;
        BASE_HP = _BASE_HP;
        BASE_DODGE = _BASE_DODGE;
        BASE_EDEF = _BASE_EDEF;
        BASE_ACCURACY = _BASE_ACCURACY;
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

        if (id == 22) {
            return applyTier(SoldiersHoodie(tier), tier, 1);
        } else if (id == 23) {
            return applyTier(ExecutionerHoodie(tier), tier, 1);
        } else if (id == 24) {
            return applyTier(KnightsHoodie(tier), tier, 1);
        } else if (id == 25) {
            return applyTier(DwarvenHoodie(tier), tier, 1);
        } else if (id == 26) {
            return applyTier(ScaleHoodie(tier), tier, 1);
        } else if (id == 27) {
            return applyTier(WingedHoodie(tier), tier, 2);
        } else if (id == 28) {
            return applyTier(DraconicHoodie(tier), tier, 2);
        } else if (id == 29) {
            return applyTier(ArgentHoodie(tier), tier, 2);
        } else if (id == 30) {
            return applyTier(GoldenHoodie(tier), tier, 3);
        } else if (id == 31) {
            return applyTier(MidassHoodie(tier), tier, 3);
        } else if (id == 32) {
            return applyTier(JuggernautHoodie(tier), tier, 4);
        } else if (id == 33) {
            return applyTier(ChosensHoodie(tier), tier, 4);
        } else if (id == 34) {
            return applyTier(TemplarHoodie(tier), tier, 5);
        } else if (id == 35) {
            return applyTier(VanguardHoodie(tier), tier, 6);
        } else if (id == 36) {
            return applyTier(VoidDwellerHoodie(tier), tier, 7);
        } else if (id == 37) {
            return applyTier(SunHoodie(tier), tier, 9);
        } else if (id == 38) {
            return applyTier(MoonHoodie(tier), tier, 11);
        } else if (id == 39) {
            return applyTier(DemonicHoodie(tier), tier, 13);
        } else if (id == 40) {
            return applyTier(AngelicHoodie(tier), tier, 15);
        } else if (id == 41) {
            return applyTier(CycleHoodie(tier), tier, 19);
        } else if (id == 42) {
            return applyTier(EternalHoodie(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 1;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Soldier's Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;

        // requirements here
        _helmet.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _helmet.requirement.classRequirement = classRequirement();

//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});


        // bonuses here
        _helmet.statBonus = hoodieStats(0);
        _helmet.generatedStatBonus = hoodieGenStats(0);
        _helmet.elementalStats.ElementalDef = hoodieEle(0);
    }

    function ExecutionerHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 2;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Executioner's Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 5;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(1);
        _helmet.generatedStatBonus = hoodieGenStats(1);
        _helmet.elementalStats.ElementalDef = hoodieEle(1);
    }

    function KnightsHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 3;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Knight's Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 10;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(2);
        _helmet.generatedStatBonus = hoodieGenStats(2);
        _helmet.elementalStats.ElementalDef = hoodieEle(2);
    }

    function DwarvenHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 4;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Dwarven Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 15;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(3);
        _helmet.generatedStatBonus = hoodieGenStats(3);
        _helmet.elementalStats.ElementalDef = hoodieEle(3);
    }

    function ScaleHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 5;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Scale Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 20;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(4);
        _helmet.generatedStatBonus = hoodieGenStats(4);
        _helmet.elementalStats.ElementalDef = hoodieEle(4);
    }

    function WingedHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 6;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Winged Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 25;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(5);
        _helmet.generatedStatBonus = hoodieGenStats(5);
        _helmet.elementalStats.ElementalDef = hoodieEle(5);
    }

    function DraconicHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 7;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Draconic Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 30;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(6);
        _helmet.generatedStatBonus = hoodieGenStats(6);
        _helmet.elementalStats.ElementalDef = hoodieEle(6);
    }

    function ArgentHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 8;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Argent Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 35;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(7);
        _helmet.generatedStatBonus = hoodieGenStats(7);
        _helmet.elementalStats.ElementalDef = hoodieEle(7);
    }

    function GoldenHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 9;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Golden Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 40;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(8);
        _helmet.generatedStatBonus = hoodieGenStats(8);
        _helmet.elementalStats.ElementalDef = hoodieEle(8);
    }

    function MidassHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 10;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Midas's Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 45;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(9);
        _helmet.generatedStatBonus = hoodieGenStats(9);
        _helmet.elementalStats.ElementalDef = hoodieEle(9);
    }

    function JuggernautHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 11;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Juggernaut Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 50;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(10);
        _helmet.generatedStatBonus = hoodieGenStats(10);
        _helmet.elementalStats.ElementalDef = hoodieEle(10);
    }

    function ChosensHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 12;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Chosen's Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 55;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(11);
        _helmet.generatedStatBonus = hoodieGenStats(11);
        _helmet.elementalStats.ElementalDef = hoodieEle(11);
    }

    function TemplarHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 13;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Templar Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 60;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(12);
        _helmet.generatedStatBonus = hoodieGenStats(12);
        _helmet.elementalStats.ElementalDef = hoodieEle(12);
    }

    function VanguardHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 14;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Vanguard Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 65;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(13);
        _helmet.generatedStatBonus = hoodieGenStats(13);
        _helmet.elementalStats.ElementalDef = hoodieEle(13);
    }

    function VoidDwellerHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 15;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Void Dweller Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 70;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(14);
        _helmet.generatedStatBonus = hoodieGenStats(14);
        _helmet.elementalStats.ElementalDef = hoodieEle(14);
    }

    function SunHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 16;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Sun Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 75;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(15);
        _helmet.generatedStatBonus = hoodieGenStats(15);
        _helmet.elementalStats.ElementalDef = hoodieEle(15);
    }

    function MoonHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 17;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Moon Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 80;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(16);
        _helmet.generatedStatBonus = hoodieGenStats(16);
        _helmet.elementalStats.ElementalDef = hoodieEle(16);
    }

    function DemonicHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 18;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Demonic Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 85;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(17);
        _helmet.generatedStatBonus = hoodieGenStats(17);
        _helmet.elementalStats.ElementalDef = hoodieEle(17);
    }

    function AngelicHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 19;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Angelic Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 90;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(18);
        _helmet.generatedStatBonus = hoodieGenStats(18);
        _helmet.elementalStats.ElementalDef = hoodieEle(18);
    }

    function CycleHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 20;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Cycle Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 95;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _helmet.statBonus = hoodieStats(19);
        _helmet.generatedStatBonus = hoodieGenStats(19);
        _helmet.elementalStats.ElementalDef = hoodieEle(19);
    }

    function EternalHoodie(uint tier) public view returns (GameObjects.Helmet memory _helmet) {
        _helmet.metadata.id = 21;
        _helmet.metadata.baseType = GameObjects.ItemType.HELMET;
//        _helmet.metadata.name = "Eternal Hoodie";
//        _helmet.metadata.description = "";
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 100;
        _helmet.requirement.classRequirement = classRequirement();
//        _helmet.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
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
