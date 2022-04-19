import "../../Interfaces/GameObjects/IMonster.sol";
pragma solidity ^0.8.0;

contract CodexEnemiesArcane {
    function enemy(uint256 _id)
    public
    pure
    returns (IMonster.Monster memory)
    {
        if (_id == 1) {
            return WizardApprentice();
        } else if (_id == 2) {
            return Hag();
        } else if (_id == 3) {
            return Witch();
        } else if (_id == 4) {
            return Imp();
        } else if (_id == 5) {
            return EvilWizard();
        } else if (_id == 6) {
            return Arcanist();
        } else if (_id == 7) {
            return ArcaneMist();
        } else if (_id == 8) {
            return DeathKnight();
        } else if (_id == 9) {
            return Fiend();
        } else if (_id == 10) {
            return MummyKnight();
        } else if (_id == 11) {
            return AberrantsAncientBook();
        } else if (_id == 12) {
            return StarSpawns();
        } else if (_id == 13) {
            return ArcaneWyvern();
        } else if (_id == 14) {
            return AncientRune();
        } else if (_id == 15) {
            return MummyLord();
        } else if (_id == 16) {
            return EternalWatcher();
        } else if (_id == 17) {
            return CorruptedWisp();
        } else if (_id == 18) {
            return MasterArcanist();
        } else if (_id == 19) {
            return ArcaneLich();
        } else if (_id == 20) {
            return Soulstealer();
        } else if (_id == 21) {
            return SpellWarden();
        } else if (_id == 22) {
            return EyeOfCosmos();
        }
        revert();
    }


    // ARCANEs
    function WizardApprentice() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Wizard Apprentice";


        _enemy.EnemyStats.STR = 10;
        _enemy.EnemyStats.AGI = 10;
        _enemy.EnemyStats.INT = 40;
        _enemy.EnemyStats.DEX = 10;
        _enemy.EnemyStats.VIT = 20;
        _enemy.EnemyStats.LUCK = 10;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 100,
        P_ATK : 30,
        M_ATK : 50,
        P_DEF : 80,
        M_DEF : 120,
        ACCURACY : 50,
        DODGE : 10,
        CRIT : 1,
        CRIT_MULTIPLIER : 250,
        INFUSION : 0
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 200,
        COLD_DEF : 200,
        EARTH_DEF : 200,
        LIGHTNING_DEF : 200,
        DARK_DEF : 200,
        HOLY_DEF : 200,
        VOID_DEF : 0
        });
    }
    function Hag() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Hag";


        _enemy.EnemyStats.STR = 10;
        _enemy.EnemyStats.AGI = 10;
        _enemy.EnemyStats.INT = 50;
        _enemy.EnemyStats.DEX = 10;
        _enemy.EnemyStats.VIT = 30;
        _enemy.EnemyStats.LUCK = 20;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 150,
        P_ATK : 50,
        M_ATK : 70,
        P_DEF : 100,
        M_DEF : 140,
        ACCURACY : 70,
        DODGE : 20,
        CRIT : 1,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

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
    function Witch() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Witch";


        _enemy.EnemyStats.STR = 20;
        _enemy.EnemyStats.AGI = 20;
        _enemy.EnemyStats.INT = 50;
        _enemy.EnemyStats.DEX = 10;
        _enemy.EnemyStats.VIT = 40;
        _enemy.EnemyStats.LUCK = 20;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 200,
        P_ATK : 70,
        M_ATK : 90,
        P_DEF : 120,
        M_DEF : 160,
        ACCURACY : 80,
        DODGE : 40,
        CRIT : 2,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 300,
        COLD_DEF : 300,
        EARTH_DEF : 300,
        LIGHTNING_DEF : 300,
        DARK_DEF : 300,
        HOLY_DEF : 300,
        VOID_DEF : 0
        });
    }
    function Imp() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Imp";


        _enemy.EnemyStats.STR = 30;
        _enemy.EnemyStats.AGI = 30;
        _enemy.EnemyStats.INT = 70;
        _enemy.EnemyStats.DEX = 30;
        _enemy.EnemyStats.VIT = 50;
        _enemy.EnemyStats.LUCK = 30;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 250,
        P_ATK : 90,
        M_ATK : 110,
        P_DEF : 160,
        M_DEF : 180,
        ACCURACY : 120,
        DODGE : 80,
        CRIT : 2,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 360,
        COLD_DEF : 360,
        EARTH_DEF : 360,
        LIGHTNING_DEF : 306,
        DARK_DEF : 360,
        HOLY_DEF : 360,
        VOID_DEF : 0
        });
    }
    function EvilWizard() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Evil Wizard";


        _enemy.EnemyStats.STR = 40;
        _enemy.EnemyStats.AGI = 40;
        _enemy.EnemyStats.INT = 80;
        _enemy.EnemyStats.DEX = 20;
        _enemy.EnemyStats.VIT = 60;
        _enemy.EnemyStats.LUCK = 20;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 300,
        P_ATK : 100,
        M_ATK : 120,
        P_DEF : 180,
        M_DEF : 230,
        ACCURACY : 160,
        DODGE : 120,
        CRIT : 4,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 400,
        COLD_DEF : 400,
        EARTH_DEF : 400,
        LIGHTNING_DEF : 400,
        DARK_DEF : 400,
        HOLY_DEF : 400,
        VOID_DEF : 0
        });
    }
    function Arcanist() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Arcanist";


        _enemy.EnemyStats.STR = 40;
        _enemy.EnemyStats.AGI = 40;
        _enemy.EnemyStats.INT = 90;
        _enemy.EnemyStats.DEX = 40;
        _enemy.EnemyStats.VIT = 50;
        _enemy.EnemyStats.LUCK = 40;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 350,
        P_ATK : 120,
        M_ATK : 130,
        P_DEF : 200,
        M_DEF : 250,
        ACCURACY : 200,
        DODGE : 160,
        CRIT : 4,
        CRIT_MULTIPLIER : 250,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 480,
        COLD_DEF : 480,
        EARTH_DEF : 480,
        LIGHTNING_DEF : 480,
        DARK_DEF : 480,
        HOLY_DEF : 480,
        VOID_DEF : 0
        });
    }
    function ArcaneMist() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Arcane Mist";


        _enemy.EnemyStats.STR = 50;
        _enemy.EnemyStats.AGI = 50;
        _enemy.EnemyStats.INT = 100;
        _enemy.EnemyStats.DEX = 50;
        _enemy.EnemyStats.VIT = 60;
        _enemy.EnemyStats.LUCK = 40;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 400,
        P_ATK : 140,
        M_ATK : 150,
        P_DEF : 240,
        M_DEF : 280,
        ACCURACY : 240,
        DODGE : 200,
        CRIT : 5,
        CRIT_MULTIPLIER : 500,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 520,
        COLD_DEF : 520,
        EARTH_DEF : 520,
        LIGHTNING_DEF : 520,
        DARK_DEF : 520,
        HOLY_DEF : 520,
        VOID_DEF : 0
        });
    }
    function DeathKnight() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Death Knight";


        _enemy.EnemyStats.STR = 50;
        _enemy.EnemyStats.AGI = 50;
        _enemy.EnemyStats.INT = 110;
        _enemy.EnemyStats.DEX = 60;
        _enemy.EnemyStats.VIT = 60;
        _enemy.EnemyStats.LUCK = 50;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 450,
        P_ATK : 160,
        M_ATK : 170,
        P_DEF : 280,
        M_DEF : 340,
        ACCURACY : 280,
        DODGE : 240,
        CRIT : 5,
        CRIT_MULTIPLIER : 500,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 640,
        COLD_DEF : 640,
        EARTH_DEF : 640,
        LIGHTNING_DEF : 640,
        DARK_DEF : 640,
        HOLY_DEF : 640,
        VOID_DEF : 0
        });
    }
    function Fiend() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Fiend";


        _enemy.EnemyStats.STR = 60;
        _enemy.EnemyStats.AGI = 60;
        _enemy.EnemyStats.INT = 120;
        _enemy.EnemyStats.DEX = 70;
        _enemy.EnemyStats.VIT = 80;
        _enemy.EnemyStats.LUCK = 50;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 500,
        P_ATK : 180,
        M_ATK : 190,
        P_DEF : 320,
        M_DEF : 380,
        ACCURACY : 320,
        DODGE : 280,
        CRIT : 6,
        CRIT_MULTIPLIER : 600,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

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
    function MummyKnight() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Mummy Knight";


        _enemy.EnemyStats.STR = 70;
        _enemy.EnemyStats.AGI = 70;
        _enemy.EnemyStats.INT = 130;
        _enemy.EnemyStats.DEX = 130;
        _enemy.EnemyStats.VIT = 90;
        _enemy.EnemyStats.LUCK = 60;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 550,
        P_ATK : 200,
        M_ATK : 230,
        P_DEF : 360,
        M_DEF : 460,
        ACCURACY : 360,
        DODGE : 320,
        CRIT : 6,
        CRIT_MULTIPLIER : 600,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 880,
        COLD_DEF : 880,
        EARTH_DEF : 880,
        LIGHTNING_DEF : 880,
        DARK_DEF : 880,
        HOLY_DEF : 880,
        VOID_DEF : 0
        });
    }
    function AberrantsAncientBook() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Aberrant's Ancient Book";


        _enemy.EnemyStats.STR = 80;
        _enemy.EnemyStats.AGI = 80;
        _enemy.EnemyStats.INT = 140;
        _enemy.EnemyStats.DEX = 80;
        _enemy.EnemyStats.VIT = 100;
        _enemy.EnemyStats.LUCK = 70;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 600,
        P_ATK : 240,
        M_ATK : 250,
        P_DEF : 400,
        M_DEF : 500,
        ACCURACY : 400,
        DODGE : 360,
        CRIT : 8,
        CRIT_MULTIPLIER : 700,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

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
    function StarSpawns() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Star Spawns";


        _enemy.EnemyStats.STR = 90;
        _enemy.EnemyStats.AGI = 90;
        _enemy.EnemyStats.INT = 150;
        _enemy.EnemyStats.DEX = 90;
        _enemy.EnemyStats.VIT = 110;
        _enemy.EnemyStats.LUCK = 80;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 650,
        P_ATK : 280,
        M_ATK : 290,
        P_DEF : 440,
        M_DEF : 540,
        ACCURACY : 440,
        DODGE : 400,
        CRIT : 8,
        CRIT_MULTIPLIER : 700,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1040,
        COLD_DEF : 1040,
        EARTH_DEF : 1040,
        LIGHTNING_DEF : 1040,
        DARK_DEF : 1040,
        HOLY_DEF : 1040,
        VOID_DEF : 0
        });
    }
    function ArcaneWyvern() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Arcane Wyvern";


        _enemy.EnemyStats.STR = 110;
        _enemy.EnemyStats.AGI = 110;
        _enemy.EnemyStats.INT = 160;
        _enemy.EnemyStats.DEX = 110;
        _enemy.EnemyStats.VIT = 150;
        _enemy.EnemyStats.LUCK = 80;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 700,
        P_ATK : 320,
        M_ATK : 330,
        P_DEF : 480,
        M_DEF : 600,
        ACCURACY : 480,
        DODGE : 440,
        CRIT : 9,
        CRIT_MULTIPLIER : 900,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1160,
        COLD_DEF : 1160,
        EARTH_DEF : 1160,
        LIGHTNING_DEF : 1160,
        DARK_DEF : 1160,
        HOLY_DEF : 1160,
        VOID_DEF : 0
        });
    }
    function AncientRune() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Ancient Rune";


        _enemy.EnemyStats.STR = 120;
        _enemy.EnemyStats.AGI = 120;
        _enemy.EnemyStats.INT = 180;
        _enemy.EnemyStats.DEX = 120;
        _enemy.EnemyStats.VIT = 140;
        _enemy.EnemyStats.LUCK = 120;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 750,
        P_ATK : 360,
        M_ATK : 370,
        P_DEF : 520,
        M_DEF : 660,
        ACCURACY : 520,
        DODGE : 480,
        CRIT : 9,
        CRIT_MULTIPLIER : 900,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1240,
        COLD_DEF : 1240,
        EARTH_DEF : 1240,
        LIGHTNING_DEF : 1240,
        DARK_DEF : 1240,
        HOLY_DEF : 1240,
        VOID_DEF : 0
        });
    }
    function MummyLord() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Mummy Lord";


        _enemy.EnemyStats.STR = 130;
        _enemy.EnemyStats.AGI = 140;
        _enemy.EnemyStats.INT = 200;
        _enemy.EnemyStats.DEX = 80;
        _enemy.EnemyStats.VIT = 110;
        _enemy.EnemyStats.LUCK = 90;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 800,
        P_ATK : 400,
        M_ATK : 420,
        P_DEF : 580,
        M_DEF : 680,
        ACCURACY : 560,
        DODGE : 520,
        CRIT : 10,
        CRIT_MULTIPLIER : 1000,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1320,
        COLD_DEF : 1320,
        EARTH_DEF : 1320,
        LIGHTNING_DEF : 1320,
        DARK_DEF : 1320,
        HOLY_DEF : 1320,
        VOID_DEF : 0
        });
    }
    function EternalWatcher() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Eternal Watcher";


        _enemy.EnemyStats.STR = 140;
        _enemy.EnemyStats.AGI = 140;
        _enemy.EnemyStats.INT = 220;
        _enemy.EnemyStats.DEX = 130;
        _enemy.EnemyStats.VIT = 140;
        _enemy.EnemyStats.LUCK = 150;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 850,
        P_ATK : 420,
        M_ATK : 440,
        P_DEF : 640,
        M_DEF : 720,
        ACCURACY : 600,
        DODGE : 560,
        CRIT : 10,
        CRIT_MULTIPLIER : 1000,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1400,
        COLD_DEF : 1400,
        EARTH_DEF : 1400,
        LIGHTNING_DEF : 1400,
        DARK_DEF : 1400,
        HOLY_DEF : 1400,
        VOID_DEF : 0
        });
    }
    function CorruptedWisp() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Corrupted Wisp";


        _enemy.EnemyStats.STR = 150;
        _enemy.EnemyStats.AGI = 140;
        _enemy.EnemyStats.INT = 240;
        _enemy.EnemyStats.DEX = 160;
        _enemy.EnemyStats.VIT = 180;
        _enemy.EnemyStats.LUCK = 190;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 900,
        P_ATK : 460,
        M_ATK : 480,
        P_DEF : 700,
        M_DEF : 760,
        ACCURACY : 640,
        DODGE : 600,
        CRIT : 12,
        CRIT_MULTIPLIER : 1200,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1480,
        COLD_DEF : 1480,
        EARTH_DEF : 1480,
        LIGHTNING_DEF : 1480,
        DARK_DEF : 1480,
        HOLY_DEF : 1480,
        VOID_DEF : 0
        });
    }
    function MasterArcanist() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Master Arcanist";


        _enemy.EnemyStats.STR = 180;
        _enemy.EnemyStats.AGI = 150;
        _enemy.EnemyStats.INT = 250;
        _enemy.EnemyStats.DEX = 180;
        _enemy.EnemyStats.VIT = 210;
        _enemy.EnemyStats.LUCK = 210;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 950,
        P_ATK : 480,
        M_ATK : 500,
        P_DEF : 740,
        M_DEF : 800,
        ACCURACY : 640,
        DODGE : 680,
        CRIT : 12,
        CRIT_MULTIPLIER : 1200,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1560,
        COLD_DEF : 1560,
        EARTH_DEF : 1560,
        LIGHTNING_DEF : 1560,
        DARK_DEF : 1560,
        HOLY_DEF : 1560,
        VOID_DEF : 0
        });
    }
    function ArcaneLich() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Arcane Lich";


        _enemy.EnemyStats.STR = 200;
        _enemy.EnemyStats.AGI = 170;
        _enemy.EnemyStats.INT = 270;
        _enemy.EnemyStats.DEX = 190;
        _enemy.EnemyStats.VIT = 230;
        _enemy.EnemyStats.LUCK = 240;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 1000,
        P_ATK : 500,
        M_ATK : 520,
        P_DEF : 800,
        M_DEF : 840,
        ACCURACY : 720,
        DODGE : 680,
        CRIT : 14,
        CRIT_MULTIPLIER : 1300,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1640,
        COLD_DEF : 1640,
        EARTH_DEF : 1640,
        LIGHTNING_DEF : 1640,
        DARK_DEF : 1640,
        HOLY_DEF : 1640,
        VOID_DEF : 0
        });
    }
    function Soulstealer() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Soulstealer";


        _enemy.EnemyStats.STR = 240;
        _enemy.EnemyStats.AGI = 180;
        _enemy.EnemyStats.INT = 300;
        _enemy.EnemyStats.DEX = 200;
        _enemy.EnemyStats.VIT = 250;
        _enemy.EnemyStats.LUCK = 260;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 1250,
        P_ATK : 540,
        M_ATK : 540,
        P_DEF : 840,
        M_DEF : 900,
        ACCURACY : 760,
        DODGE : 720,
        CRIT : 14,
        CRIT_MULTIPLIER : 1300,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1720,
        COLD_DEF : 1720,
        EARTH_DEF : 1720,
        LIGHTNING_DEF : 1720,
        DARK_DEF : 1720,
        HOLY_DEF : 1720,
        VOID_DEF : 0
        });
    }
    function SpellWarden() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Spell Warden";


        _enemy.EnemyStats.STR = 280;
        _enemy.EnemyStats.AGI = 220;
        _enemy.EnemyStats.INT = 360;
        _enemy.EnemyStats.DEX = 240;
        _enemy.EnemyStats.VIT = 300;
        _enemy.EnemyStats.LUCK = 290;

        _enemy.EnemyGeneratedStats = IMonster.GeneratedStats({
        HP : 1500,
        P_ATK : 580,
        M_ATK : 600,
        P_DEF : 900,
        M_DEF : 950,
        ACCURACY : 800,
        DODGE : 760,
        CRIT : 15,
        CRIT_MULTIPLIER : 1500,
        INFUSION : 1
        });

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 1800,
        COLD_DEF : 1800,
        EARTH_DEF : 1800,
        LIGHTNING_DEF : 1800,
        DARK_DEF : 1800,
        HOLY_DEF : 1800,
        VOID_DEF : 0
        });
    }
    function EyeOfCosmos() public pure returns (IMonster.Monster memory _enemy) {
        _enemy.MonsterMetadata.name = "Eye of Cosmos";


        _enemy.EnemyStats.STR = 330;
        _enemy.EnemyStats.AGI = 330;
        _enemy.EnemyStats.INT = 420;
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

        _enemy.damageType = IMonster.Element.ARCANE;
        _enemy.EnemyElementalStats.SummonerDamageType = IMonster.Element.ARCANE;

        _enemy.EnemyElementalStats.ElementalDef = IMonster.ElementalDef({
        FIRE_DEF : 2400,
        COLD_DEF : 2400,
        EARTH_DEF : 2400,
        LIGHTNING_DEF : 2400,
        DARK_DEF : 2400,
        HOLY_DEF : 2400,
        VOID_DEF : 0
        });
    }
}
