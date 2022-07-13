import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Interfaces/Core/Calculator/ICalculator.sol";
import "../Interfaces/Codex/ICodexAdventures.sol";
import "../Interfaces/Codex/ICodexEnemies.sol";
import "../Inventory/EquipableUtils.sol";
import "../Interfaces/Codex/ICodexRandom.sol";
import "../Interfaces/Reward/IReward.sol";

pragma solidity ^0.8.15;

contract WorldBoss is Initializable, InitNavigator, OwnableUpgradeable {

    uint public bossId;

    mapping(uint => IMonster.Monster) public Bosses;

    struct Boss {
        uint damageRequiredForReward;
        uint bossLevel;
        uint multiplier;
        uint cooldown;
        uint deadline;
        GameObjects.Element element;
    }

    function createBoss (Boss memory _boss) external onlyOwner {
        Bosses[bossId] = generateBoss(_boss.bossLevel, _boss.element, _boss.multiplier);
        bossId++;
    }

    function generateBoss(uint level, GameObjects.Element element, uint multi) internal view returns (IMonster.Monster memory) {
        IMonster.Monster memory proceduralBoss = ICodexEnemies(contractAddress(INavigator.CONTRACT.CODEX_ENEMIES)).enemy(element, 1, level);
        proceduralBoss.EnemyGeneratedStats.HP = proceduralBoss.EnemyGeneratedStats.HP * multi;
        return proceduralBoss;
    }

}
