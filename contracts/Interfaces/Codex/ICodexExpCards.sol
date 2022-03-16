import "../NonFungibles/EXP/EXPCardLib.sol";

// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

interface ICodexExpCards {

    function getAllCards() external view returns (EXPCardLib.EXPCard[] memory);

    function item(uint _id) external view returns (EXPCardLib.EXPCard memory _misc);

    function ExpCard1 () external view returns(EXPCardLib.EXPCard memory _expCard);

    function ExpCard2 () external view returns(EXPCardLib.EXPCard memory _expCard);

    function ExpCard3 () external view returns(EXPCardLib.EXPCard memory _expCard);

    function ExpCard4 () external view returns(EXPCardLib.EXPCard memory _expCard);

    function ExpCard5 () external view returns(EXPCardLib.EXPCard memory _expCard);

}