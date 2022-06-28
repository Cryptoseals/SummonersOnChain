import {ISpell, GameObjects} from "../../Interfaces/GameObjects/ISpell.sol";
pragma solidity ^0.8.0;

contract CodexSpellsArcane {

    function spell(uint _id, uint _tier) public pure returns (ISpell.Spell memory) {
        if (_id == 1) {
            return DummySpell(_tier);
        }

        revert("invalid");
    }

    function DummySpell(uint tier) public pure returns (ISpell.Spell memory _spell) {
        _spell.id = 1;
        _spell.name = "Healing Fireball";
        _spell.cooldown = 3;
        _spell.spellType = ISpell.SpellType.LIFESTEAL;

        _spell.attackProps.element = GameObjects.Element.FIRE;
        _spell.attackProps.damageMultiplier = 120;
        _spell.attackProps.infusion = 5;
        _spell.attackProps.multiplierBonusPerTier = 5;

        _spell.healingProps.maxAmount = 20;
        _spell.healingProps.maxAmount = 25;
        _spell.healingProps.bonusHealingPerTier = 2;

        _spell.maxSpellLevel = 12;

        _spell.learningCost = 50e18;

        _spell.upgradeCostMultiplier = 3;

        _spell.requirements.level = 1;
        _spell.requirements.levelRequirementPerTier = 4;

        _spell.requirements.statRequirement.AGI = 2;
        _spell.requirements.additionalStatRequirementsPerTier.AGI = 2 * tier;

        _spell.requirements.statRequirement.INT = 6;
        _spell.requirements.additionalStatRequirementsPerTier.INT = 3 * tier;


        // class req. example.
        // (1) means there is 1 class can wear this, its an array of 1 length series.
        //req[0] will give us this class.
        // with [0], we mean first element of array. arrays start from 0
        _spell.requirements.classRequirement = new GameObjects.Class[](1);
        _spell.requirements.classRequirement[0] = GameObjects.Class.Wizard;
        //        this would be invalid. because its length of 1, means only element is [0], first.
        //        _spell.requirements.classRequirement[1]

    }
}
