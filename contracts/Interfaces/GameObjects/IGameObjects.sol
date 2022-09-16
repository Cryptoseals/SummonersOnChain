//import "./IGenericMetadata.sol";
pragma solidity ^0.8.0;

import "../NonFungibles/ConsumablesAndArtifacts/IMisc.sol";
import "../NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
import "../NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
import "../NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";
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


    struct ItemMetadata {
        ItemType baseType;
        uint id;
        bool upgradable;
    }

    struct Prefix {
        string title;
        Stats statBonus;

        // these are percentages.
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;
        uint difficulty;
        bool isPercentage;
    }

    struct Suffix {
        string title;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;
        uint difficulty;
        bool isPercentage;
    }

    struct MiscItem {
        ItemMetadata metadata;
    }

    struct Weapon {
        ItemMetadata metadata;
        ItemRequirement requirement;
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;
        Element damageType;
    }

    struct EquippedItemStruct {
        uint tokenId;
        uint itemId;
        uint itemTier;
        uint prefixId;
        uint prefixTier;
        uint suffixId;
        uint suffixTier;
        Element element;
    }

    struct Artifact {
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


    struct ItemRequirement {
        uint level;
        Stats statRequirement;
        Class[] classRequirement;
    }

    struct ItemNFTMetadata {
        address creator;
        uint created;
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

    struct ItemDTO {
        ItemType _type;
        uint _itemId;
        uint256 _tier;
        uint _prefix;
        uint _prefixTier;
        uint _suffix;
        uint _suffixTier;
        Element _element;
    }


    struct SummonedCompanion {
        address companionAddress;
        uint companionId;
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
        Stats statBonus;
        GeneratedStats generatedStatBonus;
        ElementalStats elementalStats;
        ElixirBonusEffect bonus;
        BuffEffectType buffEffectType;
        uint turnDuration;
    }

    struct BuffEffectRecipe {
        uint id;
        BasicAlchemyRequirement[] requiredAlchemyItems;
        BasicMiscRequirement[] requiredMiscItems;
        BasicCookingRequirement[] requiredCookingItems;
        BasicRequirement[] requiredConsumableItem;
        uint requiredGold;
        uint requiredEssence;
    }

    struct BasicRequirement {
        uint id;
        uint amount;
    }

    struct BasicMiscRequirement {
        IMiscs.List id;
        uint amount;
    }

    struct BasicAlchemyRequirement {
        IAlchemyItem.List id;
        uint amount;
    }

    struct BasicCookingRequirement {
        ICookingItem.List id;
        uint amount;
    }

    struct AlchemyItem {
        ItemMetadata metadata;
    }

    struct CookingItem {
        ItemMetadata metadata;
    }

