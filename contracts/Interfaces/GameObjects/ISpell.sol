import "./IGameObjects.sol";
pragma solidity ^0.8.0;

interface ISpell {

    enum SpellType {
        ATTACK,
        HEALING,
        LIFESTEAL
    }

    struct Spell {
        uint id;
        string name;
        SpellType spellType;
        uint maxSpellLevel;
        uint learningCost;
        uint upgradeCostMultiplier; // if cost is 50e18 and multiplier is 2, to upgrade from level 4 to level 5, user needs 50e18 * 5 * 2 = 500e18 essence.
        AttackProperties attackProps;
        HealingProperties healingProps;
        SpellRequirements requirements;
        uint cooldown;  // turns
    }

    struct SpellRequirements {
        uint level;
        uint levelRequirementPerTier; // if level is 3, and @param levelRequirementPerTier is 5, skill will require 3+5=8 level at level 2, and 3+10 at level 3;
        GameObjects.Stats statRequirement;
        GameObjects.Stats additionalStatRequirementsPerTier;
        GameObjects.Class[] classRequirement;
    }

    struct AttackProperties {
        GameObjects.Element element;
        uint damageMultiplier; // @notice example, 120 means 120% of element damage
        uint multiplierBonusPerTier;
        uint infusion;
        uint infusionBonusPerTier;
    }

    struct HealingProperties {
        bool isPercentage;
        uint minAmount;
        uint maxAmount;
        uint bonusHealingPerTier;
    }
}
