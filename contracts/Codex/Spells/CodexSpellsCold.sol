import {Element, Class} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {Spell, SpellType} from "../../Interfaces/GameObjects/ISpell.sol";
pragma solidity ^0.8.0;

contract CodexSpellsCold {
    function spell(uint256 _id, uint256 _tier)
        public
        pure
        returns (Spell memory)
    {
        if (_id == 1) {
            return Frostbolt(_tier);
        } else if (_id == 2) {
            return IcicleShot(_tier);
        } else if (_id == 3) {
            return FreezingBlast(_tier);
        } else if (_id == 4) {
            return Icebite(_tier);
        } else if (_id == 5) {
            return Blizzard(_tier);
        } else if (_id == 6) {
            return WallOfIce(_tier);
        } else if (_id == 7) {
            return RayOfFrost(_tier);
        } else if (_id == 8) {
            return Dragonfrost(_tier);
        }

        revert("invalid");
    }

    function Frostbolt(uint256 tier) public pure returns (Spell memory _spell) {
        _spell.id = 1;
        _spell.cooldown = 3;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.COLD;
        _spell.attackProps.damageMultiplier = 25;
        _spell.attackProps.multiplierBonusPerTier = 3;
        _spell.attackProps.infusion = 3;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 12;

        _spell.learningCost = 4e18;

        _spell.upgradeCostMultiplier = 3;

        _spell.requirements.level = 2;
        _spell.requirements.levelRequirementPerTier = 3;

        _spell.requirements.classRequirement = classRequirement();
    }

    function IcicleShot(uint256 tier)
        public
        pure
        returns (Spell memory _spell)
    {
        _spell.id = 2;
        _spell.cooldown = 4;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.COLD;
        _spell.attackProps.damageMultiplier = 30;
        _spell.attackProps.multiplierBonusPerTier = 4;
        _spell.attackProps.infusion = 3;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 11;

        _spell.learningCost = 5e18;

        _spell.upgradeCostMultiplier = 3;

        _spell.requirements.level = 6;
        _spell.requirements.levelRequirementPerTier = 3;

        _spell.requirements.classRequirement = classRequirement();
    }

    function FreezingBlast(uint256 tier)
        public
        pure
        returns (Spell memory _spell)
    {
        _spell.id = 3;
        _spell.cooldown = 5;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.COLD;
        _spell.attackProps.damageMultiplier = 35;
        _spell.attackProps.multiplierBonusPerTier = 5;
        _spell.attackProps.infusion = 3;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 10;

        _spell.learningCost = 6e18;

        _spell.upgradeCostMultiplier = 3;

        _spell.requirements.level = 12;
        _spell.requirements.levelRequirementPerTier = 4;

        _spell.requirements.classRequirement = classRequirement();
    }

    function Icebite(uint256 tier) public pure returns (Spell memory _spell) {
        _spell.id = 4;
        _spell.cooldown = 5;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.COLD;
        _spell.attackProps.damageMultiplier = 40;
        _spell.attackProps.multiplierBonusPerTier = 7;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 8;

        _spell.learningCost = 10e18;

        _spell.upgradeCostMultiplier = 4;

        _spell.requirements.level = 16;
        _spell.requirements.levelRequirementPerTier = 6;

        _spell.requirements.classRequirement = classRequirement();
    }

    function Blizzard(uint256 tier) public pure returns (Spell memory _spell) {
        _spell.id = 5;
        _spell.cooldown = 5;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.COLD;
        _spell.attackProps.damageMultiplier = 45;
        _spell.attackProps.multiplierBonusPerTier = 9;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 6;

        _spell.learningCost = 24e18;

        _spell.upgradeCostMultiplier = 4;

        _spell.requirements.level = 24;
        _spell.requirements.levelRequirementPerTier = 8;

        _spell.requirements.classRequirement = classRequirement();
    }

    function WallOfIce(uint256 tier) public pure returns (Spell memory _spell) {
        _spell.id = 6;
        _spell.cooldown = 6;
        _spell.spellType = SpellType.HEALING;

        _spell.healingProps.minAmount = 35;
        _spell.healingProps.maxAmount = 45;
        _spell.healingProps.bonusHealingPerTier = 3;
        _spell.healingProps.isPercentage = true;

        _spell.maxSpellLevel = 4;

        _spell.learningCost = 80e18;

        _spell.upgradeCostMultiplier = 5;

        _spell.requirements.level = 32;
        _spell.requirements.levelRequirementPerTier = 13;

        _spell.requirements.classRequirement = classRequirement();
    }

    function RayOfFrost(uint256 tier)
        public
        pure
        returns (Spell memory _spell)
    {
        _spell.id = 7;
        _spell.cooldown = 6;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.COLD;
        _spell.attackProps.damageMultiplier = 50;
        _spell.attackProps.multiplierBonusPerTier = 18;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 3;

        _spell.learningCost = 96e18;

        _spell.upgradeCostMultiplier = 5;

        _spell.requirements.level = 40;
        _spell.requirements.levelRequirementPerTier = 18;

        _spell.requirements.classRequirement = classRequirement();
    }

    function Dragonfrost(uint256 tier)
        public
        pure
        returns (Spell memory _spell)
    {
        _spell.id = 8;
        _spell.cooldown = 6;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.COLD;
        _spell.attackProps.damageMultiplier = 75;
        _spell.attackProps.multiplierBonusPerTier = 25;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 5;

        _spell.maxSpellLevel = 2;

        _spell.learningCost = 120e18;

        _spell.upgradeCostMultiplier = 6;

        _spell.requirements.level = 48;
        _spell.requirements.levelRequirementPerTier = 26;

        _spell.requirements.classRequirement = classRequirement();
    }

    function classRequirement() internal pure returns (Class[] memory) {
        Class[] memory _reqClass = new Class[](2);
        _reqClass[0] = Class.Necromancer;
        _reqClass[1] = Class.Wizard;
        return _reqClass;
    }
}
