import {ISpell, GameObjects} from "../../Interfaces/GameObjects/ISpell.sol";
pragma solidity ^0.8.0;

contract CodexSpellsLightning {

    function spell(uint _id, uint _tier) public pure returns (ISpell.Spell memory) {
        if (_id == 1) {return LightningBolt(_tier);}
        else if (_id == 2) {return LightningCharge(_tier);}
        else if (_id == 3) {return LightningBall(_tier);}
        else if (_id == 4) {return LightningBody(_tier);}
        else if (_id == 5) {return Thunderclaw(_tier);}
        else if (_id == 6) {return AvatarOfStorm(_tier);}
        else if (_id == 7) {return SummoningRitual(_tier);}
        else if (_id == 8) {return StormOfVengeance(_tier);}

        revert("invalid");
    }

    function LightningBolt(uint tier) public pure returns (ISpell.Spell memory _spell) {
        _spell.id = 1;
        _spell.cooldown = 3;
        _spell.spellType = ISpell.SpellType.ATTACK;

        _spell.attackProps.element = GameObjects.Element.LIGHTNING;
        _spell.attackProps.damageMultiplier = 25;
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

    function LightningCharge(uint tier) public pure returns (ISpell.Spell memory _spell) {
        _spell.id = 2;
        _spell.cooldown = 4;
        _spell.spellType = ISpell.SpellType.ATTACK;

        _spell.attackProps.element = GameObjects.Element.LIGHTNING;
        _spell.attackProps.damageMultiplier = 30;
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

    function LightningBall(uint tier) public pure returns (ISpell.Spell memory _spell) {
        _spell.id = 3;
        _spell.cooldown = 4;
        _spell.spellType = ISpell.SpellType.ATTACK;

        _spell.attackProps.element = GameObjects.Element.LIGHTNING;
        _spell.attackProps.damageMultiplier = 35;
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

    function LightningBody(uint tier) public pure returns (ISpell.Spell memory _spell) {
        _spell.id = 4;
        _spell.cooldown = 5;
        _spell.spellType = ISpell.SpellType.HEALING;

        _spell.healingProps.maxAmount = 35;
        _spell.healingProps.maxAmount = 45;
        _spell.healingProps.bonusHealingPerTier = 5;

        _spell.maxSpellLevel = 8;

        _spell.learningCost = 48e18;

        _spell.upgradeCostMultiplier = 4;

        _spell.requirements.level = 16;
        _spell.requirements.levelRequirementPerTier = 6;

        _spell.requirements.classRequirement = classRequirement();
    }

    function Thunderclaw(uint tier) public pure returns (ISpell.Spell memory _spell) {
        _spell.id = 5;
        _spell.cooldown = 5;
        _spell.spellType = ISpell.SpellType.ATTACK;

        _spell.attackProps.element = GameObjects.Element.LIGHTNING;
        _spell.attackProps.damageMultiplier = 40;
        _spell.attackProps.multiplierBonusPerTier = 5;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 1;

        _spell.maxSpellLevel = 6;

        _spell.learningCost = 64e18;

        _spell.upgradeCostMultiplier = 6;

        _spell.requirements.level = 24;
        _spell.requirements.levelRequirementPerTier = 8;

        _spell.requirements.classRequirement = classRequirement();
    }

    function AvatarOfStorm(uint tier) public pure returns (ISpell.Spell memory _spell) {
        _spell.id = 6;
        _spell.cooldown = 6;
        _spell.spellType = ISpell.SpellType.ATTACK;

        _spell.attackProps.element = GameObjects.Element.LIGHTNING;
        _spell.attackProps.damageMultiplier = 45;
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

    function SummoningRitual(uint tier) public pure returns (ISpell.Spell memory _spell) {
        _spell.id = 7;
        _spell.cooldown = 6;
        _spell.spellType = ISpell.SpellType.ATTACK;

        _spell.attackProps.element = GameObjects.Element.LIGHTNING;
        _spell.attackProps.damageMultiplier = 50;
        _spell.attackProps.multiplierBonusPerTier = 10;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 3;

        _spell.maxSpellLevel = 3;

        _spell.learningCost = 96e18;

        _spell.upgradeCostMultiplier = 16;

        _spell.requirements.level = 40;
        _spell.requirements.levelRequirementPerTier = 18;

        _spell.requirements.classRequirement = classRequirement();
    }

    function StormOfVengeance(uint tier) public pure returns (ISpell.Spell memory _spell) {
        _spell.id = 8;
        _spell.cooldown = 6;
        _spell.spellType = ISpell.SpellType.ATTACK;

        _spell.attackProps.element = GameObjects.Element.LIGHTNING;
        _spell.attackProps.damageMultiplier = 75;
        _spell.attackProps.multiplierBonusPerTier = 25;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.infusionBonusPerTier = 5;

        _spell.maxSpellLevel = 2;

        _spell.learningCost = 120e18;

        _spell.upgradeCostMultiplier = 24;

        _spell.requirements.level = 48;
        _spell.requirements.levelRequirementPerTier = 26;

        _spell.requirements.classRequirement = classRequirement();
    }

    function classRequirement() internal pure returns (GameObjects.Class[] memory) {
        GameObjects.Class[] memory _reqClass = new GameObjects.Class[](2);
        _reqClass[0] = GameObjects.Class.Wizard;
        _reqClass[1] = GameObjects.Class.Assassin;
        return _reqClass;
    }
}
