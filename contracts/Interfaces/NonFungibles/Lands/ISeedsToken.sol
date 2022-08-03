pragma solidity ^0.8.0;

interface ISeedsToken {
    function mintSeed(uint seed, address to, uint amount) external;

    function burnSeed(address from, uint id, uint amount) external;
}
