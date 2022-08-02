pragma solidity ^0.8.0;

import {GameObjects_BuffEffects} from "../GameObjects/IGameObjects.sol";

interface IMiscItems {
    function burnMiscItem(address from, uint id, uint amount) external;
}

interface IAlchemyItems {
    function burnAlchemyItem(address from, uint id, uint amount) external;
}

interface ICookingItems {
    function burnCookingItem(address from, uint id, uint amount) external;
}
