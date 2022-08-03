pragma solidity ^0.8.0;

import {ICookingItem} from "./ICookingItem.sol";

interface ICookingItems {
    function rewardCookingItem(address to, ICookingItem.List id, uint amount) external;

    function burnCookingItem(address from, ICookingItem.List id, uint amount) external;
}
