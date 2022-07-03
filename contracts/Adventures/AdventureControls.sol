import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {ISpell, GameObjects} from "../Interfaces/GameObjects/ISpell.sol";
import {IAdventure} from "../Interfaces/GameObjects/IAdventure.sol";
import {ICalculator} from  "../Interfaces/Core/Calculator/ICalculator.sol";
import {ICodexEnemies, IMonster} from "../Interfaces/Codex/ICodexEnemies.sol";

pragma solidity ^0.8.0;

interface IAdventures {
    function activeBattle(uint summoner) external view returns (IAdventure.AdventureBattle memory);

    function attack(uint summoner, uint multiplier, uint overrideDps) external virtual;

    function settleBattle(uint summoner) external virtual;

    function flee(uint summoner) external virtual;
}

contract AdventureControls is InitNavigator {

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function basicAttack(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        IAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES)).attack(summoner, 100, 0);
    }

    function spellAttack(uint summoner, ISpell.SpellCategories spellCategory, uint spellId) external
    ensureNotPaused
    senderIsSummonerOwner(summoner) {

        // TODO("check if skill is learnt")

        GameObjects.Element dummyEle = GameObjects.Element.FIRE;

        IAdventures adventures = IAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES));
        IAdventure.AdventureBattle memory _battle = adventures.activeBattle(summoner);

        ICalculator calc = ICalculator(contractAddress(INavigator.CONTRACT.CALCULATOR));
        IMonster.Monster memory monster = ICodexEnemies(
            contractAddress(INavigator.CONTRACT.CODEX_ENEMIES)).enemy(
            _battle.monster.element,
            _battle.monster.monsterId,
            _battle.monster.level
        );

        // calculate the extra dps from spell atk of attacker and def from enemy stats
        (
        GameObjects.BattleStats memory summ,
        ) = calc.PVEBattleStatsByElement(summoner, monster, dummyEle);

        // TODO, override the spell mult (100)
        IAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES)).attack(summoner, 100, summ.DPS);
    }

    function settleBattle(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        IAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES)).settleBattle(summoner);
    }

    function flee(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        IAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES)).flee(summoner);
    }
}
