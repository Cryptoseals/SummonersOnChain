import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexBootsHeavy is Initializable {
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
    function applyTier(GameObjects.Boots memory _boots, uint tier, uint percentage) public view returns (GameObjects.Boots memory){
        if (tier == 0) return _boots;
        _boots.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_boots.generatedStatBonus, (tier) * percentage);
        _boots.elementalStats.ElementalDef = bootEle(percentage);
        _boots.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_boots.elementalStats, (tier) * percentage);
        return _boots;
    }

    function boots(uint id, uint tier) public view returns (GameObjects.Boots memory) {
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
            return applyTier(DraconicBoots(tier), tier, 2);
        } else if (id == 8) {
            return applyTier(ArgentBoots(tier), tier, 2);
        } else if (id == 9) {
            return applyTier(GoldenBoots(tier), tier, 3);
        } else if (id == 10) {
            return applyTier(MidassBoots(tier), tier, 3);
        } else if (id == 11) {
            return applyTier(JuggernautBoots(tier), tier, 4);
        } else if (id == 12) {
            return applyTier(ChosensBoots(tier), tier, 4);
        } else if (id == 13) {
            return applyTier(TemplarBoots(tier), tier, 5);
        } else if (id == 14) {
            return applyTier(VanguardBoots(tier), tier, 6);
        } else if (id == 15) {
            return applyTier(VoidDwellerBoots(tier), tier, 7);
        } else if (id == 16) {
            return applyTier(SunBoots(tier), tier, 9);
        } else if (id == 17) {
            return applyTier(MoonBoots(tier), tier, 11);
        } else if (id == 18) {
            return applyTier(DemonicBoots(tier), tier, 13);
        } else if (id == 19) {
            return applyTier(AngelicBoots(tier), tier, 15);
        } else if (id == 20) {
            return applyTier(CycleBoots(tier), tier, 19);
        } else if (id == 21) {
            return applyTier(EternalBoots(tier), tier, 10);
        }

        revert("?hm");
    }

    function SoldiersBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 1;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Soldier's Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;

        // requirements here
        _boots.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _boots.requirement.classRequirement = classRequirement();

        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _boots.statBonus = bootStats(0);
        _boots.generatedStatBonus = bootGenStats(0);
        _boots.elementalStats.ElementalDef = bootEle(0);
    }

    function ExecutionerBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 2;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Executioner's Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 5;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(1);
        _boots.generatedStatBonus = bootGenStats(1);
        _boots.elementalStats.ElementalDef = bootEle(1);
    }

    function KnightsBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 3;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Knight's Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 10;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(2);
        _boots.generatedStatBonus = bootGenStats(2);
        _boots.elementalStats.ElementalDef = bootEle(2);
    }

    function DwarvenBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 4;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Dwarven Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 15;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(3);
        _boots.generatedStatBonus = bootGenStats(3);
        _boots.elementalStats.ElementalDef = bootEle(3);
    }

    function ScaleBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 5;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Scale Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 20;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(4);
        _boots.generatedStatBonus = bootGenStats(4);
        _boots.elementalStats.ElementalDef = bootEle(4);
    }

    function WingedBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 6;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Winged Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 25;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(5);
        _boots.generatedStatBonus = bootGenStats(5);
        _boots.elementalStats.ElementalDef = bootEle(5);
    }

    function DraconicBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 7;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Draconic Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 30;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(6);
        _boots.generatedStatBonus = bootGenStats(6);
        _boots.elementalStats.ElementalDef = bootEle(6);
    }

    function ArgentBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 8;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Argent Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 35;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(7);
        _boots.generatedStatBonus = bootGenStats(7);
        _boots.elementalStats.ElementalDef = bootEle(7);
    }

    function GoldenBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 9;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Golden Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 40;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(8);
        _boots.generatedStatBonus = bootGenStats(8);
        _boots.elementalStats.ElementalDef = bootEle(8);
    }

    function MidassBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 10;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Midas's Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 45;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(9);
        _boots.generatedStatBonus = bootGenStats(9);
        _boots.elementalStats.ElementalDef = bootEle(9);
    }

    function JuggernautBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 11;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Juggernaut Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 50;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(10);
        _boots.generatedStatBonus = bootGenStats(10);
        _boots.elementalStats.ElementalDef = bootEle(10);
    }

    function ChosensBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 12;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Chosen's Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 55;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(11);
        _boots.generatedStatBonus = bootGenStats(11);
        _boots.elementalStats.ElementalDef = bootEle(11);
    }

    function TemplarBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 13;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Templar Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 60;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(12);
        _boots.generatedStatBonus = bootGenStats(12);
        _boots.elementalStats.ElementalDef = bootEle(12);
    }

    function VanguardBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 14;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Vanguard Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 65;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(13);
        _boots.generatedStatBonus = bootGenStats(13);
        _boots.elementalStats.ElementalDef = bootEle(13);
    }

    function VoidDwellerBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 15;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Void Dweller Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 70;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(14);
        _boots.generatedStatBonus = bootGenStats(14);
        _boots.elementalStats.ElementalDef = bootEle(14);
    }

    function SunBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 16;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Sun Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 75;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(15);
        _boots.generatedStatBonus = bootGenStats(15);
        _boots.elementalStats.ElementalDef = bootEle(15);
    }

    function MoonBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 17;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Moon Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 80;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(16);
        _boots.generatedStatBonus = bootGenStats(16);
        _boots.elementalStats.ElementalDef = bootEle(16);
    }

    function DemonicBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 18;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Demonic Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 85;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(17);
        _boots.generatedStatBonus = bootGenStats(17);
        _boots.elementalStats.ElementalDef = bootEle(17);
    }

    function AngelicBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 19;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Angelic Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 90;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(18);
        _boots.generatedStatBonus = bootGenStats(18);
        _boots.elementalStats.ElementalDef = bootEle(18);
    }

    function CycleBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 20;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Cycle Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 95;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(19);
        _boots.generatedStatBonus = bootGenStats(19);
        _boots.elementalStats.ElementalDef = bootEle(19);
    }

    function EternalBoots(uint tier) public view returns (GameObjects.Boots memory _boots) {
        _boots.metadata.id = 21;
        _boots.metadata.baseType = GameObjects.ItemType.BOOTS;
        _boots.metadata.name = "Eternal Boots";
        _boots.metadata.description = "";
        _boots.metadata.upgradable = true;
        _boots.requirement.level = 100;
        _boots.requirement.classRequirement = classRequirement();
        _boots.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        // bonuses here
        _boots.statBonus = bootStats(20);
        _boots.generatedStatBonus = bootGenStats(20);
        _boots.elementalStats.ElementalDef = bootEle(20);
    }

    function bootStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : 0,
        VIT : BASE_VIT[index],
        LUCK : 0});
        return stats;
    }

    function bootEle(uint index) internal view returns (GameObjects.ElementalDef memory) {
        GameObjects.ElementalDef memory stats = GameObjects.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function bootGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
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
        _reqClass[0] = GameObjects.Class.Barbarian;
        _reqClass[1] = GameObjects.Class.Paladin;
        _reqClass[2] = GameObjects.Class.Necromancer;
        return _reqClass;
    }
}