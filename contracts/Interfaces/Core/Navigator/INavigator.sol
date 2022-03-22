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
        ARTIFACTS_CODEX, //15
        MOUNTS_CODEX, //16
        RANDOM_CODEX, //17
        CALCULATOR // 18
    }

    function setGameContractsAddresses(address[] memory _addresses, bool value) external;

    function getContractAddress(CONTRACT _contractId) external view returns (address);

    function isGameContract(address _address) external view returns (bool);

    function isPaused() external view returns (bool);

    function sealIsOwned(uint summoner) external returns (bool);

    function nftIsOwned(address _address, uint _tokenId) external returns (bool);

    function onlyGameContracts() external returns (bool);
}
