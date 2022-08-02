pragma solidity ^0.8.0;

import {Barn} from "./Barn.sol";
import {Dairy} from "./Dairy.sol";
import {Farm} from "./Farm.sol";
import {Mill} from "./Mill.sol";
import {Poultry} from "./Poultry.sol";
import {Slaughterhouse} from "./Slaughterhouse.sol";
import {Storages} from "./Storages.sol";
import {WaterTower} from "./WaterTower.sol";
import {LandUtils} from "./LandUtils.sol";

contract LandControls is LandUtils, Barn, Dairy, Farm, Mill, Poultry, Slaughterhouse, Storages, WaterTower {

}
