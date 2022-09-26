//import "./IGenericMetadata.sol";
pragma solidity ^0.8.0;

import "../NonFungibles/ConsumablesAndArtifacts/IMisc.sol";
import "../NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
import "../NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
import "../NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";
import {CraftingMaterial} from "../GameObjects/ICrafting/ICraftingMaterials.sol";

enum StatsEnum {
    STR,
    AGI,
    INT,
    DEX,
    VIT,
    LUCK
}

struct BattleStats {
    uint256 TOTAL_HP;
    uint256 DPS;
    uint256 HIT_CHANCE;
    uint256 CRIT_CHANCE;
    uint256 CRIT_MULTI;
    uint MAX_HP;
}

struct Stats {
    uint256 STR;
    uint256 AGI;
    uint256 INT;
    uint256 DEX;
    uint256 VIT;
    uint256 LUCK;
}

struct GeneratedStats {
    uint256 HP;
    uint256 P_ATK;
    uint256 M_ATK;
    uint256 P_DEF;
    uint256 M_DEF;
    uint256 ACCURACY;
    uint256 DODGE;
    uint256 CRIT;
    uint256 CRIT_MULTIPLIER;
    uint256 INFUSION;
}

struct ElementalStats {
    ElementalAtk ElementalAtk;
    ElementalDef ElementalDef;
    Element SummonerDamageType;
}

struct ElementalAtk {
    uint256 FIRE_ATK;
    uint256 COLD_ATK;
    uint256 EARTH_ATK;
    uint256 LIGHTNING_ATK;
    uint256 DARK_ATK;
    uint256 HOLY_ATK;
    uint256 VOID_ATK;
}

struct ElementalDef {
    uint256 FIRE_DEF;
    uint256 COLD_DEF;
    uint256 EARTH_DEF;
    uint256 LIGHTNING_DEF;
    uint256 DARK_DEF;
    uint256 HOLY_DEF;
    uint256 VOID_DEF;
}

struct SummonerStats {
    Stats Stats;
    GeneratedStats GeneratedStats;
    ElementalStats ElementalStats;
}

struct ItemMetadata {
    ItemType baseType;
    uint256 id;
    bool upgradable;
}

struct Prefix {
    string title;
    Stats statBonus;
    // these are percentages.
    GeneratedStats generatedStatBonus;
    ElementalStats elementalStats;
    uint256 difficulty;
    bool isPercentage;
}

struct Suffix {
    string title;
    Stats statBonus;
    GeneratedStats generatedStatBonus;
    ElementalStats elementalStats;
    uint256 difficulty;
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
    uint256 tokenId;
    uint256 itemId;
    uint256 itemTier;
    uint256 prefixId;
    uint256 prefixTier;
    uint256 suffixId;
    uint256 suffixTier;
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
    uint256 level;
    Stats statRequirement;
    Class[] classRequirement;
}

struct ItemNFTMetadata {
    address creator;
    uint256 created;
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
    uint256 _itemId;
    uint256 _tier;
    uint256 _prefix;
    uint256 _prefixTier;
    uint256 _suffix;
    uint256 _suffixTier;
    Element _element;
}

struct SummonedCompanion {
    address companionAddress;
    uint256 companionId;
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
    Barbarian,
    Paladin,
    Assassin,
    Wizard,
    Necromancer,
    Priest,
    Engineer,
    Ranger
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
    SEAL,
    CORE
}

struct ElixirBonusEffect {
    uint256 BonusEXPPercentage;
    uint256 BonusEXPPercentagePerTier;
    uint256 BonusGoldPercentage;
    uint256 BonusGoldPercentagePerTier;
    uint256 BonusEssencePercentage;
    uint256 BonusEssencePercentagePerTier;
    uint256 BonusMaterialPercentage;
    uint256 BonusMaterialPercentagePerTier;
    uint256 StatBonusPerTier;
    uint256 GenStatBonusPerTier;
    uint256 EleStatBonusPerTier;
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
    uint256 turnDuration;
}

struct BuffEffectRecipe {
    uint256 id;
    BasicAlchemyRequirement[] requiredAlchemyItems;
    BasicMiscRequirement[] requiredMiscItems;
    BasicCookingRequirement[] requiredCookingItems;
    BasicRequirement[] requiredConsumableItem;
    uint256 requiredGold;
    uint256 requiredEssence;
}

struct CoreRecipe {
    uint256 id;
    BasicAlchemyRequirement[] requiredAlchemyItems;
    BasicMiscRequirement[] requiredMiscItems;
    MaterialRequirement[] requiredMaterials;
    uint256 requiredGold;
    uint256 requiredEssence;
}

struct BasicRequirement {
    uint256 id;
    uint256 amount;
}

struct BasicMiscRequirement {
    IMiscs.List id;
    uint256 amount;
}

struct BasicAlchemyRequirement {
    IAlchemyItem.List id;
    uint256 amount;
}

struct BasicCookingRequirement {
    ICookingItem.List id;
    uint256 amount;
}

struct MaterialRequirement {
    uint256 amount;
    CraftingMaterial material;
}

struct AlchemyItem {
    ItemMetadata metadata;
}

struct CookingItem {
    ItemMetadata metadata;
}
