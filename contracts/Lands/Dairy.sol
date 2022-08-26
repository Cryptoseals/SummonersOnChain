pragma solidity ^0.8.0;

import {ILand, AnimalsL} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";
import {Animals} from "../NonFungibles/Animals.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";

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
    function depositAnimalToDairy(uint landId, uint slot, uint animal) external nonReentrant isOwned(landId, msg.sender) {
        require(animal != 0, "0");
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Dairies memory dairy = landCodex.dairies(stats.DairiesTier);
        require(slot <= dairy.maxProductionSimultaneously, "l");
        ILand.Storages memory storages = landCodex.storages(stats.StorageBuildingsTier);

        AnimalsL.GrownAnimal memory _animal = landCodex.grownAnimal(animal);
        if (StakedDairy[landId][slot].animalId != 0) {
            uint cycle = calculateCycle(landId, slot);
            StakedDairy[landId][slot].lastClaim = block.timestamp;
            animalToken.mintAnimal(msg.sender, StakedDairy[landId][slot].animalId, 1);
            AnimalsL.GrownAnimal memory _prevAnimal = landCodex.grownAnimal(StakedDairy[landId][slot].animalId);
            rewardForAnimal(_prevAnimal, cycle, storages.eggCapacity, storages.diaryCapacity);
        }
        StakedDairy[landId][slot].animalId = _animal.animalId;
        StakedDairy[landId][slot].depositDate = block.timestamp;
        StakedDairy[landId][slot].lastClaim = block.timestamp;
        animalToken.burnAnimal(msg.sender, _animal.animalId, 1);
    }

    function claimProductions(uint landId) external nonReentrant isOwned(landId, msg.sender) {
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
    function withdrawAnimalsFromDairy(uint landId, uint[] memory slots) external nonReentrant isOwned(landId, msg.sender) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Dairies memory dairy = landCodex.dairies(stats.DairiesTier);
        ILand.Storages memory storages = landCodex.storages(stats.StorageBuildingsTier);
        require(slots.length <= dairy.maxProductionSimultaneously, "l");
        AnimalsL.GrownAnimal memory _prevAnimal;
        for (uint i = 0; i < slots.length; i++) {
            if (StakedDairy[landId][slots[i]].animalId != 0) {
                _prevAnimal = landCodex.grownAnimal(StakedDairy[landId][slots[i]].animalId);
                animalToken.mintAnimal(msg.sender, StakedDairy[landId][slots[i]].animalId, 1);
                StakedDairy[landId][slots[i]].animalId = 0;
                uint cycle = calculateCycle(landId, slots[i]);
                StakedDairy[landId][slots[i]].lastClaim = block.timestamp;
                rewardForAnimal(_prevAnimal, cycle, storages.eggCapacity, storages.diaryCapacity);
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
        for (uint i = 0; i < dairy.maxProductionSimultaneously;) {
            result[i] = StakedDairy[landId][i];
        unchecked{i++;}
        }
        return result;
    }
}
