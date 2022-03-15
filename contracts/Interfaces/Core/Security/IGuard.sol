pragma solidity ^0.8.0;
// @title Stores and ensures the functions are called by other game contracts.

interface Guard {

    function addOrRemoveGameContract(address _address, bool _value) external view returns(bool);

    function isGameContract(address _address) external returns(bool);

}
