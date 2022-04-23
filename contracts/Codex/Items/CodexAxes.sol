import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexAxes is Initializable {

    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_ATK;
    uint[21] public BASE_CRIT;
    uint[21] public BASE_CRITMULTI;
    uint[21] public BASE_ACCURACY;

    function initialize() external initializer {
        initializeSTR();
        initializeAGI();
        initializeDEX();
        initializeATK();
        initializeCRIT();
        initializeCRITMULTI();
        initializeACCURACY();
    }

    function initializeSTR() public {
        BASE_STR = [10, 50, 99, 149, 198, 248, 297, 347, 396, 446, 495, 545, 594, 644, 693, 743, 792, 842, 891, 941, 990];
    }

    function initializeAGI() public {
        BASE_AGI = [1, 3, 5, 8, 10, 12, 15, 17, 19, 22, 24, 27, 29, 31, 34, 36, 38, 41, 43, 46, 48];
    }

    function initializeDEX() public {
        BASE_DEX = [1, 5, 10, 15, 19, 24, 29, 34, 38, 43, 48, 53, 57, 62, 67, 72, 76, 81, 86, 91, 95];
    }

    function initializeATK() public {
        BASE_ATK = [46, 56, 70, 88, 110, 139, 177, 216, 286, 363, 462, 589, 750, 955, 1218, 1553, 1981, 2528, 3224, 4113, 5249];
    }

    function initializeCRIT() public {
        BASE_CRIT = [3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11];
    }

    function initializeCRITMULTI() public {
        BASE_CRITMULTI = [120, 120, 130, 142, 154, 168, 184, 200, 219, 239, 262, 287, 315, 320, 320, 320, 320, 320, 320, 320, 320];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [114, 114, 132, 159, 192, 232, 282, 341, 413, 501, 608, 739, 897, 1090, 1324, 1611, 1959, 2381, 2896, 3522, 4284];
    }

    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "t");

        if (id == 64) {
            return applyTier(WoodenAxe(tier), tier, 4);
        } else if(id == 65) {
            return applyTier(StoneAxe(tier), tier, 5);
        } else if (id == 66) {
            return applyTier(FlintAxe(tier), tier, 5);
        } else if (id == 67) {
            return applyTier(SteelAxe(tier), tier, 5);
        } else if (id == 68) {
            return applyTier(BerserkersAxe(tier), tier, 5);
        } else if (id == 69) {
            return applyTier(SkullAxe(tier), tier, 5);
        } else if (id == 70) {
            return applyTier(EmeraldAxe(tier), tier, 5);
        } else if (id == 71) {
            return applyTier(VerdantAxe(tier), tier, 5);
        } else if (id == 72) {
            return applyTier(TitaniumAxe(tier), tier, 5);
        } else if (id == 73) {
            return applyTier(CrescentAxe(tier), tier, 5);
        } else if (id == 74) {
            return applyTier(AxeOfMoonlight(tier), tier, 5);
        } else if (id == 75) {
            return applyTier(AxeOfSunlight(tier), tier, 5);
        } else if (id == 76) {
            return applyTier(CycleAxe(tier), tier, 5);
        } else if (id == 77) {
            return applyTier(PhantasmalAxe(tier), tier, 5);
        } else if (id == 78) {
            return applyTier(WarlordsAxe(tier), tier, 5);
        } else if (id == 79) {
            return applyTier(LuminescentAxe(tier), tier, 5);
        } else if (id == 80) {
            return applyTier(EldersAxe(tier), tier, 5);
        } else if (id == 81) {
            return applyTier(FallenOrdersAxe(tier), tier, 5);
        } else if (id == 82) {
            return applyTier(IncursionAxe(tier), tier, 5);
        } else if (id == 83) {
            return applyTier(TotemicAxe(tier), tier, 5);
        } else if (id == 84) {
            return applyTier(Blooddrinker(tier), tier, 5);
        }

        revert("?a");
    }

    function applyTier(GameObjects.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) *percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) *percentage);
        return weapon;
    }

    function WoodenAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Wooden Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;


        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[0],
        DEX : BASE_DEX[0],
        AGI : BASE_AGI[0],
        INT : 0,
        VIT : 0,
        LUCK : 0});

        _weapon.generatedStatBonus.P_ATK = BASE_ATK[0];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[0];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[0];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[0];
    }

    function StoneAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 2;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Stone Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[1],
        DEX : BASE_DEX[1],
        AGI : BASE_AGI[1],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[1];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[1];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[1];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[1];
    }

    function FlintAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 3;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Flint Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[2],
        DEX : BASE_DEX[2],
        AGI : BASE_AGI[2],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[2];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[2];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[2];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[2];
    }

    function SteelAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 4;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Steel Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[3],
        DEX : BASE_DEX[3],
        AGI : BASE_AGI[3],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[3];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[3];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[3];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[3];
    }

    function BerserkersAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 5;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Berserker's Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[4],
        DEX : BASE_DEX[4],
        AGI : BASE_AGI[4],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[4];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[4];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[4];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[4];
    }

    function SkullAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 6;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Skull Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[5],
        DEX : BASE_DEX[5],
        AGI : BASE_AGI[5],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[5];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[5];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[5];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[5];
    }

    function EmeraldAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 7;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Emerald Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[6],
        DEX : BASE_DEX[6],
        AGI : BASE_AGI[6],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[6];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[6];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[6];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[6];
    }

    function VerdantAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 8;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Verdant Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[7],
        DEX : BASE_DEX[7],
        AGI : BASE_AGI[7],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[7];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[7];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[7];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[7];
    }

    function TitaniumAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 9;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Titanium Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[8],
        DEX : BASE_DEX[8],
        AGI : BASE_AGI[8],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[8];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[8];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[8];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[8];
    }

    function CrescentAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 10;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Crescent Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[9],
        DEX : BASE_DEX[9],
        AGI : BASE_AGI[9],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[9];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[9];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[9];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[9];
    }

    function AxeOfMoonlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 11;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Axe of Moonlight";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[10],
        DEX : BASE_DEX[10],
        AGI : BASE_AGI[10],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[10];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[10];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[10];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[10];
    }

    function AxeOfSunlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 12;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Axe of Sunlight";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[11],
        DEX : BASE_DEX[11],
        AGI : BASE_AGI[11],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[11];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[11];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[11];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[11];
    }

    function CycleAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 13;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Cycle Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[12],
        DEX : BASE_DEX[12],
        AGI : BASE_AGI[12],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[12];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[12];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[12];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[12];
    }

    function PhantasmalAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 14;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Phantasmal Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[13],
        DEX : BASE_DEX[13],
        AGI : BASE_AGI[13],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[13];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[13];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[13];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[13];
    }

    function WarlordsAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 15;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Warlord's Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[14],
        DEX : BASE_DEX[14],
        AGI : BASE_AGI[14],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[14];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[14];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[14];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[14];
    }

    function LuminescentAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 16;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Luminescent Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[15],
        DEX : BASE_DEX[15],
        AGI : BASE_AGI[15],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[15];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[15];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[15];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[15];
    }

    function EldersAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 17;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Elder's Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[16],
        DEX : BASE_DEX[16],
        AGI : BASE_AGI[16],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[16];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[16];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[16];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[16];
    }

    function FallenOrdersAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 18;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Fallen Order's Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[17],
        DEX : BASE_DEX[17],
        AGI : BASE_AGI[17],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[17];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[17];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[17];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[17];
    }

    function IncursionAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 20;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Incursion Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[18],
        DEX : BASE_DEX[18],
        AGI : BASE_AGI[18],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[18];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[18];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[18];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[18];
    }

    function TotemicAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 21;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "TotemicAxe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[19],
        DEX : BASE_DEX[19],
        AGI : BASE_AGI[19],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[19];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[19];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[19];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[19];
    }

    function Blooddrinker(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 22;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Blooddrinker";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = new GameObjects.Class[](3);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Ranger;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : BASE_STR[20],
        DEX : BASE_DEX[20],
        AGI : BASE_AGI[20],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.generatedStatBonus.P_ATK = BASE_ATK[20];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[20];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[20];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[20];
    }
}
