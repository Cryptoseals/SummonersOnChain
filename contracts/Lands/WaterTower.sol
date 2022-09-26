import {ILand, AnimalsL} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";
import {Animals} from "../NonFungibles/Animals.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";

pragma solidity ^0.8.0;

// Increases speed of farm production / produces water
contract WaterTower is LandUtils {
    mapping(uint256 => uint256) public WaterTowerCooldown;

    function claimWater(uint256 landId)
        external
        nonReentrant
        isOwned(landId, msg.sender)
    {
        require(block.timestamp >= WaterTowerCooldown[landId], "early");
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.WaterTower memory waterTower = landCodex.waterTower(
            stats.WaterTowersTier
        );
        uint256 roll = rng.d100(block.number + uint160(msg.sender));
        WaterTowerCooldown[landId] = block.timestamp + 1 days;
        cookingItemToken.rewardCookingItem(
            msg.sender,
            ICookingItem.List.Water,
            roll <= waterTower.building.bonusChance
                ? waterTower.dailyWaterReward +
                    (waterTower.dailyWaterReward * 20) /
                    100
                : waterTower.dailyWaterReward
        );
    }
}
