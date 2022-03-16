pragma solidity ^0.8.0;

import "./EXPCardLib.sol";

interface IExpCards {

    function expByCardId() external view returns(uint);

    function card (uint tokenId) external view returns(EXPCardLib.EXPCard memory);

    function redeem(uint tokenId, uint summoner) external;
}
