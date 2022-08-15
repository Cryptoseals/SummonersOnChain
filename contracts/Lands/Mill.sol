pragma solidity ^0.8.0;

import {ReentrancyGuardUpgradeable} from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import {ILand, AnimalsL} from "../Interfaces/Lands/ILand.sol";
import {LandUtils} from "./LandUtils.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";
import {EnumerableSetUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/structs/EnumerableSetUpgradeable.sol";

// Process Wheat/Corn to Flour
contract Mill is LandUtils {
    using EnumerableSetUpgradeable for EnumerableSetUpgradeable.UintSet;

    struct GrainProcessing {
        ICookingItem.List rewardMaterial;
        uint amount;
        uint when;
        uint startingDate;
        address who;
        bool isClaimed;
    }

    uint nextProcessId;
    mapping(uint => GrainProcessing) public ActiveProcessings;
    mapping(uint => EnumerableSetUpgradeable.UintSet) LandsActiveProcessings;

    function processGrain(uint landId, ICookingItem.List[] memory grainIds, uint[] memory amounts) external nonReentrant isOwned(landId, msg.sender) {
        require(grainIds.length == amounts.length, "l");

        ILand.LandStatsStruct memory stats = landToken.landStats(landId);
        ILand.Mill memory mill = landCodex.mill(stats.MillsTier);

        uint l = LandsActiveProcessings[landId].values().length;
        require(l <= mill.maxProcessSimultaneously, "o");

        require(mill.processTimePerCrop > 0, "0");


        uint totalFlourReward = 0;
        for (uint i = 0; i < grainIds.length; i++) {
            require(amounts[i] > 0, "0");
            totalFlourReward += amounts[i];
            cookingItemToken.burnCookingItem(msg.sender, grainIds[i], amounts[i]);
        }

        ActiveProcessings[nextProcessId] = GrainProcessing({
        amount : totalFlourReward,
        rewardMaterial : ICookingItem.List.Flour,
        when : block.timestamp + (mill.processTimePerCrop * totalFlourReward),
        who : msg.sender,
        isClaimed : false,
        startingDate : block.timestamp
        });

        LandsActiveProcessings[landId].add(nextProcessId);

        nextProcessId++;
    }

    function claimGrain(uint landId, uint[] memory processIds) external nonReentrant isOwned(landId, msg.sender) {
        uint totalFlourReward = 0;
        for (uint i = 0; i < processIds.length; i++) {
            GrainProcessing memory process = ActiveProcessings[processIds[i]];
            require(process.isClaimed == false, "claimed");
            require(process.who == msg.sender, "unauth");
            require(process.when <= block.timestamp, "time");

            totalFlourReward += process.amount;
            LandsActiveProcessings[landId].remove(processIds[i]);
            ActiveProcessings[processIds[i]].isClaimed = true;
        }
        cookingItemToken.rewardCookingItem(msg.sender, ICookingItem.List.Flour,
            totalFlourReward);
    }

    //    function partialGrainClaimProcess(uint landId, uint processId, uint amount) external nonReentrant isOwned(landId,msg.sender) {
    //        require(ActiveProcessings[processId].isClaimed == false, "claimed");
    //        require(ActiveProcessings[processId].who == msg.sender, "unauth");
    //        require(amount <= ActiveProcessings[processId].amount, "scam?");
    //
    //        uint timeRequiredPerMaterial = (ActiveProcessings[processId].when - ActiveProcessings[processId].startingDate) / ActiveProcessings[processId].amount;
    //        require(block.timestamp > ActiveProcessings[processId].startingDate + timeRequiredPerMaterial * amount, "early");
    //
    //        ActiveProcessings[processId].startingDate += timeRequiredPerMaterial * amount;
    //        ActiveProcessings[processId].amount -= amount;
    //
    //        if (ActiveProcessings[processId].amount == 0) {
    //            LandsActiveProcessings[landId].remove(processId);
    //        }
    //        cookingItemToken.rewardCookingItem(msg.sender, ICookingItem.List.Flour,
    //            ActiveProcessings[processId].amount);
    //    }
}
