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


    function getAllMonsters(GameObjects.Element ele, uint lvl) external view returns (IMonster.Monster[] memory){
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
        (GameObjects_Stats.Stats memory _stats,
        GameObjects_Stats.GeneratedStats memory _gen_stats,
        GameObjects_Stats.ElementalStats memory _ele_stats) = baseStats.getStatSet(_lvl);

        _enemy.EnemyStats = _stats;
        _enemy.EnemyGeneratedStats = _gen_stats;
        _enemy.EnemyElementalStats = _ele_stats;

        _enemy.damageType = ele;
        _enemy.EnemyElementalStats.SummonerDamageType = ele;


        if (ele == GameObjects.Element.VOID) {
            _enemy.EnemyStats.STR += percentage(_enemy.EnemyStats.STR, 10);
            _enemy.EnemyStats.AGI += percentage(_enemy.EnemyStats.AGI, 10);
            _enemy.EnemyStats.DEX += percentage(_enemy.EnemyStats.DEX, 10);
            _enemy.EnemyStats.INT += percentage(_enemy.EnemyStats.INT, 10);
            _enemy.EnemyStats.VIT += percentage(_enemy.EnemyStats.VIT, 10);
            _enemy.EnemyStats.LUCK += percentage(_enemy.EnemyStats.LUCK, 10);

            _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK += percentage(_enemy.EnemyStats.LUCK, 10);
            _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF += percentage(_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF, 10);
            _enemy.EnemyElementalStats.ElementalDef.COLD_DEF += percentage(_enemy.EnemyElementalStats.ElementalDef.COLD_DEF, 10);
            _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF += percentage(_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF, 10);
            _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF += percentage(_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF, 10);
            _enemy.EnemyElementalStats.ElementalDef.DARK_DEF += percentage(_enemy.EnemyElementalStats.ElementalDef.DARK_DEF, 10);
            _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF += percentage(_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF, 10);
            _enemy.EnemyElementalStats.ElementalDef.VOID_DEF += percentage(_enemy.EnemyElementalStats.ElementalDef.VOID_DEF, 10);
        }

        // VOID & ARCANE BOOST
        if (ele == GameObjects.Element.VOID || ele == GameObjects.Element.ARCANE) {
            _enemy.EnemyGeneratedStats.M_DEF += percentage(_enemy.EnemyGeneratedStats.M_DEF, 10);
        }

        // VOID & HOLY
        if (ele == GameObjects.Element.VOID || ele == GameObjects.Element.HOLY) {
            _enemy.EnemyGeneratedStats.HP += percentage(_enemy.EnemyGeneratedStats.HP, 10);
        }

        // VOID && COLD
        if (ele == GameObjects.Element.VOID || ele == GameObjects.Element.COLD) {
            _enemy.EnemyGeneratedStats.CRIT += percentage(_enemy.EnemyGeneratedStats.CRIT, 10);
        }

        // VOID && LIGHTNING
        if (ele == GameObjects.Element.VOID || ele == GameObjects.Element.LIGHTNING) {
            _enemy.EnemyGeneratedStats.DODGE += percentage(_enemy.EnemyGeneratedStats.DODGE, 10);
        }

        // VOID && FIRE
        if (ele == GameObjects.Element.FIRE) {
            _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK += percentage(_enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK, 10);
        }

        // VOID && PHYSICAL
        if (ele == GameObjects.Element.PHYSICAL) {
            _enemy.EnemyGeneratedStats.CRIT_MULTIPLIER += percentage(_enemy.EnemyGeneratedStats.CRIT_MULTIPLIER, 10);
        }
        // VOID && DARK
        if (ele == GameObjects.Element.DARK) {
            _enemy.EnemyGeneratedStats.ACCURACY += percentage(_enemy.EnemyGeneratedStats.ACCURACY, 10);
        }

        // VOID && EARTH
        if (ele == GameObjects.Element.EARTH) {
            _enemy.EnemyGeneratedStats.P_DEF += percentage(_enemy.EnemyGeneratedStats.P_DEF, 10);
        }

        return _enemy;
    }


    function percentage(uint value, uint perc) internal pure returns (uint){
        return (value * perc) / 100;
    }

}
