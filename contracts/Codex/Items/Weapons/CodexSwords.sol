import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, ElementalAtk, ElementalDef, Class, Weapon, Stats, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexSwords is Initializable {

    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_ATK;
    uint[21] public BASE_CRIT;
    uint[21] public BASE_CRITMULTI;
    uint[21] public BASE_ACCURACY;

    function initialize(
        uint[21] memory _BASE_STR,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_ATK,
        uint[21] memory _BASE_CRIT,
        uint[21] memory _BASE_CRITMULTI,
        uint[21] memory _BASE_ACCURACY
    ) external initializer {
        BASE_STR = _BASE_STR;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_ATK = _BASE_ATK;
        BASE_CRIT = _BASE_CRIT;
        BASE_CRITMULTI = _BASE_CRITMULTI;
        BASE_ACCURACY = _BASE_ACCURACY;
    }

    function weapon(uint id, uint tier) public view returns (Weapon memory _weapon) {
        require(tier < 10, "t");
        Weapon memory base;
        if (id == 1) {
            _weapon = applyTier(WoodenSword(tier), tier, 630);
            base = WoodenSword(tier);
            _weapon.generatedStatBonus.CRIT = base.generatedStatBonus.CRIT + ((_weapon.generatedStatBonus.CRIT * 500) / 1000);
            _weapon.generatedStatBonus.CRIT_MULTIPLIER = base.generatedStatBonus.CRIT_MULTIPLIER + ((_weapon.generatedStatBonus.CRIT_MULTIPLIER * 5) / 100);
            _weapon.generatedStatBonus.ACCURACY = base.generatedStatBonus.ACCURACY + (_weapon.generatedStatBonus.ACCURACY * 25) / 1000;
            _weapon.generatedStatBonus.P_ATK = base.generatedStatBonus.P_ATK + (_weapon.generatedStatBonus.P_ATK * 10) / 1000;
            _weapon.statBonus.STR = base.statBonus.STR + ((_weapon.statBonus.STR * 350) / 1000);
            _weapon.statBonus.DEX = base.statBonus.DEX + ((_weapon.statBonus.DEX * 350) / 1000);
            _weapon.statBonus.AGI = base.statBonus.AGI + ((_weapon.statBonus.AGI * 350) / 1000);
        } else if (id == 2) {
            _weapon = applyTier(Needle(tier), tier, 160);
        } else if (id == 3) {
            _weapon = applyTier(Scimitar(tier), tier, 70);
        } else if (id == 4) {
            _weapon = applyTier(Falchion(tier), tier, 50);
        } else if (id == 5) {
            _weapon = applyTier(Katana(tier), tier, 35);
        } else if (id == 6) {
            _weapon = applyTier(SilverSword(tier), tier, 20);
        } else if (id == 7) {
            _weapon = applyTier(SwordOfTemplar(tier), tier, 20);
        } else if (id == 8) {
            _weapon = applyTier(VerdantSword(tier), tier, 20);
        } else if (id == 9) {
            _weapon = applyTier(HollowSword(tier), tier, 20);
        } else if (id == 10) {
            _weapon = applyTier(GhostBreaker(tier), tier, 15);
        } else if (id == 11) {
            _weapon = applyTier(SwordOfMoonlight(tier), tier, 15);
        } else if (id == 12) {
            _weapon = applyTier(SwordOfSunlight(tier), tier, 15);
        } else if (id == 13) {
            _weapon = applyTier(CycleSword(tier), tier, 10);
        } else if (id == 14) {
            _weapon = applyTier(PhantasmalSword(tier), tier, 10);
        } else if (id == 15) {
            _weapon = applyTier(EmeraldSword(tier), tier, 10);
        } else if (id == 16) {
            _weapon = applyTier(SwordOfTheUndeadKing(tier), tier, 10);
        } else if (id == 17) {
            _weapon = applyTier(Pyroblade(tier), tier, 10);
        } else if (id == 18) {
            _weapon = applyTier(PointOfNoReturn(tier), tier, 7);
        } else if (id == 19) {
            _weapon = applyTier(SwordOfIncursion(tier), tier, 7);
        } else if (id == 20) {
            _weapon = applyTier(Murasame(tier), tier, 7);
        } else if (id == 21) {
            _weapon = applyTier(Deathbringer(tier), tier, 7);
        } else {
            revert("?s");
        }
    }

    function applyTier(Weapon memory weapon, uint tier, uint percentage) public view returns (Weapon memory){
        if (tier == 0) return weapon;
        weapon.statBonus = EquipableUtils.sumStatsAsTier(weapon.statBonus, tier * percentage);
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function WoodenSword(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = classRequirement();


        // bonuses he
        _weapon.statBonus = weaponStats(0);

        _weapon.generatedStatBonus = weaponGenStats(0);
    }

    function Needle(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 2;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
    }

    function Scimitar(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 3;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
    }

    function Falchion(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 4;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
    }

    function Katana(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 5;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
    }

    function SilverSword(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 6;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
    }

    function SwordOfTemplar(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 7;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
    }

    function VerdantSword(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 8;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
    }

    function HollowSword(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 9;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
    }

    function GhostBreaker(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 10;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
    }

    function SwordOfMoonlight(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 11;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
    }

    function SwordOfSunlight(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 12;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
    }

    function CycleSword(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 13;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
    }

    function PhantasmalSword(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 14;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
    }

    function EmeraldSword(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 15;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
    }

    function SwordOfTheUndeadKing(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 16;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
    }

    function Pyroblade(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 17;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
    }

    function PointOfNoReturn(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 18;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
    }

    function SwordOfIncursion(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 19;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
    }

    function Murasame(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 20;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
    }

    function Deathbringer(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 21;
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
        LUCK : 0});
        return stats;
    }

    function weaponGenStats(uint index) internal view returns (GeneratedStats memory) {
        GeneratedStats memory stats = GeneratedStats({
        HP : 0,
        P_ATK : BASE_ATK[index],
        M_ATK : 0,
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
        Class[] memory _reqClass = new Class[](4);
        _reqClass[0] = Class.Barbarian;
        _reqClass[1] = Class.Paladin;
        _reqClass[2] = Class.Assassin;
        _reqClass[3] = Class.Engineer;
        return _reqClass;
    }

}
