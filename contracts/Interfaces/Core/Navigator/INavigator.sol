pragma solidity ^0.8.0;

interface INavigator {

    enum CONTRACT {
        SUMMONERS, // 0
        ATTRIBUTES, // 1
        SKILLS, // 2
        EQUIPABLE_ITEMS, // 4 NFTS
        INVENTORY, // 5 EQUIP SLOTS
        EXP, // 6
        GOLD, // 7
        ESSENCE, // 8
        SCRAPS, // 9
        JOB, // 10
        HELMETS_CODEX, //11
        BODY_ARMORS_CODEX, //12
        BOOTS_CODEX, // 13
        WEAPONS_CODEX, //14
        OFF_HANDS_CODEX, //15
        AMULETS_CODEX, //16
        RINGS_CODEX, //17
        EARRINGS_CODEX, //18
        BELTS_CODEX, //19
        ARTIFACTS_CODEX, //20
        ARTIFACT_PROPS_CODEX, //20
        CONSUMABLES_CODEX, //21
        MOUNTS_CODEX, //22
        RANDOM_CODEX, //23
        CORE_CODEX,
        CORES,
        CALCULATOR, // 24
        CRYPTO_SEAL, // 25
        ARTIFACT_AND_ELIXIR_SLOTS, // 26
        ARTIFACTS,
        CONSUMABLES,
        MISC_CODEX,
        MISC_ITEMS,
        ALCHEMY_ITEMS_CODEX,
        ALCHEMY_ITEMS,
        COOKING_ITEMS_CODEX,
        COOKING_ITEMS,
        PREFIX_CODEX,
        SUFFIX_CODEX,
        EXP_CARDS,
        FREE_SPOT_1,
        FREE_SPOT_2,
        FREE_SPOT_3,
        FREE_SPOT_4,
        FREE_SPOT_5,
        FREE_SPOT_6,
        FREE_SPOT_7,
        FREE_SPOT_8,
        FREE_SPOT_9,
        SPELLS_CODEX,
        FIRE_SPELLS,
        COLD_SPELLS,
        EARTH_SPELLS,
        LIGHTNING_SPELLS,
        GADGET_SPELLS,
        PHYSICAL_SPELLS,
        ARCANE_SPELLS,
        DARK_SPELLS,
        HOLY_SPELLS,
        VOID_SPELLS,
        RANGED_SPELLS,
        BASE_ENEMY_STATS,
        CODEX_ENEMIES,
        CRAFTING,
        CRAFTING_MATERIALS,
        ORE_PROCESSING_RECIPES,
        LEATHER_PROCESSING_RECIPES,
        WOOD_PROCESSING_RECIPES,
        CLOTH_PROCESSING_RECIPES,
        GEMSTONE_PROCESSING_RECIPES,
        ORE_UPGRADING_RECIPES,
        LEATHER_UPGRADING_RECIPES,
        WOOD_UPGRADING_RECIPES,
        CLOTH_UPGRADING_RECIPES,
        GEMSTONE_UPGRADING_RECIPES,
        HELMET_RECIPES,
        ARMOR_RECIPES,
        BOOTS_RECIPES,
        WEAPON_RECIPES,
        SWORD_RECIPES,
        DAGGER_RECIPES,
        SHIELD_RECIPES,
        BOW_RECIPES,
        AXE_RECIPES,
        STAFF_RECIPES,
        FOCUS_RECIPES,
        AMULET_RECIPES,
        RING_RECIPES,
        EARRING_RECIPES,
        BELT_RECIPES,
        CONSUMABLE_RECIPES,
        ARTIFACT_RECIPES,
        SWORD_STATS,
        DAGGER_STATS,
        SHIELD_STATS,
        BOW_STATS,
        AXE_STATS,
        STAFF_STATS,
        FOCUS_STATS,
        HEAVY_HELMET_RECIPES,
        MEDIUM_HELMET_RECIPES,
        LIGHT_HELMET_RECIPES,
        HEAVY_ARMOR_RECIPES,
        MEDIUM_ARMOR_RECIPES,
        LIGHT_ARMOR_RECIPES,
        HEAVY_BOOTS_RECIPES,
        MEDIUM_BOOTS_RECIPES,
        LIGHT_BOOTS_RECIPES,
        HEAVY_HELMET_STATS,
        MEDIUM_HELMET_STATS,
        LIGHT_HELMET_STATS,
        HEAVY_ARMOR_STATS,
        MEDIUM_ARMOR_STATS,
        LIGHT_ARMOR_STATS,
        HEAVY_BOOTS_STATS,
        MEDIUM_BOOTS_STATS,
        LIGHT_BOOTS_STATS,
        ADVENTURES_CODEX,
        ADVENTURES,
        ADVENTURE_CONTROLS,
        AREA_1,
        AREA_2,
        AREA_3,
        AREA_4,
        AREA_5,
        AREA_6,
        AREA_7,
        AREA_8,
        AREA_9,
        AREA_10,
        AREA_11,
        AREA_12,
        AREA_13,
        AREA_14,
        AREA_15,
        AREA_16,
        REWARDS,
        CHESTS,
        WORLD_BOSS,
        LANDS,
        LANDS_CODEX,
        ANIMALS,
        SEEDS
    }

    function setGameContractsAddresses(address[] memory _addresses, bool value) external;

    function setGameContractsById(CONTRACT _contractId, address _address, bool value) external;

    function getContractAddress(CONTRACT _contractId) external view returns (address);

    function isGameContract(address _address) external view returns (bool);

    function isPaused() external view returns (bool);

    function sealIsOwned(uint summoner, address sender) external view returns (bool);

    function nftIsOwned(address _address, address sender, uint _tokenId) external view returns (bool);

    function onlyGameContracts() external returns (bool);

    function extendGameTime(uint _end) external;
}
