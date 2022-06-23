import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/Codex/IBaseEnemyStats.sol";

pragma solidity ^0.8.0;

contract CodexEnemiesFire is InitNavigator {
    string constant public index = "Codex";
    string constant public class = "EnemiesFire";
    string constant public version = "0.0.1";

    IBaseEnemyStats baseStats;

    function getAllMonsters() external view returns (IMonster.Monster[] memory){
        IMonster.Monster[] memory result = new IMonster.Monster[](22);
        for (uint i = 1; i < 23; i++) {
            result[i-1] = enemy(i, 1);
        }
        return result;
    }

    function enemy(uint256 _id, uint lvl)
    public
    view
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return FireElemental(lvl);
        } else if (_id == 2) {
            return GiantLavaWorm(lvl);
        } else if (_id == 3) {
            return BurningNeedle(lvl);
        } else if (_id == 4) {
            return LavaNaga(lvl);
        } else if (_id == 5) {
            return InfernalZombie(lvl);
        } else if (_id == 6) {
            return FlameGolem(lvl);
        } else if (_id == 7) {
            return FlameSkull(lvl);
        } else if (_id == 8) {
            return BurningApe(lvl);
        } else if (_id == 9) {
            return LavaTendrils(lvl);
        } else if (_id == 10) {
            return VolcanicShaman(lvl);
        } else if (_id == 11) {
            return FlameSculpture(lvl);
        } else if (_id == 12) {
            return Spitfire(lvl);
        } else if (_id == 13) {
            return InfernalTroll(lvl);
        } else if (_id == 14) {
            return Vampfire(lvl);
        } else if (_id == 15) {
            return CorruptedMagmus(lvl);
        } else if (_id == 16) {
            return CorruptedLavekans(lvl);
        } else if (_id == 17) {
            return CorruptedIgnis(lvl);
        } else if (_id == 18) {
            return CorruptedFiredactus(lvl);
        } else if (_id == 19) {
            return CorruptedChargoyle(lvl);
        } else if (_id == 20) {
            return Ashfiend(lvl);
        } else if (_id == 21) {
            return Heathorn(lvl);
        } else if (_id == 22) {
            return Kai(lvl);
        }

        revert();
    }


    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }
    //26-50 FIRE
    function FireElemental(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function GiantLavaWorm(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function BurningNeedle(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function LavaNaga(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function InfernalZombie(uint lvl) public view returns (IMonster.Monster memory _enemy) {

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function FlameGolem(uint lvl) public view returns (IMonster.Monster memory _enemy) {

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function FlameSkull(uint lvl) public view returns (IMonster.Monster memory _enemy) {

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function BurningApe(uint lvl) public view returns (IMonster.Monster memory _enemy) {

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function LavaTendrils(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function VolcanicShaman(uint lvl) public view returns (IMonster.Monster memory _enemy) {

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function FlameSculpture(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function Spitfire(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function InfernalTroll(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function Vampfire(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function CorruptedMagmus(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function CorruptedLavekans(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function CorruptedIgnis(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function CorruptedFiredactus(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function CorruptedChargoyle(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function Ashfiend(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function Heathorn(uint lvl) public view returns (IMonster.Monster memory _enemy) {


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }

    function Kai(uint lvl) public view returns (IMonster.Monster memory _enemy) {

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.FIRE, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.FIRE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.FIRE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.FIRE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.FIRE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.FIRE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.FIRE, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.FIRE;
        _enemy.EnemyElementalStats.ElementalAtk.FIRE_ATK = baseStats.enemyATK(GameObjects.Element.FIRE, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.FIRE, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.COLD_DEF -= (_enemy.EnemyElementalStats.ElementalDef.COLD_DEF * 10) / 100;
    }
}
