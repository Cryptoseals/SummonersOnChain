pragma solidity ^0.8.0;

import {ILand, AnimalsL} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";

/*
    Stake baby poultry animals to grow them
    &
    Keep data of them here, send them to slaughterhouse or dairy
*/

contract Poultry is LandUtils {
    // maps land-poultry slot id to animal slots
    mapping(uint => mapping(uint => AnimalsL.BabyAnimal)) public PoultrySlots;

    // use this function if you are depositing same animal in every slot
    function depositPoultryAnimals(uint landId, uint[] memory slots, uint _animalId) external nonReentrant isOwned(landId) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Poultry memory poultry = landCodex.poultry(stats.PoultriesTier);
        require(slots.length <= poultry.capacity, "m");
        for (uint i = 0; i < slots.length; i++) {
            _handlePoultryDeposit(landId, slots[i], _animalId);
        }
    }

    function depositPoultryAnimal(uint landId, uint slot, uint _animalId) external nonReentrant isOwned(landId) {
        _handlePoultryDeposit(landId, slot, _animalId);
    }

    function _handlePoultryDeposit(uint landId, uint slot, uint _animalId) internal {
        AnimalsL.BabyAnimal memory _animal = landCodex.babyAnimal(_animalId);
        require(!PoultrySlots[landId][slot].active, "a");
        require(_animal.building == AnimalsL.AnimalPlace.POULTRY, "b");

        animalToken.burnAnimal(msg.sender, _animalId, 1);

        PoultrySlots[landId][slot].active = true;
        PoultrySlots[landId][slot].growthTime = block.timestamp + _animal.growthTime;
    }

    function withdrawPoultryAnimals(uint landId, uint[] memory slots) external nonReentrant isOwned(landId) {
        for (uint i = 0; i < slots.length; i++) {
            _handlePoultryClaim(landId, slots[i]);
        }
    }

    function _handlePoultryClaim(uint landId, uint slot) internal {
        require(block.timestamp >= PoultrySlots[landId][slot].growthTime, "e");
        PoultrySlots[landId][slot].active = false;
        animalToken.mintAnimal(msg.sender, PoultrySlots[landId][slot].becomes, 1);
    }
}
