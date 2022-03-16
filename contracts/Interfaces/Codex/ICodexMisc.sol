import "../GameObjects/GameObjects.sol";

pragma solidity ^0.8.0;

interface CodexMisc {
    function item(uint _id) external pure returns (GameObjects.MiscItem memory _misc);
}
