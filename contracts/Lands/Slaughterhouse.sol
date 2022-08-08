import {ILand, AnimalsL} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";
import {Animals} from "../NonFungibles/Animals.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";

pragma solidity ^0.8.0;

// Check a grown animal, burn animal and harvest their meat & organs.
contract Slaughterhouse is LandUtils {

    // land -> cooldown
    mapping(uint => uint) public SlaughterhouseCooldown;

    function killAnimal(uint landId, uint animalId, uint amount) external nonReentrant isOwned(landId) {
        require(block.timestamp >= SlaughterhouseCooldown[landId], "early");
        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Slaughterhouse memory slaughterhouse = landCodex.slaughterhouse(stats.SlaughterhousesTier);
        require(amount <= slaughterhouse.maxProductionSimultaneously, "l");
        SlaughterhouseCooldown[landId] = block.timestamp + (amount * slaughterhouse.cooldownPerAnimal);
        AnimalsL.GrownAnimal memory animal = landCodex.grownAnimal(animalId);

        animalToken.burnAnimal(msg.sender, animalId, amount);
        for (uint i = 0; i < animal.harvestOnKill.cookingItems.length; i++) {
            //ICookingItem.List
            cookingItemToken.rewardCookingItem(msg.sender,
                animal.harvestOnKill.cookingItems[i].id,
                animal.harvestOnKill.cookingItems[i].amount
            );
        }

    }

}
