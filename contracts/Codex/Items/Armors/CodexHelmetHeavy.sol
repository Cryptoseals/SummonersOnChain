import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, Stats, GeneratedStats, ElementalStats, ElementalAtk, ElementalDef, Class, EquippedItemStruct, Prefix, Suffix, EquipableItem, Stats, ElementalDef, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexHelmetsHeavy is Initializable {
    uint[21] public BASE_STR;
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


    function applyTier(EquipableItem memory _helmet, uint tier, uint percentage) public view returns (EquipableItem memory){
        if (tier == 0) return _helmet;
        _helmet.statBonus = EquipableUtils.sumStatsAsTier(_helmet.statBonus, tier * percentage);
        _helmet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_helmet.generatedStatBonus, (tier) * percentage);
        _helmet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_helmet.elementalStats, (tier) * percentage);
        return _helmet;
    }

    function helmet(uint id, uint tier) public view returns (EquipableItem memory _helmet) {
        require(tier < 10, "t");
        EquipableItem memory base;
        if (id == 1) {
            _helmet = applyTier(SoldiersHelmet(tier), tier, 550);
            base = SoldiersHelmet(tier);
            _helmet.statBonus.STR = base.statBonus.STR + ((_helmet.statBonus.STR * 900) / 1000);
            _helmet.statBonus.DEX = base.statBonus.DEX + ((_helmet.statBonus.DEX * 900) / 1000);
//            _helmet.statBonus.AGI = base.statBonus.AGI + ((_helmet.statBonus.AGI * 900) / 1000);
            _helmet.statBonus.VIT = base.statBonus.VIT + ((_helmet.statBonus.VIT * 900) / 1000);
            _helmet.statBonus.INT = base.statBonus.INT + ((_helmet.statBonus.INT * 900) / 1000);

            _helmet.generatedStatBonus.HP = base.generatedStatBonus.HP + ((_helmet.generatedStatBonus.HP * 100) / 1000);
            _helmet.generatedStatBonus.P_DEF = base.generatedStatBonus.P_DEF + ((_helmet.generatedStatBonus.P_DEF * 100) / 1000);
            _helmet.generatedStatBonus.M_DEF = base.generatedStatBonus.M_DEF + ((_helmet.generatedStatBonus.M_DEF * 100) / 1000);
            _helmet.generatedStatBonus.DODGE = base.generatedStatBonus.DODGE + ((_helmet.generatedStatBonus.DODGE * 50) / 1000);
            _helmet.generatedStatBonus.ACCURACY = base.generatedStatBonus.ACCURACY + ((_helmet.generatedStatBonus.ACCURACY * 50) / 1000);

            _helmet.elementalStats.ElementalDef.FIRE_DEF = base.elementalStats.ElementalDef.FIRE_DEF + ((_helmet.elementalStats.ElementalDef.FIRE_DEF * 100) / 1000);
            _helmet.elementalStats.ElementalDef.COLD_DEF = base.elementalStats.ElementalDef.COLD_DEF + ((_helmet.elementalStats.ElementalDef.COLD_DEF * 100) / 1000);
            _helmet.elementalStats.ElementalDef.EARTH_DEF = base.elementalStats.ElementalDef.EARTH_DEF + ((_helmet.elementalStats.ElementalDef.EARTH_DEF * 100) / 1000);
            _helmet.elementalStats.ElementalDef.LIGHTNING_DEF = base.elementalStats.ElementalDef.LIGHTNING_DEF + ((_helmet.elementalStats.ElementalDef.LIGHTNING_DEF * 100) / 1000);
            _helmet.elementalStats.ElementalDef.DARK_DEF = base.elementalStats.ElementalDef.DARK_DEF + ((_helmet.elementalStats.ElementalDef.DARK_DEF * 100) / 1000);
            _helmet.elementalStats.ElementalDef.HOLY_DEF = base.elementalStats.ElementalDef.HOLY_DEF + ((_helmet.elementalStats.ElementalDef.HOLY_DEF * 100) / 1000);
        } else if (id == 2) {
            _helmet = applyTier(ExecutionerHelmet(tier), tier, 150);
        } else if (id == 3) {
            _helmet = applyTier(KnightsHelmet(tier), tier, 70);
        } else if (id == 4) {
            _helmet = applyTier(DwarvenHelmet(tier), tier, 50);
        } else if (id == 5) {
            _helmet = applyTier(ScaleHelmet(tier), tier, 36);
        } else if (id == 6) {
            _helmet = applyTier(WingedHelmet(tier), tier, 28);
        } else if (id == 7) {
            _helmet = applyTier(JuggernautHelmet(tier), tier, 25);
        } else if (id == 8) {
            _helmet = applyTier(DraconicHelmet(tier), tier, 21);
        } else if (id == 9) {
            _helmet = applyTier(DragonsilverHelmet(tier), tier, 18);
        } else if (id == 10) {
            _helmet = applyTier(GoldenHelmet(tier), tier, 15);
        } else if (id == 11) {
            _helmet = applyTier(MidassHelmet(tier), tier, 15);
        } else if (id == 12) {
            _helmet = applyTier(ChosensHelmet(tier), tier, 12);
        } else if (id == 13) {
            _helmet = applyTier(TemplarHelmet(tier), tier, 12);
        } else if (id == 14) {
            _helmet = applyTier(VanguardHelmet(tier), tier, 12);
        } else if (id == 15) {
            _helmet = applyTier(VoidDwellerHelmet(tier), tier, 10);
        } else if (id == 16) {
            _helmet = applyTier(MoonlightHelmet(tier), tier, 10);
        } else if (id == 17) {
            _helmet = applyTier(SunlightHelmet(tier), tier, 9);
        } else if (id == 18) {
            _helmet = applyTier(CycleHelmet(tier), tier, 8);
        } else if (id == 19) {
            _helmet = applyTier(DemonicHelmet(tier), tier, 8);
        } else if (id == 20) {
            _helmet = applyTier(AngelicHelmet(tier), tier, 7);
        } else if (id == 21) {
            _helmet = applyTier(EternalHelmet(tier), tier, 7);
        } else revert("?hm");
    }

    function SoldiersHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 1;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;

        // requirements here
        _helmet.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _helmet.requirement.classRequirement = classRequirement();

        //        _helmet.requirement.statRequirement = Stats({
        //        STR : 0,
        //        DEX : 0,
        //        AGI : 0,
        //        INT : 0,
        //        VIT : 0,
        //        LUCK : 0});


        // bonuses here
        _helmet.statBonus = helmetStats(0);
        _helmet.generatedStatBonus = helmetGenStats(0);
        _helmet.elementalStats.ElementalDef = helmetEle(0);
    }

    function ExecutionerHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 2;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 3;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(1);
        _helmet.generatedStatBonus = helmetGenStats(1);
        _helmet.elementalStats.ElementalDef = helmetEle(1);
    }

    function KnightsHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 3;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 8;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(2);
        _helmet.generatedStatBonus = helmetGenStats(2);
        _helmet.elementalStats.ElementalDef = helmetEle(2);
    }

    function DwarvenHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 4;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 13;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(3);
        _helmet.generatedStatBonus = helmetGenStats(3);
        _helmet.elementalStats.ElementalDef = helmetEle(3);
    }

    function ScaleHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 5;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 18;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(4);
        _helmet.generatedStatBonus = helmetGenStats(4);
        _helmet.elementalStats.ElementalDef = helmetEle(4);
    }

    function WingedHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 6;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 23;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(5);
        _helmet.generatedStatBonus = helmetGenStats(5);
        _helmet.elementalStats.ElementalDef = helmetEle(5);
    }

    function JuggernautHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 7;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 28;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(6);
        _helmet.generatedStatBonus = helmetGenStats(6);
        _helmet.elementalStats.ElementalDef = helmetEle(6);
    }

    function DraconicHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 8;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 33;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(7);
        _helmet.generatedStatBonus = helmetGenStats(7);
        _helmet.elementalStats.ElementalDef = helmetEle(7);
    }

    function DragonsilverHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 9;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 38;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(8);
        _helmet.generatedStatBonus = helmetGenStats(8);
        _helmet.elementalStats.ElementalDef = helmetEle(8);
    }

    function GoldenHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 10;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 43;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(9);
        _helmet.generatedStatBonus = helmetGenStats(9);
        _helmet.elementalStats.ElementalDef = helmetEle(9);
    }

    function MidassHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 11;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 48;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(10);
        _helmet.generatedStatBonus = helmetGenStats(10);
        _helmet.elementalStats.ElementalDef = helmetEle(10);
    }

    function ChosensHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 12;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 53;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(11);
        _helmet.generatedStatBonus = helmetGenStats(11);
        _helmet.elementalStats.ElementalDef = helmetEle(11);
    }

    function TemplarHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 13;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 58;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(12);
        _helmet.generatedStatBonus = helmetGenStats(12);
        _helmet.elementalStats.ElementalDef = helmetEle(12);
    }

    function VanguardHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 14;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 63;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(13);
        _helmet.generatedStatBonus = helmetGenStats(13);
        _helmet.elementalStats.ElementalDef = helmetEle(13);
    }

    function VoidDwellerHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 15;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 68;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(14);
        _helmet.generatedStatBonus = helmetGenStats(14);
        _helmet.elementalStats.ElementalDef = helmetEle(14);
    }

    function MoonlightHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 16;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 73;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(15);
        _helmet.generatedStatBonus = helmetGenStats(15);
        _helmet.elementalStats.ElementalDef = helmetEle(15);
    }

    function SunlightHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 17;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 78;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(16);
        _helmet.generatedStatBonus = helmetGenStats(16);
        _helmet.elementalStats.ElementalDef = helmetEle(16);
    }

    function CycleHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 18;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 83;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(17);
        _helmet.generatedStatBonus = helmetGenStats(17);
        _helmet.elementalStats.ElementalDef = helmetEle(17);
    }

    function DemonicHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 19;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 88;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(18);
        _helmet.generatedStatBonus = helmetGenStats(18);
        _helmet.elementalStats.ElementalDef = helmetEle(18);
    }

    function AngelicHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 20;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 93;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(19);
        _helmet.generatedStatBonus = helmetGenStats(19);
        _helmet.elementalStats.ElementalDef = helmetEle(19);
    }

    function EternalHelmet(uint tier) public view returns (EquipableItem memory _helmet) {
        _helmet.metadata.id = 21;
        _helmet.metadata.baseType = ItemType.HELMET;
        _helmet.metadata.upgradable = true;
        _helmet.requirement.level = 98;
        _helmet.requirement.classRequirement = classRequirement();

        _helmet.statBonus = helmetStats(20);
        _helmet.generatedStatBonus = helmetGenStats(20);
        _helmet.elementalStats.ElementalDef = helmetEle(20);
    }

    function helmetStats(uint index) internal view returns (Stats memory) {
        Stats memory stats = Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : 0,
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function helmetEle(uint index) internal view returns (ElementalDef memory) {
        ElementalDef memory stats = ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function helmetGenStats(uint index) internal view returns (GeneratedStats memory) {
        GeneratedStats memory stats = GeneratedStats({
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

    function classRequirement() internal view returns (Class[] memory) {
        Class[] memory _reqClass = new Class[](2);
        _reqClass[0] = Class.Barbarian;
        _reqClass[1] = Class.Paladin;
        return _reqClass;
    }
}
