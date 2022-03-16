import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "../Interfaces/NonFungibles/EXP/EXPCardLib.sol";

pragma solidity ^0.8.0;

contract EXPCards is ERC1155 {
    constructor (string memory _baseUri) ERC1155(_baseUri) {}

    function redeemCard(uint _card, uint _summoner) external {

    }

}
