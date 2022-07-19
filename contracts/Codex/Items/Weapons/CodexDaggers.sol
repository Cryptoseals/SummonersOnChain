import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments} from "../../../Interfaces/GameObjects/IGameObjects.sol";
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

    function weapon(uint id, uint tier) public view returns (GameObjects_Equipments.Weapon memory) {
        require(tier < 10, "t");

        if (id == 22) {
            return applyTier(BreadKnife(tier), tier, 4);
        } else if (id == 23) {
            return applyTier(Twinkle(tier), tier, 5);
        } else if (id == 24) {
            return applyTier(Razor(tier), tier, 5);
        } else if (id == 25) {
            return applyTier(Quickblade(tier), tier, 5);
        } else if (id == 26) {
            return applyTier(PocketKiller(tier), tier, 5);
        } else if (id == 27) {
            return applyTier(SilverDagger(tier), tier, 5);
        } else if (id == 28) {
            return applyTier(GoldenStiletto(tier), tier, 5);
        } else if (id == 29) {
            return applyTier(VerdantKris(tier), tier, 5);
        } else if (id == 30) {
            return applyTier(NightfallDagger(tier), tier, 5);
        } else if (id == 31) {
            return applyTier(Voidslasher(tier), tier, 5);
        } else if (id == 32) {
            return applyTier(DaggerOfMoonlight(tier), tier, 5);
        } else if (id == 33) {
            return applyTier(DaggerOfSunlight(tier), tier, 5);
        } else if (id == 34) {
            return applyTier(CycleDagger(tier), tier, 5);
        } else if (id == 35) {
            return applyTier(PhantasmalDagger(tier), tier, 5);
        } else if (id == 36) {
            return applyTier(DefilingRazor(tier), tier, 5);
        } else if (id == 37) {
            return applyTier(DaggerOfTheSuccubus(tier), tier, 5);
        } else if (id == 38) {
            return applyTier(Pyrodagger(tier), tier, 5);
        } else if (id == 39) {
            return applyTier(PointOfZero(tier), tier, 5);
        } else if (id == 40) {
            return applyTier(DaggerOfIncursion(tier), tier, 5);
        } else if (id == 41) {
            return applyTier(Kingmaker(tier), tier, 5);
        } else if (id == 42) {
            return applyTier(Blooddrainer(tier), tier, 5);
        }

        revert("?d");
    }

    function applyTier(GameObjects_Equipments.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects_Equipments.Weapon memory){
        if (tier == 0) return weapon;
        weapon.statBonus = EquipableUtils.sumStatsAsTier(weapon.statBonus, tier * percentage);
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function BreadKnife(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 22;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Bread Knife";
        // _weapon.metadata.description = "";
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

    function Twinkle(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 23;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Twinkle";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
    }

    function Razor(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 24;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Razor";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
    }

    function Quickblade(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 25;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Quickblade";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
    }

    function PocketKiller(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 26;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Pocket Killer";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
    }

    function SilverDagger(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 27;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Silver Dagger";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
    }

    function GoldenStiletto(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 28;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Golden Stiletto";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
    }

    function VerdantKris(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 29;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Verdant Kris";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
    }

    function NightfallDagger(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 30;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Nightfall Dagger";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
    }

    function Voidslasher(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 31;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Voidslasher";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
    }

    function DaggerOfMoonlight(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 32;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //   _weapon.metadata.name = "Dagger of Moonlight";
        //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
    }

    function DaggerOfSunlight(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 33;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //   _weapon.metadata.name = "Dagger of Sunlight";
        //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
    }

    function CycleDagger(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 34;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Cycle Dagger";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
    }

    function PhantasmalDagger(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 35;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Phantasmal Dagger";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
    }

    function DefilingRazor(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 36;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //   _weapon.metadata.name = "Defiling Razor";
        //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
    }

    function DaggerOfTheSuccubus(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 37;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //   _weapon.metadata.name = "Dagger of the Succubus";
        //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
    }

    function Pyrodagger(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 38;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //   _weapon.metadata.name = "Pyrodagger";
        //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = classRequirement();


        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
    }

    function PointOfZero(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 39;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Point Of Zero";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
    }

    function DaggerOfIncursion(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 40;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //   _weapon.metadata.name = "Dagger of Incursion";
        //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = classRequirement();

        // _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
    }

    function Kingmaker(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 41;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Kingmaker";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = classRequirement();

        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        // AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
    }

    function Blooddrainer(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 42;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Blooddrainer";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(20);
        _weapon.generatedStatBonus = weaponGenStats(20);
    }

    function weaponStats(uint index) internal view returns (GameObjects_Stats.Stats memory) {
        GameObjects_Stats.Stats memory stats = GameObjects_Stats.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : 0,
        VIT : 0,
        LUCK : BASE_LUCK[index]});
        return stats;
    }

    function weaponGenStats(uint index) internal view returns (GameObjects_Stats.GeneratedStats memory) {
        GameObjects_Stats.GeneratedStats memory stats = GameObjects_Stats.GeneratedStats({
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

    function classRequirement() internal view returns (GameObjects.Class[] memory) {
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](3);
        _reqClass[0] = GameObjects.Class.Assassin;
        _reqClass[1] = GameObjects.Class.Wizard;
        _reqClass[2] = GameObjects.Class.Necromancer;
        return _reqClass;
    }
}
