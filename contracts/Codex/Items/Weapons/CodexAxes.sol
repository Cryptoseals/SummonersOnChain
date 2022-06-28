import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {GameObjects, EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
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


    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "t");

        if (id == 64) {
            return applyTier(WoodenAxe(tier), tier, 4);
        } else if (id == 65) {
            return applyTier(HandAxe(tier), tier, 5);
        } else if (id == 66) {
            return applyTier(Pickaxe(tier), tier, 5);
        } else if (id == 67) {
            return applyTier(SkullAxe(tier), tier, 5);
        } else if (id == 68) {
            return applyTier(BattleAxe(tier), tier, 5);
        } else if (id == 69) {
            return applyTier(SilverAxe(tier), tier, 5);
        } else if (id == 70) {
            return applyTier(BerserkersAxe(tier), tier, 5);
        } else if (id == 71) {
            return applyTier(VerdantAxe(tier), tier, 5);
        } else if (id == 72) {
            return applyTier(WarlordsAxe(tier), tier, 5);
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
            return applyTier(EmeraldAxe(tier), tier, 5);
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
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function WoodenAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 64;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //        _weapon.metadata.name = "Wooden Axe";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = classRequirement();


        //        _weapon.requirement.statRequirement = GameObjects.Stats({
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

    function HandAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 65;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Hand Axe";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = GameObjects.Stats({
        // STR : 0,
        // DEX : 0,
        //  AGI : 0,
        // INT : 0,
        // VIT : 0,
        // LUCK : 0});
        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
    }

    function Pickaxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 66;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Pickaxe";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //    INT : 0,
        //    VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
    }

    function SkullAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 67;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Skull Axe";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
    }

    function BattleAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 68;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Battle Axe";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
    }

    function SilverAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 69;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Silver Axe";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
    }

    function BerserkersAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 70;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Berserker's Axe";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
    }

    function VerdantAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 71;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Verdant Axe";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
    }

    function WarlordsAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 72;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Warlord's Axe";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = classRequirement();
        //   _weapon.requirement.statRequirement = GameObjects.Stats({
        //   STR : 0,
        //   DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //    LUCK : 0});
        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
    }

    function CrescentAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 73;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Crescent Axe";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //   INT : 0,
        //  VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
    }

    function AxeOfMoonlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 74;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Axe of Moonlight";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = GameObjects.Stats({
        // STR : 0,
        // DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
    }

    function AxeOfSunlight(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 75;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Axe of Sunlight";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = GameObjects.Stats({
        // STR : 0,
        // DEX : 0,
        // AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
    }

    function CycleAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 76;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //_weapon.metadata.name = "Cycle Axe";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        // STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
    }

    function PhantasmalAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 77;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Phantasmal Axe";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = GameObjects.Stats({
        // STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
    }

    function EmeraldAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 78;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Emerald Axe";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
    }

    function LuminescentAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 79;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Luminescent Axe";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
    }

    function EldersAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 80;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Elder's Axe";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
    }

    function FallenOrdersAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 81;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Fallen Order's Axe";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //   DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
    }

    function IncursionAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 82;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        //  _weapon.metadata.name = "Incursion Axe";
        //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = classRequirement();
        //  _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //   AGI : 0,
        //   INT : 0,
        //   VIT : 0,
        //   LUCK : 0});
        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
    }

    function TotemicAxe(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 83;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "TotemicAxe";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = GameObjects.Stats({
        // STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
    }

    function Blooddrinker(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 84;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        // _weapon.metadata.name = "Blooddrinker";
        // _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;
        _weapon.requirement.classRequirement = classRequirement();
        // _weapon.requirement.statRequirement = GameObjects.Stats({
        //  STR : 0,
        //  DEX : 0,
        //  AGI : 0,
        //  INT : 0,
        //  VIT : 0,
        //  LUCK : 0});
        _weapon.statBonus = weaponStats(20);
        _weapon.generatedStatBonus = weaponGenStats(20);
    }

    function weaponStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : 0,
        VIT : 0,
        LUCK : 0});
        return stats;
    }

    function weaponGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
        GameObjects.GeneratedStats memory stats = GameObjects.GeneratedStats({
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


    function classRequirement() internal view returns (GameObjects.Class[] memory) {
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](3);
        _reqClass[0] = GameObjects.Class.Barbarian;
        _reqClass[1] = GameObjects.Class.Necromancer;
        _reqClass[2] = GameObjects.Class.Ranger;
        return _reqClass;
    }
}
