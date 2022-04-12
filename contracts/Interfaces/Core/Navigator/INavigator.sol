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
        ARMORS_CODEX, //12
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
        ARCANE_ENEMY_CODEX
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
