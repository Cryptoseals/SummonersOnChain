
pragma solidity ^0.8.0;

interface ISummoners {
    function level(uint id) external view returns (uint);
    function senderIsOwner(uint summoner) external returns(bool);
}
