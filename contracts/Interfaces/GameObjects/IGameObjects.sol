//import "./IGenericMetadata.sol";
pragma solidity ^0.8.0;

library GameObjects_Stats {


    enum StatsEnum {
        STR, AGI, INT, DEX, VIT, LUCK
    }

    struct BattleStats {
        uint TOTAL_HP;
        uint DPS;
        uint HIT_CHANCE;
        uint CRIT_CHANCE;
        uint CRIT_MULTI;
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
        GameObjects.Element SummonerDamageType;
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
}

library GameObjects_Equipments {

    struct ItemMetadata {
        GameObjects.ItemType baseType;
        uint id;
        bool upgradable;
    }

    struct Prefix {
        string title;
        GameObjects_Stats.Stats statBonus;

        // these are percentages.
        GameObjects_Stats.GeneratedStats generatedStatBonus;
        GameObjects_Stats.ElementalStats elementalStats;
        uint difficulty;
        bool isPercentage;
    }

    struct Suffix {
        string title;
        GameObjects_Stats.Stats statBonus;
        GameObjects_Stats.GeneratedStats generatedStatBonus;
        GameObjects_Stats.ElementalStats elementalStats;
        uint difficulty;
        bool isPercentage;
    }

    struct MiscItem {
        ItemMetadata metadata;
    }

    struct Weapon {
        ItemMetadata metadata;
        ItemRequirement requirement;
        GameObjects_Stats.Stats statBonus;
        GameObjects_Stats.GeneratedStats generatedStatBonus;
        GameObjects_Stats.ElementalStats elementalStats;
        GameObjects.Element damageType;
    }

    struct EquippedItemStruct {
        uint tokenId;
        uint itemId;
        uint itemTier;
        uint prefixId;
        uint prefixTier;
        uint suffixId;
        uint suffixTier;
        GameObjects.Element element;
    }

    struct Artifact {
        GameObjects_Stats.Stats statBonus;
        GameObjects_Stats.GeneratedStats generatedStatBonus;
        GameObjects_Stats.ElementalStats elementalStats;
    }


    struct Companion {
        ItemMetadata metadata;
        ItemRequirement requirement;
        GameObjects_Stats.Stats statBonus;
        GameObjects_Stats.GeneratedStats generatedStatBonus;
        GameObjects_Stats.ElementalStats elementalStats;

    }

    struct EquipableItem {
        ItemMetadata metadata;
        ItemRequirement requirement;
        GameObjects_Stats.Stats statBonus;
        GameObjects_Stats.GeneratedStats generatedStatBonus;
        GameObjects_Stats.ElementalStats elementalStats;

    }


    struct ItemRequirement {
        uint level;
        GameObjects_Stats.Stats statRequirement;
        GameObjects.Class[] classRequirement;
    }

    struct ItemNFTMetadata {
        address creator;
        uint created;
    }


    struct Seal {
        ItemMetadata metadata;
        ItemRequirement requirement;
        GameObjects_Stats.Stats statBonus;
        GameObjects_Stats.GeneratedStats generatedStatBonus;
        GameObjects_Stats.ElementalStats elementalStats;

    }


    struct Mount {
        ItemMetadata metadata;
        ItemRequirement requirement;
        GameObjects_Stats.Stats statBonus;
        GameObjects_Stats.GeneratedStats generatedStatBonus;
        GameObjects_Stats.ElementalStats elementalStats;

    }

    struct ItemDTO {
        GameObjects.ItemType _type;
        uint _itemId;
        uint256 _tier;
        uint _prefix;
        uint _prefixTier;
        uint _suffix;
        uint _suffixTier;
        GameObjects.Element _element;
    }


    struct SummonedCompanion {
        address companionAddress;
        uint companionId;
    }
}


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
        Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
    }

    enum WeaponType {
        SWORD,
        DAGGER,
        STAFF,
        AXE,
        BOWANDCROSSBOW,
        FOCUS,
        SHIELD
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
        CONSUMABLE,
        MOUNT,
        FISHING_ROD,
        MISC,
        ALCHEMY,
        COOKING,
        GENERAL_ACCESSORY,
        PET,
        SEAL
    }

}


library GameObjects_BuffEffects {

    struct ElixirBonusEffect {
        uint BonusEXPPercentage;
        uint BonusEXPPercentagePerTier;
        uint BonusGoldPercentage;
        uint BonusGoldPercentagePerTier;
        uint BonusEssencePercentage;
        uint BonusEssencePercentagePerTier;
        uint BonusMaterialPercentage;
        uint BonusMaterialPercentagePerTier;
        uint StatBonusPerTier;
        uint GenStatBonusPerTier;
        uint EleStatBonusPerTier;
    }

    enum BuffEffectType {
        ELIXIR,
        FOOD,
        MISC1,
        MISC2,
        MISC3
    }

    struct BuffEffect {
        //        //        ItemMetadata metadata;
        GameObjects_Stats.Stats statBonus;
        GameObjects_Stats.GeneratedStats generatedStatBonus;
        GameObjects_Stats.ElementalStats elementalStats;
        ElixirBonusEffect bonus;
        BuffEffectType buffEffectType;
        uint turnDuration;
    }

    struct BuffEffectRecipe {
        uint id;
        BasicRequirement[] requiredAlchemyItems;
        BasicRequirement[] requiredMiscItems;
        BasicRequirement[] requiredCookingItems;
        uint requiredGold;
        uint requiredEssence;
    }

    struct BasicRequirement {
        uint id;
        uint amount;
    }

    struct ItemMetadata {
        GameObjects.ItemType baseType;
        uint id;
        bool upgradable;
    }

    struct AlchemyItem {
        ItemMetadata metadata;
    }

    struct CookingItem {
        ItemMetadata metadata;
    }

}

library GameObjects_Cooking {


}