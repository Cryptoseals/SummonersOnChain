pragma solidity ^0.8.0;

interface INavigator {

    enum CONTRACT {
        SUMMONERS, // 0
        ATTRIBUTES, // 1
        SKILLS, // 2
        EXP, // 3
        GOLD, // 4
        ESSENCE, // 5
        SCRAPS, // 6
        JOB, // 7
        HELMETS_CODEX,//8
        ARMORS_CODEX, //9
        BOOTS_CODEX,// 10
        WEAPONS_CODEX, //11
        OFF_HANDS_CODEX, //12
        ARTIFACTS_CODEX, //12
        MOUNTS_CODEX //12
}

function setGameContractsAddresses (address[] memory _addresses, bool value) external;
function getContractAddress (CONTRACT _contractId) external view returns (address);
function isGameContract(address _address) external view returns (bool);
function isPaused() external view returns (bool);
function sealIsOwned(uint summoner) external returns (bool);
function nftIsOwned(address _address, uint _tokenId) external returns (bool);
function onlyGameContracts() external returns (bool);
}
