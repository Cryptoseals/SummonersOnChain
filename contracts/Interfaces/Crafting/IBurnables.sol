pragma solidity ^0.8.0;

import "../NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
import "../NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";
import "../NonFungibles/ConsumablesAndArtifacts/IMisc.sol";

interface IMiscBurnable {
    function burnMiscItem(address from, IMiscs.List id, uint amount) external;
}

interface IAlchemyBurnable {
    function burnAlchemyItem(address from, IAlchemyItem.List id, uint amount) external;
}

interface ICookingBurnable {
    function burnCookingItem(address from, ICookingItem.List id, uint amount) external;
}

interface ISeedBurnable {
    function burnSeed(address from, uint id, uint amount) external;
}
