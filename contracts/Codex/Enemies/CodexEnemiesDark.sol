import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/Codex/IBaseEnemyStats.sol";

pragma solidity ^0.8.0;

contract CodexEnemiesDark is Initializable, InitNavigator {
    IBaseEnemyStats baseStats;

    function enemy(uint256 _id, uint lvl)
    public
    view
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return HauntingShadow(lvl);
        } else if (_id == 2) {
            return CorruptedMage(lvl);
        } else if (_id == 3) {
            return CreatureOfNight(lvl);
        } else if (_id == 4) {
            return BackstreetVampire(lvl);
        } else if (_id == 5) {
            return RestlessSpirit(lvl);
        } else if (_id == 6) {
            return CorruptedWraith(lvl);
        } else if (_id == 7) {
            return CorruptedGoblen(lvl);
        } else if (_id == 8) {
            return Succubus(lvl);
        } else if (_id == 9) {
            return Archfiend(lvl);
        } else if (_id == 10) {
            return ShadowNaga(lvl);
        } else if (_id == 11) {
            return Soulsmith(lvl);
        } else if (_id == 12) {
            return Mimi(lvl);
        } else if (_id == 13) {
            return Gigabat(lvl);
        } else if (_id == 14) {
            return Bloodrainer(lvl);
        } else if (_id == 15) {
            return CorruptedDepedus(lvl);
        } else if (_id == 16) {
            return Cyberdark(lvl);
        } else if (_id == 17) {
            return CorruptedBaphomet(lvl);
        } else if (_id == 18) {
            return CorruptedDarthys(lvl);
        } else if (_id == 19) {
            return Darkgoyle(lvl);
        } else if (_id == 20) {
            return CorruptedWanderer(lvl);
        } else if (_id == 21) {
            return Grenth(lvl);
        } else if (_id == 22) {
            return Deathbringer(lvl);
        }
        revert();
    }

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }
    //101-125 DARK
    function HauntingShadow(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Haunting Shadow";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function CorruptedMage(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Mage";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function CreatureOfNight(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Creature Of Night";
        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function BackstreetVampire(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Backstreet Vampire";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function RestlessSpirit(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Restless Spirit";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function CorruptedWraith(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Wraith";
        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function CorruptedGoblen(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Goblen";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Succubus(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Succubus";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Archfiend(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Backstreet Vampire";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function ShadowNaga(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Shadow Naga";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Soulsmith(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Soulsmith";
        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Mimi(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Mimi";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Gigabat(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Gigabat";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Bloodrainer(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Bloodrainer";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function CorruptedDepedus(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Depedus";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Cyberdark(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Cyberdark";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function CorruptedBaphomet(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Baphomet";
        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function CorruptedDarthys(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Darthys";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Darkgoyle(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Darkgoyle";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function CorruptedWanderer(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Wanderer";
        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Grenth(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Grenth";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

    function Deathbringer(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Deathbringer";
        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.DARK, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.DARK, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.DARK, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.DARK, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.DARK, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.DARK, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.DARK, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.DARK, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.DARK;
        _enemy.EnemyElementalStats.ElementalAtk.DARK_ATK = baseStats.enemyATK(GameObjects.Element.DARK, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.DARK, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.HOLY_DEF -= (_enemy.EnemyElementalStats.ElementalDef.HOLY_DEF * 10) / 100;
    }

}
