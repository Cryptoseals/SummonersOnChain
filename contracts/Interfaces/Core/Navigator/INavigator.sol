pragma solidity ^0.8.0;

interface INavigator {

    enum CONTRACT {
        SUMMONERS, // 0
        ATTRIBUTES, // 1
        SKILLS, // 2
        EQUIPABLES, // 4
        EXP, // 5
        GOLD, // 6
        ESSENCE, // 7
        SCRAPS, // 8
        JOB, // 9
        HELMETS_CODEX, //10
        ARMORS_CODEX, //11
        BOOTS_CODEX, // 12
        WEAPONS_CODEX, //13
        OFF_HANDS_CODEX, //14
        AMULETS_CODEX, //15
        RINGS_CODEX, //16
        EARRINGS_CODEX, //17
        BELTS_CODEX, //18
        ARTIFACTS_CODEX, //19
        MOUNTS_CODEX, //20
        RANDOM_CODEX, //21
        CALCULATOR // 22
    }

    function setGameContractsAddresses(address[] memory _addresses, bool value) external;
    function setGameContractsById(CONTRACT _contractId, address _address, bool value) external;
    function getContractAddress(CONTRACT _contractId) external view returns (address);

    function isGameContract(address _address) external view returns (bool);

    function isPaused() external view returns (bool);

    function sealIsOwned(uint summoner, address sender) external view returns (bool);

    function nftIsOwned(address _address, address sender, uint _tokenId) external view returns (bool);

    function onlyGameContracts() external returns (bool);
}
