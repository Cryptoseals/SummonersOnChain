import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
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


    function applyTier(GameObjects.Armor memory _armor, uint tier, uint percentage) public view returns (GameObjects.Armor memory){
        if (tier == 0) return _armor;
        _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_armor.generatedStatBonus, (tier) * percentage);
        _armor.elementalStats.ElementalDef = armorEle(percentage);
        _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_armor.elementalStats, (tier) * percentage);
        return _armor;
    }

    function armor(uint id, uint tier) public view returns (GameObjects.Armor memory) {
        require(tier < 10, "t");

        if (id == 1) {
            return applyTier(SoldiersArmor(tier), tier, 1);
        } else if (id == 2) {
            return applyTier(ExecutionerArmor(tier), tier, 1);
        } else if (id == 3) {
            return applyTier(KnightsArmor(tier), tier, 1);
        } else if (id == 4) {
            return applyTier(DwarvenArmor(tier), tier, 1);
        } else if (id == 5) {
            return applyTier(ScaleArmor(tier), tier, 1);
        } else if (id == 6) {
            return applyTier(WingedArmor(tier), tier, 2);
        } else if (id == 7) {
            return applyTier(JuggernautArmor(tier), tier, 2);
        } else if (id == 8) {
            return applyTier(DraconicArmor(tier), tier, 2);
        } else if (id == 9) {
            return applyTier(DragonsilverArmor(tier), tier, 3);
        } else if (id == 10) {
            return applyTier(GoldenArmor(tier), tier, 3);
        } else if (id == 11) {
            return applyTier(MidassArmor(tier), tier, 4);
        } else if (id == 12) {
            return applyTier(ChosensArmor(tier), tier, 4);
        } else if (id == 13) {
            return applyTier(TemplarArmor(tier), tier, 5);
        } else if (id == 14) {
            return applyTier(VanguardArmor(tier), tier, 6);
        } else if (id == 15) {
            return applyTier(VoidDwellerArmor(tier), tier, 7);
        } else if (id == 16) {
            return applyTier(MoonlightArmor(tier), tier, 9);
        } else if (id == 17) {
            return applyTier(SunlightArmor(tier), tier, 11);
        } else if (id == 18) {
            return applyTier(CycleArmor(tier), tier, 13);
        } else if (id == 19) {
            return applyTier(DemonicArmor(tier), tier, 15);
        } else if (id == 20) {
            return applyTier(AngelicArmor(tier), tier, 19);
        } else if (id == 21) {
            return applyTier(EternalArmor(tier), tier, 20);
        }

        revert("?hm");
    }

    function SoldiersArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 1;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Soldier's Armor";
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

    function ExecutionerArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 2;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Executioner Armor";
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

    function KnightsArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 3;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Knight's Armor";
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

    function DwarvenArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 4;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Dwarven Armor";
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

    function ScaleArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 5;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Scale Armor";
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

    function WingedArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 6;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Winged Armor";
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

    function JuggernautArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 7;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Juggernaut Armor";
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

    function DraconicArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 8;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Draconic Armor";
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

    function DragonsilverArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 9;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Dragonsilver Armor";
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

    function GoldenArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 10;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Golden Armor";
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

    function MidassArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 11;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Midas's Armor";
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

    function ChosensArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 12;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Chosen's Armor";
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

    function TemplarArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 13;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Templar Armor";
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

    function VanguardArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 14;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Vanguard Armor";
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

    function VoidDwellerArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 15;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Void Dweller Armor";
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

    function MoonlightArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 16;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Sun Armor";
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

    function SunlightArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 17;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Moon Armor";
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

    function CycleArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 18;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Demonic Armor";
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

    function DemonicArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 19;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Angelic Armor";
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

    function AngelicArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 20;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Cycle Armor";
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

    function EternalArmor(uint tier) public view returns (GameObjects.Armor memory _armor) {
        _armor.metadata.id = 21;
        _armor.metadata.baseType = GameObjects.ItemType.ARMOR;
//        _armor.metadata.name = "Eternal Armor";
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
        _reqClass[0] = GameObjects.Class.Barbarian;
        _reqClass[1] = GameObjects.Class.Paladin;
        return _reqClass;
    }
}
