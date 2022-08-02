pragma solidity ^0.8.0;

import {ILand} from "../../Lands/ILand.sol";

interface ILandsToken {
    function ownerOf(uint landId) external view returns (address);
    function landStats(uint landId) external view returns (ILand.LandStatsStruct memory);
}
