import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
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
            return applyTier(SoldiersTunic(tier), tier, 1);
        } else if (id == 44) {
            return applyTier(PriestsTunic(tier), tier, 1);
        } else if (id == 45) {
            return applyTier(FaithTunic(tier), tier, 1);
        } else if (id == 46) {
            return applyTier(TraineesTunic(tier), tier, 1);
        } else if (id == 47) {
            return applyTier(MagiciansShirt(tier), tier, 1);
        } else if (id == 48) {
            return applyTier(SealedShirt(tier), tier, 2);
        } else if (id == 49) {
            return applyTier(GateKeepersShirt(tier), tier, 2);
        } else if (id == 50) {
            return applyTier(ElementalistsShirt(tier), tier, 2);
        } else if (id == 51) {
            return applyTier(AlcemistsJacket(tier), tier, 3);
        } else if (id == 52) {
            return applyTier(ArchmagesJacket(tier), tier, 3);
        } else if (id == 53) {
            return applyTier(ElvenJacket(tier), tier, 4);
        } else if (id == 54) {
            return applyTier(ChosensJacket(tier), tier, 4);
        } else if (id == 55) {
            return applyTier(ProphetsJacket(tier), tier, 5);
        } else if (id == 56) {
            return applyTier(EldersJacket(tier), tier, 6);
        } else if (id == 57) {
            return applyTier(AncientCuirass(tier), tier, 7);
        } else if (id == 58) {
            return applyTier(MoonlightCuirass(tier), tier, 9);
        } else if (id == 59) {
            return applyTier(SunlightCuirass(tier), tier, 11);
        } else if (id == 60) {
            return applyTier(CycleCuirass(tier), tier, 13);
        } else if (id == 61) {
            return applyTier(DemonicRobe(tier), tier, 15);
        } else if (id == 62) {
            return applyTier(AngelicRobe(tier), tier, 19);
        } else if (id == 63) {
            return applyTier(EternalRobe(tier), tier, 20);
        }

        revert("?hm");
    }

    function SoldiersTunic(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 43;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Soldier's Tunic";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;

        // requirements here
        _armor.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _armor.requirement.classRequirement = classRequirement();

//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});


        // bonuses here
        _armor.statBonus = armorStats(0);
        _armor.generatedStatBonus = armorGenStats(0);
        _armor.elementalStats.ElementalDef = armorEle(0);
    }

    function PriestsTunic(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 44;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Priest's Tunic";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 5;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(1);
        _armor.generatedStatBonus = armorGenStats(1);
        _armor.elementalStats.ElementalDef = armorEle(1);
    }

    function FaithTunic(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 45;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Faith Tunic";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 10;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(2);
        _armor.generatedStatBonus = armorGenStats(2);
        _armor.elementalStats.ElementalDef = armorEle(2);
    }

    function TraineesTunic(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 46;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Trainee's Tunic";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 15;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(3);
        _armor.generatedStatBonus = armorGenStats(3);
        _armor.elementalStats.ElementalDef = armorEle(3);
    }

    function MagiciansShirt(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 47;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Trainee's Tunic";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 20;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(4);
        _armor.generatedStatBonus = armorGenStats(4);
        _armor.elementalStats.ElementalDef = armorEle(4);
    }

    function SealedShirt(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 48;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Sealed Shirt";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 25;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(5);
        _armor.generatedStatBonus = armorGenStats(5);
        _armor.elementalStats.ElementalDef = armorEle(5);
    }

    function GateKeepersShirt(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 49;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Gate Keeper's Shirt";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 30;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(6);
        _armor.generatedStatBonus = armorGenStats(6);
        _armor.elementalStats.ElementalDef = armorEle(6);
    }

    function ElementalistsShirt(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 50;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Elementalist's Shirt";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 35;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(7);
        _armor.generatedStatBonus = armorGenStats(7);
        _armor.elementalStats.ElementalDef = armorEle(7);
    }

    function AlcemistsJacket(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 51;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Alchemist's Shirt";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 40;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(8);
        _armor.generatedStatBonus = armorGenStats(8);
        _armor.elementalStats.ElementalDef = armorEle(8);
    }

    function ArchmagesJacket(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 52;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Archmage's Jacket";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 45;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(9);
        _armor.generatedStatBonus = armorGenStats(9);
        _armor.elementalStats.ElementalDef = armorEle(9);
    }

    function ElvenJacket(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 53;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Elven Jacket";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 50;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(10);
        _armor.generatedStatBonus = armorGenStats(10);
        _armor.elementalStats.ElementalDef = armorEle(10);
    }

    function ChosensJacket(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 54;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Chosen's Jacket";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 55;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(11);
        _armor.generatedStatBonus = armorGenStats(11);
        _armor.elementalStats.ElementalDef = armorEle(11);
    }

    function ProphetsJacket(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 55;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Prophet's Jacket";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 60;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(12);
        _armor.generatedStatBonus = armorGenStats(12);
        _armor.elementalStats.ElementalDef = armorEle(12);
    }

    function EldersJacket(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 56;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Elder's Jacket";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 65;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(13);
        _armor.generatedStatBonus = armorGenStats(13);
        _armor.elementalStats.ElementalDef = armorEle(13);
    }

    function AncientCuirass(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 57;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Ancient Cuirass";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 70;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(14);
        _armor.generatedStatBonus = armorGenStats(14);
        _armor.elementalStats.ElementalDef = armorEle(14);
    }

    function MoonlightCuirass(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 58;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Moon Cuirass";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 75;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(15);
        _armor.generatedStatBonus = armorGenStats(15);
        _armor.elementalStats.ElementalDef = armorEle(15);
    }

    function SunlightCuirass(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 59;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Sun Cuirass";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 80;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(16);
        _armor.generatedStatBonus = armorGenStats(16);
        _armor.elementalStats.ElementalDef = armorEle(16);
    }

    function CycleCuirass(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 60;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Cycle Cuirass";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 85;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(17);
        _armor.generatedStatBonus = armorGenStats(17);
        _armor.elementalStats.ElementalDef = armorEle(17);
    }

    function DemonicRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 61;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Demonic Robe";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 90;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(18);
        _armor.generatedStatBonus = armorGenStats(18);
        _armor.elementalStats.ElementalDef = armorEle(18);
    }

    function AngelicRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 62;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Angelic Robe";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 95;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _armor.statBonus = armorStats(19);
        _armor.generatedStatBonus = armorGenStats(19);
        _armor.elementalStats.ElementalDef = armorEle(19);
    }

    function EternalRobe(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 63;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Eternal Robe";
//        _armor.metadata.description = "";
        _armor.metadata.upgradable = true;
        _armor.requirement.level = 100;
        _armor.requirement.classRequirement = classRequirement();
//        _armor.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
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
