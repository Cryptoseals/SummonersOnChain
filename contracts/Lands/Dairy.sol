pragma solidity ^0.8.0;

import {ILand, AnimalsL} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";
import {Animals} from "../NonFungibles/Animals.sol";

/*
    Stake animals here.
    &
    Earn milk | eggs
*/
contract Dairy is LandUtils {

    struct DairyAnimal {
        uint animalId;
        uint depositDate;
        uint lastClaim;
    }


    // land id-slot-animal
    mapping(uint => mapping(uint => DairyAnimal)) public Staked;


    // animal id must be 0, if you dont want to touch that dairy slot
    function depositAnimalToDairy(uint landId, uint[] memory animalIdsForSlots) external nonReentrant isOwned(landId) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Dairies memory dairy = landCodex.dairies(stats.DairiesTier);

        require(animalIdsForSlots.length <= dairy.maxProductionSimultaneously, "l");

        for (uint i = 0; i < animalIdsForSlots.length; i++) {
            if (animalIdsForSlots[i] == 0) continue;
            AnimalsL.GrownAnimal memory _animal = landCodex.grownAnimal(animalIdsForSlots[i]);
            if (Staked[landId][i].animalId != 0) {
                uint cycle = calculateCycle(landId, i);
                animalToken.mintAnimal(msg.sender, Staked[landId][i].animalId, 1);
                AnimalsL.GrownAnimal memory _prevAnimal = landCodex.grownAnimal(Staked[landId][i].animalId);
                rewardForAnimal(_prevAnimal, cycle);
            }
            Staked[landId][i].animalId = _animal.animalId;
            Staked[landId][i].depositDate = block.timestamp;
            Staked[landId][i].lastClaim = 0;
            animalToken.burnAnimal(msg.sender, _animal.animalId, 1);
        }
    }

    function claimProductions(uint landId, uint[] calldata slotIds) external nonReentrant isOwned(landId) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Dairies memory dairy = landCodex.dairies(stats.DairiesTier);
        AnimalsL.GrownAnimal memory _animal;
        require(slotIds.length <= dairy.maxProductionSimultaneously, "l");
        for (uint i = 0; i < slotIds.length; i++) {
            uint slot = slotIds[i];
            require(Staked[landId][slot].animalId != 0, "0");
            uint cycle = calculateCycle(landId, slot);
            if (_animal.animalId != Staked[landId][slot].animalId) {
                _animal = landCodex.grownAnimal(Staked[landId][slot].animalId);
            }
            Staked[landId][slot].lastClaim = block.timestamp;

            rewardForAnimal(_animal, cycle);
        }
    }


    function rewardForAnimal(AnimalsL.GrownAnimal memory animal, uint cycle) internal {
        if (cycle > 0) {
            for (uint i = 0; i < animal.dailyProductions.cookingItems.length; i++) {
                cookingItemToken.rewardCookingItem(msg.sender,
                    animal.dailyProductions.cookingItems[i].id,
                    animal.dailyProductions.cookingItems[i].amount * cycle);
            }
        }
    }


    function calculateCycle(uint landId, uint slot) internal view returns (uint cycle) {
        uint depositDate = Staked[landId][slot].depositDate;
        uint lastClaim = Staked[landId][slot].lastClaim;
        if (lastClaim == 0) {
            cycle = (block.timestamp - depositDate) / DairyProdTime;
        } else {
            cycle = (block.timestamp - lastClaim) / DairyProdTime;
        }
    }
}
