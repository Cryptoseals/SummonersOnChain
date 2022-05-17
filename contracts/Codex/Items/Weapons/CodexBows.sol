import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexBows is Initializable {

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
        uint[21] memory _BASE_ACCURACY) external initializer {
        BASE_STR = _BASE_STR;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_LUCK = _BASE_LUCK;
        BASE_ATK = _BASE_ATK;
        BASE_CRIT = _BASE_CRIT;
        BASE_CRITMULTI = _BASE_CRITMULTI;
        BASE_ACCURACY = _BASE_ACCURACY;
    }


    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "t");

        if (id == 43) {
            return applyTier(SimpleBow(tier), tier, 4);
        } else if (id == 44) {
            return applyTier(Crossbow(tier), tier, 5);
        } else if (id == 45) {
            return applyTier(LongBow(tier), tier, 5);
        } else if (id == 46) {
            return applyTier(CompositeBow(tier), tier, 5);
        } else if (id == 47) {
            return applyTier(RecurveCrossbow(tier), tier, 5);
        } else if (id == 48) {
            return applyTier(GreatBow(tier), tier, 5);
        } else if (id == 49) {
            return applyTier(ReinforcedBow(tier), tier, 5);
        } else if (id == 50) {
            return applyTier(VerdantBow(tier), tier, 5);
        } else if (id == 51) {
            return applyTier(TemplarsCrossbow(tier), tier, 5);
        } else if (id == 52) {
            return applyTier(ElvenBow(tier), tier, 5);
        } else if (id == 53) {
            return applyTier(Moonbow(tier), tier, 5);
        } else if (id == 54) {
            return applyTier(Sunbow(tier), tier, 5);
        } else if (id == 55) {
            return applyTier(CycleBow(tier), tier, 5);
        } else if (id == 56) {
            return applyTier(PhantasmalBow(tier), tier, 5);
        } else if (id == 57) {
            return applyTier(BowOfUndeadKing(tier), tier, 5);
        } else if (id == 58) {
            return applyTier(PyroCrossbow(tier), tier, 5);
        } else if (id == 59) {
            return applyTier(Ghostbolt(tier), tier, 5);
        } else if (id == 60) {
            return applyTier(SkeletalBolter(tier), tier, 5);
        } else if (id == 61) {
            return applyTier(Astrarrow(tier), tier, 5);
        } else if (id == 62) {
            return applyTier(Comet(tier), tier, 5);
        } else if (id == 63) {
            return applyTier(Deathwhisperer(tier), tier, 5);
        }

        revert("?b");
    }

    function applyTier(GameObjects.Weapon memory weapon, uint tier, uint percentage) public view returns (GameObjects.Weapon memory){
        if (tier == 0) return weapon;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, (tier) * percentage);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, (tier) * percentage);
        return weapon;
    }

    function SimpleBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 43;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
       // _weapon.metadata.name = "Simple Bow";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = classRequirement();


       // _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
       // DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
       // LUCK : 0});


        // bonuses here
        _weapon.statBonus = weaponStats(0);

        _weapon.generatedStatBonus = weaponGenStats(0);
    }

    function Crossbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 44;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Crossbow";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 5;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(1);
        _weapon.generatedStatBonus = weaponGenStats(1);
    }

    function LongBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 45;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Long Bow";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 10;
        _weapon.requirement.classRequirement = classRequirement();
       // _weapon.requirement.statRequirement = GameObjects.Stats({
       // STR : 0,
       // DEX : 0,
       // AGI : 0,
       // INT : 0,
       // VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(2);
        _weapon.generatedStatBonus = weaponGenStats(2);
    }

    function CompositeBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 46;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Steel Bow";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 15;
        _weapon.requirement.classRequirement = classRequirement();
       // _weapon.requirement.statRequirement = GameObjects.Stats({
       // STR : 0,
       // DEX : 0,
       // AGI : 0,
       // INT : 0,
       // VIT : 0,
       // LUCK : 0});
        _weapon.statBonus = weaponStats(3);
        _weapon.generatedStatBonus = weaponGenStats(3);
    }

    function RecurveCrossbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 47;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Recurve Crossbow";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 20;
        _weapon.requirement.classRequirement = classRequirement();
       // _weapon.requirement.statRequirement = GameObjects.Stats({
       // STR : 0,
      //  DEX : 0,
       // AGI : 0,
       // INT : 0,
       // VIT : 0,
       // LUCK : BASE_LUCK[4]});
        _weapon.statBonus = weaponStats(4);
        _weapon.generatedStatBonus = weaponGenStats(4);
    }

    function GreatBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 48;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Great Bow";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 25;
        _weapon.requirement.classRequirement = classRequirement();
       // _weapon.requirement.statRequirement = GameObjects.Stats({
       // STR : 0,
       // DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(5);
        _weapon.generatedStatBonus = weaponGenStats(5);
    }

    function ReinforcedBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 49;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Reinforced Bow";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 30;
        _weapon.requirement.classRequirement = classRequirement();
       // _weapon.requirement.statRequirement = GameObjects.Stats({
       // STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(6);
        _weapon.generatedStatBonus = weaponGenStats(6);
    }

    function VerdantBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 50;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Verdant Bow";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 35;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
     //   DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(7);
        _weapon.generatedStatBonus = weaponGenStats(7);
    }

    function TemplarsCrossbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 51;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Templar's Crossbow";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 40;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(8);
        _weapon.generatedStatBonus = weaponGenStats(8);
    }

    function ElvenBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 52;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Elven Bow";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 45;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(9);
        _weapon.generatedStatBonus = weaponGenStats(9);
    }

    function Moonbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 53;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Moonbow";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 50;
        _weapon.requirement.classRequirement = classRequirement();
       // _weapon.requirement.statRequirement = GameObjects.Stats({
       // STR : 0,
       // DEX : 0,
      //  AGI : 0,
       // INT : 0,
       // VIT : 0,
       // LUCK : 0});
        _weapon.statBonus = weaponStats(10);
        _weapon.generatedStatBonus = weaponGenStats(10);
    }

    function Sunbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 54;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Sunbow";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 55;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
     //   LUCK : 0});
        _weapon.statBonus = weaponStats(11);
        _weapon.generatedStatBonus = weaponGenStats(11);
    }

    function CycleBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 55;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Cycle Bow";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 60;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
     //   VIT : 0,
     //   LUCK : 0});
        _weapon.statBonus = weaponStats(12);
        _weapon.generatedStatBonus = weaponGenStats(12);
    }

    function PhantasmalBow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 56;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Phantasmal Bow";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 65;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(13);
        _weapon.generatedStatBonus = weaponGenStats(13);
    }

    function BowOfUndeadKing(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 57;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Bow of Undead King";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 70;
        _weapon.requirement.classRequirement = classRequirement();
     //   _weapon.requirement.statRequirement = GameObjects.Stats({
     //   STR : 0,
     //   DEX : 0,
     //   AGI : 0,
     //   INT : 0,
     //   VIT : 0,
     //   LUCK : 0});
        _weapon.statBonus = weaponStats(14);
        _weapon.generatedStatBonus = weaponGenStats(14);
    }

    function PyroCrossbow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 58;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Pyro Crossbow";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 75;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(15);
        _weapon.generatedStatBonus = weaponGenStats(15);
    }

    function Ghostbolt(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 59;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Ghostbolt";
      //  _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 80;
        _weapon.requirement.classRequirement = classRequirement();
       // _weapon.requirement.statRequirement = GameObjects.Stats({
       // STR : 0,
       // DEX : 0,
       // AGI : 0,
      //  INT : 0,
      //  VIT : 0,
       // LUCK : 0});
        _weapon.statBonus = weaponStats(16);
        _weapon.generatedStatBonus = weaponGenStats(16);
    }

    function SkeletalBolter(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 60;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
      //  _weapon.metadata.name = "Skeletal Bolter";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 85;
        _weapon.requirement.classRequirement = classRequirement();
       // _weapon.requirement.statRequirement = GameObjects.Stats({
       // STR : 0,
       // DEX : 0,
       // AGI : 0,
       // INT : 0,
      //  VIT : 0,
       // LUCK : 0});
        _weapon.statBonus = weaponStats(17);
        _weapon.generatedStatBonus = weaponGenStats(17);
    }

    function Astrarrow(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 61;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Astrarrow";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 90;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(18);
        _weapon.generatedStatBonus = weaponGenStats(18);
    }

    function Comet(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 62;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Comet";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 95;
        _weapon.requirement.classRequirement = classRequirement();
      //  _weapon.requirement.statRequirement = GameObjects.Stats({
      //  STR : 0,
      //  DEX : 0,
      //  AGI : 0,
      //  INT : 0,
      //  VIT : 0,
      //  LUCK : 0});
        _weapon.statBonus = weaponStats(19);
        _weapon.generatedStatBonus = weaponGenStats(19);
    }

    function Deathwhisperer(uint tier) public view returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 63;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
     //   _weapon.metadata.name = "Deathwhisperer";
     //   _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;
        _weapon.requirement.level = 100;

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
        LUCK : BASE_LUCK[index]});
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
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](2);
        _reqClass[0] = GameObjects.Class.Assassin;
        _reqClass[1] = GameObjects.Class.Ranger;
        return _reqClass;
    }
}
