pragma solidity ^0.8.0;

interface IAnimalsToken {
    function animalsOf(address account, uint[] memory ids) external view returns (uint[] memory);
    function burnAnimal(address from, uint id, uint amount) external;
    function mintAnimal(uint animal, address to, uint amount) external;
}
