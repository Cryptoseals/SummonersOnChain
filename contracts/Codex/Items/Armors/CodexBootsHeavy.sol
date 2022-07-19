import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments} from "../../../Interfaces/GameObjects/IGameObjects.sol";

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

    function applyTier(GameObjects_Equipments.EquipableItem memory _boots, uint tier, uint percentage) public view returns (GameObjects_Equipments.EquipableItem memory){
        if (tier == 0) return _boots;
        _boots.statBonus = EquipableUtils.sumStatsAsTier(_boots.statBonus, tier * percentage);
        _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_boots.generatedStatBonus, (tier) * percentage);
        _boots.elementalStats.ElementalDef = bootEle(percentage);
        _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_boots.elementalStats, (tier) * percentage);
        return _boots;
    }

    function boots(uint id, uint tier) public view returns (GameObjects_Equipments.EquipableItem memory) {
        require(tier < 10, "t");

        if (id == 1) {
            return applyTier(SoldiersBoots(tier), tier, 1);
        } else if (id == 2) {
            return applyTier(ExecutionerBoots(tier), tier, 1);
        } else if (id == 3) {
            return applyTier(KnightsBoots(tier), tier, 1);
        } else if (id == 4) {
            return applyTier(DwarvenBoots(tier), tier, 1);
        } else if (id == 5) {
            return applyTier(ScaleBoots(tier), tier, 1);
        } else if (id == 6) {
            return applyTier(WingedBoots(tier), tier, 2);
        } else if (id == 7) {
            return applyTier(JuggernautBoots(tier), tier, 2);
        } else if (id == 8) {
            return applyTier(DraconicBoots(tier), tier, 2);
        } else if (id == 9) {
            return applyTier(DragonsilverBoots(tier), tier, 3);
        } else if (id == 10) {
            return applyTier(GoldenBoots(tier), tier, 3);
        } else if (id == 11) {
            return applyTier(MidassBoots(tier), tier, 4);
        } else if (id == 12) {
            return applyTier(ChosensBoots(tier), tier, 4);
        } else if (id == 13) {
            return applyTier(TemplarBoots(tier), tier, 5);
        } else if (id == 14) {
            return applyTier(VanguardBoots(tier), tier, 6);
        } else if (id == 15) {
            return applyTier(VoidDwellerBoots(tier), tier, 7);
        } else if (id == 16) {
            return applyTier(MoonlightBoots(tier), tier, 9);
        } else if (id == 17) {
            return applyTier(SunlightBoots(tier), tier, 11);
        } else if (id == 18) {
            return applyTier(CycleBoots(tier), tier, 13);
        } else if (id == 19) {
            return applyTier(DemonicBoots(tier), tier, 15);
        } else if (id == 20) {
            return applyTier(AngelicBoots(tier), tier, 19);
        } else if (id == 21) {
            return applyTier(EternalBoots(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 1;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        // _boots.metadata.name = "Soldier's Boots";
        // _boots.metadata.description = "";
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

    function ExecutionerBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 2;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //  _boots.metadata.name = "Executioner's Boots";
        //  _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 3;
        _boots.requirement.classRequirement = classRequirement();
        // _boots.requirement.statRequirement = GameObjects.Stats({

        _boots.statBonus = bootStats(1);
        _boots.generatedStatBonus = bootGenStats(1);
        _boots.elementalStats.ElementalDef = bootEle(1);
    }

    function KnightsBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 3;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //   _boots.metadata.name = "Knight's Boots";
        //   _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 8;
        _boots.requirement.classRequirement = classRequirement();
        //   _boots.requirement.statRequirement = GameObjects.Stats({

        _boots.statBonus = bootStats(2);
        _boots.generatedStatBonus = bootGenStats(2);
        _boots.elementalStats.ElementalDef = bootEle(2);
    }

    function DwarvenBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 4;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //  _boots.metadata.name = "Dwarven Boots";
        //  _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 13;
        _boots.requirement.classRequirement = classRequirement();
        //  _boots.requirement.statRequirement = GameObjects.Stats({

        _boots.statBonus = bootStats(3);
        _boots.generatedStatBonus = bootGenStats(3);
        _boots.elementalStats.ElementalDef = bootEle(3);
    }

    function ScaleBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 5;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        // _boots.metadata.name = "Scale Boots";
        // _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 18;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(4);
        _boots.generatedStatBonus = bootGenStats(4);
        _boots.elementalStats.ElementalDef = bootEle(4);
    }

    function WingedBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 6;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //  _boots.metadata.name = "Winged Boots";
        //  _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 23;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(5);
        _boots.generatedStatBonus = bootGenStats(5);
        _boots.elementalStats.ElementalDef = bootEle(5);
    }

    function JuggernautBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 7;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //  _boots.metadata.name = "Juggernaut Boots";
        //  _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 28;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(6);
        _boots.generatedStatBonus = bootGenStats(6);
        _boots.elementalStats.ElementalDef = bootEle(6);
    }

    function DraconicBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 8;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //  _boots.metadata.name = "Draconic Boots";
        //  _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 33;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(7);
        _boots.generatedStatBonus = bootGenStats(7);
        _boots.elementalStats.ElementalDef = bootEle(7);
    }

    function DragonsilverBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 9;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //    _boots.metadata.name = "Dragonsilver Boots";
        //    _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 38;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(8);
        _boots.generatedStatBonus = bootGenStats(8);
        _boots.elementalStats.ElementalDef = bootEle(8);
    }

    function GoldenBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 10;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        // _boots.metadata.name = "Golden Boots";
        // _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 43;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(9);
        _boots.generatedStatBonus = bootGenStats(9);
        _boots.elementalStats.ElementalDef = bootEle(9);
    }

    function MidassBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 11;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        ////_boots.metadata.name = "Midas's Boots";
        //_boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 48;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(10);
        _boots.generatedStatBonus = bootGenStats(10);
        _boots.elementalStats.ElementalDef = bootEle(10);
    }

    function ChosensBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 12;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //_boots.metadata.name = "Chosen's Boots";
        //_boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 53;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(11);
        _boots.generatedStatBonus = bootGenStats(11);
        _boots.elementalStats.ElementalDef = bootEle(11);
    }

    function TemplarBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 13;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //_boots.metadata.name = "Templar Boots";
        //_boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 58;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(12);
        _boots.generatedStatBonus = bootGenStats(12);
        _boots.elementalStats.ElementalDef = bootEle(12);
    }

    function VanguardBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 14;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //_boots.metadata.name = "Vanguard Boots";
        //_boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 63;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(13);
        _boots.generatedStatBonus = bootGenStats(13);
        _boots.elementalStats.ElementalDef = bootEle(13);
    }

    function VoidDwellerBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 15;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //_boots.metadata.name = "Void Dweller Boots";
        //_boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 68;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(14);
        _boots.generatedStatBonus = bootGenStats(14);
        _boots.elementalStats.ElementalDef = bootEle(14);
    }

    function MoonlightBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 16;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //  _boots.metadata.name = "Sun Boots";
        // _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 73;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(15);
        _boots.generatedStatBonus = bootGenStats(15);
        _boots.elementalStats.ElementalDef = bootEle(15);
    }

    function SunlightBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 17;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //  _boots.metadata.name = "Moon Boots";
        //  _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 78;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(16);
        _boots.generatedStatBonus = bootGenStats(16);
        _boots.elementalStats.ElementalDef = bootEle(16);
    }

    function CycleBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 18;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //  _boots.metadata.name = "Demonic Boots";
        // _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 83;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(17);
        _boots.generatedStatBonus = bootGenStats(17);
        _boots.elementalStats.ElementalDef = bootEle(17);
    }

    function DemonicBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 19;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //  _boots.metadata.name = "Angelic Boots";
        //  _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 88;
        _boots.requirement.classRequirement = classRequirement();

        // bonuses here
        _boots.statBonus = bootStats(18);
        _boots.generatedStatBonus = bootGenStats(18);
        _boots.elementalStats.ElementalDef = bootEle(18);
    }

    function AngelicBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 20;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        // _boots.metadata.name = "Cycle Boots";
        // _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 93;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(19);
        _boots.generatedStatBonus = bootGenStats(19);
        _boots.elementalStats.ElementalDef = bootEle(19);
    }

    function EternalBoots(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _boots) {
        _boots.metadata.id = 21;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        //   _boots.metadata.name = "Eternal Boots";
        //   _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 98;
        _boots.requirement.classRequirement = classRequirement();

        _boots.statBonus = bootStats(20);
        _boots.generatedStatBonus = bootGenStats(20);
        _boots.elementalStats.ElementalDef = bootEle(20);
    }

    function bootStats(uint index) internal view returns (GameObjects_Stats.Stats memory) {
        GameObjects_Stats.Stats memory stats = GameObjects_Stats.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function bootEle(uint index) internal view returns (GameObjects_Stats.ElementalDef memory) {
        GameObjects_Stats.ElementalDef memory stats = GameObjects_Stats.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function bootGenStats(uint index) internal view returns (GameObjects_Stats.GeneratedStats memory) {
        GameObjects_Stats.GeneratedStats memory stats = GameObjects_Stats.GeneratedStats({
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
