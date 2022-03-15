pragma solidity ^0.8.0;

// @title Stores and ensures the functions are called by other game contracts.

interface IGuard {

    function addOrRemoveGameContract(address _address, bool _value) external;

    function isGameContract(address _address) external view returns(bool);

}
