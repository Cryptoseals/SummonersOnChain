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
    mapping(uint => mapping(uint => DairyAnimal)) public StakedDairy;

    // animal id must be 0, if you dont want to touch that dairy slot
    function depositAnimalToDairy(uint landId, uint[] memory animalIdsForSlots) external nonReentrant isOwned(landId) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Dairies memory dairy = landCodex.dairies(stats.DairiesTier);
        ILand.Storages memory storages = landCodex.storages(stats.StorageBuildingsTier);

        require(animalIdsForSlots.length <= dairy.maxProductionSimultaneously, "l");

        for (uint i = 0; i < animalIdsForSlots.length; i++) {
            if (animalIdsForSlots[i] == 0) continue;
            AnimalsL.GrownAnimal memory _animal = landCodex.grownAnimal(animalIdsForSlots[i]);
            if (StakedDairy[landId][i].animalId != 0) {
                uint cycle = calculateCycle(landId, i);
                StakedDairy[landId][i].lastClaim = block.timestamp;
                animalToken.mintAnimal(msg.sender, StakedDairy[landId][i].animalId, 1);
                AnimalsL.GrownAnimal memory _prevAnimal = landCodex.grownAnimal(StakedDairy[landId][i].animalId);
                rewardForAnimal(_prevAnimal, cycle, storages.eggCapacity, storages.diaryCapacity);
            }
            StakedDairy[landId][i].animalId = _animal.animalId;
            StakedDairy[landId][i].depositDate = block.timestamp;
            StakedDairy[landId][i].lastClaim = 0;
            animalToken.burnAnimal(msg.sender, _animal.animalId, 1);
        }
    }

    function claimProductions(uint landId) external nonReentrant isOwned(landId) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Dairies memory dairy = landCodex.dairies(stats.DairiesTier);
        ILand.Storages memory storages = landCodex.storages(stats.StorageBuildingsTier);
        AnimalsL.GrownAnimal memory _animal;
        for (uint slot = 0; slot <= dairy.maxProductionSimultaneously; slot++) {
            if (StakedDairy[landId][slot].animalId == 0) continue;
            uint cycle = calculateCycle(landId, slot);
            if (_animal.animalId != StakedDairy[landId][slot].animalId) {
                _animal = landCodex.grownAnimal(StakedDairy[landId][slot].animalId);
            }
            StakedDairy[landId][slot].lastClaim = block.timestamp;

            rewardForAnimal(_animal, cycle, storages.eggCapacity, storages.diaryCapacity);
        }
    }

    // withdraw
    function withdrawAnimalsFromDairy(uint landId, uint[] memory animalIdsForSlots) external nonReentrant isOwned(landId) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Dairies memory dairy = landCodex.dairies(stats.DairiesTier);
        ILand.Storages memory storages = landCodex.storages(stats.StorageBuildingsTier);
        require(animalIdsForSlots.length <= dairy.maxProductionSimultaneously, "l");
        AnimalsL.GrownAnimal memory _prevAnimal;
        for (uint i = 0; i < animalIdsForSlots.length; i++) {

            if (animalIdsForSlots[i] == 0) continue;

            if (StakedDairy[landId][i].animalId != 0) {
                uint cycle = calculateCycle(landId, i);
                _prevAnimal = landCodex.grownAnimal(StakedDairy[landId][i].animalId);
                StakedDairy[landId][i].lastClaim = block.timestamp;
                animalToken.mintAnimal(msg.sender, StakedDairy[landId][i].animalId, 1);
                rewardForAnimal(_prevAnimal, cycle, storages.eggCapacity, storages.diaryCapacity);
                StakedDairy[landId][i].animalId = 0;
            }
        }
    }

    function calculateCycle(uint landId, uint slot) internal view returns (uint cycle) {
        uint depositDate = StakedDairy[landId][slot].depositDate;
        uint lastClaim = StakedDairy[landId][slot].lastClaim;
        if (lastClaim == 0) {
            cycle = (block.timestamp - depositDate) / DairyProdTime;
        } else {
            cycle = (block.timestamp - lastClaim) / DairyProdTime;
        }
    }

    function rewardForAnimal(AnimalsL.GrownAnimal memory animal, uint cycle, uint eggLimit, uint dairyLimit) internal {
        if (cycle > 0) {
            for (uint i = 0; i < animal.dailyProductions.cookingItems.length; i++) {
                ICookingItem.List item = animal.dailyProductions.cookingItems[i].id;
                uint amount = animal.dailyProductions.cookingItems[i].amount * cycle;
                if (item == ICookingItem.List.Egg) {
                    if (amount > eggLimit) amount = eggLimit;
                }
                if (item == ICookingItem.List.Milk) {
                    if (amount > dairyLimit) amount = dairyLimit;
                }

                //ICookingItem.List
                cookingItemToken.rewardCookingItem(msg.sender,
                    item,
                    amount
                );
            }
        }
    }

    function stakedDairyAnimals(uint landId) external view returns (DairyAnimal[] memory){
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Dairies memory dairy = landCodex.dairies(stats.DairiesTier);
        DairyAnimal[] memory result = new DairyAnimal[](dairy.maxProductionSimultaneously);
        for (uint i = 1; i < dairy.maxProductionSimultaneously;) {
            result[i - 1] = StakedDairy[landId][i];
        unchecked{i++;}
        }
        return result;
    }
}
