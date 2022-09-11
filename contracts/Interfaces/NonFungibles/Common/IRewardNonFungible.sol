pragma solidity ^0.8.0;

import {IMiscs} from "../ConsumablesAndArtifacts/IMisc.sol";

interface IRewardNonFungible {
    function rewardMiscItem(address to, IMiscs.List id, uint amount) external;
}
