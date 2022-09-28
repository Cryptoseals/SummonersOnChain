import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {SpellCategories, Spell, SpellType} from "../Interfaces/GameObjects/ISpell.sol";
import {AdventureBattle} from "../Interfaces/GameObjects/IAdventure.sol";
import {ICalculator} from "../Interfaces/Core/Calculator/ICalculator.sol";
import {ICodexEnemies, IMonster} from "../Interfaces/Codex/ICodexEnemies.sol";
import {Element, BattleStats} from "../Interfaces/GameObjects/IGameObjects.sol";
import {ICodexSpells} from "../Interfaces/Codex/ICodexSpells.sol";
import {ISpells} from "../Interfaces/Spells/ISpells.sol";
pragma solidity ^0.8.0;

interface IAdventures {
    function activeBattle(uint256 summoner)
        external
        view
        returns (AdventureBattle memory);

    function attack(
        uint256 summoner,
        uint256 multiplier,
        uint256 overrideDps
    ) external returns (uint256);

    function heal(
        uint256 summoner,
        uint256 minHealAmount,
        uint256 maxHealAmount,
        bool isPercentage
    ) external;

    function settleBattle(uint256 summoner) external;

    function flee(uint256 summoner) external;
}

contract AdventureControls is InitNavigator {
    IAdventures adventuresContract;
    ICodexEnemies enemyCodexContract;
    ICalculator calculatorContract;
    ICodexSpells spellCodex;
    ISpells spells;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function initializeContracts() external {
        adventuresContract = IAdventures(
            contractAddress(INavigator.CONTRACT.ADVENTURES)
        );
        enemyCodexContract = ICodexEnemies(
            contractAddress(INavigator.CONTRACT.CODEX_ENEMIES)
        );
        calculatorContract = ICalculator(
            contractAddress(INavigator.CONTRACT.CALCULATOR)
        );
        spellCodex = ICodexSpells(
            contractAddress(INavigator.CONTRACT.SPELLS_CODEX)
        );
        spells = ISpells(contractAddress(INavigator.CONTRACT.SPELLS));
    }

    function basicAttack(uint256 summoner)
        external
        ensureNotPaused
        senderIsSummonerOwner(summoner)
    {
        adventuresContract.attack(summoner, 100, 0);
    }

    function spellAttack(
        uint256 summoner,
        SpellCategories spellCategory,
        uint256 spellId
    ) external ensureNotPaused senderIsSummonerOwner(summoner) {
        (bool isEquipped, uint256 lvl) = spells.isSpellEquipped(
            summoner,
            spellCategory,
            spellId
        );
        require(isEquipped && lvl > 0, "not learnt");
        Spell memory _spell = spellCodex.spell(spellCategory, spellId, lvl);

        IAdventures adventures = adventuresContract;
        AdventureBattle memory _battle = adventures.activeBattle(summoner);
        Element ele = getType(spellCategory);

        IMonster.Monster memory monster = enemyCodexContract.enemy(
            _battle.monster.element,
            _battle.monster.monsterId,
            _battle.monster.level
        );
        (BattleStats memory summ, ) = calculatorContract
            .PVEBattleStatsByElement(summoner, monster, ele);

        if (_spell.spellType == SpellType.ATTACK) {
            adventuresContract.attack(
                summoner,
                _spell.attackProps.damageMultiplier,
                summ.DPS
            );
        } else if (_spell.spellType == SpellType.HEALING) {
            adventuresContract.heal(
                summoner,
                _spell.healingProps.minAmount,
                _spell.healingProps.maxAmount,
                _spell.healingProps.isPercentage
            );
        } else if (_spell.spellType == SpellType.HEALING) {
            uint256 dealt = adventuresContract.attack(
                summoner,
                _spell.attackProps.damageMultiplier,
                summ.DPS
            );

            if (dealt > 0) {
                adventuresContract.heal(
                    summoner,
                    dealt,
                    0,
                    _spell.healingProps.isPercentage
                );
            }
        }
    }

    function settleBattle(uint256 summoner)
        external
        ensureNotPaused
        senderIsSummonerOwner(summoner)
    {
        adventuresContract.settleBattle(summoner);
    }

    function flee(uint256 summoner)
        external
        ensureNotPaused
        senderIsSummonerOwner(summoner)
    {
        adventuresContract.flee(summoner);
    }

    function getType(SpellCategories _type) internal pure returns (Element) {
        if (_type == SpellCategories.ARCANE) return Element.ARCANE;
        if (_type == SpellCategories.FIRE) return Element.FIRE;
        if (_type == SpellCategories.COLD) return Element.COLD;
        if (_type == SpellCategories.EARTH) return Element.EARTH;
        if (_type == SpellCategories.LIGHTNING) return Element.LIGHTNING;
        if (_type == SpellCategories.HOLY) return Element.HOLY;
        if (_type == SpellCategories.DARK) return Element.DARK;
        if (_type == SpellCategories.VOID) return Element.VOID;
        if (_type == SpellCategories.GADGET) return Element.PHYSICAL;
        if (_type == SpellCategories.PHYSICAL) return Element.PHYSICAL;
        if (_type == SpellCategories.RANGED) return Element.PHYSICAL;
    }
}
