import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, ElementalAtk, ElementalDef, Class, Weapon, Stats, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexStaves is Initializable {

    uint[21] public BASE_INT;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_LUK;
    uint[21] public BASE_MATK;
    uint[21] public BASE_CRIT;
    uint[21] public BASE_CRITMULTI;
    uint[21] public BASE_ACCURACY;

    function initialize(
        uint[21] memory _BASE_INT,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_LUK,
        uint[21] memory _BASE_MATK,
        uint[21] memory _BASE_CRIT,
        uint[21] memory _BASE_CRITMULTI,
        uint[21] memory _BASE_ACCURACY
    ) external initializer {
        BASE_INT = _BASE_INT;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_LUK = _BASE_LUK;
        BASE_MATK = _BASE_MATK;
        BASE_CRIT = _BASE_CRIT;
        BASE_CRITMULTI = _BASE_CRITMULTI;
        BASE_ACCURACY = _BASE_ACCURACY;
    }

    function weapon(uint id, uint tier) public view returns (Weapon memory _weapon) {
        require(tier < 10, "t");
        Weapon memory base;

        if (id == 85) {
            _weapon = applyTier(WoodenStaff(tier), tier, 630);
            base = WoodenStaff(tier);
            _weapon.generatedStatBonus.CRIT = base.generatedStatBonus.CRIT + ((_weapon.generatedStatBonus.CRIT * 500) / 1000);
            _weapon.generatedStatBonus.CRIT_MULTIPLIER = base.generatedStatBonus.CRIT_MULTIPLIER + ((_weapon.generatedStatBonus.CRIT_MULTIPLIER * 5) / 100);
            _weapon.generatedStatBonus.ACCURACY = base.generatedStatBonus.ACCURACY + ((_weapon.generatedStatBonus.ACCURACY * 25) / 1000);
            _weapon.generatedStatBonus.M_ATK = base.generatedStatBonus.M_ATK + ((_weapon.generatedStatBonus.M_ATK * 10) / 1000);
            _weapon.statBonus.INT = base.statBonus.INT + ((_weapon.statBonus.INT * 350) / 1000);
            _weapon.statBonus.DEX = base.statBonus.DEX + ((_weapon.statBonus.DEX * 350) / 1000);
            _weapon.statBonus.AGI = base.statBonus.AGI + ((_weapon.statBonus.AGI * 350) / 1000);
            _weapon.statBonus.LUCK = base.statBonus.LUCK + ((_weapon.statBonus.LUCK * 350) / 1000);}
        else if (id == 86) {
            _weapon = applyTier(MarbleStaff(tier), tier, 160);
        } else if (id == 87) {
            _weapon = applyTier(TotemicStaff(tier), tier, 70);
        } else if (id == 88) {
            _weapon = applyTier(AuraStaff(tier), tier, 50);
        } else if (id == 89) {
            _weapon = applyTier(BattleseenStaff(tier), tier, 35);
        } else if (id == 90) {
            _weapon = applyTier(WizardStaff(tier), tier, 20);
        } else if (id == 91) {
            _weapon = applyTier(RubyStaff(tier), tier, 20);
        } else if (id == 92) {
            _weapon = applyTier(VerdantStaff(tier), tier, 20);
        } else if (id == 93) {
            _weapon = applyTier(StarfallensStaff(tier), tier, 20);
        } else if (id == 94) {
            _weapon = applyTier(Lightbringer(tier), tier, 15);
        } else if (id == 95) {
            _weapon = applyTier(StaffOfMoonlight(tier), tier, 15);
        } else if (id == 96) {
            _weapon = applyTier(StaffOfSunlight(tier), tier, 15);
        } else if (id == 97) {
            _weapon = applyTier(CycleStaff(tier), tier, 10);
        } else if (id == 98) {
            _weapon = applyTier(PhantasmalStaff(tier), tier, 10);
        } else if (id == 99) {
            _weapon = applyTier(WarlocksStaff(tier), tier, 10);
        } else if (id == 100) {
            _weapon = applyTier(LuminescentStaff(tier), tier, 10);
        } else if (id == 101) {
            _weapon = applyTier(AncientElementalistsStaff(tier), tier, 10);
        } else if (id == 102) {
            _weapon = applyTier(Spellcatcher(tier), tier, 7);
        } else if (id == 103) {
            _weapon = applyTier(IncursionStaff(tier), tier, 7);
        } else if (id == 104) {
            _weapon = applyTier(EldersMark(tier), tier, 7);
        } else if (id == 105) {
            _weapon = applyTier(Soultrapper(tier), tier, 7);
        } else {
            revert("?st");
        }


    }

    function applyTier(Weapon memory weapon, uint tier, uint percentage) public view returns (Weapon memory){
        if (tier == 0) return weapon;
        weapon.statBonus = EquipableUtils.sumStatsAsTier(weapon.statBonus, tier * percentage);
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function WoodenStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 85;
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

    function MarbleStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 86;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
    }

    function TotemicStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 87;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
    }

    function AuraStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 88;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
    }

    function BattleseenStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 89;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
    }

    function WizardStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 90;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
    }

    function RubyStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 91;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
    }

    function VerdantStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 92;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
    }

    function StarfallensStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 93;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
    }

    function Lightbringer(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 94;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
    }

    function StaffOfMoonlight(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 95;
        _weapon.metadata.baseType = ItemType.WEAPON;
        //  _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
    }

    function StaffOfSunlight(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 96;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
    }

    function CycleStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 97;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
    }

    function PhantasmalStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 98;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
    }

    function WarlocksStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 99;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
    }

    function LuminescentStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 100;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
    }

    function AncientElementalistsStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 101;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
    }

    function Spellcatcher(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 102;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
    }

    function IncursionStaff(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 103;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
    }

    function EldersMark(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 104;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
    }

    function Soultrapper(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 105;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
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
        DODGE : 0,
        CRIT : BASE_CRIT[index],
        CRIT_MULTIPLIER : BASE_CRITMULTI[index],
        INFUSION : 0
        });
        return stats;
    }

    function classRequirement() internal view returns (Class[] memory) {
        Class[] memory _reqClass = new Class[](4);
        _reqClass[0] = Class.Wizard;
        _reqClass[1] = Class.Necromancer;
        _reqClass[2] = Class.Priest;
        _reqClass[3] = Class.Paladin;
        return _reqClass;
    }
}
