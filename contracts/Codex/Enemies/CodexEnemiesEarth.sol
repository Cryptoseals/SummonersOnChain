import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/Codex/IBaseEnemyStats.sol";

pragma solidity ^0.8.0;

contract CodexEnemiesEarth is Initializable, InitNavigator {
    IBaseEnemyStats baseStats;

    function enemy(uint256 _id, uint lvl)
    public
    view
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return EarthElemental(lvl);
        } else if (_id == 2) {
            return Ysoki(lvl);
        } else if (_id == 3) {
            return Viper(lvl);
        } else if (_id == 4) {
            return Naga(lvl);
        } else if (_id == 5) {
            return Zombie(lvl);
        } else if (_id == 6) {
            return Golem(lvl);
        } else if (_id == 7) {
            return Ogre(lvl);
        } else if (_id == 8) {
            return Ape(lvl);
        } else if (_id == 9) {
            return JungleTendril(lvl);
        } else if (_id == 10) {
            return GiantWorm(lvl);
        } else if (_id == 11) {
            return NightmareWine(lvl);
        } else if (_id == 12) {
            return Athach(lvl);
        } else if (_id == 13) {
            return GraveKeeper(lvl);
        } else if (_id == 14) {
            return Arrowhawk(lvl);
        } else if (_id == 15) {
            return Shai(lvl);
        } else if (_id == 16) {
            return Basilisk(lvl);
        } else if (_id == 17) {
            return LamiaQueen(lvl);
        } else if (_id == 18) {
            return CentaurChampion(lvl);
        } else if (_id == 19) {
            return JungleTroll(lvl);
        } else if (_id == 20) {
            return Koranok(lvl);
        } else if (_id == 21) {
            return Ankheg(lvl);
        } else if (_id == 22) {
            return Melandriel(lvl);
        }
        revert();
    }

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }
    //1-25 Earth
    function EarthElemental(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Earth Elemental";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Ysoki(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ysoki";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Viper(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Viper";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Naga(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Naga";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Zombie(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Zombie";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Golem(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Golem";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Ogre(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ogre";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Ape(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ape";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function JungleTendril(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Jungle Tendril";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function GiantWorm(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Giant Worm";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function NightmareWine(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Nightmare Wine";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Athach(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Athach";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function GraveKeeper(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Grave Keeper";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Arrowhawk(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Arrowhawk";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Shai(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Shai";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Basilisk(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Basilisk";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function LamiaQueen(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Lamia Queen";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function CentaurChampion(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Centaur Champion";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function JungleTroll(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Jungle Troll";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Koranok(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Koranok";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Ankheg(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ankheg";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

    function Melandriel(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Melandriel";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.EARTH, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.EARTH, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.EARTH, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.EARTH, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.EARTH, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.EARTH, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.EARTH, lvl),
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = baseStats.enemyATK(GameObjects.Element.EARTH, lvl);

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.EARTH, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.FIRE_DEF -= (_enemy.EnemyElementalStats.ElementalDef.FIRE_DEF * 10) / 100;
    }

}
