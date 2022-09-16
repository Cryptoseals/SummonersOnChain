import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, ElementalAtk, ElementalDef, Class, Weapon, Stats, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexDaggers is Initializable {

    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_LUCK;
    uint[21] public BASE_ATK;
    uint[21] public BASE_CRIT;
    uint[21] public BASE_CRITMULTI;
    uint[21] public BASE_ACCURACY;

    function initialize(
        uint[21] memory _BASE_STR,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_LUCK,
        uint[21] memory _BASE_ATK,
        uint[21] memory _BASE_CRIT,
        uint[21] memory _BASE_CRITMULTI,
        uint[21] memory _BASE_ACCURACY
    ) external initializer {
        BASE_STR = _BASE_STR;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_LUCK = _BASE_LUCK;
        BASE_ATK = _BASE_ATK;
        BASE_CRIT = _BASE_CRIT;
        BASE_CRITMULTI = _BASE_CRITMULTI;
        BASE_ACCURACY = _BASE_ACCURACY;
    }

    function weapon(uint id, uint tier) public view returns (Weapon memory _weapon) {
        require(tier < 10, "t");
        Weapon memory base;

        if (id == 22) {
            _weapon = applyTier(BreadKnife(tier), tier, 600);
            base = BreadKnife(tier);
            _weapon.generatedStatBonus.CRIT = base.generatedStatBonus.CRIT + ((_weapon.generatedStatBonus.CRIT * 500) / 1000);
            _weapon.generatedStatBonus.CRIT_MULTIPLIER = base.generatedStatBonus.CRIT_MULTIPLIER + ((_weapon.generatedStatBonus.CRIT_MULTIPLIER * 12) / 100);
            _weapon.generatedStatBonus.ACCURACY = base.generatedStatBonus.ACCURACY + ((_weapon.generatedStatBonus.ACCURACY * 24) / 1000);
            _weapon.generatedStatBonus.P_ATK = base.generatedStatBonus.P_ATK + ((_weapon.generatedStatBonus.P_ATK * 10) / 1000);
            _weapon.statBonus.STR = base.statBonus.STR + ((_weapon.statBonus.STR * 350) / 1000);
            _weapon.statBonus.DEX = base.statBonus.DEX + ((_weapon.statBonus.DEX * 350) / 1000);
            _weapon.statBonus.AGI = base.statBonus.AGI + ((_weapon.statBonus.AGI * 350) / 1000);
            _weapon.statBonus.LUCK = base.statBonus.LUCK + ((_weapon.statBonus.LUCK * 350) / 1000);

        } else if (id == 23) {
            _weapon = applyTier(Twinkle(tier), tier, 150);
        } else if (id == 24) {
            _weapon = applyTier(Razor(tier), tier, 70);
        } else if (id == 25) {
            _weapon = applyTier(Quickblade(tier), tier, 50);
        } else if (id == 26) {
            _weapon = applyTier(PocketKiller(tier), tier, 35);
        } else if (id == 27) {
            _weapon = applyTier(SilverDagger(tier), tier, 20);
        } else if (id == 28) {
            _weapon = applyTier(GoldenStiletto(tier), tier, 20);
        } else if (id == 29) {
            _weapon = applyTier(VerdantKris(tier), tier, 20);
        } else if (id == 30) {
            _weapon = applyTier(NightfallDagger(tier), tier, 15);
        } else if (id == 31) {
            _weapon = applyTier(Voidslasher(tier), tier, 12);
        } else if (id == 32) {
            _weapon = applyTier(DaggerOfMoonlight(tier), tier, 12);
        } else if (id == 33) {
            _weapon = applyTier(DaggerOfSunlight(tier), tier, 12);
        } else if (id == 34) {
            _weapon = applyTier(CycleDagger(tier), tier, 12);
        } else if (id == 35) {
            _weapon = applyTier(PhantasmalDagger(tier), tier, 12);
        } else if (id == 36) {
            _weapon = applyTier(DefilingRazor(tier), tier, 10);
        } else if (id == 37) {
            _weapon = applyTier(DaggerOfTheSuccubus(tier), tier, 10);
        } else if (id == 38) {
            _weapon = applyTier(Pyrodagger(tier), tier, 7);
        } else if (id == 39) {
            _weapon = applyTier(PointOfZero(tier), tier, 7);
        } else if (id == 40) {
            _weapon = applyTier(DaggerOfIncursion(tier), tier, 7);
        } else if (id == 41) {
            _weapon = applyTier(Kingmaker(tier), tier, 7);
        } else if (id == 42) {
            _weapon = applyTier(Blooddrainer(tier), tier, 7);
        } else revert("?d");
    }

    function applyTier(Weapon memory weapon, uint tier, uint percentage) public view returns (Weapon memory){
        if (tier == 0) return weapon;
        weapon.statBonus = EquipableUtils.sumStatsAsTier(weapon.statBonus, tier * percentage);
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function BreadKnife(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 22;
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

    function Twinkle(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 23;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
    }

    function Razor(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 24;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
    }

    function Quickblade(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 25;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
    }

    function PocketKiller(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 26;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
    }

    function SilverDagger(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 27;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
    }

    function GoldenStiletto(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 28;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
    }

    function VerdantKris(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 29;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
    }

    function NightfallDagger(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 30;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
    }

    function Voidslasher(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 31;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
    }

    function DaggerOfMoonlight(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 32;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
    }

    function DaggerOfSunlight(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 33;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
    }

    function CycleDagger(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 34;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
    }

    function PhantasmalDagger(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 35;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
    }

    function DefilingRazor(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 36;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
    }

    function DaggerOfTheSuccubus(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 37;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
    }

    function Pyrodagger(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 38;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = classRequirement();


        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
    }

    function PointOfZero(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 39;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
    }

    function DaggerOfIncursion(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 40;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = classRequirement();

        // _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
    }

    function Kingmaker(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 41;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = classRequirement();

        //  _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //  DEX : 0,
        // AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
    }

    function Blooddrainer(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 42;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(20);
        _weapon.generatedStatBonus = weaponGenStats(20);
    }

    function weaponStats(uint index) internal view returns (Stats memory) {
        Stats memory stats = Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[index]});
        return stats;
    }

    function weaponGenStats(uint index) internal view returns (GeneratedStats memory) {
        GeneratedStats memory stats = GeneratedStats({
        HP : 0,
        P_ATK : BASE_ATK[index],
        M_ATK : BASE_ATK[index],
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : BASE_ACCURACY[index],
        DODGE : 0,
        CRIT : BASE_CRIT[index],
        CRIT_MULTIPLIER : BASE_CRITMULTI[index],
        INFUSION : 0
        });
        return stats;
    }

    function classRequirement() internal view returns (Class[] memory) {
        Class[] memory _reqClass = new Class[](3);
        _reqClass[0] = Class.Assassin;
        _reqClass[1] = Class.Wizard;
        _reqClass[2] = Class.Necromancer;
        return _reqClass;
    }
}
