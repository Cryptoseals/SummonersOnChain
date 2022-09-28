import {Stats, Class, WeaponType, Element} from "./IGameObjects.sol";
pragma solidity ^0.8.0;

enum SpellCategories {
    FIRE,
    COLD,
    EARTH,
    LIGHTNING,
    ARCANE,
    PHYSICAL,
    DARK,
    HOLY,
    GADGET,
    VOID,
    RANGED
}

enum SpellType {
    ATTACK,
    HEALING,
    LIFESTEAL
}

struct Spell {
    uint256 id;
    string name;
    SpellType spellType;
    uint256 maxSpellLevel;
    uint256 learningCost;
    uint256 upgradeCostMultiplier; // if cost is 50e18 and multiplier is 2, to upgrade from level 4 to level 5, user needs 50e18 * 5 * 2 = 500e18 essence.
    AttackProperties attackProps;
    HealingProperties healingProps;
    SpellRequirements requirements;
    uint256 cooldown; // turns
}

struct SpellRequirements {
    uint256 level;
    uint256 levelRequirementPerTier; // if level is 3, and @param levelRequirementPerTier is 5, skill will require 3+5=8 level at level 2, and 3+10 at level 3;
    Class[] classRequirement;
    WeaponType requiredItem;
}

struct AttackProperties {
    Element element;
    uint256 damageMultiplier; // @notice example, 20 means 120% of element damage
    uint256 multiplierBonusPerTier;
    uint256 infusion;
    uint256 infusionBonusPerTier;
}

struct HealingProperties {
    bool isPercentage;
    uint256 minAmount;
    uint256 maxAmount;
    uint256 bonusHealingPerTier;
}

struct SpellSlot {
    SpellCategories category;
    uint256 id;
}
