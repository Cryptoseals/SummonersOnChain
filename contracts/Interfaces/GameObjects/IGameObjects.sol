pragma solidity ^0.8.0;

library GameObjects {

    enum Element {FIRE, WATER, EARTH, DARK, LIGHT, VOID}

    enum Class {
        Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest
    }

    enum ItemType {
        HELMET, ARMOR, WEAPON, SHIELD, MISC
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
        uint created;
        address createdBy;
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
    }

    struct Elixir {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }

    struct ConsumedElixir {
        uint artifactType;
        uint artifactTier;
        uint deadline;
    }

    struct Helmet {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }

    struct EquippedHelmet {
        uint helmetId;
        uint helmetTier;
    }

    struct Armor {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }

    struct EquippedArmor {
        uint armorId;
        uint armorTier;
    }

    struct Boots {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }

    struct EquippedBoots {
        uint bootsId;
        uint bootsTier;
    }

    struct Weapon {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }

    struct EquippedWeapon {
        uint weaponId;
        uint weaponTier;
    }

    struct Shield {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }

    struct EquippedShield {
        uint shieldId;
        uint shieldTier;
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

    struct EquippedSeal {
        uint sealId;
    }

    struct Mount {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }

    struct EquippedMount {
        uint mountId;
        uint mountTier;
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
