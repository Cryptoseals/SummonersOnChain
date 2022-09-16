import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, Stats, GeneratedStats, ElementalStats, ElementalAtk, ElementalDef, Class, EquippedItemStruct, Prefix, Suffix, EquipableItem, Stats, ElementalDef, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexArmorsHeavy is Initializable {
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


    function applyTier(EquipableItem memory _armor, uint tier, uint percentage) public view returns (EquipableItem memory){
        if (tier == 0) return _armor;
        _armor.statBonus = EquipableUtils.sumStatsAsTier(_armor.statBonus, tier * percentage);
        _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_armor.generatedStatBonus, (tier) * percentage);
        _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_armor.elementalStats, (tier) * percentage);
        return _armor;
    }

    function armor(uint id, uint tier) public view returns (EquipableItem memory _armor) {
        require(tier < 10, "t");
        EquipableItem memory base;
        if (id == 1) {
            _armor = applyTier(SoldiersArmor(tier), tier, 600);
            base = SoldiersArmor(tier);
            _armor.statBonus.STR = base.statBonus.STR + ((_armor.statBonus.STR * 900) / 1000);
            _armor.statBonus.DEX = base.statBonus.DEX + ((_armor.statBonus.DEX * 900) / 1000);
            _armor.statBonus.AGI = base.statBonus.AGI + ((_armor.statBonus.AGI * 900) / 1000);
            _armor.statBonus.VIT = base.statBonus.VIT + ((_armor.statBonus.VIT * 900) / 1000);
            _armor.statBonus.INT = base.statBonus.INT + ((_armor.statBonus.INT * 900) / 1000);

            _armor.generatedStatBonus.HP = base.generatedStatBonus.HP + ((_armor.generatedStatBonus.HP * 100) / 1000);
            _armor.generatedStatBonus.P_DEF = base.generatedStatBonus.P_DEF + ((_armor.generatedStatBonus.P_DEF * 100) / 1000);
            _armor.generatedStatBonus.M_DEF = base.generatedStatBonus.M_DEF + ((_armor.generatedStatBonus.M_DEF * 100) / 1000);
            _armor.generatedStatBonus.DODGE = base.generatedStatBonus.DODGE + ((_armor.generatedStatBonus.DODGE * 50) / 1000);

            _armor.elementalStats.ElementalDef.FIRE_DEF = base.elementalStats.ElementalDef.FIRE_DEF + ((_armor.elementalStats.ElementalDef.FIRE_DEF * 100) / 1000);
            _armor.elementalStats.ElementalDef.COLD_DEF = base.elementalStats.ElementalDef.COLD_DEF + ((_armor.elementalStats.ElementalDef.COLD_DEF * 100) / 1000);
            _armor.elementalStats.ElementalDef.EARTH_DEF = base.elementalStats.ElementalDef.EARTH_DEF + ((_armor.elementalStats.ElementalDef.EARTH_DEF * 100) / 1000);
            _armor.elementalStats.ElementalDef.LIGHTNING_DEF = base.elementalStats.ElementalDef.LIGHTNING_DEF + ((_armor.elementalStats.ElementalDef.LIGHTNING_DEF * 100) / 1000);
            _armor.elementalStats.ElementalDef.DARK_DEF = base.elementalStats.ElementalDef.DARK_DEF + ((_armor.elementalStats.ElementalDef.DARK_DEF * 100) / 1000);
            _armor.elementalStats.ElementalDef.HOLY_DEF = base.elementalStats.ElementalDef.HOLY_DEF + ((_armor.elementalStats.ElementalDef.HOLY_DEF * 100) / 1000);
        } else if (id == 2) {
            _armor = applyTier(ExecutionerArmor(tier), tier, 150);
        } else if (id == 3) {
            _armor = applyTier(KnightsArmor(tier), tier, 75);
        } else if (id == 4) {
            _armor = applyTier(DwarvenArmor(tier), tier, 50);
        } else if (id == 5) {
            _armor = applyTier(ScaleArmor(tier), tier, 35);
        } else if (id == 6) {
            _armor = applyTier(WingedArmor(tier), tier, 20);
        } else if (id == 7) {
            _armor = applyTier(JuggernautArmor(tier), tier, 20);
        } else if (id == 8) {
            _armor = applyTier(DraconicArmor(tier), tier, 20);
        } else if (id == 9) {
            _armor = applyTier(DragonsilverArmor(tier), tier, 20);
        } else if (id == 10) {
            _armor = applyTier(GoldenArmor(tier), tier, 15);
        } else if (id == 11) {
            _armor = applyTier(MidassArmor(tier), tier, 15);
        } else if (id == 12) {
            _armor = applyTier(ChosensArmor(tier), tier, 15);
        } else if (id == 13) {
            _armor = applyTier(TemplarArmor(tier), tier, 10);
        } else if (id == 14) {
            _armor = applyTier(VanguardArmor(tier), tier, 10);
        } else if (id == 15) {
            _armor = applyTier(VoidDwellerArmor(tier), tier, 10);
        } else if (id == 16) {
            _armor = applyTier(MoonlightArmor(tier), tier, 10);
        } else if (id == 17) {
            _armor = applyTier(SunlightArmor(tier), tier, 10);
        } else if (id == 18) {
            _armor = applyTier(CycleArmor(tier), tier, 7);
        } else if (id == 19) {
            _armor = applyTier(DemonicArmor(tier), tier, 7);
        } else if (id == 20) {
            _armor = applyTier(AngelicArmor(tier), tier, 7);
        } else if (id == 21) {
            _armor = applyTier(EternalArmor(tier), tier, 7);
        } else revert("?hm");
    }

    function SoldiersArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 1;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;

        // requirements here
        _armor.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _armor.requirement.classRequirement = classRequirement();


        // bonuses here
        _armor.statBonus = armorStats(0);
        _armor.generatedStatBonus = armorGenStats(0);
        _armor.elementalStats.ElementalDef = armorEle(0);
    }

    function ExecutionerArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 2;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 5;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(1);
        _armor.generatedStatBonus = armorGenStats(1);
        _armor.elementalStats.ElementalDef = armorEle(1);
    }

    function KnightsArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 3;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 10;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(2);
        _armor.generatedStatBonus = armorGenStats(2);
        _armor.elementalStats.ElementalDef = armorEle(2);
    }

    function DwarvenArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 4;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 15;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(3);
        _armor.generatedStatBonus = armorGenStats(3);
        _armor.elementalStats.ElementalDef = armorEle(3);
    }

    function ScaleArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 5;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 20;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(4);
        _armor.generatedStatBonus = armorGenStats(4);
        _armor.elementalStats.ElementalDef = armorEle(4);
    }

    function WingedArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 6;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 25;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(5);
        _armor.generatedStatBonus = armorGenStats(5);
        _armor.elementalStats.ElementalDef = armorEle(5);
    }

    function JuggernautArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 7;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 30;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(6);
        _armor.generatedStatBonus = armorGenStats(6);
        _armor.elementalStats.ElementalDef = armorEle(6);
    }

    function DraconicArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 8;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 35;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(7);
        _armor.generatedStatBonus = armorGenStats(7);
        _armor.elementalStats.ElementalDef = armorEle(7);
    }

    function DragonsilverArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 9;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 40;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(8);
        _armor.generatedStatBonus = armorGenStats(8);
        _armor.elementalStats.ElementalDef = armorEle(8);
    }

    function GoldenArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 10;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 45;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(9);
        _armor.generatedStatBonus = armorGenStats(9);
        _armor.elementalStats.ElementalDef = armorEle(9);
    }

    function MidassArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 11;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 50;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(10);
        _armor.generatedStatBonus = armorGenStats(10);
        _armor.elementalStats.ElementalDef = armorEle(10);
    }

    function ChosensArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 12;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 55;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(11);
        _armor.generatedStatBonus = armorGenStats(11);
        _armor.elementalStats.ElementalDef = armorEle(11);
    }

    function TemplarArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 13;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 60;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(12);
        _armor.generatedStatBonus = armorGenStats(12);
        _armor.elementalStats.ElementalDef = armorEle(12);
    }

    function VanguardArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 14;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 65;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(13);
        _armor.generatedStatBonus = armorGenStats(13);
        _armor.elementalStats.ElementalDef = armorEle(13);
    }

    function VoidDwellerArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 15;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 70;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(14);
        _armor.generatedStatBonus = armorGenStats(14);
        _armor.elementalStats.ElementalDef = armorEle(14);
    }

    function MoonlightArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 16;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 75;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(15);
        _armor.generatedStatBonus = armorGenStats(15);
        _armor.elementalStats.ElementalDef = armorEle(15);
    }

    function SunlightArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 17;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 80;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(16);
        _armor.generatedStatBonus = armorGenStats(16);
        _armor.elementalStats.ElementalDef = armorEle(16);
    }

    function CycleArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 18;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 85;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(17);
        _armor.generatedStatBonus = armorGenStats(17);
        _armor.elementalStats.ElementalDef = armorEle(17);
    }

    function DemonicArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 19;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 90;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(18);
        _armor.generatedStatBonus = armorGenStats(18);
        _armor.elementalStats.ElementalDef = armorEle(18);
    }

    function AngelicArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 20;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 95;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(19);
        _armor.generatedStatBonus = armorGenStats(19);
        _armor.elementalStats.ElementalDef = armorEle(19);
    }

    function EternalArmor(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 21;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 100;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(20);
        _armor.generatedStatBonus = armorGenStats(20);
        _armor.elementalStats.ElementalDef = armorEle(20);
    }

    function armorStats(uint index) internal view returns (Stats memory) {
        Stats memory stats = Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function armorEle(uint index) internal view returns (ElementalDef memory) {
        ElementalDef memory stats = ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function armorGenStats(uint index) internal view returns (GeneratedStats memory) {
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
