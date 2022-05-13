import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/Codex/IBaseEnemyStats.sol";
pragma solidity ^0.8.0;

contract CodexEnemiesArcane is Initializable, InitNavigator {
    IBaseEnemyStats baseStats;

    function enemy(uint256 _id, uint lvl)
    public
    view
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return WizardApprentice(lvl);
        } else if (_id == 2) {
            return Hag(lvl);
        } else if (_id == 3) {
            return Witch(lvl);
        } else if (_id == 4) {
            return Imp(lvl);
        } else if (_id == 5) {
            return EvilWizard(lvl);
        } else if (_id == 6) {
            return Arcanist(lvl);
        } else if (_id == 7) {
            return ArcaneMist(lvl);
        } else if (_id == 8) {
            return DeathKnight(lvl);
        } else if (_id == 9) {
            return Fiend(lvl);
        } else if (_id == 10) {
            return MummyKnight(lvl);
        } else if (_id == 11) {
            return AberrantsAncientBook(lvl);
        } else if (_id == 12) {
            return StarSpawns(lvl);
        } else if (_id == 13) {
            return ArcaneWyvern(lvl);
        } else if (_id == 14) {
            return AncientRune(lvl);
        } else if (_id == 15) {
            return MummyLord(lvl);
        } else if (_id == 16) {
            return EternalWatcher(lvl);
        } else if (_id == 17) {
            return CorruptedWisp(lvl);
        } else if (_id == 18) {
            return MasterArcanist(lvl);
        } else if (_id == 19) {
            return ArcaneLich(lvl);
        } else if (_id == 20) {
            return Soulstealer(lvl);
        } else if (_id == 21) {
            return SpellWarden(lvl);
        } else if (_id == 22) {
            return EyeOfCosmos(lvl);
        }
        revert();
    }

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }

    // ARCANEs
    function WizardApprentice(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Wizard Apprentice";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function Hag(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Hag";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function Witch(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Witch";



        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function Imp(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Imp";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function EvilWizard(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Evil Wizard";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function Arcanist(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Arcanist";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function ArcaneMist(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Arcane Mist";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function DeathKnight(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Death Knight";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function Fiend(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Fiend";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function MummyKnight(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Mummy Knight";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function AberrantsAncientBook(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Aberrant's Ancient Book";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function StarSpawns(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Star Spawns";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function ArcaneWyvern(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Arcane Wyvern";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function AncientRune(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Ancient Rune";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function MummyLord(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Mummy Lord";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function EternalWatcher(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Eternal Watcher";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function CorruptedWisp(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Corrupted Wisp";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function MasterArcanist(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Master Arcanist";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function ArcaneLich(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Arcane Lich";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function Soulstealer(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Soulstealer";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function SpellWarden(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Spell Warden";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }

    function EyeOfCosmos(uint lvl) public view returns (IMonster.Monster memory _enemy) {
//        _enemy.MonsterMetadata.name = "Eye of Cosmos";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.ARCANE, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.ARCANE, lvl),
        P_ATK : 0,
        M_ATK : baseStats.enemyATK(GameObjects.Element.ARCANE, lvl),
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.ARCANE, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.ARCANE, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.ARCANE, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.ARCANE, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.ARCANE, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.ARCANE, lvl),
        INFUSION : 0
        });
        _enemy.EnemyGeneratedStats.P_DEF -= (_enemy.EnemyGeneratedStats.P_DEF*10) / 100;

        _enemy.damageType = GameObjects.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.ARCANE, lvl)
        });
    }
}
