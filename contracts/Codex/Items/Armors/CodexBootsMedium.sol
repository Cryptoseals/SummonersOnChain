import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexBootsMedium is Initializable {
    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_VIT;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_EDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;


    function initialize(
        uint[21] memory _BASE_STR,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_VIT,
        uint[21] memory _BASE_DEF,
        uint[21] memory _BASE_MDEF,
        uint[21] memory _BASE_EDEF,
        uint[21] memory _BASE_HP,
        uint[21] memory _BASE_DODGE
    ) external initializer {
        BASE_STR = _BASE_STR;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_VIT = _BASE_VIT;
        BASE_DEF = _BASE_DEF;
        BASE_MDEF = _BASE_MDEF;
        BASE_HP = _BASE_HP;
        BASE_DODGE = _BASE_DODGE;
        BASE_EDEF = _BASE_EDEF;
    }

    function applyTier(GameObjects.Boots memory _greaves, uint tier, uint percentage) public view returns (GameObjects.Boots memory){
        if (tier == 0) return _greaves;
        _greaves.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_greaves.generatedStatBonus, (tier) * percentage);
        _greaves.elementalStats.ElementalDef = armorEle(percentage);
        _greaves.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_greaves.elementalStats, (tier) * percentage);
        return _greaves;
    }

    function boots(uint id, uint tier) public view returns (GameObjects.Boots memory) {
        require(tier < 10, "t");

        if (id ==  22) {
            return applyTier(SoldiersGreaves(tier), tier, 1);
        } else if (id ==  23) {
            return applyTier(ExecutionerGreaves(tier), tier, 1);
        } else if (id ==  24) {
            return applyTier(KnightsGreaves(tier), tier, 1);
        } else if (id ==  25) {
            return applyTier(DwarvenGreaves(tier), tier, 1);
        } else if (id ==  26) {
            return applyTier(ScaleGreaves(tier), tier, 1);
        } else if (id ==  27) {
            return applyTier(WingedGreaves(tier), tier, 2);
        } else if (id ==  28) {
            return applyTier(DraconicGreaves(tier), tier, 2);
        } else if (id ==  29) {
            return applyTier(ArgentGreaves(tier), tier, 2);
        } else if (id ==  30) {
            return applyTier(GoldenGreaves(tier), tier, 3);
        } else if (id ==  31) {
            return applyTier(MidassGreaves(tier), tier, 3);
        } else if (id ==  32) {
            return applyTier(JuggernautGreaves(tier), tier, 4);
        } else if (id ==  33) {
            return applyTier(ChosensGreaves(tier), tier, 4);
        } else if (id ==  34) {
            return applyTier(TemplarGreaves(tier), tier, 5);
        } else if (id ==  35) {
            return applyTier(VanguardGreaves(tier), tier, 6);
        } else if (id ==  36) {
            return applyTier(VoidDwellerGreaves(tier), tier, 7);
        } else if (id ==  37) {
            return applyTier(SunGreaves(tier), tier, 9);
        } else if (id ==  38) {
            return applyTier(MoonGreaves(tier), tier, 11);
        } else if (id ==  39) {
            return applyTier(DemonicGreaves(tier), tier, 13);
        } else if (id ==  40) {
            return applyTier(AngelicGreaves(tier), tier, 15);
        } else if (id ==  41) {
            return applyTier(CycleGreaves(tier), tier, 19);
        } else if (id ==  42) {
            return applyTier(EternalGreaves(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 1;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Soldier's Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;

        // requirements here
        _greaves.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _greaves.requirement.classRequirement = classRequirement();

        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _greaves.statBonus = armorStats(0);
        _greaves.generatedStatBonus = armorGenStats(0);
        _greaves.elementalStats.ElementalDef = armorEle(0);
    }

    function ExecutionerGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 2;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Executioner's Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 5;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(1);
        _greaves.generatedStatBonus = armorGenStats(1);
        _greaves.elementalStats.ElementalDef = armorEle(1);
    }

    function KnightsGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 3;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Knight's Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 10;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(2);
        _greaves.generatedStatBonus = armorGenStats(2);
        _greaves.elementalStats.ElementalDef = armorEle(2);
    }

    function DwarvenGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 4;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Dwarven Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 15;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(3);
        _greaves.generatedStatBonus = armorGenStats(3);
        _greaves.elementalStats.ElementalDef = armorEle(3);
    }

    function ScaleGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 5;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Scale Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 20;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(4);
        _greaves.generatedStatBonus = armorGenStats(4);
        _greaves.elementalStats.ElementalDef = armorEle(4);
    }

    function WingedGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 6;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Winged Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 25;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(5);
        _greaves.generatedStatBonus = armorGenStats(5);
        _greaves.elementalStats.ElementalDef = armorEle(5);
    }

    function DraconicGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 7;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Draconic Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 30;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(6);
        _greaves.generatedStatBonus = armorGenStats(6);
        _greaves.elementalStats.ElementalDef = armorEle(6);
    }

    function ArgentGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 8;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Argent Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 35;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(7);
        _greaves.generatedStatBonus = armorGenStats(7);
        _greaves.elementalStats.ElementalDef = armorEle(7);
    }

    function GoldenGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 9;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Golden Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 40;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(8);
        _greaves.generatedStatBonus = armorGenStats(8);
        _greaves.elementalStats.ElementalDef = armorEle(8);
    }

    function MidassGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 10;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Midas's Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 45;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(9);
        _greaves.generatedStatBonus = armorGenStats(9);
        _greaves.elementalStats.ElementalDef = armorEle(9);
    }

    function JuggernautGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 11;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Juggernaut Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 50;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(10);
        _greaves.generatedStatBonus = armorGenStats(10);
        _greaves.elementalStats.ElementalDef = armorEle(10);
    }

    function ChosensGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 12;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Chosen's Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 55;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(11);
        _greaves.generatedStatBonus = armorGenStats(11);
        _greaves.elementalStats.ElementalDef = armorEle(11);
    }

    function TemplarGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 13;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Templar Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 60;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(12);
        _greaves.generatedStatBonus = armorGenStats(12);
        _greaves.elementalStats.ElementalDef = armorEle(12);
    }

    function VanguardGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 14;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Vanguard Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 65;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(13);
        _greaves.generatedStatBonus = armorGenStats(13);
        _greaves.elementalStats.ElementalDef = armorEle(13);
    }

    function VoidDwellerGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 15;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Void Dweller Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 70;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(14);
        _greaves.generatedStatBonus = armorGenStats(14);
        _greaves.elementalStats.ElementalDef = armorEle(14);
    }

    function SunGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 16;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Sun Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 75;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(15);
        _greaves.generatedStatBonus = armorGenStats(15);
        _greaves.elementalStats.ElementalDef = armorEle(15);
    }

    function MoonGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 17;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Moon Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 80;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(16);
        _greaves.generatedStatBonus = armorGenStats(16);
        _greaves.elementalStats.ElementalDef = armorEle(16);
    }

    function DemonicGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 18;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Demonic Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 85;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(17);
        _greaves.generatedStatBonus = armorGenStats(17);
        _greaves.elementalStats.ElementalDef = armorEle(17);
    }

    function AngelicGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 19;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Angelic Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 90;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(18);
        _greaves.generatedStatBonus = armorGenStats(18);
        _greaves.elementalStats.ElementalDef = armorEle(18);
    }

    function CycleGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 20;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Cycle Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 95;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(19);
        _greaves.generatedStatBonus = armorGenStats(19);
        _greaves.elementalStats.ElementalDef = armorEle(19);
    }

    function EternalGreaves(uint tier) public view returns (GameObjects.Boots memory _greaves) {
        _greaves.metadata.id = 21;
        _greaves.metadata.baseType = GameObjects.ItemType.BOOTS;
        _greaves.metadata.name = "Eternal Greaves";
        _greaves.metadata.description = "";
        _greaves.metadata.upgradable = true;
        _greaves.requirement.level = 100;
        _greaves.requirement.classRequirement = classRequirement();
        _greaves.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _greaves.statBonus = armorStats(20);
        _greaves.generatedStatBonus = armorGenStats(20);
        _greaves.elementalStats.ElementalDef = armorEle(20);
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
