import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/Codex/IBaseEnemyStats.sol";

pragma solidity ^0.8.0;

contract CodexEnemiesHoly is Initializable, InitNavigator {
    IBaseEnemyStats baseStats;


    function enemy(uint256 _id, uint lvl)
    public
    view
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return ShinyWorm(lvl);
        } else if (_id == 2) {
            return DivineNeedle(lvl);
        } else if (_id == 3) {
            return HolyElemental(lvl);
        } else if (_id == 4) {
            return ProphetsChest(lvl);
        } else if (_id == 5) {
            return PaladinofFalseGod(lvl);
        } else if (_id == 6) {
            return CorruptedLuminousSoldier(lvl);
        } else if (_id == 7) {
            return MisguidedCleric(lvl);
        } else if (_id == 8) {
            return AncientHolyBook(lvl);
        } else if (_id == 9) {
            return DivineCultist(lvl);
        } else if (_id == 10) {
            return ShinyNaga(lvl);
        } else if (_id == 11) {
            return CorruptedElkar(lvl);
        } else if (_id == 12) {
            return PriestOfTheOrder(lvl);
        } else if (_id == 13) {
            return DivineOrderGeneral(lvl);
        } else if (_id == 14) {
            return CorruptedSentinel(lvl);
        } else if (_id == 15) {
            return FallenAngel(lvl);
        } else if (_id == 16) {
            return CorruptedPegasus(lvl);
        } else if (_id == 17) {
            return HeavenFallenLion(lvl);
        } else if (_id == 18) {
            return GaladusTheSunborn(lvl);
        } else if (_id == 19) {
            return CorruptedLumenicia(lvl);
        } else if (_id == 20) {
            return Andromedus(lvl);
        } else if (_id == 21) {
            return CorruptedTemplar(lvl);
        } else if (_id == 22) {
            return TheSunGod(lvl);
        }

        revert();
    }


    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        baseStats = IBaseEnemyStats(contractAddress(INavigator.CONTRACT.BASE_ENEMY_STATS));
    }
    //126-150 HOLY
    function ShinyWorm(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Shiny Worm";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function DivineNeedle(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Divine Needle";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function HolyElemental(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Holy Elemental";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function ProphetsChest(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Prophet's Chest";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function PaladinofFalseGod(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Paladin of False God";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function CorruptedLuminousSoldier(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Luminous Soldier";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function MisguidedCleric(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Misguided Cleric";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function AncientHolyBook(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ancient Holy Book";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function DivineCultist(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Divine Cultist";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function ShinyNaga(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Shiny Naga";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function CorruptedElkar(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted  Elkar";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function PriestOfTheOrder(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Priest Of The Order";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function DivineOrderGeneral(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Divine Order General";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function CorruptedSentinel(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Sentinel";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function FallenAngel(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Fallen Angel";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function CorruptedPegasus(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Pegasus";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function HeavenFallenLion(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Heaven Fallen Lion";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function GaladusTheSunborn(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Galadus the Sunborn";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function CorruptedLumenicia(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Lumenicia";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function Andromedus(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Andromedus";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function CorruptedTemplar(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Templar";

        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }

    function TheSunGod(uint lvl) public view returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Sun God";


        _enemy.EnemyStats.INT = baseStats.enemySTAT(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyGeneratedStats = GameObjects.GeneratedStats({
        HP : baseStats.enemyHP(GameObjects.Element.HOLY, lvl),
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseStats.enemyPDEF(GameObjects.Element.HOLY, lvl),
        M_DEF : baseStats.enemyMDEF(GameObjects.Element.HOLY, lvl),
        ACCURACY : baseStats.enemyACC(GameObjects.Element.HOLY, lvl),
        DODGE : baseStats.enemyDODGE(GameObjects.Element.HOLY, lvl),
        CRIT : baseStats.enemyCRIT(GameObjects.Element.HOLY, lvl),
        CRIT_MULTIPLIER : baseStats.enemyCRIT_MULT(GameObjects.Element.HOLY, lvl),
        INFUSION : 0
        });

        _enemy.damageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.SummonerDamageType = GameObjects.Element.HOLY;
        _enemy.EnemyElementalStats.ElementalAtk.HOLY_ATK = baseStats.enemyATK(GameObjects.Element.HOLY, lvl);

        _enemy.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({
        FIRE_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        COLD_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        EARTH_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        LIGHTNING_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        DARK_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        HOLY_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl),
        VOID_DEF : baseStats.enemyEDEF(GameObjects.Element.HOLY, lvl)
        });
        _enemy.EnemyElementalStats.ElementalDef.EARTH_DEF -= (_enemy.EnemyElementalStats.ElementalDef.EARTH_DEF * 10) / 100;
    }
}
