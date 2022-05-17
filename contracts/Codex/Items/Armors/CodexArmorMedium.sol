import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexArmorsMedium is Initializable {
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

        if (id == 22) {
            return applyTier(SoldiersTunic(tier), tier, 1);
        } else if (id == 23) {
            return applyTier(ExecutionersTunic(tier), tier, 1);
        } else if (id == 24) {
            return applyTier(HuntersShirt(tier), tier, 1);
        } else if (id == 25) {
            return applyTier(RangerShirt(tier), tier, 1);
        } else if (id == 26) {
            return applyTier(MercenaryCoat(tier), tier, 1);
        } else if (id == 27) {
            return applyTier(NobleCoat(tier), tier, 2);
        } else if (id == 28) {
            return applyTier(BloodstainedCoat(tier), tier, 2);
        } else if (id == 29) {
            return applyTier(CoatOfDusk(tier), tier, 2);
        } else if (id == 30) {
            return applyTier(ShadowLongcoat(tier), tier, 3);
        } else if (id == 31) {
            return applyTier(HeadmastersLongcoat(tier), tier, 3);
        } else if (id == 32) {
            return applyTier(ElvenLongcoat(tier), tier, 4);
        } else if (id == 33) {
            return applyTier(ChosensLongcoat(tier), tier, 4);
        } else if (id == 34) {
            return applyTier(ProphetsLongcoat(tier), tier, 5);
        } else if (id == 35) {
            return applyTier(EldersLongcoat(tier), tier, 6);
        } else if (id == 36) {
            return applyTier(AncientLongcoat(tier), tier, 7);
        } else if (id == 37) {
            return applyTier(MoonLongcoat(tier), tier, 9);
        } else if (id == 38) {
            return applyTier(SunLongcoat(tier), tier, 11);
        } else if (id == 39) {
            return applyTier(CycleLongcoat(tier), tier, 13);
        } else if (id == 40) {
            return applyTier(DemonicSuit(tier), tier, 15);
        } else if (id == 41) {
            return applyTier(AngelicSuit(tier), tier, 19);
        } else if (id == 42) {
            return applyTier(EternalSuit(tier), tier, 20);
        }

        revert("?hm");
    }

    function SoldiersTunic(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 22;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Soldier's Coat";
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

    function ExecutionersTunic(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 23;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Executioner's Coat";
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

    function HuntersShirt(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 24;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Knight's Coat";
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

    function RangerShirt(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 25;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Dwarven Coat";
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

    function MercenaryCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 26;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Scale Coat";
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

    function NobleCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 27;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Winged Coat";
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

    function BloodstainedCoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 28;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Draconic Coat";
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

    function CoatOfDusk(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 29;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Argent Coat";
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

    function ShadowLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 30;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Golden Coat";
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

    function HeadmastersLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 31;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Midas's Coat";
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

    function ElvenLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 32;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Juggernaut Coat";
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

    function ChosensLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 33;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Chosen's Coat";
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

    function ProphetsLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 34;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Templar Coat";
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

    function EldersLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 35;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Vanguard Coat";
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

    function AncientLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 36;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Void Dweller Coat";
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

    function MoonLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 37;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Sun Coat";
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

    function SunLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 38;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Moon Coat";
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

    function CycleLongcoat(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 39;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Demonic Coat";
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

    function DemonicSuit(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 40;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Angelic Coat";
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

    function AngelicSuit(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 41;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Cycle Coat";
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

    function EternalSuit(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 42;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Eternal Coat";
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
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](3);
        _reqClass[0] = GameObjects.Class.Assassin;
        _reqClass[1] = GameObjects.Class.Ranger;
        _reqClass[2] = GameObjects.Class.Engineer;
        return _reqClass;
    }
}
