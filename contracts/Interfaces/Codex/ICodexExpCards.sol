import "../NonFungibles/EXP/EXPCardLib.sol";

// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract ICodexExpCards {

    function getAllCards() external view returns (EXPCardLib.EXPCard[] memory);

    function item(uint _id) public view returns (EXPCardLib.EXPCard memory _misc);

    function ExpCard1 () public view returns(EXPCardLib.EXPCard memory _expCard);

    function ExpCard2 () public view returns(EXPCardLib.EXPCard memory _expCard);

    function ExpCard3 () public view returns(EXPCardLib.EXPCard memory _expCard);

    function ExpCard4 () public view returns(EXPCardLib.EXPCard memory _expCard);

    function ExpCard5 () public view returns(EXPCardLib.EXPCard memory _expCard);

}