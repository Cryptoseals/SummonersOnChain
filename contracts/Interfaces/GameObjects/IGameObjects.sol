pragma solidity ^0.8.0;

library GameObjects {

    enum Element {FIRE, WATER, EARTH, DARK, LIGHT, VOID}

    enum Class {
        Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest
    }

    enum ItemType {
        WEAPON, ARMOR, MISC
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

    struct Elixir {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
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

    struct Shield {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
    }


    struct Pet {
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
