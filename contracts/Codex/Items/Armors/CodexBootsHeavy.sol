import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, Stats, GeneratedStats, ElementalStats, ElementalAtk, ElementalDef, Class, EquippedItemStruct, Prefix, Suffix, EquipableItem, Stats, ElementalDef, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexBootsHeavy is Initializable {
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
        uint[21] memory _BASE_DODGE
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
    }

    function applyTier(EquipableItem memory _boots, uint tier, uint percentage) public view returns (EquipableItem memory){
        if (tier == 0) return _boots;
        _boots.statBonus = EquipableUtils.sumStatsAsTier(_boots.statBonus, tier * percentage);
        _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_boots.generatedStatBonus, (tier) * percentage);
        _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_boots.elementalStats, (tier) * percentage);
        return _boots;
    }

    function boots(uint id, uint tier) public view returns (EquipableItem memory _boots) {
        require(tier < 10, "t");
        EquipableItem memory base;
        if (id == 1) {
            _boots = applyTier(SoldiersBoots(tier), tier, 550);
            base = SoldiersBoots(tier);
            //            _boots.statBonus.VIT = base.statBonus.VIT + ((_boots.statBonus.VIT * 100) / 1000);
            _boots.statBonus.STR = base.statBonus.STR + ((_boots.statBonus.STR * 900) / 1000);
            _boots.statBonus.DEX = base.statBonus.DEX + ((_boots.statBonus.DEX * 900) / 1000);
            _boots.statBonus.AGI = base.statBonus.AGI + ((_boots.statBonus.AGI * 900) / 1000);
            _boots.statBonus.VIT = base.statBonus.VIT + ((_boots.statBonus.VIT * 900) / 1000);
            _boots.statBonus.INT = base.statBonus.INT + ((_boots.statBonus.INT * 900) / 1000);

            _boots.generatedStatBonus.HP = base.generatedStatBonus.HP + ((_boots.generatedStatBonus.HP * 100) / 1000);
            _boots.generatedStatBonus.P_DEF = base.generatedStatBonus.P_DEF + ((_boots.generatedStatBonus.P_DEF * 100) / 1000);
            _boots.generatedStatBonus.M_DEF = base.generatedStatBonus.M_DEF + ((_boots.generatedStatBonus.M_DEF * 100) / 1000);
            _boots.generatedStatBonus.DODGE = base.generatedStatBonus.DODGE + ((_boots.generatedStatBonus.DODGE * 50) / 1000);

            _boots.elementalStats.ElementalDef.FIRE_DEF = base.elementalStats.ElementalDef.FIRE_DEF + ((_boots.elementalStats.ElementalDef.FIRE_DEF * 100) / 1000);
            _boots.elementalStats.ElementalDef.COLD_DEF = base.elementalStats.ElementalDef.COLD_DEF + ((_boots.elementalStats.ElementalDef.COLD_DEF * 100) / 1000);
            _boots.elementalStats.ElementalDef.EARTH_DEF = base.elementalStats.ElementalDef.EARTH_DEF + ((_boots.elementalStats.ElementalDef.EARTH_DEF * 100) / 1000);
            _boots.elementalStats.ElementalDef.LIGHTNING_DEF = base.elementalStats.ElementalDef.LIGHTNING_DEF + ((_boots.elementalStats.ElementalDef.LIGHTNING_DEF * 100) / 1000);
            _boots.elementalStats.ElementalDef.DARK_DEF = base.elementalStats.ElementalDef.DARK_DEF + ((_boots.elementalStats.ElementalDef.DARK_DEF * 100) / 1000);
            _boots.elementalStats.ElementalDef.HOLY_DEF = base.elementalStats.ElementalDef.HOLY_DEF + ((_boots.elementalStats.ElementalDef.HOLY_DEF * 100) / 1000);
        } else if (id == 2) {
            _boots = applyTier(ExecutionerBoots(tier), tier, 150);
        } else if (id == 3) {
            _boots = applyTier(KnightsBoots(tier), tier, 70);
        } else if (id == 4) {
            _boots = applyTier(DwarvenBoots(tier), tier, 50);
        } else if (id == 5) {
            _boots = applyTier(ScaleBoots(tier), tier, 36);
        } else if (id == 6) {
            _boots = applyTier(WingedBoots(tier), tier, 28);
        } else if (id == 7) {
            _boots = applyTier(JuggernautBoots(tier), tier, 25);
        } else if (id == 8) {
            _boots = applyTier(DraconicBoots(tier), tier, 21);
        } else if (id == 9) {
            _boots = applyTier(DragonsilverBoots(tier), tier, 18);
        } else if (id == 10) {
            _boots = applyTier(GoldenBoots(tier), tier, 15);
        } else if (id == 11) {
            _boots = applyTier(MidassBoots(tier), tier, 15);
        } else if (id == 12) {
            _boots = applyTier(ChosensBoots(tier), tier, 12);
        } else if (id == 13) {
            _boots = applyTier(TemplarBoots(tier), tier, 12);
        } else if (id == 14) {
            _boots = applyTier(VanguardBoots(tier), tier, 12);
        } else if (id == 15) {
            _boots = applyTier(VoidDwellerBoots(tier), tier, 10);
        } else if (id == 16) {
            _boots = applyTier(MoonlightBoots(tier), tier, 10);
        } else if (id == 17) {
            _boots = applyTier(SunlightBoots(tier), tier, 9);
        } else if (id == 18) {
            _boots = applyTier(CycleBoots(tier), tier, 8);
        } else if (id == 19) {
            _boots = applyTier(DemonicBoots(tier), tier, 8);
        } else if (id == 20) {
            _boots = applyTier(AngelicBoots(tier), tier, 7);
        } else if (id == 21) {
            _boots = applyTier(EternalBoots(tier), tier, 7);
        } else revert("?hm");
    }

    function SoldiersBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 1;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;

        // requirements here
        _boots.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _boots.requirement.classRequirement = classRequirement();

        // bonuses here
        _boots.statBonus = bootStats(0);
        _boots.generatedStatBonus = bootGenStats(0);
        _boots.elementalStats.ElementalDef = bootEle(0);
    }

    function ExecutionerBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 2;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 3;
        _boots.requirement.classRequirement = classRequirement();
        // _boots.requirement.statRequirement = Stats({

        _boots.statBonus = bootStats(1);
        _boots.generatedStatBonus = bootGenStats(1);
        _boots.elementalStats.ElementalDef = bootEle(1);
    }

    function KnightsBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 3;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 8;
        _boots.requirement.classRequirement = classRequirement();
        //   _boots.requirement.statRequirement = Stats({

        _boots.statBonus = bootStats(2);
        _boots.generatedStatBonus = bootGenStats(2);
        _boots.elementalStats.ElementalDef = bootEle(2);
    }

    function DwarvenBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 4;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 13;
        _boots.requirement.classRequirement = classRequirement();
        //  _boots.requirement.statRequirement = Stats({

        _boots.statBonus = bootStats(3);
        _boots.generatedStatBonus = bootGenStats(3);
        _boots.elementalStats.ElementalDef = bootEle(3);
    }

    function ScaleBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 5;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 18;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(4);
        _boots.generatedStatBonus = bootGenStats(4);
        _boots.elementalStats.ElementalDef = bootEle(4);
    }

    function WingedBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 6;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 23;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(5);
        _boots.generatedStatBonus = bootGenStats(5);
        _boots.elementalStats.ElementalDef = bootEle(5);
    }

    function JuggernautBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 7;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 28;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(6);
        _boots.generatedStatBonus = bootGenStats(6);
        _boots.elementalStats.ElementalDef = bootEle(6);
    }

    function DraconicBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 8;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 33;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(7);
        _boots.generatedStatBonus = bootGenStats(7);
        _boots.elementalStats.ElementalDef = bootEle(7);
    }

    function DragonsilverBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 9;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 38;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(8);
        _boots.generatedStatBonus = bootGenStats(8);
        _boots.elementalStats.ElementalDef = bootEle(8);
    }

    function GoldenBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 10;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 43;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(9);
        _boots.generatedStatBonus = bootGenStats(9);
        _boots.elementalStats.ElementalDef = bootEle(9);
    }

    function MidassBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 11;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 48;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(10);
        _boots.generatedStatBonus = bootGenStats(10);
        _boots.elementalStats.ElementalDef = bootEle(10);
    }

    function ChosensBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 12;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 53;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(11);
        _boots.generatedStatBonus = bootGenStats(11);
        _boots.elementalStats.ElementalDef = bootEle(11);
    }

    function TemplarBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 13;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 58;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(12);
        _boots.generatedStatBonus = bootGenStats(12);
        _boots.elementalStats.ElementalDef = bootEle(12);
    }

    function VanguardBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 14;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 63;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(13);
        _boots.generatedStatBonus = bootGenStats(13);
        _boots.elementalStats.ElementalDef = bootEle(13);
    }

    function VoidDwellerBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 15;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 68;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(14);
        _boots.generatedStatBonus = bootGenStats(14);
        _boots.elementalStats.ElementalDef = bootEle(14);
    }

    function MoonlightBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 16;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 73;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(15);
        _boots.generatedStatBonus = bootGenStats(15);
        _boots.elementalStats.ElementalDef = bootEle(15);
    }

    function SunlightBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 17;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 78;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(16);
        _boots.generatedStatBonus = bootGenStats(16);
        _boots.elementalStats.ElementalDef = bootEle(16);
    }

    function CycleBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 18;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 83;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(17);
        _boots.generatedStatBonus = bootGenStats(17);
        _boots.elementalStats.ElementalDef = bootEle(17);
    }

    function DemonicBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 19;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 88;
        _boots.requirement.classRequirement = classRequirement();

        // bonuses here
        _boots.statBonus = bootStats(18);
        _boots.generatedStatBonus = bootGenStats(18);
        _boots.elementalStats.ElementalDef = bootEle(18);
    }

    function AngelicBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 20;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 93;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(19);
        _boots.generatedStatBonus = bootGenStats(19);
        _boots.elementalStats.ElementalDef = bootEle(19);
    }

    function EternalBoots(uint tier) public view returns (EquipableItem memory _boots) {
        _boots.metadata.id = 21;
        _boots.metadata.baseType = ItemType.BOOTS;
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 98;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(20);
        _boots.generatedStatBonus = bootGenStats(20);
        _boots.elementalStats.ElementalDef = bootEle(20);
    }

    function bootStats(uint index) internal view returns (Stats memory) {
        Stats memory stats = Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function bootEle(uint index) internal view returns (ElementalDef memory) {
        ElementalDef memory stats = ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function bootGenStats(uint index) internal view returns (GeneratedStats memory) {
        GeneratedStats memory stats = GeneratedStats({
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

    function classRequirement() internal view returns (Class[] memory) {
        Class[] memory _reqClass = new Class[](2);
        _reqClass[0] = Class.Barbarian;
        _reqClass[1] = Class.Paladin;
        return _reqClass;
    }
}
