pragma solidity ^0.8.0;

library GameObjects {

    enum Element {FIRE, WATER, EARTH, DARK, LIGHT, VOID}

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
        uint DPS;
        uint P_ATK;
        uint M_ATK;
        uint M_ATK;
        uint P_DEF;
        uint M_DEF;
    }

    struct ElementalAtk {
        uint FIRE_ATK;
        uint COLD_ATK;
        uint NATURE_ATK;
        uint LIGHTNING_ATK;
        uint DARK_ATK;
        uint HOLY_ATK;
        uint VOID_ATK;
    }

    struct ElementalDef {
        uint FIRE_DEF;
        uint COLD_DEF;
        uint NATURE_DEF;
        uint LIGHTNING_DEF;
        uint DARK_DEF;
        uint HOLY_DEF;
        uint VOID_DEF;
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
    }


    struct Armor {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }

    struct Boots {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }


    struct Weapon {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }


    struct OffHand {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }


    struct Companion {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
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
