import "../Interfaces/GameObjects/IMonster.sol";
pragma solidity ^0.8.0;

contract CodexEnemiesEarth {
    function enemy(uint256 _id, uint256 _lvl)
    public
    pure
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return EarthElemental();
        } else if (_id == 2) {
            return Ysoki();
        } else if (_id == 3) {
            return Viper();
        } else if (_id == 4) {
            return Naga();
        } else if (_id == 5) {
            return Zombie();
        } else if (_id == 6) {
            return Golem();
        } else if (_id == 7) {
            return Ogre();
        } else if (_id == 8) {
            return Ape();
        } else if (_id == 9) {
            return JungleTendril();
        } else if (_id == 10) {
            return GiantWorm();
        } else if (_id == 11) {
            return NightmareWine();
        } else if (_id == 12) {
            return Athach();
        } else if (_id == 13) {
            return GraveKeeper();
        } else if (_id == 14) {
            return Arrowhawk();
        } else if (_id == 15) {
            return Shai();
        } else if (_id == 16) {
            return Basilisk();
        } else if (_id == 17) {
            return LamiaQueen();
        } else if (_id == 18) {
            return CentaurChampion();
        } else if (_id == 19) {
            return JungleTroll();
        } else if (_id == 20) {
            return Koranok();
        } else if (_id == 21) {
            return Ankheg();
        } else if (_id == 22) {
            return Melandriel();
        }
        revert();
    }

    //1-25 Earth
    function EarthElemental() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Earth Elemental";


        _enemy.EnemyStats.STR = 20;
        _enemy.EnemyStats.AGI = 10;
        _enemy.EnemyStats.INT = 10;
        _enemy.EnemyStats.DEX = 10;
        _enemy.EnemyStats.VIT = 30;
        _enemy.EnemyStats.LUCK = 10;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 100,
        P_ATK : 30,
        M_ATK : 30,
        P_DEF : 100,
        M_DEF : 100,
        ACCURACY : 50,
        DODGE : 10,
        CRIT : 1,
        CRIT_MULTIPLIER : 250,
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 200;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 200,
        COLD_DEF : 400,
        EARTH_DEF : 800,
        LIGHTNING_DEF : 400,
        DARK_DEF : 400,
        HOLY_DEF : 400,
        VOID_DEF : 0
        });
    }
    function Ysoki() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ysoki";

        _enemy.EnemyStats.STR = 30;
        _enemy.EnemyStats.AGI = 10;
        _enemy.EnemyStats.INT = 10;
        _enemy.EnemyStats.DEX = 10;
        _enemy.EnemyStats.VIT = 40;
        _enemy.EnemyStats.LUCK = 20;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 150,
        P_ATK : 50,
        M_ATK : 50,
        P_DEF : 120,
        M_DEF : 120,
        ACCURACY : 70,
        DODGE : 20,
        CRIT : 1,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 200;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 240,
        COLD_DEF : 480,
        EARTH_DEF : 960,
        LIGHTNING_DEF : 480,
        DARK_DEF : 480,
        HOLY_DEF : 480,
        VOID_DEF : 0
        });
    }
    function Viper() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Viper";

        _enemy.EnemyStats.STR = 40;
        _enemy.EnemyStats.AGI = 20;
        _enemy.EnemyStats.INT = 20;
        _enemy.EnemyStats.DEX = 20;
        _enemy.EnemyStats.VIT = 50;
        _enemy.EnemyStats.LUCK = 20;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 200,
        P_ATK : 70,
        M_ATK : 70,
        P_DEF : 150,
        M_DEF : 150,
        ACCURACY : 80,
        DODGE : 40,
        CRIT : 2,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 240;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 300,
        COLD_DEF : 600,
        EARTH_DEF : 1200,
        LIGHTNING_DEF : 600,
        DARK_DEF : 600,
        HOLY_DEF : 600,
        VOID_DEF : 0
        });
    }
    function Naga() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Naga";

        _enemy.EnemyStats.STR = 50;
        _enemy.EnemyStats.AGI = 30;
        _enemy.EnemyStats.INT = 30;
        _enemy.EnemyStats.DEX = 30;
        _enemy.EnemyStats.VIT = 40;
        _enemy.EnemyStats.LUCK = 30;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 250,
        P_ATK : 90,
        M_ATK : 90,
        P_DEF : 180,
        M_DEF : 180,
        ACCURACY : 120,
        DODGE : 80,
        CRIT : 2,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 360;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 360,
        COLD_DEF : 720,
        EARTH_DEF : 1440,
        LIGHTNING_DEF : 720,
        DARK_DEF : 720,
        HOLY_DEF : 720,
        VOID_DEF : 0
        });
    }
    function Zombie() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Zombie";

        _enemy.EnemyStats.STR = 60;
        _enemy.EnemyStats.AGI = 40;
        _enemy.EnemyStats.INT = 40;
        _enemy.EnemyStats.DEX = 20;
        _enemy.EnemyStats.VIT = 60;
        _enemy.EnemyStats.LUCK = 20;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 300,
        P_ATK : 100,
        M_ATK : 100,
        P_DEF : 210,
        M_DEF : 210,
        ACCURACY : 160,
        DODGE : 120,
        CRIT : 4,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 420;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 420,
        COLD_DEF : 840,
        EARTH_DEF : 1680,
        LIGHTNING_DEF : 840,
        DARK_DEF : 840,
        HOLY_DEF : 840,
        VOID_DEF : 0
        });
    }
    function Golem() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Golem";

        _enemy.EnemyStats.STR = 60;
        _enemy.EnemyStats.AGI = 40;
        _enemy.EnemyStats.INT = 40;
        _enemy.EnemyStats.DEX = 40;
        _enemy.EnemyStats.VIT = 50;
        _enemy.EnemyStats.LUCK = 40;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 350,
        P_ATK : 120,
        M_ATK : 120,
        P_DEF : 240,
        M_DEF : 240,
        ACCURACY : 200,
        DODGE : 160,
        CRIT : 4,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 480;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 480,
        COLD_DEF : 960,
        EARTH_DEF : 1920,
        LIGHTNING_DEF : 960,
        DARK_DEF : 960,
        HOLY_DEF : 960,
        VOID_DEF : 0
        });
    }
    function Ogre() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ogre";

        _enemy.EnemyStats.STR = 70;
        _enemy.EnemyStats.AGI = 50;
        _enemy.EnemyStats.INT = 50;
        _enemy.EnemyStats.DEX = 50;
        _enemy.EnemyStats.VIT = 60;
        _enemy.EnemyStats.LUCK = 40;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 400,
        P_ATK : 140,
        M_ATK : 140,
        P_DEF : 280,
        M_DEF : 280,
        ACCURACY : 240,
        DODGE : 200,
        CRIT : 5,
        CRIT_MULTIPLIER : 500,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 520;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 520,
        COLD_DEF : 1040,
        EARTH_DEF : 2080,
        LIGHTNING_DEF : 1040,
        DARK_DEF : 1040,
        HOLY_DEF : 1040,
        VOID_DEF : 0
        });
    }
    function Ape() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ape";

        _enemy.EnemyStats.STR = 80;
        _enemy.EnemyStats.AGI = 50;
        _enemy.EnemyStats.INT = 50;
        _enemy.EnemyStats.DEX = 60;
        _enemy.EnemyStats.VIT = 60;
        _enemy.EnemyStats.LUCK = 50;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 450,
        P_ATK : 160,
        M_ATK : 160,
        P_DEF : 320,
        M_DEF : 320,
        ACCURACY : 280,
        DODGE : 240,
        CRIT : 5,
        CRIT_MULTIPLIER : 500,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 640;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 640,
        COLD_DEF : 1200,
        EARTH_DEF : 2400,
        LIGHTNING_DEF : 1200,
        DARK_DEF : 1200,
        HOLY_DEF : 1200,
        VOID_DEF : 0
        });
    }
    function JungleTendril() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Jungle Tendril";

        _enemy.EnemyStats.STR = 90;
        _enemy.EnemyStats.AGI = 60;
        _enemy.EnemyStats.INT = 60;
        _enemy.EnemyStats.DEX = 70;
        _enemy.EnemyStats.VIT = 80;
        _enemy.EnemyStats.LUCK = 50;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 500,
        P_ATK : 180,
        M_ATK : 180,
        P_DEF : 360,
        M_DEF : 360,
        ACCURACY : 320,
        DODGE : 280,
        CRIT : 5,
        CRIT_MULTIPLIER : 500,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 720;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 720,
        COLD_DEF : 1440,
        EARTH_DEF : 2880,
        LIGHTNING_DEF : 1440,
        DARK_DEF : 1440,
        HOLY_DEF : 1440,
        VOID_DEF : 0
        });
    }
    function GiantWorm() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Giant Worm";

        _enemy.EnemyStats.STR = 100;
        _enemy.EnemyStats.AGI = 70;
        _enemy.EnemyStats.INT = 70;
        _enemy.EnemyStats.DEX = 80;
        _enemy.EnemyStats.VIT = 90;
        _enemy.EnemyStats.LUCK = 60;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 550,
        P_ATK : 200,
        M_ATK : 200,
        P_DEF : 440,
        M_DEF : 440,
        ACCURACY : 360,
        DODGE : 320,
        CRIT : 6,
        CRIT_MULTIPLIER : 600,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 880;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 880,
        COLD_DEF : 1760,
        EARTH_DEF : 3400,
        LIGHTNING_DEF : 1760,
        DARK_DEF : 1760,
        HOLY_DEF : 1760,
        VOID_DEF : 0
        });
    }
    function NightmareWine() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Nightmare Wine";

        _enemy.EnemyStats.STR = 110;
        _enemy.EnemyStats.AGI = 80;
        _enemy.EnemyStats.INT = 80;
        _enemy.EnemyStats.DEX = 80;
        _enemy.EnemyStats.VIT = 100;
        _enemy.EnemyStats.LUCK = 70;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 600,
        P_ATK : 240,
        M_ATK : 240,
        P_DEF : 480,
        M_DEF : 480,
        ACCURACY : 400,
        DODGE : 360,
        CRIT : 8,
        CRIT_MULTIPLIER : 700,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 960;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 960,
        COLD_DEF : 1920,
        EARTH_DEF : 3840,
        LIGHTNING_DEF : 1920,
        DARK_DEF : 1920,
        HOLY_DEF : 1920,
        VOID_DEF : 0
        });
    }
    function Athach() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Athach";

        _enemy.EnemyStats.STR = 120;
        _enemy.EnemyStats.AGI = 90;
        _enemy.EnemyStats.INT = 90;
        _enemy.EnemyStats.DEX = 90;
        _enemy.EnemyStats.VIT = 110;
        _enemy.EnemyStats.LUCK = 80;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 650,
        P_ATK : 280,
        M_ATK : 280,
        P_DEF : 520,
        M_DEF : 520,
        ACCURACY : 440,
        DODGE : 400,
        CRIT : 8,
        CRIT_MULTIPLIER : 700,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1040;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1040,
        COLD_DEF : 2080,
        EARTH_DEF : 4160,
        LIGHTNING_DEF : 2080,
        DARK_DEF : 2080,
        HOLY_DEF : 2080,
        VOID_DEF : 0
        });
    }
    function GraveKeeper() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Grave Keeper";

        _enemy.EnemyStats.STR = 130;
        _enemy.EnemyStats.AGI = 110;
        _enemy.EnemyStats.INT = 110;
        _enemy.EnemyStats.DEX = 110;
        _enemy.EnemyStats.VIT = 150;
        _enemy.EnemyStats.LUCK = 80;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 700,
        P_ATK : 320,
        M_ATK : 320,
        P_DEF : 580,
        M_DEF : 580,
        ACCURACY : 480,
        DODGE : 440,
        CRIT : 9,
        CRIT_MULTIPLIER : 800,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1160;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1160,
        COLD_DEF : 2320,
        EARTH_DEF : 4640,
        LIGHTNING_DEF : 2320,
        DARK_DEF : 2320,
        HOLY_DEF : 2320,
        VOID_DEF : 0
        });
    }
    function Arrowhawk() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Arrowhawk";

        _enemy.EnemyStats.STR = 150;
        _enemy.EnemyStats.AGI = 120;
        _enemy.EnemyStats.INT = 120;
        _enemy.EnemyStats.DEX = 120;
        _enemy.EnemyStats.VIT = 140;
        _enemy.EnemyStats.LUCK = 120;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 750,
        P_ATK : 360,
        M_ATK : 360,
        P_DEF : 620,
        M_DEF : 620,
        ACCURACY : 520,
        DODGE : 480,
        CRIT : 9,
        CRIT_MULTIPLIER : 900,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1240;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1240,
        COLD_DEF : 2480,
        EARTH_DEF : 4960,
        LIGHTNING_DEF : 2480,
        DARK_DEF : 2480,
        HOLY_DEF : 2480,
        VOID_DEF : 0
        });
    }
    function Shai() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Shai";

        _enemy.EnemyStats.STR = 160;
        _enemy.EnemyStats.AGI = 140;
        _enemy.EnemyStats.INT = 120;
        _enemy.EnemyStats.DEX = 80;
        _enemy.EnemyStats.VIT = 110;
        _enemy.EnemyStats.LUCK = 90;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 800,
        P_ATK : 400,
        M_ATK : 400,
        P_DEF : 660,
        M_DEF : 660,
        ACCURACY : 560,
        DODGE : 520,
        CRIT : 10,
        CRIT_MULTIPLIER : 1000,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1320;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1320,
        COLD_DEF : 2640,
        EARTH_DEF : 5280,
        LIGHTNING_DEF : 2640,
        DARK_DEF : 2640,
        HOLY_DEF : 2640,
        VOID_DEF : 0
        });
    }
    function Basilisk() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Basilisk";
        _enemy.EnemyStats.STR = 120;
        _enemy.EnemyStats.AGI = 140;
        _enemy.EnemyStats.INT = 130;
        _enemy.EnemyStats.DEX = 130;
        _enemy.EnemyStats.VIT = 140;
        _enemy.EnemyStats.LUCK = 150;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 850,
        P_ATK : 420,
        M_ATK : 420,
        P_DEF : 700,
        M_DEF : 700,
        ACCURACY : 600,
        DODGE : 560,
        CRIT : 10,
        CRIT_MULTIPLIER : 1000,
        INFUSION : 1
        });


        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1400;
        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1400,
        COLD_DEF : 2800,
        EARTH_DEF : 5600,
        LIGHTNING_DEF : 2800,
        DARK_DEF : 2800,
        HOLY_DEF : 2800,
        VOID_DEF : 0
        });
    }
    function LamiaQueen() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Lamia Queen";
        _enemy.EnemyStats.STR = 140;
        _enemy.EnemyStats.AGI = 140;
        _enemy.EnemyStats.INT = 150;
        _enemy.EnemyStats.DEX = 160;
        _enemy.EnemyStats.VIT = 180;
        _enemy.EnemyStats.LUCK = 190;
        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 900,
        P_ATK : 460,
        M_ATK : 460,
        P_DEF : 740,
        M_DEF : 740,
        ACCURACY : 640,
        DODGE : 600,
        CRIT : 12,
        CRIT_MULTIPLIER : 1200,
        INFUSION : 1
        });
        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1480;
        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1480,
        COLD_DEF : 2960,
        EARTH_DEF : 5920,
        LIGHTNING_DEF : 2960,
        DARK_DEF : 2960,
        HOLY_DEF : 2960,
        VOID_DEF : 0
        });
    }
    function CentaurChampion() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Centaur Champion";
        _enemy.EnemyStats.STR = 160;
        _enemy.EnemyStats.AGI = 150;
        _enemy.EnemyStats.INT = 230;
        _enemy.EnemyStats.DEX = 180;
        _enemy.EnemyStats.VIT = 210;
        _enemy.EnemyStats.LUCK = 210;
        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 950,
        P_ATK : 480,
        M_ATK : 480,
        P_DEF : 780,
        M_DEF : 780,
        ACCURACY : 680,
        DODGE : 640,
        CRIT : 12,
        CRIT_MULTIPLIER : 1200,
        INFUSION : 1
        });
        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1560;
        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1560,
        COLD_DEF : 3120,
        EARTH_DEF : 6240,
        LIGHTNING_DEF : 3120,
        DARK_DEF : 3120,
        HOLY_DEF : 3120,
        VOID_DEF : 0
        });
    }
    function JungleTroll() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Jungle Troll";
        _enemy.EnemyStats.STR = 180;
        _enemy.EnemyStats.AGI = 170;
        _enemy.EnemyStats.INT = 80;
        _enemy.EnemyStats.DEX = 190;
        _enemy.EnemyStats.VIT = 230;
        _enemy.EnemyStats.LUCK = 240;
        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 1000,
        P_ATK : 500,
        M_ATK : 500,
        P_DEF : 820,
        M_DEF : 820,
        ACCURACY : 720,
        DODGE : 680,
        CRIT : 14,
        CRIT_MULTIPLIER : 1300,
        INFUSION : 1
        });
        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1640;
        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1640,
        COLD_DEF : 3280,
        EARTH_DEF : 6560,
        LIGHTNING_DEF : 3280,
        DARK_DEF : 3280,
        HOLY_DEF : 3280,
        VOID_DEF : 0
        });
    }
    function Koranok() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Koranok";
        _enemy.EnemyStats.STR = 200;
        _enemy.EnemyStats.AGI = 180;
        _enemy.EnemyStats.INT = 250;
        _enemy.EnemyStats.DEX = 200;
        _enemy.EnemyStats.VIT = 250;
        _enemy.EnemyStats.LUCK = 260;
        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 1250,
        P_ATK : 540,
        M_ATK : 540,
        P_DEF : 860,
        M_DEF : 860,
        ACCURACY : 760,
        DODGE : 720,
        CRIT : 14,
        CRIT_MULTIPLIER : 1300,
        INFUSION : 1
        });
        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1720;
        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1640,
        COLD_DEF : 3440,
        EARTH_DEF : 6880,
        LIGHTNING_DEF : 3440,
        DARK_DEF : 3440,
        HOLY_DEF : 3440,
        VOID_DEF : 0
        });
    }
    function Ankheg() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ankheg";
        _enemy.EnemyStats.STR = 240;
        _enemy.EnemyStats.AGI = 220;
        _enemy.EnemyStats.INT = 300;
        _enemy.EnemyStats.DEX = 240;
        _enemy.EnemyStats.VIT = 300;
        _enemy.EnemyStats.LUCK = 290;
        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 1500,
        P_ATK : 580,
        M_ATK : 580,
        P_DEF : 900,
        M_DEF : 900,
        ACCURACY : 800,
        DODGE : 760,
        CRIT : 15,
        CRIT_MULTIPLIER : 1500,
        INFUSION : 1
        });
        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 1800;
        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1800,
        COLD_DEF : 3600,
        EARTH_DEF : 6880,
        LIGHTNING_DEF : 3600,
        DARK_DEF : 3600,
        HOLY_DEF : 3600,
        VOID_DEF : 0
        });
    }
    function Melandriel() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Melandriel";
        _enemy.EnemyStats.STR = 320;
        _enemy.EnemyStats.AGI = 330;
        _enemy.EnemyStats.INT = 360;
        _enemy.EnemyStats.DEX = 390;
        _enemy.EnemyStats.VIT = 420;
        _enemy.EnemyStats.LUCK = 360;
        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 2000,
        P_ATK : 750,
        M_ATK : 750,
        P_DEF : 1200,
        M_DEF : 1200,
        ACCURACY : 1200,
        DODGE : 800,
        CRIT : 20,
        CRIT_MULTIPLIER : 2000,
        INFUSION : 1
        });
        _enemy.damageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.EARTH;
        _enemy.EnemyElementalStats.ElementalAtk.EARTH_ATK = 2400;
        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 2400,
        COLD_DEF : 4800,
        EARTH_DEF : 9600,
        LIGHTNING_DEF : 4800,
        DARK_DEF : 4800,
        HOLY_DEF : 4800,
        VOID_DEF : 0
        });
    }

}
