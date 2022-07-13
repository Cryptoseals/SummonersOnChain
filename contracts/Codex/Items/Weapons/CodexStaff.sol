import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments} from "../../../Interfaces/GameObjects/IGameObjects.sol";
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

    function weapon(uint id, uint tier) public view returns (GameObjects_Equipments.Weapon memory) {
        require(tier < 10, "t");

        if (id == 85) {
            return applyTier(WoodenStaff(tier), tier, 4);
        } else if (id == 86) {
            return applyTier(MarbleStaff(tier), tier, 5);
        } else if (id == 87) {
            return applyTier(TotemicStaff(tier), tier, 5);
        } else if (id == 88) {
            return applyTier(AuraStaff(tier), tier, 5);
        } else if (id == 89) {
            return applyTier(BattleseenStaff(tier), tier, 5);
        } else if (id == 90) {
            return applyTier(WizardStaff(tier), tier, 5);
        } else if (id == 91) {
            return applyTier(RubyStaff(tier), tier, 5);
        } else if (id == 92) {
            return applyTier(VerdantStaff(tier), tier, 5);
        } else if (id == 93) {
            return applyTier(StarfallensStaff(tier), tier, 5);
        } else if (id == 94) {
            return applyTier(Lightbringer(tier), tier, 5);
        } else if (id == 95) {
            return applyTier(StaffOfMoonlight(tier), tier, 5);
        } else if (id == 96) {
            return applyTier(StaffOfSunlight(tier), tier, 5);
        } else if (id == 97) {
            return applyTier(CycleStaff(tier), tier, 5);
        } else if (id == 98) {
            return applyTier(PhantasmalStaff(tier), tier, 5);
        } else if (id == 99) {
            return applyTier(WarlocksStaff(tier), tier, 5);
        } else if (id == 100) {
            return applyTier(LuminescentStaff(tier), tier, 5);
        } else if (id == 101) {
            return applyTier(AncientElementalistsStaff(tier), tier, 5);
        } else if (id == 102) {
            return applyTier(Spellcatcher(tier), tier, 5);
        } else if (id == 103) {
            return applyTier(IncursionStaff(tier), tier, 5);
        } else if (id == 104) {
            return applyTier(EldersMark(tier), tier, 5);
        } else if (id == 105) {
            return applyTier(Soultrapper(tier), tier, 5);
        }

        revert("?st");
    }

    function applyTier(GameObjects_Equipments.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects_Equipments.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function WoodenStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 85;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Wooden Staff";
        //   _weapon.metadata.description = "";
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

    function MarbleStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 86;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Marble Staff";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
    }

    function TotemicStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 87;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Totemic Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
    }

    function AuraStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 88;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Aura Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
    }

    function BattleseenStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 89;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Battleseen Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
    }

    function WizardStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 90;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Wizard Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
    }

    function RubyStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 91;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Ruby Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
    }

    function VerdantStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 92;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Verdant Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
    }

    function StarfallensStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 93;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Starfallen's Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
    }

    function Lightbringer(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 94;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Lightbringer";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
    }

    function StaffOfMoonlight(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 95;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Staff of Moonlight";
        _weapon.metadata.description = "";
        //  _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
    }

    function StaffOfSunlight(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 96;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Staff of Sunlight";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
    }

    function CycleStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 97;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Cycle Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
    }

    function PhantasmalStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 98;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Phantasmal Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
    }

    function WarlocksStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 99;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Warlock's Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
    }

    function LuminescentStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 100;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Luminescent Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
    }

    function AncientElementalistsStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 101;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Ancient Elementalist's Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
    }

    function Spellcatcher(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 102;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Spellcatcher";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
    }

    function IncursionStaff(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 103;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Incursion Staff";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
    }

    function EldersMark(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 104;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Elder's Mark";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
    }

    function Soultrapper(uint tier) public view returns (GameObjects_Equipments.Weapon memory _weapon) {
        _weapon.metadata.id = 105;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Soultrapper";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = classRequirement();

        _weapon.statBonus = weaponStats(20);
        _weapon.generatedStatBonus = weaponGenStats(20);
    }

    function weaponStats(uint index) internal view returns (GameObjects_Stats.Stats memory) {
        GameObjects_Stats.Stats memory stats = GameObjects_Stats.Stats({
        STR : 0,
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : 0,
        LUCK : BASE_LUK[index]});
        return stats;
    }

    function weaponGenStats(uint index) internal view returns (GameObjects_Stats.GeneratedStats memory) {
        GameObjects_Stats.GeneratedStats memory stats = GameObjects_Stats.GeneratedStats({
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

    function classRequirement() internal view returns (GameObjects.Class[] memory) {
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](3);
        _reqClass[0] = GameObjects.Class.Wizard;
        _reqClass[1] = GameObjects.Class.Necromancer;
        _reqClass[2] = GameObjects.Class.Priest;
        return _reqClass;
    }
}
