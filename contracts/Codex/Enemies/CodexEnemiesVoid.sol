import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/Codex/IBaseEnemyStats.sol";

pragma solidity ^0.8.0;

contract CodexEnemiesVoid is Initializable, InitNavigator  {
    IBaseEnemyStats baseStats;

    function enemy(uint256 _id, uint lvl)
    public
    view
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return TheMatter1(lvl);
        } else if (_id == 2) {
            return TheMatter2(lvl);
        } else if (_id == 3) {
            return TheMatter3(lvl);
        } else if (_id == 4) {
            return TheMatter4(lvl);
        } else if (_id == 5) {
            return TheMatter5(lvl);
        } else if (_id == 6) {
            return Celestion1(lvl);
        } else if (_id == 7) {
            return Celestion2(lvl);
        } else if (_id == 8) {
            return Celestion3(lvl);
        } else if (_id == 9) {
            return Celestion4(lvl);
        } else if (_id == 10) {
            return Celestion5(lvl);
        } else if (_id == 11) {
            return Celestion6(lvl);
        } else if (_id == 12) {
            return Invincia1(lvl);
        } else if (_id == 13) {
            return Invincia2(lvl);
        } else if (_id == 14) {
            return Invincia3(lvl);
        } else if (_id == 15) {
            return Invincia4(lvl);
        } else if (_id == 16) {
            return Invincia5(lvl);
        } else if (_id == 17) {
            return Invincia6(lvl);
        } else if (_id == 18) {
            return InfinitumAeternum1(lvl);
        } else if (_id == 19) {
            return InfinitumAeternum2(lvl);
        } else if (_id == 20) {
            return InfinitumAeternum3(lvl);
        } else if (_id == 21) {
            return InfinitumAeternum4(lvl);
        } else if (_id == 22) {
            return InfinitumAeternum5(lvl);
        }
        revert();
    }

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }


    //151-175 VOID
    function TheMatter1(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function TheMatter2(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function TheMatter3(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function TheMatter4(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function TheMatter5(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Celestion1(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Celestion2(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Celestion3(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Celestion4(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Celestion5(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Celestion6(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Invincia1(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Invincia2(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Invincia3(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Invincia4(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Invincia5(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function Invincia6(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function InfinitumAeternum1(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function InfinitumAeternum2(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function InfinitumAeternum3(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function InfinitumAeternum4(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }
    function InfinitumAeternum5(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.VOID, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.VOID, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.VOID, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.VOID, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.VOID, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.VOID, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.VOID, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.VOID, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = baseStats.enemyATK(GameObjects.Element.VOID, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.VOID, lvl)
        });
    }

}
