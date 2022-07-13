import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {GameObjects, GameObjects_Stats} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {IMonster} from "../../Interfaces/GameObjects/IMonster.sol";
import {InitNavigator, INavigator} from "../../Core/Navigator/InitNavigator.sol";
import {IBaseEnemyStats} from "../../Interfaces/Codex/IBaseEnemyStats.sol";

pragma solidity ^0.8.0;


contract CodexEnemies is Initializable, InitNavigator {

    string constant public index = "Codex";
    string constant public class = "Enemies";
    string constant public version = "0.0.1";

    IBaseEnemyStats baseStats;


    function getAllMonsters (GameObjects.Element ele, uint lvl) external view returns(IMonster.Monster[] memory){
        IMonster.Monster[] memory result = new IMonster.Monster[](22);
        for (uint i = 1; i < 22; i++) {
            result[i - 1] = enemy(ele, i, lvl);
        }
        return result;
    }

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }

    function updateCodex() external {
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }

    function enemy(GameObjects.Element ele, uint256 _id, uint256 _lvl)
    public
    view
    returns (IMonster.Monster memory _enemy)
    {
        _enemy.EnemyGeneratedStats = GameObjects_Stats.GeneratedStats({
        HP : baseStats.enemyHP(ele, _lvl),
        P_ATK : ele == GameObjects.Element.PHYSICAL ? baseStats.enemyATK(ele, _lvl) : 0,
        M_ATK : ele != GameObjects.Element.PHYSICAL ? baseStats.enemyATK(ele, _lvl) : 0,
        P_DEF : baseStats.enemyPDEF(ele, _lvl),
        M_DEF : baseStats.enemyMDEF(ele, _lvl),
        ACCURACY : baseStats.enemyACC(ele, _lvl),
        DODGE : baseStats.enemyDODGE(ele, _lvl),
        CRIT : baseStats.enemyCRIT(ele, _lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(ele, _lvl),
        INFUSION : 0
        });

        _enemy.damageType = ele;
        _enemy.EnemyElementalStats.SummonerDamageType = ele;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(ele, _lvl),
        COLD_DEF : baseStats.enemyEDEF(ele, _lvl),
        EARTH_DEF : baseStats.enemyEDEF(ele, _lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(ele, _lvl),
        DARK_DEF : baseStats.enemyEDEF(ele, _lvl),
        HOLY_DEF : baseStats.enemyEDEF(ele, _lvl),
        VOID_DEF : baseStats.enemyEDEF(ele, _lvl)
        });
        return _enemy;
    }

}
