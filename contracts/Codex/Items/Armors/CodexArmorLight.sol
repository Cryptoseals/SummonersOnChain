import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, Stats, GeneratedStats, ElementalStats, ElementalAtk, ElementalDef, Class, EquippedItemStruct, Prefix, Suffix, EquipableItem, Stats, ElementalDef, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexArmorsLight is Initializable {
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
        if (id == 43) {
            _armor = applyTier(SoldiersTunic(tier), tier, 630);
            base = SoldiersTunic(tier);
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
        } else if (id == 44) {
            _armor = applyTier(PriestsTunic(tier), tier, 160);
        } else if (id == 45) {
            _armor = applyTier(FaithTunic(tier), tier, 75);
        } else if (id == 46) {
            _armor = applyTier(TraineesTunic(tier), tier, 50);
        } else if (id == 47) {
            _armor = applyTier(MagiciansShirt(tier), tier, 35);
        } else if (id == 48) {
            _armor = applyTier(SealedShirt(tier), tier, 20);
        } else if (id == 49) {
            _armor = applyTier(GateKeepersShirt(tier), tier, 20);
        } else if (id == 50) {
            _armor = applyTier(ElementalistsShirt(tier), tier, 20);
        } else if (id == 51) {
            _armor = applyTier(AlcemistsJacket(tier), tier, 20);
        } else if (id == 52) {
            _armor = applyTier(ArchmagesJacket(tier), tier, 15);
        } else if (id == 53) {
            _armor = applyTier(ElvenJacket(tier), tier, 15);
        } else if (id == 54) {
            _armor = applyTier(ChosensJacket(tier), tier, 15);
        } else if (id == 55) {
            _armor = applyTier(ProphetsJacket(tier), tier, 10);
        } else if (id == 56) {
            _armor = applyTier(EldersJacket(tier), tier, 10);
        } else if (id == 57) {
            _armor = applyTier(AncientCuirass(tier), tier, 10);
        } else if (id == 58) {
            _armor = applyTier(MoonlightCuirass(tier), tier, 10);
        } else if (id == 59) {
            _armor = applyTier(SunlightCuirass(tier), tier, 10);
        } else if (id == 60) {
            _armor = applyTier(CycleCuirass(tier), tier, 7);
        } else if (id == 61) {
            _armor = applyTier(DemonicRobe(tier), tier, 7);
        } else if (id == 62) {
            _armor = applyTier(AngelicRobe(tier), tier, 7);
        } else if (id == 63) {
            _armor = applyTier(EternalRobe(tier), tier, 7);
        } else revert("?hm");
    }

    function SoldiersTunic(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 43;
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

    function PriestsTunic(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 44;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 5;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(1);
        _armor.generatedStatBonus = armorGenStats(1);
        _armor.elementalStats.ElementalDef = armorEle(1);
    }

    function FaithTunic(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 45;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 10;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(2);
        _armor.generatedStatBonus = armorGenStats(2);
        _armor.elementalStats.ElementalDef = armorEle(2);
    }

    function TraineesTunic(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 46;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 15;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(3);
        _armor.generatedStatBonus = armorGenStats(3);
        _armor.elementalStats.ElementalDef = armorEle(3);
    }

    function MagiciansShirt(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 47;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 20;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(4);
        _armor.generatedStatBonus = armorGenStats(4);
        _armor.elementalStats.ElementalDef = armorEle(4);
    }

    function SealedShirt(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 48;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 25;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(5);
        _armor.generatedStatBonus = armorGenStats(5);
        _armor.elementalStats.ElementalDef = armorEle(5);
    }

    function GateKeepersShirt(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 49;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 30;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(6);
        _armor.generatedStatBonus = armorGenStats(6);
        _armor.elementalStats.ElementalDef = armorEle(6);
    }

    function ElementalistsShirt(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 50;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 35;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(7);
        _armor.generatedStatBonus = armorGenStats(7);
        _armor.elementalStats.ElementalDef = armorEle(7);
    }

    function AlcemistsJacket(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 51;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 40;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(8);
        _armor.generatedStatBonus = armorGenStats(8);
        _armor.elementalStats.ElementalDef = armorEle(8);
    }

    function ArchmagesJacket(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 52;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 45;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(9);
        _armor.generatedStatBonus = armorGenStats(9);
        _armor.elementalStats.ElementalDef = armorEle(9);
    }

    function ElvenJacket(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 53;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 50;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(10);
        _armor.generatedStatBonus = armorGenStats(10);
        _armor.elementalStats.ElementalDef = armorEle(10);
    }

    function ChosensJacket(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 54;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 55;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(11);
        _armor.generatedStatBonus = armorGenStats(11);
        _armor.elementalStats.ElementalDef = armorEle(11);
    }

    function ProphetsJacket(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 55;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 60;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(12);
        _armor.generatedStatBonus = armorGenStats(12);
        _armor.elementalStats.ElementalDef = armorEle(12);
    }

    function EldersJacket(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 56;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 65;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(13);
        _armor.generatedStatBonus = armorGenStats(13);
        _armor.elementalStats.ElementalDef = armorEle(13);
    }

    function AncientCuirass(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 57;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 70;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(14);
        _armor.generatedStatBonus = armorGenStats(14);
        _armor.elementalStats.ElementalDef = armorEle(14);
    }

    function MoonlightCuirass(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 58;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 75;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(15);
        _armor.generatedStatBonus = armorGenStats(15);
        _armor.elementalStats.ElementalDef = armorEle(15);
    }

    function SunlightCuirass(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 59;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 80;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(16);
        _armor.generatedStatBonus = armorGenStats(16);
        _armor.elementalStats.ElementalDef = armorEle(16);
    }

    function CycleCuirass(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 60;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 85;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(17);
        _armor.generatedStatBonus = armorGenStats(17);
        _armor.elementalStats.ElementalDef = armorEle(17);
    }

    function DemonicRobe(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 61;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 90;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(18);
        _armor.generatedStatBonus = armorGenStats(18);
        _armor.elementalStats.ElementalDef = armorEle(18);
    }

    function AngelicRobe(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 62;
        _armor.metadata.baseType = ItemType.ARMOR;
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 95;
        _armor.requirement.classRequirement = classRequirement();

        // bonuses here
        _armor.statBonus = armorStats(19);
        _armor.generatedStatBonus = armorGenStats(19);
        _armor.elementalStats.ElementalDef = armorEle(19);
    }

    function EternalRobe(uint tier) public view returns (EquipableItem memory _armor) {
        _armor.metadata.id = 63;
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
        Class[] memory _reqClass = new Class[](3);
        _reqClass[0] = Class.Wizard;
        _reqClass[1] = Class.Priest;
        _reqClass[2] = Class.Necromancer;
        return _reqClass;
    }
}
