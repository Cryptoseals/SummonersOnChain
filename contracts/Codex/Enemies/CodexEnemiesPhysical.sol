import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/Codex/IBaseEnemyStats.sol";

pragma solidity ^0.8.0;

contract CodexEnemiesPhysical is Initializable, InitNavigator {
    IBaseEnemyStats baseStats;

    function enemy(uint256 _id, uint lvl)
    public
    view
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return Pickpocket(lvl);
        } else if (_id == 2) {
            return GangMember(lvl);
        } else if (_id == 3) {
            return Bandit(lvl);
        } else if (_id == 4) {
            return Spearman(lvl);
        } else if (_id == 5) {
            return Hunter(lvl);
        } else if (_id == 6) {
            return GangLeader(lvl);
        } else if (_id == 7) {
            return EvilLumberjack(lvl);
        } else if (_id == 8) {
            return BanditGeneral(lvl);
        } else if (_id == 9) {
            return Racketeer(lvl);
        } else if (_id == 10) {
            return ThiefMasterClan(lvl);
        } else if (_id == 11) {
            return Sharpshooter(lvl);
        } else if (_id == 12) {
            return Ranger(lvl);
        } else if (_id == 13) {
            return CaveTroll(lvl);
        } else if (_id == 14) {
            return BehemothPython(lvl);
        } else if (_id == 15) {
            return FleshDevourer(lvl);
        } else if (_id == 16) {
            return ScarlettSoldier(lvl);
        } else if (_id == 17) {
            return AssassinOfTheOrder(lvl);
        } else if (_id == 18) {
            return SyndicateAssassin(lvl);
        } else if (_id == 19) {
            return Gatekeeper(lvl);
        } else if (_id == 20) {
            return Ashbringer(lvl);
        } else if (_id == 21) {
            return ScarlettGeneral(lvl);
        } else if (_id == 22) {
            return FeudalLordGodrig(lvl);
        }
        revert();
    }

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }

    function Pickpocket(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Pickpocket";

        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function GangMember(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Gang Member";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function Bandit(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Bandit";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function Spearman(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Spearman";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function Hunter(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Hunter";

        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function GangLeader(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Gang Leader";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function EvilLumberjack(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Evil Lumberjack";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function BanditGeneral(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Bandit General";

        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function Racketeer(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Racketeer";

        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function ThiefMasterClan(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Thief Master Clan";

        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function Sharpshooter(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Sharpshooter";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function Ranger(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ranger";

        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function CaveTroll(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Cave Troll";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function BehemothPython(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Behemoth Python";

        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function FleshDevourer(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Flesh Devourer";

        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function ScarlettSoldier(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Scarlett Soldier";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function AssassinOfTheOrder(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Assassin of the Order";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function SyndicateAssassin(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Syndicate Assassin";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function Gatekeeper(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Gatekeeper";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function Ashbringer(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ashbringer";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function ScarlettGeneral(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Scarlett General";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }

    function FeudalLordGodrig(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Feudal Lord Godrig";


        _enemy.EnemyStats.STR = baseStats.enemySTAT(GameObjects.Element.PHYSICAL, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.PHYSICAL, lvl),
        P_ATK : baseStats.enemyATK(GameObjects.Element.PHYSICAL, lvl),
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.PHYSICAL, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.PHYSICAL, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.PHYSICAL, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.PHYSICAL, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.PHYSICAL, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.PHYSICAL, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.PHYSICAL;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.PHYSICAL;

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.PHYSICAL, lvl)
        });
        _enemy.EnemyGeneratedStats.M_DEF -= (_enemy.EnemyGeneratedStats.M_DEF * 10) / 100;
    }
}
