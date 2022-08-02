import {GameObjects_BuffEffects} from "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

library Animals {

    enum AnimalPlace {
        POULTRY,
        BARN
    }

    // ANIMAL STUFF
    struct BabyAnimal {
        uint animalId;
        uint growthTime;
        AnimalPlace building;
        uint becomes;
    }

    struct GrownAnimal {
        uint animalId;
        AnimalPlace building;
        AnimalProduction dailyProductions;
        AnimalProduction harvestOnKill;
        uint minMainBuildingLevel;
        uint minSecondaryBuildingLevel;
    }

    struct AnimalProduction {
        ILand.CookingItemReward[] cookingItems;
        ILand.AlchemyItemReward[] alchemyItems;
    }

    struct GrowingAnimal {
        Animals.BabyAnimal animal;
        uint growthEnds;
    }


}

library ILand {

    struct LandDetails {
        GeneralBuilding building;
        address landlord;
        uint experience;
        bool active;
    }

    // BUILDINGS
    struct GeneralBuilding {
        uint level;
        uint maxLevel;
        BuildingRequirement upgradeReqs;
        uint lastInteraction;
        uint bonusChance;
        uint bonusPercentage;
        uint reserveSlot;
        uint reserveSlot2;
        uint reserveSlot3;
        uint reserveSlot4;
        uint reserveSlot5;
        bool reserveSlot6;
        bool reserveSlot7;
        bool reserveSlot8;
    }

    struct Poultry {
        GeneralBuilding building;
        uint capacity;
    }

    struct BarnHouse {
        GeneralBuilding building;
        uint capacity;
    }

    struct Storages {
        GeneralBuilding building;
        uint eggCapacity;
        uint diaryCapacity;
        uint reserveSlot1;
        uint reserveSlot2;
        uint reserveSlot3;
        uint reserveSlot4;
        bool reserveSlot5;
        bool reserveSlot6;
    }

    struct Mill {
        GeneralBuilding building;
        uint processTimePerCrop;
    }

    struct Farm {
        GeneralBuilding building;
        uint plots;
    }

    struct WaterTower {
        GeneralBuilding building;
    }

    struct Slaughterhouse {
        GeneralBuilding building;
        uint maxProductionSimultaneously;
        Animals.GrownAnimal[] animalRooms;
    }

    struct Dairies {
        GeneralBuilding building;
        uint maxProductionSimultaneously;
        Animals.GrownAnimal[] animalRooms;
    }





    // farming

    struct Seed {
        uint id;
        uint requiredLandExperience;
        uint landExpReward;
        uint growTime;
        SeedReward reward;
    }

    struct SeedReward {
        uint id;
        uint min;
        uint max;
    }

    struct Plot {
        uint seedId;
        uint startTime;
        uint endTime;
        bool isAvailable;
        uint reserveSlot1;
        uint reserveSlot2;
        uint reserveSlot3;
        bool reserveSlot4;
        bool reserveSlot5;
        bool reserveSlot6;
        bool reserveSlot7;
    }

    // reward and reqs;

    struct BuildingRequirement {
        GeneralRequirement[] requiredAlchemyItems;
        GeneralRequirement[] requiredMiscItems;
        GeneralRequirement[] requiredCookingItems;
        GeneralRequirement[] requiredMaterials;
        uint requiredGold;
        uint requiredEssence;
        bool isValid;
    }

    struct GeneralRequirement {
        uint id;
        uint amount;
    }

    struct CookingItemReward {
        uint id;
        uint amount;
    }

    struct AlchemyItemReward {
        uint id;
        uint amount;
    }


}