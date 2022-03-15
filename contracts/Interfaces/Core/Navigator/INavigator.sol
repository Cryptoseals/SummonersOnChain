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
        JOB // 7
    }

    function setGameContracts (address[] memory _addresses) external;
    function getContractAddress (uint _contractId) external view returns(address);
}
