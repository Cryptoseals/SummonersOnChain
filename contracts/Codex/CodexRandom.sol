// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexRandom {
    string constant public index = "Codex";
    string constant public class = "Random";
    string constant public version = "0.0.1";

    function d100(uint _input) external view returns (uint) {
        return dn(_input, 100);
    }

    function d20(uint _input) external view returns (uint) {
        return dn(_input, 20);
    }

    function d12(uint _input) external view returns (uint) {
        return dn(_input, 12);
    }

    function d10(uint _input) external view returns (uint) {
        return dn(_input, 10);
    }

    function d8(uint _input) external view returns (uint) {
        return dn(_input, 8);
    }

    function d6(uint _input) external view returns (uint) {
        return dn(_input, 6);
    }

    function d4(uint _input) external view returns (uint) {
        return dn(_input, 4);
    }

    function dn(uint _input, uint _number) public view returns (uint) {
        return _seed(_input) % _number;
    }

    function _random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function _seed(uint _input) internal view returns (uint rand) {
        rand = _random(
            string(
                abi.encodePacked(
                    block.number,
                    uint160(address(this)),
                    gasleft(),
                    _input,
                    msg.sender
                )
            )
        );
    }
}