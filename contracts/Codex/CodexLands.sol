import {AnimalsL, ILand, ICookingItem} from "../Interfaces/Lands/ILand.sol";
import {ICraftingMaterials} from "../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
import {IAlchemyItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
pragma solidity ^0.8.0;

contract CodexLands {

    string constant public index = "Codex";
    string constant public class = "Lands";
    string constant public version = "0.0.1";
    uint constant public indexOfGrownAnimals = 10000;
    uint constant public maxLandLevel = 5;
    uint constant public maxPoultryLevel = 5;
    uint constant public maxBarnLevel = 5;
    uint constant public maxStorageLevel = 5;
    uint constant public maxMillLevel = 5;
    uint constant public maxFarmLevel = 5;
    uint constant public maxWaterLevel = 5;
    uint constant public maxSlaughterhouseLevel = 5;
    uint constant public maxDairyLevel = 5;

    // utils
    function generateRequirement(uint length) internal pure returns (ILand.GeneralRequirement[] memory){
        return new ILand.GeneralRequirement[](length);
    }


    // lands
    function land(uint tier) external view returns (ILand.GeneralBuilding memory _land){
        require(tier > 0 && tier <= maxLandLevel, "t");
        _land.level = tier;

        if (tier != maxLandLevel) {
            _land.upgradeReqs = landBuildReqs(tier + 1);
        }
        _land.maxLevel = maxLandLevel;
    }

    function poultry(uint tier) external view returns (ILand.Poultry memory _poultry){
        require(tier > 0 && tier <= maxPoultryLevel, "t");
        _poultry.building.level = tier;
        _poultry.building.maxLevel = maxPoultryLevel;
        _poultry.building.bonusChance = 5 * (tier * 2);
        if (tier != maxPoultryLevel) {
            _poultry.building.upgradeReqs = poultryBuildReqs(tier + 1);
        }
        _poultry.capacity = 5 + (tier * 2);
    }

    function barnHouse(uint tier) external view returns (ILand.BarnHouse memory _barnHouse){
        require(tier > 0 && tier <= maxBarnLevel, "t");
        _barnHouse.building.level = tier;
        _barnHouse.building.maxLevel = maxBarnLevel;
        _barnHouse.building.bonusChance = 5 * (tier * 2);
        if (tier != maxBarnLevel) {
            _barnHouse.building.upgradeReqs = barnBuilding(tier + 1);
        }
        _barnHouse.capacity = 5 + (tier * 2);
    }

    function storages(uint tier) external view returns (ILand.Storages memory _storageBuilding){
        require(tier > 0 && tier <= maxStorageLevel, "t");
        _storageBuilding.building.level = tier;
        _storageBuilding.building.maxLevel = maxStorageLevel;
        _storageBuilding.building.bonusChance = 5 * (tier * 2);
        if (tier != maxStorageLevel) {
            _storageBuilding.building.upgradeReqs = storageBuilding(tier + 1);
        }
        _storageBuilding.diaryCapacity = 5 + (tier * 2);
        _storageBuilding.eggCapacity = 5 + (tier * 2);
    }

    function mill(uint tier) external view returns (ILand.Mill memory _mill){
        require(tier > 0 && tier <= maxMillLevel, "t");
        _mill.building.level = tier;
        _mill.building.maxLevel = maxMillLevel;
        _mill.building.bonusChance = 5 * (tier * 2);
        if (tier != maxMillLevel) {
            _mill.building.upgradeReqs = millBuilding(tier + 1);
        }
        _mill.processTimePerCrop = 5 + (tier * 2);
    }

    function farm(uint tier) external view returns (ILand.Farm memory _farm){
        require(tier > 0 && tier <= maxFarmLevel, "t");
        _farm.building.level = tier;
        _farm.building.maxLevel = maxFarmLevel;
        _farm.building.bonusChance = 5 * (tier * 2);
        if (tier != maxFarmLevel) {
            _farm.building.upgradeReqs = farmBuilding(tier + 1);
        }
        _farm.usablePlots = 6 + (tier * 2);
    }

    function waterTower(uint tier) external view returns (ILand.WaterTower memory _waterTower){
        require(tier > 0 && tier <= maxWaterLevel, "t");
        _waterTower.building.level = tier;
        _waterTower.building.maxLevel = maxWaterLevel;
        _waterTower.building.bonusChance = 5 * (tier * 2);
        if (tier != maxWaterLevel) {
            _waterTower.building.upgradeReqs = waterBuilding(tier + 1);
        }
    }

    function slaughterhouse(uint tier) external view returns (ILand.Slaughterhouse memory _slaughterhouse){
        require(tier > 0 && tier <= maxSlaughterhouseLevel, "t");
        _slaughterhouse.building.level = tier;
        _slaughterhouse.building.maxLevel = maxSlaughterhouseLevel;
        _slaughterhouse.building.bonusChance = 5 * (tier * 2);
        if (tier != maxSlaughterhouseLevel) {
            _slaughterhouse.building.upgradeReqs = slaughterhouseBuilding(tier + 1);
        }
        _slaughterhouse.maxProductionSimultaneously = 5 + (tier * 2);
    }

    function dairies(uint tier) external view returns (ILand.Dairies memory _dairies){
        require(tier > 0 && tier <= maxDairyLevel, "t");
        _dairies.building.level = tier;
        _dairies.building.maxLevel = maxDairyLevel;
        _dairies.building.bonusChance = 5 * (tier * 2);
        if (tier != maxDairyLevel) {
            _dairies.building.upgradeReqs = dairiesBuilding(tier + 1);
        }
        _dairies.maxProductionSimultaneously = 5 + (tier * 2);
    }

    // upgrades

    function landBuildReqs(uint tier) public pure returns (ILand.BuildingRequirement memory _reqs) {
        require(tier > 0, "t");
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
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[0].amount = 40;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[1].amount = 40;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE);
            _reqs.requiredMaterials[2].amount = 20;
        }
    }

    function poultryBuildReqs(uint tier) public pure returns (ILand.BuildingRequirement memory _reqs) {
        require(tier > 0, "t");
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 25;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 25;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 10;
        }
    }

    function barnBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        require(tier > 0, "t");
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 35;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 35;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 15;
        }
    }

    function storageBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 1) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 50;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 35;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[2].amount = 20;
        }
    }

    function millBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 1) {
            _reqs.requiredMaterials = generateRequirement(2);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[0].amount = 40;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[1].amount = 40;
        }
    }

    function farmBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 2) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE);
            _reqs.requiredMaterials[0].amount = 40;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[1].amount = 40;
        }}

    function waterBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 1) {
            _reqs.requiredMaterials = generateRequirement(3);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[0].amount = 25;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[1].amount = 30;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE);
            _reqs.requiredMaterials[2].amount = 25;
        }
    }

    function slaughterhouseBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 1) {
            _reqs.requiredMaterials = generateRequirement(4);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[0].amount = 25;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[1].amount = 25;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE);
            _reqs.requiredMaterials[2].amount = 10;
            _reqs.requiredMaterials[3].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[3].amount = 10;
        }

    }

    function dairiesBuilding(uint tier) public view returns (ILand.BuildingRequirement memory _reqs){
        _reqs.isValid = true;

        if (tier == 1) {
            _reqs.requiredMaterials = generateRequirement(4);
            _reqs.requiredMaterials[0].id = uint(ICraftingMaterials.CraftingMaterial.COPPER_INGOT);
            _reqs.requiredMaterials[0].amount = 10;
            _reqs.requiredMaterials[1].id = uint(ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER);
            _reqs.requiredMaterials[1].amount = 10;
            _reqs.requiredMaterials[2].id = uint(ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE);
            _reqs.requiredMaterials[2].amount = 10;
            _reqs.requiredMaterials[3].id = uint(ICraftingMaterials.CraftingMaterial.GREEN_WOOD_PLANK);
            _reqs.requiredMaterials[3].amount = 10;
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
            return Mistyflower();
        } else if (_id == 9) {
            return Mana_Mushroom();
        } else if (_id == 10) {
            return Demon_Mushroom();
        } else if (_id == 11) {
            return Raindrop_Mushroom();
        } else if (_id == 12) {
            return Bloodberry();
        } else if (_id == 13) {
            return King_Flower();
        } else if (_id == 14) {
            return Ancient_Flower();
        } else if (_id == 15) {
            return Fellherb();
        } else if (_id == 16) {
            return Wild_Rose();
        } else if (_id == 17) {
            return Red_Rose();
        } else if (_id == 18) {
            return Dragon_Flower();
        } else if (_id == 19) {
            return Golden_Flower();
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



    // grown

    function Sheep() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 1 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 1;
        _animal.minSecondaryBuildingLevel = 1;

        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Milk;
        _animal.dailyProductions.cookingItems[0].amount = 2;

        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 2;
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 3;
        _animal.harvestOnKill.cookingItems[1].id = ICookingItem.List.Steak;
        _animal.harvestOnKill.cookingItems[1].amount = 1;
    }

    function Goat() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 2 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 2;
        _animal.minSecondaryBuildingLevel = 2;

        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Milk;
        _animal.dailyProductions.cookingItems[0].amount = 4;

        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 2;
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 7;
        _animal.harvestOnKill.cookingItems[1].id = ICookingItem.List.Steak;
        _animal.harvestOnKill.cookingItems[1].amount = 2;
    }

    function Pig() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 3 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 3;
        _animal.minSecondaryBuildingLevel = 3;

        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 2;
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 7;
        _animal.harvestOnKill.cookingItems[1].id = ICookingItem.List.Steak;
        _animal.harvestOnKill.cookingItems[1].amount = 3;
    }

    function Cow() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 4 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 4;
        _animal.minSecondaryBuildingLevel = 4;


        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Milk;
        _animal.dailyProductions.cookingItems[0].amount = 8;

        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 2;
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 10;
        _animal.harvestOnKill.cookingItems[1].id = ICookingItem.List.Steak;
        _animal.harvestOnKill.cookingItems[1].amount = 6;
    }

    function Chicken() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 5 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 1;
        _animal.minSecondaryBuildingLevel = 1;

        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Egg;
        _animal.dailyProductions.cookingItems[0].amount = 2;

        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 1;
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Raw_White_Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 3;
    }

    function Duck() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 6 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 2;
        _animal.minSecondaryBuildingLevel = 2;

        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Egg;
        _animal.dailyProductions.cookingItems[0].amount = 4;

        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 1;
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Raw_White_Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 5;
    }

    function Goose() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 7 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 3;
        _animal.minSecondaryBuildingLevel = 3;

        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Egg;
        _animal.dailyProductions.cookingItems[0].amount = 7;

        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 1;
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Raw_White_Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 7;
    }

    function Turkey() public pure returns (AnimalsL.GrownAnimal memory _animal) {
        _animal.animalId = 8 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 4;
        _animal.minSecondaryBuildingLevel = 4;

        _animal.dailyProductions.cookingItems[0].id = ICookingItem.List.Egg;
        _animal.dailyProductions.cookingItems[0].amount = 10;

        _animal.harvestOnKill.alchemyItems[0].id = IAlchemyItem.List.Organs;
        _animal.harvestOnKill.alchemyItems[0].amount = 1;
        _animal.harvestOnKill.cookingItems[0].id = ICookingItem.List.Raw_White_Meat;
        _animal.harvestOnKill.cookingItems[0].amount = 10;
    }

    // seeds
    function Dill() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        // reward IAlchemyItem.List.Dill,

        //@param id is alchemy item id
        _seed.alchemyReward.id = IAlchemyItem.List.Dill;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        // example
        _seed.requiredLandExperience = 0;
    }

    function Rucola() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Rucola;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Basilicum() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Basilicum;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Manaflower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Manaflower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function FireFlower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.FireFlower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Parsley() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Parsley;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Shadowberry() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Shadowberry;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Mistyflower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Mistyflower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Mana_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Mana_Mushroom;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Demon_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Demon_Mushroom;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Raindrop_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Raindrop_Mushroom;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Bloodberry() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Bloodberry;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function King_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.King_Flower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Ancient_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Ancient_Flower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Fellherb() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Fellherb;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Wild_Rose() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Wild_Rose;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Red_Rose() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Red_Rose;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Dragon_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Dragon_Flower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Golden_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.alchemyReward.id = IAlchemyItem.List.Golden_Flower;
        _seed.alchemyReward.min = 1;
        _seed.alchemyReward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }
}
