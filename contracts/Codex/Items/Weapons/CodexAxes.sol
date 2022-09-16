import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {ItemType, ElementalAtk, ElementalDef, Class, Weapon, Stats, GeneratedStats} from "../../../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexAxes is Initializable {

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
        if (id == 64) {
            _weapon = applyTier(WoodenAxe(tier), tier, 630);
            base = WoodenAxe(tier);
            _weapon.generatedStatBonus.CRIT = base.generatedStatBonus.CRIT + ((_weapon.generatedStatBonus.CRIT * 500) / 1000);
            _weapon.generatedStatBonus.CRIT_MULTIPLIER = base.generatedStatBonus.CRIT_MULTIPLIER + ((_weapon.generatedStatBonus.CRIT_MULTIPLIER * 5) / 1000);
            _weapon.generatedStatBonus.ACCURACY = base.generatedStatBonus.ACCURACY + ((_weapon.generatedStatBonus.ACCURACY * 20) / 1000);
            _weapon.generatedStatBonus.P_ATK = base.generatedStatBonus.P_ATK + ((_weapon.generatedStatBonus.P_ATK * 10) / 1000);
            _weapon.statBonus.STR = base.statBonus.STR + ((_weapon.statBonus.STR * 350) / 1000);
            _weapon.statBonus.AGI = base.statBonus.AGI + ((_weapon.statBonus.AGI * 350) / 1000);
            _weapon.statBonus.DEX = base.statBonus.DEX + ((_weapon.statBonus.DEX * 350) / 1000);
        } else if (id == 65) {
            _weapon = applyTier(HandAxe(tier), tier, 160);
        } else if (id == 66) {
            _weapon = applyTier(Pickaxe(tier), tier, 70);
        } else if (id == 67) {
            _weapon = applyTier(SkullAxe(tier), tier, 50);
        } else if (id == 68) {
            _weapon = applyTier(BattleAxe(tier), tier, 35);
        } else if (id == 69) {
            _weapon = applyTier(SilverAxe(tier), tier, 20);
        } else if (id == 70) {
            _weapon = applyTier(BerserkersAxe(tier), tier, 20);
        } else if (id == 71) {
            _weapon = applyTier(VerdantAxe(tier), tier, 20);
        } else if (id == 72) {
            _weapon = applyTier(WarlordsAxe(tier), tier, 20);
        } else if (id == 73) {
            _weapon = applyTier(CrescentAxe(tier), tier, 15);
        } else if (id == 74) {
            _weapon = applyTier(AxeOfMoonlight(tier), tier, 15);
        } else if (id == 75) {
            _weapon = applyTier(AxeOfSunlight(tier), tier, 15);
        } else if (id == 76) {
            _weapon = applyTier(CycleAxe(tier), tier, 10);
        } else if (id == 77) {
            _weapon = applyTier(PhantasmalAxe(tier), tier, 10);
        } else if (id == 78) {
            _weapon = applyTier(EmeraldAxe(tier), tier, 10);
        } else if (id == 79) {
            _weapon = applyTier(LuminescentAxe(tier), tier, 10);
        } else if (id == 80) {
            _weapon = applyTier(EldersAxe(tier), tier, 10);
        } else if (id == 81) {
            _weapon = applyTier(FallenOrdersAxe(tier), tier, 7);
        } else if (id == 82) {
            _weapon = applyTier(IncursionAxe(tier), tier, 7);
        } else if (id == 83) {
            _weapon = applyTier(TotemicAxe(tier), tier, 7);
        } else if (id == 84) {
            _weapon = applyTier(Blooddrinker(tier), tier, 7);
        } else revert("?a");
    }

    function applyTier(Weapon memory weapon, uint tier, uint percentage) public view returns (Weapon memory){
        if (tier == 0) return weapon;
        weapon.statBonus = EquipableUtils.sumStatsAsTier(weapon.statBonus, tier * percentage);
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function WoodenAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 64;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = classRequirement();


        //        _weapon.requirement.statRequirement = Stats({
        //        STR : 0,
        //        DEX : 0,
        //        AGI : 0,
        //        INT : 0,
        //        VIT : 0,
        //        LUCK : 0});


        // bonuses here
        _weapon.statBonus = weaponStats(0);

        _weapon.generatedStatBonus = weaponGenStats(0);
    }

    function HandAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 65;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = Stats({
        // STR : 0,
        // DEX : 0,
        //  AGI : 0,
        // INT : 0,
        // VIT : 0,
        // LUCK : 0});
        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
    }

    function Pickaxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 66;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //    INT : 0,
        //    VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
    }

    function SkullAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 67;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //  DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
    }

    function BattleAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 68;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
    }

    function SilverAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 69;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
    }

    function BerserkersAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 70;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
    }

    function VerdantAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 71;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
    }

    function WarlordsAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 72;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //    LUCK : 0});
        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
    }

    function CrescentAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 73;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //   INT : 0,
        //  VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
    }

    function AxeOfMoonlight(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 74;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = Stats({
        // STR : 0,
        // DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
    }

    function AxeOfSunlight(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 75;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = Stats({
        // STR : 0,
        // DEX : 0,
        // AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
    }

    function CycleAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 76;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = Stats({
        // STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
    }

    function PhantasmalAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 77;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = Stats({
        // STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
    }

    function EmeraldAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 78;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
    }

    function LuminescentAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 79;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
    }

    function EldersAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 80;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
    }

    function FallenOrdersAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 81;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //   DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
    }

    function IncursionAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 82;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //  DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
    }

    function TotemicAxe(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 83;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = Stats({
        // STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
    }

    function Blooddrinker(uint tier) public view returns (Weapon memory _weapon) {
        _weapon.metadata.id = 84;
        _weapon.metadata.baseType = ItemType.WEAPON;
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
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
        Class[] memory _reqClass = new Class[](3);
        _reqClass[0] = Class.Barbarian;
        _reqClass[1] = Class.Necromancer;
        _reqClass[2] = Class.Ranger;
        return _reqClass;
    }
}
