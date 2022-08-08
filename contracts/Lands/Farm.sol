import {ILand, Seed} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";

/*
    You can plant seeds and grow them / increase farm spots to plant more
*/
pragma solidity ^0.8.0;

contract Farm is LandUtils {

    // land id- plot - progress
    mapping(uint => mapping(uint => ILand.Plot)) public FarmPlots;

    function plant(uint landId, uint plot, uint seedToPlant) external nonReentrant isOwned(landId) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Farm memory farm = landCodex.farm(stats.FarmsTier);

        require(plot <= farm.usablePlots, "l");

        ILand.Seed memory _seed = landCodex.seed(seedToPlant);

        require(LandExperiences[landId] >= _seed.requiredLandExperience, "t");

        require(FarmPlots[landId][plot].isAvailable, "a");
        seedToken.burnSeed(msg.sender, seedToPlant, 1);
        FarmPlots[landId][plot].seedId = seedToPlant;
        FarmPlots[landId][plot].endTime = block.timestamp + _seed.growTime;
        FarmPlots[landId][plot].isAvailable = false;
    }

    function harvest(uint landId, uint[] memory plots) external nonReentrant isOwned(landId) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Farm memory farm = landCodex.farm(stats.FarmsTier);
        ILand.Seed memory _seed;
        for (uint i = 0; i < farm.usablePlots; i++) {
            require(!FarmPlots[landId][i].isAvailable, "i");
            require(block.timestamp >= FarmPlots[landId][i].endTime, "e");

            FarmPlots[landId][i].isAvailable = true;

            // works like cache. if its same as before, dont call again
            if (_seed.id != FarmPlots[landId][i].seedId) {
                _seed = landCodex.seed(FarmPlots[landId][i].seedId);
            }

            if (_seed.alchemyReward.min > 0) {
                uint roll = rng.dn(
                    _seed.growTime + block.number + (i * 100),
                    _seed.alchemyReward.max - _seed.alchemyReward.min) + _seed.alchemyReward.min;
                alchemyItemToken.rewardAlchemyItem(msg.sender, _seed.alchemyReward.id, roll);
            } else if (_seed.cookingReward.min > 0) {
                uint roll = rng.dn(
                    _seed.growTime + block.number + 1881 + (i * 300),
                    _seed.cookingReward.max - _seed.cookingReward.min) + _seed.cookingReward.min;
                cookingItemToken.rewardCookingItem(msg.sender, _seed.cookingReward.id, roll);
            }


        }
    }
}
