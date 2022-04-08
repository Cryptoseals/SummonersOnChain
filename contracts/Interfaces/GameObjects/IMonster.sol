import "./IGenericMetadata.sol";
pragma solidity ^0.8.0;

interface IMonster {
    struct Stats {
        uint STR;
        uint AGI;
        uint INT;
        uint DEX;
        uint VIT;
        uint LUCK;
    }

    struct GeneratedStats {
        uint HP;
        uint P_ATK;
        uint M_ATK;
        uint P_DEF;
        uint M_DEF;
        uint ACCURACY;
        uint DODGE;
        uint CRIT;
        uint CRIT_MULTIPLIER;
        uint INFUSION;
    }

    struct ElementalStats {
        ElementalAtk ElementalAtk;
        ElementalDef ElementalDef;
        Element SummonerDamageType;
    }

    struct ElementalAtk {
        uint FIRE_ATK;
        uint COLD_ATK;
        uint EARTH_ATK;
        uint LIGHTNING_ATK;
        uint DARK_ATK;
        uint HOLY_ATK;
        uint VOID_ATK;
    }

    struct ElementalDef {
        uint FIRE_DEF;
        uint COLD_DEF;
        uint EARTH_DEF;
        uint LIGHTNING_DEF;
        uint DARK_DEF;
        uint HOLY_DEF;
        uint VOID_DEF;
    }

    enum Element {
        PHYSICAL,
        ARCANE,
        FIRE,
        COLD,
        EARTH,
        LIGHTNING,
        DARK,
        HOLY,
        VOID
    }

    struct Monster {
        IGenericMetadata.Metadata MonsterMetadata;
        Stats EnemyStats;
        GeneratedStats EnemyGeneratedStats;
        ElementalStats EnemyElementalStats;
        Element damageType;
    }
}
