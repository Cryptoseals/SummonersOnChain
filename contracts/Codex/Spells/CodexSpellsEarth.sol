import {Element,Class} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {Spell, SpellType} from "../../Interfaces/GameObjects/ISpell.sol";
pragma solidity ^0.8.0;

contract CodexSpellsEarth {

    function spell(uint _id, uint _tier) public pure returns (Spell memory) {
        if (_id == 1) {return EarthTremor(_tier);}
        else if (_id == 2) {return MoldEarth(_tier);}
        else if (_id == 3) {return EruptingEarth(_tier);}
        else if (_id == 4) {return WallOfSand(_tier);}
        else if (_id == 5) {return FleshToStone(_tier);}
        else if (_id == 6) {return ForceOfNature(_tier);}
        else if (_id == 7) {return Earthquake(_tier);}
        else if (_id == 8) {return BonesOfTheEarth(_tier);}

        revert("invalid");
    }

    function EarthTremor(uint tier) public pure returns (Spell memory _spell) {
        _spell.id = 1;
        _spell.cooldown = 3;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.EARTH;
        _spell.attackProps.damageMultiplier = 20;
        _spell.attackProps.multiplierBonusPerTier = 5;
        _spell.attackProps.infusion = 3;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 12;

        _spell.learningCost = 12e18;

        _spell.upgradeCostMultiplier = 2;

        _spell.requirements.level = 2;
        _spell.requirements.levelRequirementPerTier = 3;

        _spell.requirements.classRequirement = classRequirement();
    }

    function MoldEarth(uint tier) public pure returns (Spell memory _spell) {
        _spell.id = 2;
        _spell.cooldown = 4;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.EARTH;
        _spell.attackProps.damageMultiplier = 25;
        _spell.attackProps.multiplierBonusPerTier = 5;
        _spell.attackProps.infusion = 3;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 12;

        _spell.learningCost = 24e18;

        _spell.upgradeCostMultiplier = 3;

        _spell.requirements.level = 6;
        _spell.requirements.levelRequirementPerTier = 3;

        _spell.requirements.classRequirement = classRequirement();
    }

    function EruptingEarth(uint tier) public pure returns (Spell memory _spell) {
        _spell.id = 3;
        _spell.cooldown = 4;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.EARTH;
        _spell.attackProps.damageMultiplier = 30;
        _spell.attackProps.multiplierBonusPerTier = 5;
        _spell.attackProps.infusion = 3;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 10;

        _spell.learningCost = 36e18;

        _spell.upgradeCostMultiplier = 3;

        _spell.requirements.level = 12;
        _spell.requirements.levelRequirementPerTier = 4;

        _spell.requirements.classRequirement = classRequirement();
    }

    function WallOfSand(uint tier) public pure returns (Spell memory _spell) {
        _spell.id = 4;
        _spell.cooldown = 5;
        _spell.spellType = SpellType.LIFESTEAL;

        _spell.attackProps.element = Element.EARTH;
        _spell.attackProps.damageMultiplier = 0;
        _spell.attackProps.multiplierBonusPerTier = 3;
        _spell.attackProps.infusion = 3;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.healingProps.maxAmount = 20;
        _spell.healingProps.maxAmount = 40;
        _spell.healingProps.bonusHealingPerTier = 5;

        _spell.maxSpellLevel = 8;

        _spell.learningCost = 48e18;

        _spell.upgradeCostMultiplier = 4;

        _spell.requirements.level = 16;
        _spell.requirements.levelRequirementPerTier = 6;

        _spell.requirements.classRequirement = classRequirement();
    }

    function FleshToStone(uint tier) public pure returns (Spell memory _spell) {
        _spell.id = 5;
        _spell.cooldown = 5;
        _spell.spellType = SpellType.HEALING;

        _spell.healingProps.maxAmount = 30;
        _spell.healingProps.maxAmount = 50;
        _spell.healingProps.bonusHealingPerTier = 3123123;

        _spell.maxSpellLevel = 6;

        _spell.learningCost = 64e18;

        _spell.upgradeCostMultiplier = 6;

        _spell.requirements.level = 24;
        _spell.requirements.levelRequirementPerTier = 8;

        _spell.requirements.classRequirement = classRequirement();
    }

    function ForceOfNature(uint tier) public pure returns (Spell memory _spell) {
        _spell.id = 6;
        _spell.cooldown = 6;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.EARTH;
        _spell.attackProps.damageMultiplier = 35;
        _spell.attackProps.multiplierBonusPerTier = 5;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 4;

        _spell.learningCost = 80e18;

        _spell.upgradeCostMultiplier = 12;

        _spell.requirements.level = 32;
        _spell.requirements.levelRequirementPerTier = 13;

        _spell.requirements.classRequirement = classRequirement();
    }

    function Earthquake(uint tier) public pure returns (Spell memory _spell) {
        _spell.id = 7;
        _spell.cooldown = 6;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.EARTH;
        _spell.attackProps.damageMultiplier = 40;
        _spell.attackProps.multiplierBonusPerTier = 10;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 3;

        _spell.learningCost = 96e18;

        _spell.upgradeCostMultiplier = 16;

        _spell.requirements.level = 40;
        _spell.requirements.levelRequirementPerTier = 18;

        _spell.requirements.classRequirement = classRequirement();
    }

    function BonesOfTheEarth(uint tier) public pure returns (Spell memory _spell) {
        _spell.id = 8;
        _spell.cooldown = 6;
        _spell.spellType = SpellType.ATTACK;

        _spell.attackProps.element = Element.EARTH;
        _spell.attackProps.damageMultiplier = 70;
        _spell.attackProps.multiplierBonusPerTier = 25;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 4;

        _spell.maxSpellLevel = 2;

        _spell.learningCost = 120e18;

        _spell.upgradeCostMultiplier = 24;

        _spell.requirements.level = 48;
        _spell.requirements.levelRequirementPerTier = 26;

        _spell.requirements.classRequirement = classRequirement();
    }

    function classRequirement() internal pure returns (Class[] memory) {
        Class[] memory _reqClass = new Class[](2);
        _reqClass[0] = Class.Wizard;
        _reqClass[1] = Class.Assassin;
        return _reqClass;
    }
}