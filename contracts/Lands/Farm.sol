import {ILand, Seed} from "../Interfaces/Lands/ILand.sol";
import {LandUtils, INavigator} from "./LandUtils.sol";
import {IFungibleInGameToken} from "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";

/*
    You can plant seeds and grow them / increase farm spots to plant more
*/
pragma solidity ^0.8.0;

contract Farm is LandUtils {

    // land id- plot - progress
    mapping(uint => mapping(uint => ILand.Plot)) public FarmPlots;

    function plant(uint landId, uint plot, uint seedToPlant) external nonReentrant isOwned(landId, msg.sender) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Farm memory farm = landCodex.farm(stats.FarmsTier);

        require(plot <= farm.usablePlots, "l");

        ILand.Seed memory _seed = landCodex.seed(seedToPlant);

        require(LandExperiences[landId] >= _seed.requiredLandExperience, "t");

        require(!FarmPlots[landId][plot].isAvailable, "a");
        FarmPlots[landId][plot].isAvailable = true;
        seedToken.burnSeed(msg.sender, seedToPlant, 1);
        FarmPlots[landId][plot].seedId = seedToPlant;
        FarmPlots[landId][plot].endTime = block.timestamp + _seed.growTime;
    }

    function harvest(uint landId) external nonReentrant isOwned(landId, msg.sender) {
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Farm memory farm = landCodex.farm(stats.FarmsTier);
        ILand.Seed memory _seed;
        for (uint i = 0; i < farm.usablePlots; i++) {
            if (!FarmPlots[landId][i].isAvailable) continue;
            if (FarmPlots[landId][i].seedId == 0) continue;
            if (block.timestamp < FarmPlots[landId][i].endTime) continue;


            // works like cache. if its same as before, dont call again
            if (_seed.id != FarmPlots[landId][i].seedId) {
                _seed = landCodex.seed(FarmPlots[landId][i].seedId);
            }

            FarmPlots[landId][i].isAvailable = false;
            FarmPlots[landId][i].seedId = 0;

            if (_seed.alchemyReward.min > 0 && uint(_seed.alchemyReward.id) != 0) {
                uint roll = rng.dn(
                    _seed.growTime + block.number + (i * 100),
                    _seed.alchemyReward.max - _seed.alchemyReward.min) + _seed.alchemyReward.min;
                alchemyItemToken.rewardAlchemyItem(msg.sender, _seed.alchemyReward.id, roll);
            }
            if (_seed.cookingReward.min > 0 && uint(_seed.cookingReward.id) != 0) {
                uint roll = rng.dn(
                    _seed.growTime + block.number + 1881 + (i * 300),
                    _seed.cookingReward.max - _seed.cookingReward.min) + _seed.cookingReward.min;
                cookingItemToken.rewardCookingItem(msg.sender, _seed.cookingReward.id, roll);
            }

        }
    }


    function plots(uint landId, uint[] memory plots) external view returns (ILand.Plot[] memory){
        ILand.Plot[] memory result = new ILand.Plot[](plots.length);

        for (uint i = 0; i < plots.length; i++) {
            result[i] = FarmPlots[landId][plots[i]];
        }

        return result;
    }
}
