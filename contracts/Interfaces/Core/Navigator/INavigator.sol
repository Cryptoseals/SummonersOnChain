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
        ELIXIRS_CODEX, //21
        MOUNTS_CODEX, //22
        RANDOM_CODEX, //23
        CALCULATOR, // 24
        CRYPTO_SEAL, // 25
        ARTIFACT_AND_ELIXIR_SLOTS, // 26
        ARTIFACTS,
        ELIXIRS,
        MISC_CODEX,
        MISC_ITEMS,
        PREFIX_CODEX,
        SUFFIX_CODEX,
        EXP_CARDS,
        FIRE_ENEMY_CODEX,
        COLD_ENEMY_CODEX,
        LIGHTNING_ENEMY_CODEX,
        EARTH_ENEMY_CODEX,
        DARK_ENEMY_CODEX,
        HOLY_ENEMY_CODEX,
        VOID_ENEMY_CODEX,
        PHYSICAL_ENEMY_CODEX,
        ARCANE_ENEMY_CODEX,
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
        WOOD_PROCESSING_RECIPES,
        CLOTH_PROCESSING_RECIPES,
        ORE_UPGRADING_RECIPES,
        WOOD_UPGRADING_RECIPES,
        CLOTH_UPGRADING_RECIPES,
        ARMOR_RECIPES,
        WEAPON_RECIPES,
        ELIXIR_RECIPES,
        ARTIFACT_RECIPES,
        SWORD_STATS,
        DAGGER_STATS,
        SHIELD_STATS,
        BOW_STATS,
        AXE_STATS,
        STAFF_STATS,
        FOCUS_STATS,
        HEAVY_HELMET_STATS,
        MEDIUM_HELMET_STATS,
        LIGHT_HELMET_STATS,
        HEAVY_ARMOR_STATS,
        MEDIUM_ARMOR_STATS,
        LIGHT_ARMOR_STATS,
        HEAVY_BOOTS_STATS,
        MEDIUM_BOOTS_STATS,
        LIGHT_BOOTS_STATS
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
