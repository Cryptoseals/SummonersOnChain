import "../../Interfaces/GameObjects/IGameObjects.sol";
import "../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexSwords {

    function weapon(uint id, uint tier) public view returns (GameObjects.Weapon memory) {
        require(tier < 10, "?");

        if (id == 1) {
            return applyTier(WoodenSword(tier), tier);
        }

        revert("?");
    }

    function applyTier(GameObjects.Weapon memory weapon, uint tier) public pure returns (GameObjects.Weapon memory){
        if(tier == 0) return weapon;
        uint asTier = tier * 30;
        weapon.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(weapon.generatedStatBonus, asTier);
        weapon.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(weapon.elementalStats, asTier);
        return weapon;
    }

    function WoodenSword(uint tier) public pure returns (GameObjects.Weapon memory _weapon) {
        _weapon.metadata.id = 1;
        _weapon.metadata.baseType = GameObjects.ItemType.WEAPON;
        _weapon.metadata.name = "Wooden Sword";
        _weapon.metadata.description = "";
        _weapon.metadata.upgradable = true;

        // requirements here
        _weapon.requirement.level = 1;

        // class req. example
        // enum Class {
        //      Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        // }
        _weapon.requirement.classRequirement = new GameObjects.Class[](4);
        _weapon.requirement.classRequirement[0] = GameObjects.Class.Barbarian;
        _weapon.requirement.classRequirement[1] = GameObjects.Class.Paladin;
        _weapon.requirement.classRequirement[2] = GameObjects.Class.Assassin;
        _weapon.requirement.classRequirement[3] = GameObjects.Class.Engineer;


        _weapon.requirement.statRequirement = GameObjects.Stats({
        STR : 4,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});


        // bonuses here
        _weapon.statBonus = GameObjects.Stats({
        STR : 0 + tier,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0});

        _weapon.generatedStatBonus = GameObjects.GeneratedStats({
        HP : 0,
        P_ATK : 8,
        M_ATK : 5,
        P_DEF : 1,
        M_DEF : 1,
        ACCURACY : 1,
        DODGE : 1,
        CRIT : 1,
        CRIT_MULTIPLIER : 1,
        INFUSION : 0
        });

        // ele stats
        _weapon.elementalStats.ElementalAtk = GameObjects.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _weapon.elementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }
}
