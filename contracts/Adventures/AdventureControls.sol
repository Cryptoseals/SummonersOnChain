import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {ISpell} from "../Interfaces/GameObjects/ISpell.sol";
import {IAdventure} from "../Interfaces/GameObjects/IAdventure.sol";
import {ICalculator} from  "../Interfaces/Core/Calculator/ICalculator.sol";
import {ICodexEnemies, IMonster} from "../Interfaces/Codex/ICodexEnemies.sol";
import {GameObjects, GameObjects_Stats} from "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface IAdventures {
    function activeBattle(uint summoner) external view returns (IAdventure.AdventureBattle memory);

    function attack(uint summoner, uint multiplier, uint overrideDps) external virtual;

    function settleBattle(uint summoner) external virtual;

    function flee(uint summoner) external virtual;
}

contract AdventureControls is InitNavigator {

    IAdventures adventuresContract;
    ICodexEnemies enemyCodexContract;
    ICalculator calculatorContract;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
     }

    function initializeContracts() external {
        adventuresContract = IAdventures(contractAddress(INavigator.CONTRACT.ADVENTURES));
        enemyCodexContract = ICodexEnemies(contractAddress(INavigator.CONTRACT.CODEX_ENEMIES));
        calculatorContract = ICalculator(contractAddress(INavigator.CONTRACT.CALCULATOR));
    }

    function basicAttack(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        adventuresContract.attack(summoner, 100, 0);
    }

    function spellAttack(uint summoner, ISpell.SpellCategories spellCategory, uint spellId) external
    ensureNotPaused
    senderIsSummonerOwner(summoner) {

        // TODO("check if skill is learnt")

        GameObjects.Element dummyEle = GameObjects.Element.FIRE;

        IAdventures adventures = adventuresContract;
        IAdventure.AdventureBattle memory _battle = adventures.activeBattle(summoner);

        IMonster.Monster memory monster = enemyCodexContract.enemy(
            _battle.monster.element,
            _battle.monster.monsterId,
            _battle.monster.level
        );

        // calculate the extra dps from spell atk of attacker and def from enemy stats
        (
        GameObjects_Stats.BattleStats memory summ,
        ) = calculatorContract.PVEBattleStatsByElement(summoner, monster, dummyEle);

        // TODO, override the spell mult (100)
        adventuresContract.attack(summoner, 100, summ.DPS);
    }

    function settleBattle(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        adventuresContract.settleBattle(summoner);
    }

    function flee(uint summoner) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        adventuresContract.flee(summoner);
    }
}
