pragma solidity ^0.8.0;

import {Seed} from "../../Lands/ILand.sol";

interface ISeedToken {
    function mintSeed(Seed.List seed, address to, uint amount) external;

    function burnSeed(address from, uint id, uint amount) external;
}
