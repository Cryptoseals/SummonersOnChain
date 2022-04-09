import "../Interfaces/GameObjects/IMonster.sol";
pragma solidity ^0.8.0;

contract CodexEnemiesPhysical {

    function enemy(uint256 _id, uint256 _lvl)
    public
    pure
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return Test();
        }
        revert();

    }
    function Test() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Test";


        _enemy.EnemyStats.STR = 2;
        _enemy.EnemyStats.AGI = 1;
        _enemy.EnemyStats.INT = 1;
        _enemy.EnemyStats.DEX = 1;
        _enemy.EnemyStats.VIT = 3;
        _enemy.EnemyStats.LUCK = 1;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 10,
        P_ATK : 3,
        M_ATK : 3,
        P_DEF : 10,
        M_DEF : 10,
        ACCURACY : 5,
        DODGE : 1,
        CRIT : 1,
        CRIT_MULTIPLIER : 25,
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.PHYSICAL;
        _enemy.EnemyGeneratedStats.P_ATK = 20;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 40,
        COLD_DEF : 80,
        EARTH_DEF : 40,
        LIGHTNING_DEF : 20,
        DARK_DEF : 40,
        HOLY_DEF : 40,
        VOID_DEF : 0
        });
    }
}
