pragma solidity ^0.8.0;

interface IMiscBurnable {
    function burnMiscItem(address from, uint id, uint amount) external;
}

interface IAlchemyBurnable {
    function burnAlchemyItem(address from, uint id, uint amount) external;
}

interface ICookingBurnable {
    function burnCookingItem(address from, uint id, uint amount) external;
}

interface ISeedBurnable {
    function burnSeed(address from, uint id, uint amount) external;
}
