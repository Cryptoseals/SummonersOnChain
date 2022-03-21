pragma solidity ^0.8.0;

library GameObjects {

    enum Element {
        NON_ELEMENTAL,
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
        HELMET, ARMOR, BOOTS, WEAPON, OFFHAND, MISC
    }

    enum StatsEnum {
        STR, AGI, INT, DEX, VIT, LUCK
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
        uint P_ATK;
        uint M_ATK;
        uint P_DEF;
        uint M_DEF;
        uint ACCURACY;
        uint DODGE;
        uint CRIT;
        uint CRIT_MULTIPLIER;
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
        ElementalAtk ElementalAtk;
        ElementalDef ElementalDef;
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
    }


    struct Armor {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
    }

    struct Boots {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
    }


    struct Weapon {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
    }


    struct OffHand {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
    }


    struct Companion {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
    }

    struct SummonedCompanion {
        address companionAddress;
        uint companionId;
    }

    struct Seal {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }


    struct Mount {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }

    struct MiscItem {
        ItemMetadata metadata;
    }

    struct ElixirRecipe {
        uint id;
        uint[] requiredMiscItemTypes;
        uint[] requiredCommonItemTypes;
    }
}
