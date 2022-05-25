import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/Codex/IBaseEnemyStats.sol";

pragma solidity ^0.8.0;

contract CodexEnemiesCold is Initializable, InitNavigator {
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
            return ColdElemental(lvl);
        } else if (_id == 2) {
            return FrostWorm(lvl);
        } else if (_id == 3) {
            return SeaQueen(lvl);
        } else if (_id == 4) {
            return KingCrab(lvl);
        } else if (_id == 5) {
            return ArcticZombie(lvl);
        } else if (_id == 6) {
            return IceGolem(lvl);
        } else if (_id == 7) {
            return Sharakus(lvl);
        } else if (_id == 8) {
            return EldritchGrowth(lvl);
        } else if (_id == 9) {
            return WinterFey(lvl);
        } else if (_id == 10) {
            return FrostNaga(lvl);
        } else if (_id == 11) {
            return Leviathan(lvl);
        } else if (_id == 12) {
            return Seafallen(lvl);
        } else if (_id == 13) {
            return MarinerWarjack(lvl);
        } else if (_id == 14) {
            return Frostopus(lvl);
        } else if (_id == 15) {
            return SeaHarpy(lvl);
        } else if (_id == 16) {
            return FrostAnomaly(lvl);
        } else if (_id == 17) {
            return FrigidPrince(lvl);
        } else if (_id == 18) {
            return MutantIceBlaster(lvl);
        } else if (_id == 19) {
            return AbominableYeti(lvl);
        } else if (_id == 20) {
            return Remorhaz(lvl);
        } else if (_id == 21) {
            return FrozenQueen(lvl);
        } else if (_id == 22) {
            return AurilTheFrostmaiden(lvl);
        }

        revert();

    }

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }
    //51-75 COLD
    function ColdElemental(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Cold Elemental";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function FrostWorm(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Frost Worm";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function SeaQueen(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Seaqueen";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function KingCrab(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "King Crab";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function ArcticZombie(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Arctic Zombie";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function IceGolem(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Ice Golem";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function Sharakus(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Sharakus";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function EldritchGrowth(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Eldritch Growth";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function WinterFey(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Winter Fey";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function FrostNaga(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Frost Naga";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function Leviathan(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Leviathan";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function Seafallen(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Seafallen";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function MarinerWarjack(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Mariner Warjack";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function Frostopus(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Frostopus";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function SeaHarpy(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Sea Harpy";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function FrostAnomaly(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Frost Anomaly";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function FrigidPrince(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Frigid Prince";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function MutantIceBlaster(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Mutant Ice Blaster";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function AbominableYeti(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Abominable Yeti";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function Remorhaz(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Remorhaz";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function FrozenQueen(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Frozen Queen";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }

    function AurilTheFrostmaiden(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Auril The Frostmaiden";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.COLD, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.COLD, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.COLD, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.COLD, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.COLD, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.COLD, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.COLD, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.COLD, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.COLD;
        _enemy.EnemyElementalStats.ElementalAtk.COLD_ATK = baseStats.enemyATK(GameObjects.Element.COLD, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.COLD, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF -= (_enemy.EnemyElementalStats.ElementalDef.LIGHTNING_DEF * 10) / 100;

    }
}
