pragma solidity ^0.8.0;

import "./IAlchemyItem.sol";

interface IAlchemyItems {
    function rewardAlchemyItem(address to, IAlchemyItem.List id, uint amount) external;

    function burnAlchemyItem(address from, IAlchemyItem.List id, uint amount) external;
}
