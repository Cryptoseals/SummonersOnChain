import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexFocuses is Initializable {

    uint[21] public BASE_INT;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_LUK;
    uint[21] public BASE_MATK;
    uint[21] public BASE_CRIT;
    uint[21] public BASE_CRITMULTI;
    uint[21] public BASE_ACCURACY;
    uint[21] public BASE_DODGE;


    function initialize() external initializer {
        initializeINT();
        initializeAGI();
        initializeDEX();
        initializeLUK();
        initializeMATK();
        initializeCRIT();
        initializeCRITMULTI();
        initializeACCURACY();
        initializeDODGE();
    }

    function initializeINT() public {
        BASE_INT = [8, 38, 76, 114, 152, 190, 228, 266, 304, 342, 380, 418, 456, 494, 532, 570, 608, 646, 684, 722, 760];
    }

    function initializeAGI() public {
        BASE_AGI = [2, 6, 11, 16, 21, 27, 32, 37, 42, 48, 53, 58, 63, 69, 74, 79, 84, 90, 95, 100, 105];
    }

    function initializeDEX() public {
        BASE_DEX = [2, 6, 11, 16, 21, 27, 32, 37, 42, 48, 53, 58, 63, 69, 74, 79, 84, 90, 95, 100, 105];
    }

    function initializeLUK() public {
        BASE_LUK = [1, 1, 2, 2, 3, 4, 4, 5, 5, 6, 7, 7, 8, 9, 9, 10, 10, 11, 12, 12, 13];
    }

    function initializeMATK() public {
        BASE_MATK = [33, 40, 50, 63, 79, 100, 127, 155, 205, 261, 332, 423, 538, 686, 874, 1114, 1421, 1814, 2313, 2951, 3765];
    }

    function initializeCRIT() public {
        BASE_CRIT = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3];
    }

    function initializeCRITMULTI() public {
        BASE_CRITMULTI = [25, 27, 30, 32, 35, 38, 42, 46, 50, 54, 60, 65, 66, 66, 66, 66, 66, 66, 66, 66, 66];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [48, 56, 68, 82, 99, 119, 144, 175, 212, 258, 313, 380, 462, 561, 682, 829, 1008, 1226, 1491, 1813, 2206];
    }

    function initializeDODGE() public {
        BASE_DODGE = [23, 28, 35, 45, 57, 72, 92, 117, 149, 190, 242, 300, 394, 502, 641, 817, 1043, 1331, 1698, 2167, 2765];
    }

    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "t");

        if (id == 106) {
            return applyTier(WellShapedRock(tier), tier, 4);
        } else if (id == 107) {
            return applyTier(SilverCoin(tier), tier, 5);
        } else if (id == 108) {
            return applyTier(ChannellingCrystal(tier), tier, 5);
        } else if (id == 109) {
            return applyTier(IdolOfAberranth(tier), tier, 5);
        } else if (id == 110) {
            return applyTier(WarlordTotem(tier), tier, 5);
        } else if (id == 111) {
            return applyTier(BookOfPhilosopher(tier), tier, 5);
        } else if (id == 112) {
            return applyTier(GoldenChain(tier), tier, 5);
        } else if (id == 113) {
            return applyTier(EvergreenFlower(tier), tier, 5);
        } else if (id == 114) {
            return applyTier(StarfallensStaff(tier), tier, 5);
        } else if (id == 115) {
            return applyTier(BlessedDice(tier), tier, 5);
        } else if (id == 116) {
            return applyTier(MoonstoneRelic(tier), tier, 5);
        } else if (id == 117) {
            return applyTier(SunfireRelic(tier), tier, 5);
        } else if (id == 118) {
            return applyTier(CycleRelic(tier), tier, 5);
        } else if (id == 119) {
            return applyTier(PhantasmalRelic(tier), tier, 5);
        } else if (id == 120) {
            return applyTier(AncientOrb(tier), tier, 5);
        } else if (id == 121) {
            return applyTier(ScrollOfLuminous(tier), tier, 5);
        } else if (id == 122) {
            return applyTier(HeavenfallenFeather(tier), tier, 5);
        } else if (id == 123) {
            return applyTier(Godbringt(tier), tier, 5);
        } else if (id == 124) {
            return applyTier(KeyOfTheExistence(tier), tier, 5);
        } else if (id == 125) {
            return applyTier(MistguardRelic(tier), tier, 5);
        } else if (id == 126) {
            return applyTier(Mistbringer(tier), tier, 5);
        }

        revert("?f");
    }

    function applyTier(GameObjects.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier+1)*percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier+1)*percentage);
        return weapon;
    }

    function WellShapedRock(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Well Shaped Rock";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;


        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[0],
        AGI : BASE_AGI[0],
        INT : BASE_INT[0],
        VIT : 0,
        LUCK : BASE_LUK[0]});

        _weapon.generatedStatBonus.M_ATK = BASE_MATK[0];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[0];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[0];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[0];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[0];
    }

    function SilverCoin(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 2;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Silver Coin";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[1],
        AGI : BASE_AGI[1],
        INT : BASE_INT[1],
        VIT : 0,
        LUCK : BASE_LUK[1]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[1];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[1];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[1];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[1];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[1];
    }

    function ChannellingCrystal(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 3;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Channelling Crystal";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[2],
        AGI : BASE_AGI[2],
        INT : BASE_INT[2],
        VIT : 0,
        LUCK : BASE_LUK[2]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[2];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[2];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[2];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[2];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[2];
    }

    function IdolOfAberranth(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 4;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Idol Of Aberranth";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[3],
        AGI : BASE_AGI[3],
        INT : BASE_INT[3],
        VIT : 0,
        LUCK : BASE_LUK[3]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[3];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[3];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[3];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[3];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[3];
    }

    function WarlordTotem(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 5;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Warlord Totem";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[4],
        AGI : BASE_AGI[4],
        INT : BASE_INT[4],
        VIT : 0,
        LUCK : BASE_LUK[4]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[4];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[4];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[4];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[4];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[4];
    }

    function BookOfPhilosopher(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 6;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Book of Philosopher";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[5],
        AGI : BASE_AGI[5],
        INT : BASE_INT[5],
        VIT : 0,
        LUCK : BASE_LUK[5]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[5];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[5];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[5];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[5];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[5];
    }

    function GoldenChain(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 7;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Golden Chain";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[6],
        AGI : BASE_AGI[6],
        INT : BASE_INT[6],
        VIT : 0,
        LUCK : BASE_LUK[6]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[6];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[6];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[6];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[6];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[6];
    }

    function EvergreenFlower(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 8;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Evergreen Flower";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[7],
        AGI : BASE_AGI[7],
        INT : BASE_INT[7],
        VIT : 0,
        LUCK : BASE_LUK[7]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[7];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[7];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[7];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[7];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[7];
    }

    function StarfallensStaff(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 9;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Starfallen's Staff";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[8],
        AGI : BASE_AGI[8],
        INT : BASE_INT[8],
        VIT : 0,
        LUCK : BASE_LUK[8]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[8];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[8];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[8];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[8];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[8];
    }

    function BlessedDice(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 10;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Blessed Dice";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[9],
        AGI : BASE_AGI[9],
        INT : BASE_INT[9],
        VIT : 0,
        LUCK : BASE_LUK[9]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[9];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[9];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[9];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[9];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[9];
    }

    function MoonstoneRelic(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 11;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Moonstone Relic";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[10],
        AGI : BASE_AGI[10],
        INT : BASE_INT[10],
        VIT : 0,
        LUCK : BASE_LUK[10]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[10];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[10];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[10];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[10];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[10];
    }

    function SunfireRelic(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 12;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Sunfire Relic";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[11],
        AGI : BASE_AGI[11],
        INT : BASE_INT[11],
        VIT : 0,
        LUCK : BASE_LUK[11]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[11];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[11];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[11];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[11];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[11];
    }

    function CycleRelic(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 13;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Cycle Relic";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[12],
        AGI : BASE_AGI[12],
        INT : BASE_INT[12],
        VIT : 0,
        LUCK : BASE_LUK[12]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[12];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[12];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[12];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[12];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[12];
    }

    function PhantasmalRelic(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 14;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Phantasmal Relic";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[13],
        AGI : BASE_AGI[13],
        INT : BASE_INT[13],
        VIT : 0,
        LUCK : BASE_LUK[13]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[13];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[13];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[13];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[13];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[13];
    }

    function AncientOrb(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 15;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Ancient Orb";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[14],
        AGI : BASE_AGI[14],
        INT : BASE_INT[14],
        VIT : 0,
        LUCK : BASE_LUK[14]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[14];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[14];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[14];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[14];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[14];
    }

    function ScrollOfLuminous(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 16;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Scroll of Luminous";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[15],
        AGI : BASE_AGI[15],
        INT : BASE_INT[15],
        VIT : 0,
        LUCK : BASE_LUK[15]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[15];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[15];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[15];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[15];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[15];
    }

    function HeavenfallenFeather(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 17;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Heavenfallen Feather";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[16],
        AGI : BASE_AGI[16],
        INT : BASE_INT[16],
        VIT : 0,
        LUCK : BASE_LUK[16]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[16];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[16];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[16];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[16];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[16];
    }

    function Godbringt(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 18;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Godbringt";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[17],
        AGI : BASE_AGI[17],
        INT : BASE_INT[17],
        VIT : 0,
        LUCK : BASE_LUK[17]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[17];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[17];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[17];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[17];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[17];
    }

    function KeyOfTheExistence(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 20;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Key of the Existence";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[18],
        AGI : BASE_AGI[18],
        INT : BASE_INT[18],
        VIT : 0,
        LUCK : BASE_LUK[18]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[18];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[18];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[18];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[18];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[18];
    }

    function MistguardRelic(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 21;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Mistguard Relic";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[19],
        AGI : BASE_AGI[19],
        INT : BASE_INT[19],
        VIT : 0,
        LUCK : BASE_LUK[19]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[19];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[19];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[19];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[19];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[19];
    }

    function Mistbringer(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 22;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Soultrapper";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Wizard;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Necromancer;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Priest;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});
        _weapon.statBonus = GameObjects.Stats({
        STR : 0,
        DEX : BASE_DEX[20],
        AGI : BASE_AGI[20],
        INT : BASE_INT[20],
        VIT : 0,
        LUCK : BASE_LUK[20]});
        _weapon.generatedStatBonus.M_ATK = BASE_MATK[20];
        _weapon.generatedStatBonus.ACCURACY = BASE_ACCURACY[20];
        _weapon.generatedStatBonus.CRIT = BASE_CRIT[20];
        _weapon.generatedStatBonus.CRIT_MULTIPLIER = BASE_CRITMULTI[20];
        _weapon.generatedStatBonus.DODGE = BASE_DODGE[20];
    }
}
