import "../Interfaces/GameObjects/IMonster.sol";
pragma solidity ^0.8.0;

contract CodexEnemiesArcane {
    function enemy(uint256 _id)
    public
    pure
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return WizardApprentice();
        }
        revert();
    }


    // ARCANEs
    function WizardApprentice() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Wizard Apprentice";


        _enemy.EnemyStats.STR = 1;
        _enemy.EnemyStats.AGI = 1;
        _enemy.EnemyStats.INT = 4;
        _enemy.EnemyStats.DEX = 1;
        _enemy.EnemyStats.VIT = 2;
        _enemy.EnemyStats.LUCK = 1;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 10,
        P_ATK : 3,
        M_ATK : 5,
        P_DEF : 8,
        M_DEF : 12,
        ACCURACY : 5,
        DODGE : 1,
        CRIT : 1,
        CRIT_MULTIPLIER : 25,
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 20,
        COLD_DEF : 20,
        EARTH_DEF : 20,
        LIGHTNING_DEF : 20,
        DARK_DEF : 20,
        HOLY_DEF : 20,
        VOID_DEF : 0
        });
    }
}
