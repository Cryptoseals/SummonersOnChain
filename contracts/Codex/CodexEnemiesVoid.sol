import "../Interfaces/GameObjects/IMonster.sol";
pragma solidity ^0.8.0;

contract CodexEnemiesVoid {

    function enemy(uint256 _id)
    public
    pure
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return TheMatter1();
        }
        revert();
    }

    //151-175 VOID
    function TheMatter1() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";


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

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 20;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 80,
        COLD_DEF : 80,
        EARTH_DEF : 80,
        LIGHTNING_DEF : 80,
        DARK_DEF : 80,
        HOLY_DEF : 80,
        VOID_DEF : 0
        });
    }
    function TheMatter2() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";


        _enemy.EnemyStats.STR = 3;
        _enemy.EnemyStats.AGI = 1;
        _enemy.EnemyStats.INT = 1;
        _enemy.EnemyStats.DEX = 1;
        _enemy.EnemyStats.VIT = 4;
        _enemy.EnemyStats.LUCK = 2;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 15,
        P_ATK : 5,
        M_ATK : 5,
        P_DEF : 12,
        M_DEF : 12,
        ACCURACY : 7,
        DODGE : 2,
        CRIT : 1,
        CRIT_MULTIPLIER : 25,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 24;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 96,
        COLD_DEF : 96,
        EARTH_DEF : 96,
        LIGHTNING_DEF : 96,
        DARK_DEF : 96,
        HOLY_DEF : 96,
        VOID_DEF : 0
        });
    }
    function TheMatter3() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";


        _enemy.EnemyStats.STR = 4;
        _enemy.EnemyStats.AGI = 2;
        _enemy.EnemyStats.INT = 2;
        _enemy.EnemyStats.DEX = 2;
        _enemy.EnemyStats.VIT = 5;
        _enemy.EnemyStats.LUCK = 2;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 20,
        P_ATK : 7,
        M_ATK : 7,
        P_DEF : 15,
        M_DEF : 15,
        ACCURACY : 8,
        DODGE : 4,
        CRIT : 2,
        CRIT_MULTIPLIER : 25,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 30;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 120,
        COLD_DEF : 120,
        EARTH_DEF : 120,
        LIGHTNING_DEF :120,
        DARK_DEF : 120,
        HOLY_DEF : 120,
        VOID_DEF : 0
        });
    }
    function TheMatter4() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";


        _enemy.EnemyStats.STR = 5;
        _enemy.EnemyStats.AGI = 3;
        _enemy.EnemyStats.INT = 3;
        _enemy.EnemyStats.DEX = 3;
        _enemy.EnemyStats.VIT = 4;
        _enemy.EnemyStats.LUCK = 3;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 25,
        P_ATK : 9,
        M_ATK : 9,
        P_DEF : 18,
        M_DEF : 18,
        ACCURACY : 12,
        DODGE : 8,
        CRIT : 2,
        CRIT_MULTIPLIER : 25,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 36;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 144,
        COLD_DEF : 144,
        EARTH_DEF : 144,
        LIGHTNING_DEF : 144,
        DARK_DEF : 144,
        HOLY_DEF : 144,
        VOID_DEF : 0
        });
    }
    function TheMatter5() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "The Matter";


        _enemy.EnemyStats.STR = 6;
        _enemy.EnemyStats.AGI = 4;
        _enemy.EnemyStats.INT = 4;
        _enemy.EnemyStats.DEX = 2;
        _enemy.EnemyStats.VIT = 6;
        _enemy.EnemyStats.LUCK = 4;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 30,
        P_ATK : 10,
        M_ATK : 10,
        P_DEF : 18,
        M_DEF : 21,
        ACCURACY : 16,
        DODGE : 12,
        CRIT : 4,
        CRIT_MULTIPLIER : 25,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 42;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 168,
        COLD_DEF : 168,
        EARTH_DEF : 168,
        LIGHTNING_DEF : 168,
        DARK_DEF : 168,
        HOLY_DEF : 168,
        VOID_DEF : 0
        });
    }
    function Celestion1() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.STR = 6;
        _enemy.EnemyStats.AGI = 4;
        _enemy.EnemyStats.INT = 4;
        _enemy.EnemyStats.DEX = 4;
        _enemy.EnemyStats.VIT = 5;
        _enemy.EnemyStats.LUCK = 4;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 35,
        P_ATK : 12,
        M_ATK : 12,
        P_DEF : 24,
        M_DEF : 24,
        ACCURACY : 20,
        DODGE : 16,
        CRIT : 4,
        CRIT_MULTIPLIER : 25,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 48;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 192,
        COLD_DEF : 192,
        EARTH_DEF : 192,
        LIGHTNING_DEF : 192,
        DARK_DEF : 192,
        HOLY_DEF : 192,
        VOID_DEF : 0
        });
    }
    function Celestion2() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.STR = 7;
        _enemy.EnemyStats.AGI = 5;
        _enemy.EnemyStats.INT = 5;
        _enemy.EnemyStats.DEX = 5;
        _enemy.EnemyStats.VIT = 6;
        _enemy.EnemyStats.LUCK = 4;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 40,
        P_ATK : 14,
        M_ATK : 14,
        P_DEF : 28,
        M_DEF : 28,
        ACCURACY : 24,
        DODGE : 20,
        CRIT : 5,
        CRIT_MULTIPLIER : 50,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 52;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 208,
        COLD_DEF : 208,
        EARTH_DEF : 208,
        LIGHTNING_DEF : 208,
        DARK_DEF : 208,
        HOLY_DEF : 208,
        VOID_DEF : 0
        });
    }
    function Celestion3() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.STR = 8;
        _enemy.EnemyStats.AGI = 5;
        _enemy.EnemyStats.INT = 5;
        _enemy.EnemyStats.DEX = 6;
        _enemy.EnemyStats.VIT = 6;
        _enemy.EnemyStats.LUCK = 5;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 45,
        P_ATK : 16,
        M_ATK : 16,
        P_DEF : 32,
        M_DEF : 32,
        ACCURACY : 28,
        DODGE : 24,
        CRIT : 5,
        CRIT_MULTIPLIER : 50,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 64;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 240,
        COLD_DEF : 240,
        EARTH_DEF : 240,
        LIGHTNING_DEF : 240,
        DARK_DEF : 240,
        HOLY_DEF : 240,
        VOID_DEF : 0
        });
    }
    function Celestion4() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.STR = 9;
        _enemy.EnemyStats.AGI = 6;
        _enemy.EnemyStats.INT = 6;
        _enemy.EnemyStats.DEX = 7;
        _enemy.EnemyStats.VIT = 8;
        _enemy.EnemyStats.LUCK = 5;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 50,
        P_ATK : 18,
        M_ATK : 18,
        P_DEF : 36,
        M_DEF : 36,
        ACCURACY : 32,
        DODGE : 28,
        CRIT : 6,
        CRIT_MULTIPLIER : 60,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 72;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 288,
        COLD_DEF : 288,
        EARTH_DEF : 288,
        LIGHTNING_DEF : 288,
        DARK_DEF : 288,
        HOLY_DEF : 288,
        VOID_DEF : 0
        });
    }
    function Celestion5() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.STR = 10;
        _enemy.EnemyStats.AGI = 7;
        _enemy.EnemyStats.INT = 7;
        _enemy.EnemyStats.DEX = 8;
        _enemy.EnemyStats.VIT = 9;
        _enemy.EnemyStats.LUCK = 6;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 55,
        P_ATK : 20,
        M_ATK : 20,
        P_DEF : 44,
        M_DEF : 44,
        ACCURACY : 36,
        DODGE : 32,
        CRIT : 6,
        CRIT_MULTIPLIER : 60,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 88;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 340,
        COLD_DEF : 340,
        EARTH_DEF : 340,
        LIGHTNING_DEF : 340,
        DARK_DEF : 340,
        HOLY_DEF : 340,
        VOID_DEF : 0
        });
    }
    function Celestion6() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Celestion";


        _enemy.EnemyStats.STR = 11;
        _enemy.EnemyStats.AGI = 8;
        _enemy.EnemyStats.INT = 8;
        _enemy.EnemyStats.DEX = 8;
        _enemy.EnemyStats.VIT = 10;
        _enemy.EnemyStats.LUCK = 7;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 60,
        P_ATK : 24,
        M_ATK : 24,
        P_DEF : 48,
        M_DEF : 48,
        ACCURACY : 40,
        DODGE : 36,
        CRIT : 8,
        CRIT_MULTIPLIER : 70,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 96;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 384,
        COLD_DEF : 384,
        EARTH_DEF : 384,
        LIGHTNING_DEF : 384,
        DARK_DEF : 384,
        HOLY_DEF : 384,
        VOID_DEF : 0
        });
    }
    function Invincia1() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.STR = 12;
        _enemy.EnemyStats.AGI = 9;
        _enemy.EnemyStats.INT = 9;
        _enemy.EnemyStats.DEX = 9;
        _enemy.EnemyStats.VIT = 11;
        _enemy.EnemyStats.LUCK = 8;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 65,
        P_ATK : 28,
        M_ATK : 28,
        P_DEF : 52,
        M_DEF : 52,
        ACCURACY : 44,
        DODGE : 40,
        CRIT : 8,
        CRIT_MULTIPLIER : 70,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 104;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 416,
        COLD_DEF : 416,
        EARTH_DEF : 416,
        LIGHTNING_DEF : 416,
        DARK_DEF : 416,
        HOLY_DEF : 416,
        VOID_DEF : 0
        });
    }
    function Invincia2() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.STR = 13;
        _enemy.EnemyStats.AGI = 11;
        _enemy.EnemyStats.INT = 11;
        _enemy.EnemyStats.DEX = 11;
        _enemy.EnemyStats.VIT = 15;
        _enemy.EnemyStats.LUCK = 8;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 70,
        P_ATK : 32,
        M_ATK : 32,
        P_DEF : 58,
        M_DEF : 58,
        ACCURACY : 48,
        DODGE : 44,
        CRIT : 9,
        CRIT_MULTIPLIER : 90,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 116;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 464,
        COLD_DEF : 464,
        EARTH_DEF : 464,
        LIGHTNING_DEF : 464,
        DARK_DEF : 464,
        HOLY_DEF : 464,
        VOID_DEF : 0
        });
    }
    function Invincia3() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.STR = 15;
        _enemy.EnemyStats.AGI = 12;
        _enemy.EnemyStats.INT = 12;
        _enemy.EnemyStats.DEX = 12;
        _enemy.EnemyStats.VIT = 14;
        _enemy.EnemyStats.LUCK = 12;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 75,
        P_ATK : 36,
        M_ATK : 36,
        P_DEF : 62,
        M_DEF : 62,
        ACCURACY : 52,
        DODGE : 48,
        CRIT : 9,
        CRIT_MULTIPLIER : 90,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 124;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 496,
        COLD_DEF : 496,
        EARTH_DEF : 496,
        LIGHTNING_DEF : 496,
        DARK_DEF : 496,
        HOLY_DEF : 496,
        VOID_DEF : 0
        });
    }
    function Invincia4() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.STR = 16;
        _enemy.EnemyStats.AGI = 14;
        _enemy.EnemyStats.INT = 9;
        _enemy.EnemyStats.DEX = 8;
        _enemy.EnemyStats.VIT = 11;
        _enemy.EnemyStats.LUCK = 9;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 80,
        P_ATK : 40,
        M_ATK : 40,
        P_DEF : 66,
        M_DEF : 66,
        ACCURACY : 56,
        DODGE : 52,
        CRIT : 10,
        CRIT_MULTIPLIER : 100,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 132;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 528,
        COLD_DEF : 528,
        EARTH_DEF : 528,
        LIGHTNING_DEF : 528,
        DARK_DEF : 528,
        HOLY_DEF : 528,
        VOID_DEF : 0
        });
    }
    function Invincia5() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.STR = 12;
        _enemy.EnemyStats.AGI = 14;
        _enemy.EnemyStats.INT = 13;
        _enemy.EnemyStats.DEX = 13;
        _enemy.EnemyStats.VIT = 14;
        _enemy.EnemyStats.LUCK = 15;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 85,
        P_ATK : 42,
        M_ATK : 42,
        P_DEF : 70,
        M_DEF : 70,
        ACCURACY : 60,
        DODGE : 56,
        CRIT : 10,
        CRIT_MULTIPLIER : 100,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 140;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 560,
        COLD_DEF : 560,
        EARTH_DEF : 560,
        LIGHTNING_DEF : 560,
        DARK_DEF : 560,
        HOLY_DEF : 560,
        VOID_DEF : 0
        });
    }
    function Invincia6() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Invincia1";


        _enemy.EnemyStats.STR = 14;
        _enemy.EnemyStats.AGI = 14;
        _enemy.EnemyStats.INT = 15;
        _enemy.EnemyStats.DEX = 16;
        _enemy.EnemyStats.VIT = 18;
        _enemy.EnemyStats.LUCK = 19;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 90,
        P_ATK : 46,
        M_ATK : 46,
        P_DEF : 74,
        M_DEF : 74,
        ACCURACY : 64,
        DODGE : 60,
        CRIT : 12,
        CRIT_MULTIPLIER : 120,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 148;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 592,
        COLD_DEF : 592,
        EARTH_DEF : 592,
        LIGHTNING_DEF : 592,
        DARK_DEF : 592,
        HOLY_DEF : 592,
        VOID_DEF : 0
        });
    }
    function InfinitumAeternum1() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";


        _enemy.EnemyStats.STR = 16;
        _enemy.EnemyStats.AGI = 15;
        _enemy.EnemyStats.INT = 23;
        _enemy.EnemyStats.DEX = 18;
        _enemy.EnemyStats.VIT = 21;
        _enemy.EnemyStats.LUCK = 21;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 95,
        P_ATK : 48,
        M_ATK : 48,
        P_DEF : 78,
        M_DEF : 78,
        ACCURACY : 68,
        DODGE : 64,
        CRIT : 12,
        CRIT_MULTIPLIER : 120,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 156;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 624,
        COLD_DEF : 624,
        EARTH_DEF : 624,
        LIGHTNING_DEF : 624,
        DARK_DEF : 624,
        HOLY_DEF : 624,
        VOID_DEF : 0
        });
    }
    function InfinitumAeternum2() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";


        _enemy.EnemyStats.STR = 18;
        _enemy.EnemyStats.AGI = 17;
        _enemy.EnemyStats.INT = 24;
        _enemy.EnemyStats.DEX = 19;
        _enemy.EnemyStats.VIT = 23;
        _enemy.EnemyStats.LUCK = 24;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 100,
        P_ATK : 50,
        M_ATK : 50,
        P_DEF : 82,
        M_DEF : 82,
        ACCURACY : 72,
        DODGE : 68,
        CRIT : 14,
        CRIT_MULTIPLIER : 130,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 164;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 656,
        COLD_DEF : 656,
        EARTH_DEF : 656,
        LIGHTNING_DEF : 656,
        DARK_DEF : 656,
        HOLY_DEF : 656,
        VOID_DEF : 0
        });
    }
    function InfinitumAeternum3() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";


        _enemy.EnemyStats.STR = 20;
        _enemy.EnemyStats.AGI = 18;
        _enemy.EnemyStats.INT = 25;
        _enemy.EnemyStats.DEX = 20;
        _enemy.EnemyStats.VIT = 25;
        _enemy.EnemyStats.LUCK = 26;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 125,
        P_ATK : 54,
        M_ATK : 54,
        P_DEF : 86,
        M_DEF : 86,
        ACCURACY : 76,
        DODGE : 72,
        CRIT : 14,
        CRIT_MULTIPLIER : 130,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 172;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 688,
        COLD_DEF : 688,
        EARTH_DEF : 688,
        LIGHTNING_DEF : 688,
        DARK_DEF : 688,
        HOLY_DEF : 688,
        VOID_DEF : 0
        });
    }
    function InfinitumAeternum4() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";


        _enemy.EnemyStats.STR = 24;
        _enemy.EnemyStats.AGI = 22;
        _enemy.EnemyStats.INT = 30;
        _enemy.EnemyStats.DEX = 24;
        _enemy.EnemyStats.VIT = 30;
        _enemy.EnemyStats.LUCK = 29;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 150,
        P_ATK : 58,
        M_ATK : 58,
        P_DEF : 90,
        M_DEF : 90,
        ACCURACY : 80,
        DODGE : 76,
        CRIT : 15,
        CRIT_MULTIPLIER : 150,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 180;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 720,
        COLD_DEF : 720,
        EARTH_DEF : 720,
        LIGHTNING_DEF : 720,
        DARK_DEF : 720,
        HOLY_DEF : 720,
        VOID_DEF : 0
        });
    }
    function InfinitumAeternum5() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Infinitum Aeternum";


        _enemy.EnemyStats.STR = 32;
        _enemy.EnemyStats.AGI = 33;
        _enemy.EnemyStats.INT = 36;
        _enemy.EnemyStats.DEX = 39;
        _enemy.EnemyStats.VIT = 42;
        _enemy.EnemyStats.LUCK = 36;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 200,
        P_ATK : 75,
        M_ATK : 75,
        P_DEF : 120,
        M_DEF : 120,
        ACCURACY : 120,
        DODGE : 80,
        CRIT : 20,
        CRIT_MULTIPLIER : 200,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.VOID;
        _enemy.EnemyElementalStats.ElementalAtk.VOID_ATK = 240;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 960,
        COLD_DEF : 960,
        EARTH_DEF : 960,
        LIGHTNING_DEF : 960,
        DARK_DEF : 960,
        HOLY_DEF : 960,
        VOID_DEF : 0
        });
    }
    //176-200 Physical

}
