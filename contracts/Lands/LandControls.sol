pragma solidity ^0.8.0;

import {Barn} from "./Barn.sol";
import {Dairy} from "./Dairy.sol";
import {Farm} from "./Farm.sol";
import {Mill} from "./Mill.sol";
import {Poultry, AnimalsL} from "./Poultry.sol";
import {Slaughterhouse} from "./Slaughterhouse.sol";
import {WaterTower} from "./WaterTower.sol";
import {LandUtils} from "./LandUtils.sol";

contract LandControls is LandUtils, Barn, Dairy, Farm, Mill, Poultry, Slaughterhouse, WaterTower {
    function animalSlots(uint landId, uint[] memory slots, bool isPoultry) external view returns (AnimalsL.BabyAnimal[] memory){
        AnimalsL.BabyAnimal[] memory result = new AnimalsL.BabyAnimal[](slots.length);
        for (uint i = 0; i < result.length; i++) {
            result[i] = isPoultry ? PoultrySlots[landId][slots[i]] : BarnSlots[landId][slots[i]];
        }
        return result;
    }
}
