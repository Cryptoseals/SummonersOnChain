// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface ICodexRandom {

    function d100(uint _input) external view returns (uint);

    function d20(uint _input) external view returns (uint);

    function d12(uint _input) external view returns (uint);

    function d10(uint _input) external view returns (uint);

    function d8(uint _input) external view returns (uint);

    function d6(uint _input) external view returns (uint);

    function d4(uint _input) external view returns (uint);

    function dn(uint _input, uint _number) external view returns (uint);

}