pragma solidity ^0.8.0;

import {ILand, Animals} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";

/*
    Stake baby animals here and let them grow.
    &
    Keep data of grown barn animals here.
    Withdraw them or directly send them to slaughterhouse or dairies
*/

contract Barn is LandUtils {
    // maps land-barn slot id to animal slots
    mapping(uint => mapping(uint => Animals.BabyAnimal)) public BarnSlots;

    // use this function if you are depositing same animal in every slot
    function depositAnimals(uint landId, uint[] memory slots, uint _animalId) external isOwned(landId) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.BarnHouse memory barnhouse = landCodex.barnHouse(stats.BarnHousesTier);
        require(slots.length <= barnhouse.capacity, "m");
        for (uint i = 0; i < slots.length; i++) {
            _handleDeposit(landId, slots[i], _animalId);
        }
    }

    function depositAnimal(uint landId, uint slot, uint _animalId) external isOwned(landId) {
        _handleDeposit(landId, slot, _animalId);
    }

    function _handleDeposit(uint landId, uint slot, uint _animalId) internal {
        Animals.BabyAnimal memory _animal = landCodex.babyAnimal(_animalId);
        require(!BarnSlots[landId][slot].active, "a");
        require(_animal.building == Animals.AnimalPlace.BARN, "b");

        animalToken.burnAnimal(msg.sender, _animalId, 1);

        BarnSlots[landId][slot].active = true;
        BarnSlots[landId][slot].growthTime = block.timestamp + _animal.growthTime;
    }

    function withdrawAnimals(uint landId, uint[] memory slots) external isOwned(landId) {
        for (uint i = 0; i < slots.length; i++) {
            _handleClaim(landId, slots[i]);
        }
    }

    function _handleClaim(uint landId, uint slot) internal {
        BarnSlots[landId][slot].active = false;
        animalToken.mintAnimal(BarnSlots[landId][slot].becomes, msg.sender, 1);
    }

}
