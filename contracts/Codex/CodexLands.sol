import {AnimalsL, ILand, ICookingItem} from "../Interfaces/Lands/ILand.sol";
import {ICraftingMaterials} from "../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
import {IAlchemyItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
import {BasicRequirement} from "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexLands {

    string constant public index = "Codex";
    string constant public class = "Lands";
    string constant public version = "0.0.1";
    uint constant public indexOfGrownAnimals = 10000;
    uint constant public maxLandLevel = 10;
    uint constant public maxPoultryLevel = 10;
    uint constant public maxBarnLevel = 10;
    uint constant public maxStorageLevel = 10;
    uint constant public maxMillLevel = 10;
    uint constant public maxFarmLevel = 10;
    uint constant public maxWaterLevel = 10;
    uint constant public maxSlaughterhouseLevel = 10;
    uint constant public maxDairyLevel = 10;

    // utils
    function generateRequirement(uint length) internal pure returns (BasicRequirement[] memory){
        return new BasicRequirement[](length);
    }


    // lands
    function land(uint tier) external view returns (ILand.GeneralBuilding memory _land){
        require(tier > 0 && tier <= maxLandLevel, "t");
        _land.level = tier;
        _land.upgradeReqs = landBuildReqs(tier + 1);
        _land.maxLevel = maxLandLevel;
    }

    function poultry(uint tier) external view returns (ILand.Poultry memory _poultry){
        require(tier > 0 && tier <= maxPoultryLevel, "t");
        _poultry.building.level = tier;
        _poultry.building.maxLevel = maxPoultryLevel;
        _poultry.building.bonusChance = 5 + (tier * 2);
        _poultry.building.upgradeReqs = poultryBuildReqs(tier + 1);
        _poultry.capacity = 0 + (tier * 3);
    }

    function barnHouse(uint tier) external view returns (ILand.BarnHouse memory _barnHouse){
        require(tier > 0 && tier <= maxBarnLevel, "t");
        _barnHouse.building.level = tier;
        _barnHouse.building.maxLevel = maxBarnLevel;
        _barnHouse.building.bonusChance = 5 + (tier * 2);
        _barnHouse.building.upgradeReqs = barnBuilding(tier + 1);
        _barnHouse.capacity = 0 + (tier * 3);
    }

    function storages(uint tier) external view returns (ILand.Storages memory _storageBuilding){
        require(tier <= maxStorageLevel, "t");
        _storageBuilding.building.level = tier;
        _storageBuilding.building.maxLevel = maxStorageLevel;
        _storageBuilding.building.bonusChance = 5 + (tier * 2);
        _storageBuilding.building.upgradeReqs = storageBuilding(tier + 1);
        _storageBuilding.diaryCapacity = 5 + (tier * 2);
        _storageBuilding.eggCapacity = 5 + (tier * 2);
    }

    function mill(uint tier) external view returns (ILand.Mill memory _mill){
        require(tier <= maxMillLevel, "t");
        _mill.building.level = tier;
        _mill.building.maxLevel = maxMillLevel;
        _mill.building.bonusChance = 5 + (tier * 2);
        _mill.maxProcessSimultaneously = 3 + (tier * 2);
        _mill.building.upgradeReqs = millBuilding(tier + 1);
        _mill.processTimePerCrop = (15 minutes) - ((tier * 2) * 30 seconds);
    }

    function farm(uint tier) external view returns (ILand.Farm memory _farm){
        require(tier > 0 && tier <= maxFarmLevel, "t");
        _farm.building.level = tier;
        _farm.building.maxLevel = maxFarmLevel;
        _farm.building.bonusChance = 5 + (tier * 2);
        _farm.building.upgradeReqs = farmBuilding(tier + 1);
        _farm.usablePlots = 3 + (tier * 3);
    }

    function waterTower(uint tier) external view returns (ILand.WaterTower memory _waterTower){
        require(tier <= maxWaterLevel, "t");
        _waterTower.building.level = tier;
        _waterTower.building.maxLevel = maxWaterLevel;
        _waterTower.building.bonusChance = 5 + (tier * 2);
        _waterTower.building.upgradeReqs = waterBuilding(tier + 1);
        _waterTower.dailyWaterReward = 10 + ((10 * tier) / 2);
    }

    function slaughterhouse(uint tier) external view returns (ILand.Slaughterhouse memory _slaughterhouse){
        require(tier <= maxSlaughterhouseLevel, "t");
        _slaughterhouse.building.level = tier;
        _slaughterhouse.building.maxLevel = maxSlaughterhouseLevel;
        _slaughterhouse.building.bonusChance = 5 + (tier * 2);
        _slaughterhouse.building.upgradeReqs = slaughterhouseBuilding(tier + 1);
        _slaughterhouse.maxProductionSimultaneously = 5 + (tier * 2);
    }

    function dairies(uint tier) external view returns (ILand.Dairies memory _dairies){
        require(tier <= maxDairyLevel, "t");
        _dairies.building.level = tier;
        _dairies.building.maxLevel = maxDairyLevel;
        _dairies.building.bonusChance = 5 + (tier * 2);
        _dairies.building.upgradeReqs = dairiesBuilding(tier + 1);
        _dairies.maxProductionSimultaneously = 3 + (tier * 3);
    }

    // upgrades

    function landBuildReqs(uint tier) public pure returns (ILand.BuildingRequirement memory _reqs) {
        require(tier > 1, "t");
        _reqs.isValid = true;

        //        _reqs.requiredMiscItems = generateRequirement(1);
        //        _reqs.requiredMiscItems[0].id = 1;
        //        _reqs.requiredMiscItems[0].amount = 100;
        //
        //        _reqs.requiredCookingItems = generateRequirement(1);
        //        _reqs.requiredCookingItems[0].id = 1;
        //        _reqs.requiredCookingItems[0].amount = 100;
        //
        //        _reqs.requiredAlchemyItems = generateRequirement(1);
        //        _reqs.requiredAlchemyItems[0].id = 1;
        //        _reqs.requiredAlchemyItems[0].amount = 100;
        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 3) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.SOFT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.TIN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 4) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.AGED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.IRON_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 5) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.HARD_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.SILVER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 6) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GOLD_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 7) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 8) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ELDER_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 9) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 10) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.EBONY_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        } else {
            _reqs.isValid = false;
        }
    }

    function poultryBuildReqs(uint tier) public pure returns (ILand.BuildingRequirement memory _reqs) {
        require(tier > 1, "t");
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 3) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.SOFT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.TIN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 4) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.AGED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.IRON_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 5) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.HARD_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.SILVER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 6) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GOLD_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 7) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 8) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ELDER_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 9) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 10) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.EBONY_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        } else {
            _reqs.isValid = false;
        }
    }

    function barnBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        require(tier > 1, "t");
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 3) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.SOFT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.TIN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 4) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.AGED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.IRON_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 5) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.HARD_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.SILVER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 6) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GOLD_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 7) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 8) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ELDER_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 9) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 10) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.EBONY_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        } else {
            _reqs.isValid = false;
        }
    }

    function storageBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 3) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.SOFT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.TIN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 4) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.AGED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.IRON_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 5) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.HARD_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.SILVER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 6) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GOLD_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 7) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 8) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ELDER_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 9) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 10) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.EBONY_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        } else {
            _reqs.isValid = false;
        }
    }

    function millBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 3) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.SOFT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.TIN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 4) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.AGED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.IRON_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 5) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.HARD_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.SILVER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 6) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GOLD_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 7) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 8) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ELDER_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 9) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 10) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.EBONY_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        } else {
            _reqs.isValid = false;
        }
    }

    function farmBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 3) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.SOFT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.TIN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 4) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.AGED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.IRON_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 5) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.HARD_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.SILVER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 6) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GOLD_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 7) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 8) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ELDER_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 9) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 10) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.EBONY_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        } else {
            _reqs.isValid = false;
        }
    }

    function waterBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 3) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.SOFT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.TIN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 4) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.AGED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.IRON_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 5) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.HARD_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.SILVER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 6) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GOLD_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 7) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 8) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ELDER_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 9) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 10) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.EBONY_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        } else {
            _reqs.isValid = false;
        }
    }

    function slaughterhouseBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 3) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.SOFT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.TIN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 4) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.AGED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.IRON_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 5) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.HARD_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.SILVER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 6) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GOLD_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 7) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 8) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ELDER_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 9) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 10) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.EBONY_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        } else {
            _reqs.isValid = false;
        }
    }

    function dairiesBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 3) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.SOFT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.TIN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 4) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.AGED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.IRON_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 5) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.HARD_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.SILVER_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 6) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.PETRIFIED_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GOLD_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 7) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.RED_OAK_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 8) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ELDER_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 9) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.ANCIENT_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }

        else if (tier == 10) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.EBONY_WOOD);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        } else {
            _reqs.isValid = false;
        }
    }

    // view & id stuff

    function seedIDs() external view returns (uint[] memory){
        uint[] memory result = new uint[](18);
        for (uint i = 0; i < 18; i++) {
            result[i] = i + 1;
        }
        return result;
    }

    function seed(uint _id) public pure returns (ILand.Seed memory) {
        if (_id == 1) {
            return Dill();
        } else if (_id == 2) {
            return Rucola();
        } else if (_id == 3) {
            return Basilicum();
        } else if (_id == 4) {
            return Manaflower();
        } else if (_id == 5) {
            return FireFlower();
        } else if (_id == 6) {
            return Parsley();
        } else if (_id == 7) {
            return Shadowberry();
        } else if (_id == 8) {
            return Raptorherb();
        } else if (_id == 9) {
            return Dragonherb();
        } else if (_id == 10) {
            return Shadowflower();
        } else if (_id == 11) {
            return Mistyflower();
        } else if (_id == 12) {
            return Green_Poisonous_Mushroom();
        } else if (_id == 13) {
            return Red_Poisonous_Mushroom();
        } else if (_id == 14) {
            return Mana_Mushroom();
        } else if (_id == 15) {
            return Demon_Mushroom();
        } else if (_id == 16) {
            return Raindrop_Mushroom();
        } else if (_id == 17) {
            return Bloodberry();
        } else if (_id == 18) {
            return King_Flower();
        } else if (_id == 19) {
            return Wood_Moss();
        } else if (_id == 20) {
            return Ancient_Flower();
        } else if (_id == 21) {
            return Fellherb();
        } else if (_id == 22) {
            return Wild_Rose();
        } else if (_id == 23) {
            return Red_Rose();
        } else if (_id == 24) {
            return Dragon_Flower();
        } else if (_id == 25) {
            return Golden_Flower();
        } else if (_id == 26) {
            return Stinky_Flower();
        } else if (_id == 27) {
            return Apple();
        } else if (_id == 28) {
            return Carrot();
        } else if (_id == 29) {
            return Cabbage();
        } else if (_id == 30) {
            return Bell_Pepper();
        } else if (_id == 31) {
            return Chili_Pepper();
        } else if (_id == 32) {
            return Tomato();
        } else if (_id == 33) {
            return Onion();
        } else if (_id == 34) {
            return Corn();
        } else if (_id == 35) {
            return Mushroom();
        } else if (_id == 36) {
            return Turnip();
        } else if (_id == 37) {
            return Grapes();
        } else if (_id == 38) {
            return Black_Grapes();
        } else if (_id == 39) {
            return Red_Grapes();
        } else if (_id == 40) {
            return Strawberry();
        } else if (_id == 41) {
            return Cherry();
        } else if (_id == 42) {
            return Cacao();
        } else if (_id == 43) {
            return Banana();
        } else if (_id == 44) {
            return Potato();
        } else if (_id == 45) {
            return Wheat();
        }
        revert("wrong");
    }

    function babyAnimalIDs() external view returns (uint[] memory){
        uint[] memory result = new uint[](8);
        for (uint i = 0; i < 8; i++) {
            result[i] = i + 1;
        }
        return result;
    }

    function babyAnimal(uint _id) public pure returns (AnimalsL.BabyAnimal memory _animal) {
        if (_id == 1) {
            return Lamb();
        } else if (_id == 2) {
            return Kid();
        } else if (_id == 3) {
            return BabyPig();
        } else if (_id == 4) {
            return Calf();
        } else if (_id == 5) {
            return Chick();
        } else if (_id == 6) {
            return Duckling();
        } else if (_id == 7) {
            return Gosling();
        } else if (_id == 8) {
            return Poult();
        }
        revert("wrong");
    }

    function grownAnimalIDs() external view returns (uint[] memory){
        uint[] memory result = new uint[](8);
        for (uint i = 0; i < 8; i++) {
            result[i] = i + 1 + indexOfGrownAnimals;
        }
        return result;
    }

    function grownAnimal(uint _id) public pure returns (AnimalsL.GrownAnimal memory _animal) {
        if (_id == 1 + indexOfGrownAnimals) {
            return Sheep();
        } else if (_id == 2 + indexOfGrownAnimals) {
            return Goat();
        } else if (_id == 3 + indexOfGrownAnimals) {
            return Pig();
        } else if (_id == 4 + indexOfGrownAnimals) {
            return Cow();
        } else if (_id == 5 + indexOfGrownAnimals) {
            return Chicken();
        } else if (_id == 6 + indexOfGrownAnimals) {
            return Duck();
        } else if (_id == 7 + indexOfGrownAnimals) {
            return Goose();
        } else if (_id == 8 + indexOfGrownAnimals) {
            return Turkey();
        }

        revert("wrong");
    }

    // baby animals
    function Lamb() public pure returns (AnimalsL.BabyAnimal memory _animal) {
        _animal.animalId = 1;
        _animal.building = AnimalsL.AnimalPlace.BARN;
        _animal.growthTime = 2 days;
        _animal.becomes = indexOfGrownAnimals + 1;
        _animal.buyPrice = 75e18;
        _animal.minMainBuildingLevel = 1;
    }

    function Kid() public pure returns (AnimalsL.BabyAnimal memory _animal) {
        _animal.animalId = 2;
        _animal.building = AnimalsL.AnimalPlace.BARN;
        _animal.growthTime = 2 days;
        _animal.becomes = indexOfGrownAnimals + 2;
        _animal.buyPrice = 125e18;
        _animal.minMainBuildingLevel = 2;
    }

    function BabyPig() public pure returns (AnimalsL.BabyAnimal memory _animal) {
        _animal.animalId = 3;
        _animal.building = AnimalsL.AnimalPlace.BARN;
        _animal.growthTime = 1 days;
        _animal.becomes = indexOfGrownAnimals + 3;
        _animal.buyPrice = 175e18;
        _animal.minMainBuildingLevel = 3;
    }

    function Calf() public pure returns (AnimalsL.BabyAnimal memory _animal) {
        _animal.animalId = 4;
        _animal.building = AnimalsL.AnimalPlace.BARN;
        _animal.growthTime = 3 days;
        _animal.becomes = indexOfGrownAnimals + 4;
        _animal.buyPrice = 250e18;
        _animal.minMainBuildingLevel = 4;
    }

    function Chick() public pure returns (AnimalsL.BabyAnimal memory _animal) {
        _animal.animalId = 5;
        _animal.building = AnimalsL.AnimalPlace.POULTRY;
        _animal.growthTime = 1 days;
        _animal.becomes = indexOfGrownAnimals + 5;
        _animal.buyPrice = 25e18;
        _animal.minMainBuildingLevel = 1;
    }

    function Duckling() public pure returns (AnimalsL.BabyAnimal memory _animal) {
        _animal.animalId = 6;
        _animal.building = AnimalsL.AnimalPlace.POULTRY;
        _animal.growthTime = 2 days;
        _animal.becomes = indexOfGrownAnimals + 6;
        _animal.buyPrice = 50e18;
        _animal.minMainBuildingLevel = 2;
    }

    function Gosling() public pure returns (AnimalsL.BabyAnimal memory _animal) {
        _animal.animalId = 7;
        _animal.building = AnimalsL.AnimalPlace.POULTRY;
        _animal.growthTime = 60 hours;
        _animal.becomes = indexOfGrownAnimals + 7;
        _animal.buyPrice = 100e18;
        _animal.minMainBuildingLevel = 3;
    }

    function Poult() public pure returns (AnimalsL.BabyAnimal memory _animal) {
        _animal.animalId = 8;
        _animal.building = AnimalsL.AnimalPlace.POULTRY;
        _animal.growthTime = 3 days;
        _animal.becomes = indexOfGrownAnimals + 8;
        _animal.buyPrice = 250e18;
        _animal.minMainBuildingLevel = 4;
    }


    function generateArrayCooking(uint len) internal pure returns (ILand.CookingItemReward[] memory){
        return new ILand.CookingItemReward[](len);
    }

    function generateArrayAlchemy(uint len) internal pure returns (ILand.AlchemyItemReward[] memory){
        return new ILand.AlchemyItemReward[](len);
    }

    // grown

    function Sheep() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 1 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 1;
        _animal.minSecondaryBuildingLevel = 1;
        _animal.dailyProductions.cookingItems = generateArrayCooking(1);

        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Milk;
        _animal.dailyProductions.cookingItems[0].amount = 2;

        _animal.harvestOnKill.alchemyItems = generateArrayAlchemy(1);
        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 2;
        _animal.harvestOnKill.cookingItems = generateArrayCooking(2);
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 3;
        _animal.harvestOnKill.cookingItems[1].id = ICookingItem.List.Steak;
        _animal.harvestOnKill.cookingItems[1].amount = 1;
    }

    function Goat() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 2 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 2;
        _animal.minSecondaryBuildingLevel = 2;

        _animal.dailyProductions.cookingItems = generateArrayCooking(1);

        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Milk;
        _animal.dailyProductions.cookingItems[0].amount = 4;

        _animal.harvestOnKill.alchemyItems = generateArrayAlchemy(1);
        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 2;
        _animal.harvestOnKill.cookingItems = generateArrayCooking(2);
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 7;
        _animal.harvestOnKill.cookingItems[1].id = ICookingItem.List.Steak;
        _animal.harvestOnKill.cookingItems[1].amount = 2;
    }

    function Pig() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 3 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 3;
        _animal.minSecondaryBuildingLevel = 3;

        _animal.harvestOnKill.alchemyItems = generateArrayAlchemy(1);
        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 2;
        _animal.harvestOnKill.cookingItems = generateArrayCooking(2);
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 7;
        _animal.harvestOnKill.cookingItems[1].id = ICookingItem.List.Steak;
        _animal.harvestOnKill.cookingItems[1].amount = 3;
    }

    function Cow() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 4 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 4;
        _animal.minSecondaryBuildingLevel = 4;

        _animal.dailyProductions.cookingItems = generateArrayCooking(1);

        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Milk;
        _animal.dailyProductions.cookingItems[0].amount = 8;

        _animal.harvestOnKill.alchemyItems = generateArrayAlchemy(1);
        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 2;
        _animal.harvestOnKill.cookingItems = generateArrayCooking(2);
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 10;
        _animal.harvestOnKill.cookingItems[1].id = ICookingItem.List.Steak;
        _animal.harvestOnKill.cookingItems[1].amount = 6;
    }

    function Chicken() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 5 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 1;
        _animal.minSecondaryBuildingLevel = 1;

        _animal.dailyProductions.cookingItems = generateArrayCooking(1);
        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Egg;
        _animal.dailyProductions.cookingItems[0].amount = 2;

        _animal.harvestOnKill.alchemyItems = generateArrayAlchemy(1);
        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 1;
        _animal.harvestOnKill.cookingItems = generateArrayCooking(1);
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Raw_White_Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 3;
    }

    function Duck() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 6 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 2;
        _animal.minSecondaryBuildingLevel = 2;

        _animal.dailyProductions.cookingItems = generateArrayCooking(1);
        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Egg;
        _animal.dailyProductions.cookingItems[0].amount = 4;

        _animal.harvestOnKill.alchemyItems = generateArrayAlchemy(1);
        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 1;
        _animal.harvestOnKill.cookingItems = generateArrayCooking(1);
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Raw_White_Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 5;
    }

    function Goose() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 7 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 3;
        _animal.minSecondaryBuildingLevel = 3;

        _animal.dailyProductions.cookingItems = generateArrayCooking(1);
        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Egg;
        _animal.dailyProductions.cookingItems[0].amount = 7;

        _animal.harvestOnKill.alchemyItems = generateArrayAlchemy(1);
        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 1;
        _animal.harvestOnKill.cookingItems = generateArrayCooking(1);
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Raw_White_Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 7;
    }

    function Turkey() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 8 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 4;
        _animal.minSecondaryBuildingLevel = 4;

        _animal.dailyProductions.cookingItems = generateArrayCooking(1);
        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Egg;
        _animal.dailyProductions.cookingItems[0].amount = 10;

        _animal.harvestOnKill.alchemyItems = generateArrayAlchemy(1);
        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 1;
        _animal.harvestOnKill.cookingItems = generateArrayCooking(1);
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Raw_White_Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 10;
    }

    // seeds
    function Dill() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 6 hours;
        // reward IAlchemyItem.List.Dill,
        _seed.buyPrice = 1e18;
        //@param id is alchemy item id
        _seed.alchemyReward.id = IAlchemyItem.List.Dill;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        // example
        _seed.requiredLandExperience = 0;
    }

    function Rucola() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 2;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Rucola;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Basilicum() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 3;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Basilicum;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Manaflower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 4;
        _seed.growTime = 10 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Manaflower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function FireFlower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 5;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.FireFlower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Parsley() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 6;
        _seed.growTime = 6 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Parsley;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Shadowberry() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 7;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Shadowberry;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 2;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Raptorherb() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 16;
        _seed.growTime = 16 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Raptorherb;
        _seed.alchemyReward.min = 2;
        _seed.alchemyReward.max = 4;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Dragonherb() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 9;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Dragonherb;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Shadowflower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 10;
        _seed.growTime = 18 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Shadowflower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Mistyflower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 11;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Mistyflower;
        _seed.alchemyReward.min = 2;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Green_Poisonous_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 12;
        _seed.growTime = 6 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Green_Poisonous_Mushroom;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Red_Poisonous_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 13;
        _seed.growTime = 6 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Red_Poisonous_Mushroom;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Mana_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 14;
        _seed.growTime = 16 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.Mana_Mushroom;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Demon_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 15;
        _seed.growTime = 16 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.Demon_Mushroom;
        _seed.alchemyReward.min = 2;
        _seed.alchemyReward.max = 4;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Raindrop_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 16;
        _seed.growTime = 16 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.Raindrop_Mushroom;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Bloodberry() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 17;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.Bloodberry;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function King_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 18;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.King_Flower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Wood_Moss() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 19;
        _seed.growTime = 6 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.Wood_Moss;
        _seed.alchemyReward.min = 2;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Ancient_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 20;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.Ancient_Flower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 2;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Fellherb() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 21;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.Fellherb;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Wild_Rose() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 22;
        _seed.growTime = 6 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.Wild_Rose;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Red_Rose() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 23;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;

        _seed.alchemyReward.id = IAlchemyItem.List.Red_Rose;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Dragon_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 24;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Dragon_Flower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Golden_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 25;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Golden_Flower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Stinky_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 26;
        _seed.growTime = 6 hours;
        _seed.buyPrice = 1e18;
        _seed.alchemyReward.id = IAlchemyItem.List.Stinky_Flower;
        _seed.alchemyReward.min = 2;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Apple() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 27;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Apple;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Carrot() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 28;
        _seed.growTime = 18 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Carrot;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Cabbage() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 29;
        _seed.growTime = 18 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Cabbage;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Bell_Pepper() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 30;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Bell_Pepper;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Chili_Pepper() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 31;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Chili_Pepper;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Tomato() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 32;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Tomato;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Onion() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 33;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Onion;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Corn() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 34;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Corn;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 35;
        _seed.growTime = 18 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Mushroom;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 2;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Turnip() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 36;
        _seed.growTime = 24 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Turnip;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 2;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Grapes() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 37;
        _seed.growTime = 24 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Grapes;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 2;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Black_Grapes() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 38;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Black_Grapes;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Red_Grapes() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 39;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Red_Grapes;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Strawberry() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 40;
        _seed.growTime = 12 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Strawberry;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Cherry() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 41;
        _seed.growTime = 24 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Cherry;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 2;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Cacao() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 42;
        _seed.growTime = 20 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Cacao;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 2;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Banana() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 43;
        _seed.growTime = 24 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Banana;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 2;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Potato() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 44;
        _seed.growTime = 20 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Potato;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Wheat() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 45;
        _seed.growTime = 8 hours;
        _seed.buyPrice = 1e18;
        _seed.cookingReward.id = ICookingItem.List.Wheat;
        _seed.cookingReward.min = 1;
        _seed.cookingReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }
}