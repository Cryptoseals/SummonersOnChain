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

    function applyTier(GameObjects.Boots memory _grieves, uint tier, uint percentage) public view returns (GameObjects.Boots memory){
        if (tier == 0) return _grieves;
        _grieves.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_grieves.generatedStatBonus, (tier) * percentage);
        _grieves.elementalStats.ElementalDef = armorEle(percentage);
        _grieves.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_grieves.elementalStats, (tier) * percentage);
        return _grieves;
    }

    function boots(uint id, uint tier) public view returns (GameObjects.Boots memory) {
        require(tier < 10, "t");

        if (id == 43) {
            return applyTier(SoldiersSlipper(tier), tier, 1);
        } else if (id == 44) {
            return applyTier(PriestsSlipper(tier), tier, 1);
        } else if (id == 45) {
            return applyTier(FaithSlipper(tier), tier, 1);
        } else if (id == 46) {
            return applyTier(TraineesSlipper(tier), tier, 1);
        } else if (id == 47) {
            return applyTier(MagiciansSlipper(tier), tier, 1);
        } else if (id == 48) {
            return applyTier(SealedSandals(tier), tier, 2);
        } else if (id == 49) {
            return applyTier(GateKeepersSandals(tier), tier, 2);
        } else if (id == 50) {
            return applyTier(ElementalistsSandals(tier), tier, 2);
        } else if (id == 51) {
            return applyTier(AlcemistsSandals(tier), tier, 3);
        } else if (id == 52) {
            return applyTier(ArchmagesSandals(tier), tier, 3);
        } else if (id == 53) {
            return applyTier(ElvenShoes(tier), tier, 4);
        } else if (id == 54) {
            return applyTier(ChosensShoes(tier), tier, 4);
        } else if (id == 55) {
            return applyTier(ProphetsShoes(tier), tier, 5);
        } else if (id == 56) {
            return applyTier(EldersShoes(tier), tier, 6);
        } else if (id == 57) {
            return applyTier(AncientShoes(tier), tier, 7);
        } else if (id == 58) {
            return applyTier(MoonlightShoes(tier), tier, 9);
        } else if (id == 59) {
            return applyTier(SunlightShoes(tier), tier, 11);
        } else if (id == 60) {
            return applyTier(CycleShoes(tier), tier, 13);
        } else if (id == 61) {
            return applyTier(DemonicBoots(tier), tier, 15);
        } else if (id == 62) {
            return applyTier(AngelicBoots(tier), tier, 19);
        } else if (id == 63) {
            return applyTier(EternalBoots(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersSlipper(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 43;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Soldier's Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;

        // requirements here
        _grieves.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _grieves.requirement.classRequirement = classRequirement();

//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});


        // bonuses here
        _grieves.statBonus = armorStats(0);
        _grieves.generatedStatBonus = armorGenStats(0);
        _grieves.elementalStats.ElementalDef = armorEle(0);
    }

    function PriestsSlipper(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 44;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Executioner's Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 3;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(1);
        _grieves.generatedStatBonus = armorGenStats(1);
        _grieves.elementalStats.ElementalDef = armorEle(1);
    }

    function FaithSlipper(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 45;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Knight's Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 8;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(2);
        _grieves.generatedStatBonus = armorGenStats(2);
        _grieves.elementalStats.ElementalDef = armorEle(2);
    }

    function TraineesSlipper(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 46;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Dwarven Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 13;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(3);
        _grieves.generatedStatBonus = armorGenStats(3);
        _grieves.elementalStats.ElementalDef = armorEle(3);
    }

    function MagiciansSlipper(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 47;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Scale Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 18;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(4);
        _grieves.generatedStatBonus = armorGenStats(4);
        _grieves.elementalStats.ElementalDef = armorEle(4);
    }

    function SealedSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 48;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Winged Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 23;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(5);
        _grieves.generatedStatBonus = armorGenStats(5);
        _grieves.elementalStats.ElementalDef = armorEle(5);
    }

    function GateKeepersSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 49;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Draconic Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 28;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(6);
        _grieves.generatedStatBonus = armorGenStats(6);
        _grieves.elementalStats.ElementalDef = armorEle(6);
    }

    function ElementalistsSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 50;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Argent Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 33;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(7);
        _grieves.generatedStatBonus = armorGenStats(7);
        _grieves.elementalStats.ElementalDef = armorEle(7);
    }

    function AlcemistsSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 51;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Golden Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 38;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(8);
        _grieves.generatedStatBonus = armorGenStats(8);
        _grieves.elementalStats.ElementalDef = armorEle(8);
    }

    function ArchmagesSandals(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 52;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Midas's Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 43;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(9);
        _grieves.generatedStatBonus = armorGenStats(9);
        _grieves.elementalStats.ElementalDef = armorEle(9);
    }

    function ElvenShoes(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 53;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Juggernaut Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 48;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(10);
        _grieves.generatedStatBonus = armorGenStats(10);
        _grieves.elementalStats.ElementalDef = armorEle(10);
    }

    function ChosensShoes(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 54;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Chosen's Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 53;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(11);
        _grieves.generatedStatBonus = armorGenStats(11);
        _grieves.elementalStats.ElementalDef = armorEle(11);
    }

    function ProphetsShoes(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 55;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Templar Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 58;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(12);
        _grieves.generatedStatBonus = armorGenStats(12);
        _grieves.elementalStats.ElementalDef = armorEle(12);
    }

    function EldersShoes(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 56;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Vanguard Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 63;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(13);
        _grieves.generatedStatBonus = armorGenStats(13);
        _grieves.elementalStats.ElementalDef = armorEle(13);
    }

    function AncientShoes(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 57;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Void Dweller Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 68;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(14);
        _grieves.generatedStatBonus = armorGenStats(14);
        _grieves.elementalStats.ElementalDef = armorEle(14);
    }

    function MoonlightShoes(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 58;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Sun Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 73;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(15);
        _grieves.generatedStatBonus = armorGenStats(15);
        _grieves.elementalStats.ElementalDef = armorEle(15);
    }

    function SunlightShoes(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 59;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Moon Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 78;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(16);
        _grieves.generatedStatBonus = armorGenStats(16);
        _grieves.elementalStats.ElementalDef = armorEle(16);
    }

    function CycleShoes(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 60;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Demonic Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 83;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(17);
        _grieves.generatedStatBonus = armorGenStats(17);
        _grieves.elementalStats.ElementalDef = armorEle(17);
    }

    function DemonicBoots(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 61;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Angelic Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 88;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(18);
        _grieves.generatedStatBonus = armorGenStats(18);
        _grieves.elementalStats.ElementalDef = armorEle(18);
    }

    function AngelicBoots(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 62;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Cycle Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 93;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
        // bonuses here
        _grieves.statBonus = armorStats(19);
        _grieves.generatedStatBonus = armorGenStats(19);
        _grieves.elementalStats.ElementalDef = armorEle(19);
    }

    function EternalBoots(uint tier) public view returns (GameObjects.Boots memory _grieves) {
        _grieves.metadata.id = 63;
        _grieves.metadata.baseType = GameObjects.ItemType.BOOTS;
//        _grieves.metadata.name = "Eternal Sandals";
//        _grieves.metadata.description = "";
        _grieves.metadata.upgradable = true;
        _grieves.requirement.level = 98;
        _grieves.requirement.classRequirement = classRequirement();
//        _grieves.requirement.statRequirement = GameObjects.Stats({
//        STR : 0,
//        DEX : 0,
//        AGI : 0,
//        INT : 0,
//        VIT : 0,
//        LUCK : 0});
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
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](3);
        _reqClass[0] = GameObjects.Class.Wizard;
        _reqClass[1] = GameObjects.Class.Priest;
        _reqClass[2] = GameObjects.Class.Necromancer;
        return _reqClass;
    }
}
