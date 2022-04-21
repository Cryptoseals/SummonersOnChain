import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Interfaces/GameObjects/IGameObjects.sol";
import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Core/Navigator/InitNavigator.sol";
pragma solidity ^0.8.0;


interface ICodexEnemy_ {
    function enemy(uint256 _id, uint256 lvl)
    external
    pure
    returns (IMonster.Monster memory);
}


contract CodexEnemies is Initializable, InitNavigator {

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function enemy(GameObjects.Element ele, uint256 _id, uint256 _lvl)
    public
    view
    returns (IMonster.Monster memory)
    {
        ICodexEnemy_ _contract;
        if (ele == GameObjects.Element.PHYSICAL) {
            _contract = ICodexEnemy_(contractAddress(INavigator.CONTRACT.PHYSICAL_ENEMY_CODEX));
        } else if (ele == GameObjects.Element.ARCANE) {
            _contract = ICodexEnemy_(contractAddress(INavigator.CONTRACT.ARCANE_ENEMY_CODEX));
        } else if (ele == GameObjects.Element.FIRE) {
            _contract = ICodexEnemy_(contractAddress(INavigator.CONTRACT.FIRE_ENEMY_CODEX));
        } else if (ele == GameObjects.Element.COLD) {
            _contract = ICodexEnemy_(contractAddress(INavigator.CONTRACT.COLD_ENEMY_CODEX));
        } else if (ele == GameObjects.Element.LIGHTNING) {
            _contract = ICodexEnemy_(contractAddress(INavigator.CONTRACT.LIGHTNING_ENEMY_CODEX));
        } else if (ele == GameObjects.Element.EARTH) {
            _contract = ICodexEnemy_(contractAddress(INavigator.CONTRACT.EARTH_ENEMY_CODEX));
        } else if (ele == GameObjects.Element.DARK) {
            _contract = ICodexEnemy_(contractAddress(INavigator.CONTRACT.DARK_ENEMY_CODEX));
        } else if (ele == GameObjects.Element.HOLY) {
            _contract = ICodexEnemy_(contractAddress(INavigator.CONTRACT.HOLY_ENEMY_CODEX));
        } else if (ele == GameObjects.Element.VOID) {
            _contract = ICodexEnemy_(contractAddress(INavigator.CONTRACT.VOID_ENEMY_CODEX));
        } else {
            revert("?");
        }

        //        return applyLvlEffect(_contract.enemy(_id), _lvl);
        return _contract.enemy(_id, _lvl);
    }

    //    function applyLvlEffect(IMonster.Monster memory _Enemy, uint lvl) internal pure returns (IMonster.Monster memory) {
    //        if(lvl == 1) return _Enemy;
    //        _Enemy.EnemyStats.STR += lvl;
    //        _Enemy.EnemyStats.AGI += lvl;
    //        _Enemy.EnemyStats.INT += lvl;
    //        _Enemy.EnemyStats.DEX += lvl;
    //        _Enemy.EnemyStats.VIT += lvl;
    //        _Enemy.EnemyStats.LUCK += lvl;
    //
    //        _Enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
    //        HP : _Enemy.EnemyGeneratedStats.HP * lvl,
    //        P_ATK : _Enemy.EnemyGeneratedStats.P_ATK * lvl,
    //        M_ATK : _Enemy.EnemyGeneratedStats.M_ATK * lvl,
    //        P_DEF : _Enemy.EnemyGeneratedStats.P_DEF * lvl,
    //        M_DEF : _Enemy.EnemyGeneratedStats.M_DEF * lvl,
    //        ACCURACY : _Enemy.EnemyGeneratedStats.ACCURACY * lvl,
    //        DODGE : _Enemy.EnemyGeneratedStats.DODGE * lvl,
    //        CRIT : _Enemy.EnemyGeneratedStats.CRIT * lvl,
    //        CRIT_MULTIPLIER : _Enemy.EnemyGeneratedStats.CRIT_MULTIPLIER + 25 * lvl / 10,
    //        INFUSION : _Enemy.EnemyGeneratedStats.INFUSION + lvl / 10
    //        });
    //
    //        _Enemy.EnemyElementalStats.ElementalAtk = IMonster.ElementalAtk({
    //        FIRE_ATK : _Enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK * lvl,
    //        COLD_ATK : _Enemy.EnemyElementalStats.ElementalAtk.COLD_ATK * lvl,
    //        LIGHTNING_ATK : _Enemy.EnemyElementalStats.ElementalAtk.LIGHTNING_ATK * lvl,
    //        EARTH_ATK : _Enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK * lvl,
    //        VOID_ATK : _Enemy.EnemyElementalStats.ElementalAtk.VOID_ATK * lvl,
    //        HOLY_ATK : _Enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK * lvl,
    //        DARK_ATK : _Enemy.EnemyElementalStats.ElementalAtk.DARK_ATK * lvl
    //        });
    //
    //        _Enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
    //        FIRE_DEF : _Enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * lvl,
    //        COLD_DEF : _Enemy.EnemyElementalStats.ElementalDef.COLD_DEF * lvl,
    //        EARTH_DEF : _Enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * lvl,
    //        LIGHTNING_DEF : _Enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * lvl,
    //        DARK_DEF : _Enemy.EnemyElementalStats.ElementalDef.DARK_DEF * lvl,
    //        HOLY_DEF : _Enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * lvl,
    //        VOID_DEF : _Enemy.EnemyElementalStats.ElementalDef.VOID_DEF * lvl
    //        });
    //        return _Enemy;
    //    }
}
