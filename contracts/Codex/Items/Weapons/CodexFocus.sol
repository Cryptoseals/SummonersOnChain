import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, ElementalAtk, ElementalDef, Class, Weapon, Stats, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";
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


    function initialize(
        uint[21] memory _BASE_INT,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_LUK,
        uint[21] memory _BASE_MATK,
        uint[21] memory _BASE_CRIT,
        uint[21] memory _BASE_CRITMULTI,
        uint[21] memory _BASE_ACCURACY,
        uint[21] memory _BASE_DODGE
    ) external initializer {
        BASE_INT = _BASE_INT;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_LUK = _BASE_LUK;
        BASE_MATK = _BASE_MATK;
        BASE_CRIT = _BASE_CRIT;
        BASE_CRITMULTI = _BASE_CRITMULTI;
        BASE_ACCURACY = _BASE_ACCURACY;
        BASE_DODGE = _BASE_DODGE;
    }

    function weapon(uint id, uint tier) public view returns (Weapon memory _weapon) {
        require(tier < 10, "t");
        Weapon memory base;

        if (id == 106) {
            _weapon = applyTier(WellShapedRock(tier), tier, 500);
            base = WellShapedRock(tier);
            _weapon.generatedStatBonus.CRIT = base.generatedStatBonus.CRIT + ((_weapon.generatedStatBonus.CRIT * 500) / 1000);
            _weapon.generatedStatBonus.CRIT_MULTIPLIER = base.generatedStatBonus.CRIT_MULTIPLIER + ((_weapon.generatedStatBonus.CRIT_MULTIPLIER * 15) / 1000);
            _weapon.generatedStatBonus.ACCURACY = base.generatedStatBonus.ACCURACY + ((_weapon.generatedStatBonus.ACCURACY * 10) / 1000);
            _weapon.generatedStatBonus.DODGE = base.generatedStatBonus.DODGE + ((_weapon.generatedStatBonus.DODGE * 10) / 1000);
            _weapon.generatedStatBonus.M_ATK = base.generatedStatBonus.M_ATK + ((_weapon.generatedStatBonus.M_ATK * 10) / 1000);
            _weapon.statBonus.AGI = base.statBonus.AGI + ((_weapon.statBonus.AGI * 350) / 1000);
            _weapon.statBonus.INT = base.statBonus.INT + ((_weapon.statBonus.INT * 350) / 1000);
            _weapon.statBonus.DEX = base.statBonus.DEX + ((_weapon.statBonus.DEX * 350) / 1000);
            _weapon.statBonus.LUCK = base.statBonus.LUCK + ((_weapon.statBonus.LUCK * 350) / 1000);
        } else if (id == 107) {
            _weapon = applyTier(EvergreenFlower(tier), tier, 150);
        } else if (id == 108) {
            _weapon = applyTier(IdolOfAberranth(tier), tier, 70);
        } else if (id == 109) {
            _weapon = applyTier(WarlordTotem(tier), tier, 50);
        } else if (id == 110) {
            _weapon = applyTier(BookOfPhilosopher(tier), tier, 35);
        } else if (id == 111) {
            _weapon = applyTier(SilverCoin(tier), tier, 20);
        } else if (id == 112) {
            _weapon = applyTier(GoldenChain(tier), tier, 20);
        } else if (id == 113) {
            _weapon = applyTier(ChannellingCrystal(tier), tier, 20);
        } else if (id == 114) {
            _weapon = applyTier(StarfallensFocus(tier), tier, 15);
        } else if (id == 115) {
            _weapon = applyTier(BlessedDice(tier), tier, 12);
        } else if (id == 116) {
            _weapon = applyTier(MoonstoneRelic(tier), tier, 12);
        } else if (id == 117) {
            _weapon = applyTier(SunfireRelic(tier), tier, 12);
        } else if (id == 118) {
            _weapon = applyTier(CycleRelic(tier), tier, 12);
        } else if (id == 119) {
            _weapon = applyTier(PhantasmalRelic(tier), tier, 12);
        } else if (id == 120) {
            _weapon = applyTier(AncientOrb(tier), tier, 10);
        } else if (id == 121) {
            _weapon = applyTier(ScrollOfLuminous(tier), tier, 10);
        } else if (id == 122) {
            _weapon = applyTier(HeavenfallenFeather(tier), tier, 7);
        } else if (id == 123) {
            _weapon = applyTier(Godbringt(tier), tier, 7);
        } else if (id == 124) {
            _weapon = applyTier(KeyOfTheExistence(tier), tier, 7);
        } else if (id == 125) {
            _weapon = applyTier(MistguardRelic(tier), tier, 7);
        } else if (id == 126) {
            _weapon = applyTier(Mistbringer(tier), tier, 7);
        } else revert("?f");


    }

    function applyTier(Weapon memory weapon, uint tier, uint percentage) public view returns (Weapon memory){
        if (tier == 0) return weapon;
        weapon.statBonus = EquipableUtils.sumStatsAsTier(weapon.statBonus, tier * percentage);
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function WellShapedRock(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 106;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = classRequirement();

        // bonuses here
        _weapon.statBonus = weaponStats(0);
        _weapon.generatedStatBonus = weaponGenStats(0);
    }

    function EvergreenFlower(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 107;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 4;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
    }

    function IdolOfAberranth(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 108;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 9;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
    }

    function WarlordTotem(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 109;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 14;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
    }

    function BookOfPhilosopher(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 110;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 19;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
    }

    function SilverCoin(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 111;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 24;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
    }

    function GoldenChain(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 112;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 29;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
    }

    function ChannellingCrystal(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 113;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 34;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
    }

    function StarfallensFocus(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 114;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 39;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
    }

    function BlessedDice(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 115;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 44;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
    }

    function MoonstoneRelic(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 116;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 49;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
    }

    function SunfireRelic(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 117;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 54;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
    }

    function CycleRelic(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 118;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 59;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
    }

    function PhantasmalRelic(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 119;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 64;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
    }

    function AncientOrb(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 120;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 69;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
    }

    function ScrollOfLuminous(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 121;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 74;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
    }

    function HeavenfallenFeather(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 122;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 79;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
    }

    function Godbringt(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 123;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 84;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
    }

    function KeyOfTheExistence(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 124;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 89;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
    }

    function MistguardRelic(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 125;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 94;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
    }

    function Mistbringer(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 126;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 99;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(20);
        _weapon.generatedStatBonus = weaponGenStats(20);
    }


    function weaponStats(uint index) internal view returns (Stats memory) {
        Stats memory stats = Stats({
        STR : 0,
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : 0,
        LUCK : BASE_LUK[index]});
        return stats;
    }

    function weaponGenStats(uint index) internal view returns (GeneratedStats memory) {
        GeneratedStats memory stats = GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : BASE_MATK[index],
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : BASE_ACCURACY[index],
        DODGE : BASE_DODGE[index],
        CRIT : BASE_CRIT[index],
        CRIT_MULTIPLIER : BASE_CRITMULTI[index],
        INFUSION : 0
        });
        return stats;
    }

    function classRequirement() internal view returns (Class[] memory) {
        Class[] memory _reqClass = new Class[](5);
        _reqClass[0] = Class.Wizard;
        _reqClass[1] = Class.Necromancer;
        _reqClass[2] = Class.Priest;
        _reqClass[3] = Class.Assassin;
        _reqClass[4] = Class.Ranger;
        return _reqClass;
    }
}
