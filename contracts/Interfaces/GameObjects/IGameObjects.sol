pragma solidity ^0.8.0;

library GameObjects {
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

    enum Class {
        Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest
    }

    enum ItemType {
        WEAPON,
        OFFHAND,
        HELMET,
        ARMOR,
        BOOTS,
        AMULET,
        RING,
        EARRING,
        BELT,
        ARTIFACT,
        ELIXIR,
        MOUNT,
        FISHING_ROD,
        MISC,
        MISC2,
        MISC3
    }

    enum StatsEnum {
        STR, AGI, INT, DEX, VIT, LUCK
    }

    struct BattleStats {
        uint DPS;
        uint HIT_CHANCE;
        uint DODGE_CHANCE;
        uint CRIT_CHANCE;
    }

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

    struct SummonerStats {
        Stats Stats;
        GeneratedStats GeneratedStats;
        ElementalStats ElementalStats;
    }

    struct ItemRequirement {
        uint level;
        Stats statRequirement;
        Class[] classRequirement;
    }

    struct ItemMetadata {
        ItemType baseType;
        uint id;
        string name;
        string description;
        bool upgradable;
    }

    struct ItemNFTMetadata {
        address creator;
        uint created;
    }

    struct Artifact {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;
        Element element;
    }

    struct EquippedArtifact {
        uint artifactType;
        uint artifactTier;
        uint tokenId;
    }

    struct Elixir {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;
    }

    struct ConsumedElixir {
        uint elixirType;
        uint elixirTier;
        uint deadline;
    }

    struct Helmet {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }

    struct Armor {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }

    struct Boots {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }


    struct Weapon {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;
        Element damageType;
    }


    struct OffHand {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }

    struct Ring {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }

    struct Amulet {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }

    struct Earring {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }

    struct Belt {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }


    struct Companion {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }

    struct EquipableItem {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }

    struct SummonedCompanion {
        address companionAddress;
        uint companionId;
    }

    struct Seal {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }


    struct Mount {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;

    }

    struct MiscItem {
        ItemMetadata metadata;
    }

    struct ElixirRecipe {
        uint id;
        uint[] requiredMiscItemIDs;
    }
}
