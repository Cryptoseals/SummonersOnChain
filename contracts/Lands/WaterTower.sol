import {ILand, AnimalsL} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";
import {Animals} from "../NonFungibles/Animals.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";

pragma solidity ^0.8.0;

// Increases speed of farm production / produces water
contract WaterTower is LandUtils {

    mapping(uint => uint) public WaterTowerCooldown;

    function claimWater(uint landId) external nonReentrant isOwned(landId) {
        require(block.timestamp >= WaterTowerCooldown[landId], "early");
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.WaterTower memory waterTower = landCodex.waterTower(stats.WaterTowersTier);
        WaterTowerCooldown[landId] = block.timestamp + 1 days;
        cookingItemToken.rewardCookingItem(
            msg.sender,
            ICookingItem.List.Water,
            waterTower.dailyWaterReward
        );
    }

}
