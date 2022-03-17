pragma solidity ^0.8.0;

interface ICalculator {
    function damage(uint ATK, uint DEF) external view returns (uint);
}
