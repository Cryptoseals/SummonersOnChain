pragma solidity ^0.8.0;

import {ILand, AnimalsL} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";

/*
    Stake baby animals here and let them grow.
    &
    Keep data of grown barn animals here.
    Withdraw them or directly send them to slaughterhouse or dairies
*/

contract Barn is LandUtils {
    // maps land-barn slot id to animal slots
    mapping(uint256 => mapping(uint256 => AnimalsL.BabyAnimal))
        public BarnSlots;

    //    function depositBarnAnimals(uint landId, uint[] memory slots, uint[] memory _animalIds) external nonReentrant isOwned(landId, msg.sender) {
    //        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
    //        ILand.BarnHouse memory barnhouse = landCodex.barnHouse(stats.BarnHousesTier);
    //        require(slots.length <= barnhouse.capacity, "m");
    //        for (uint i = 0; i < slots.length; i++) {
    //            if (_animalIds[i] != 0) {
    //                _handleBarnDeposit(landId, slots[i], _animalIds[i], stats.BarnHousesTier);
    //            }
    //        }
    //    }

    function depositBarnAnimal(
        uint256 landId,
        uint256 slot,
        uint256 _animalId
    ) external nonReentrant isOwned(landId, msg.sender) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        _handleBarnDeposit(landId, slot, _animalId, stats.BarnHousesTier);
    }

    function _handleBarnDeposit(
        uint256 landId,
        uint256 slot,
        uint256 _animalId,
        uint256 barnLevel
    ) internal {
        AnimalsL.BabyAnimal memory _animal = landCodex.babyAnimal(_animalId);
        //        require(!BarnSlots[landId][slot].active, "a");
        require(_animal.building == AnimalsL.AnimalPlace.BARN, "b");
        require(barnLevel >= _animal.minMainBuildingLevel, "c");
        animalToken.burnAnimal(msg.sender, _animalId, 1);

        BarnSlots[landId][slot].active = true;
        BarnSlots[landId][slot].animalId = _animalId;
        BarnSlots[landId][slot].becomes = _animal.becomes;
        BarnSlots[landId][slot].growthTime =
            block.timestamp +
            _animal.growthTime;
        // BarnSlots[landId][slot].growthTime = block.timestamp + 1 minutes;
    }

    function withdrawBarnAnimals(uint256 landId, uint256 slot)
        external
        nonReentrant
        isOwned(landId, msg.sender)
    {
        _handleBarnClaim(landId, slot);
    }

    function _handleBarnClaim(uint256 landId, uint256 slot) internal {
        require(block.timestamp >= BarnSlots[landId][slot].growthTime, "e");
        BarnSlots[landId][slot].active = false;
        animalToken.mintAnimal(msg.sender, BarnSlots[landId][slot].becomes, 1);
        BarnSlots[landId][slot].becomes = 0;
    }
}
