import {IAlchemyItem} from "../NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
import {ICookingItem} from "../NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";
import {BasicRequirement, BasicMiscRequirement, BasicAlchemyRequirement, BasicCookingRequirement} from "../GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

library Seed {
    enum List {
        None,
        Dill,
        Rucola,
        Basilicum,
        Manaflower,
        FireFlower,
        Parsley,
        Shadowberry,
        Raptorherb,
        Dragonherb,
        Shadowflower,
        Mistyflower,
        Green_Poisonous_Mushroom,
        Red_Poisonous_Mushroom,
        Mana_Mushroom,
        Demon_Mushroom,
        Raindrop_Mushroom,
        Bloodberry,
        King_Flower,
        Wood_Moss,
        Ancient_Flower,
        Fellherb,
        Wild_Rose,
        Red_Rose,
        Dragon_Flower,
        Golden_Flower,
        Stinky_Flower,
        Apple,
        Carrot,
        Cabbage,
        Bell_Pepper,
        Chili_Pepper,
        Tomato,
        Onion,
        Corn,
        Mushroom,
        Turnip,
        Grapes,
        Black_Grapes,
        Red_Grapes,
        Strawberry,
        Cherry,
        Cacao,
        Banana,
        Potato,
        Wheat
    }
}

library AnimalsL {

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
        bool active;
        uint buyPrice;
        uint minMainBuildingLevel;
        uint minSecondaryBuildingLevel;}

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
        AnimalsL.BabyAnimal animal;
        uint growthEnds;
    }


}

library ILand {

    struct LandStatsStruct {
        uint LandDetailsTier;
        uint PoultriesTier;
        uint BarnHousesTier;
        uint StorageBuildingsTier;
        uint MillsTier;
        uint FarmsTier;
        uint WaterTowersTier;
        uint SlaughterhousesTier;
        uint DairiesTier;
    }

    struct LandDetails {
        GeneralBuilding building;
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
        bool reserveSlot6;
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
    }

    struct Mill {
        GeneralBuilding building;
        uint processTimePerCrop;
        uint maxProcessSimultaneously;
    }

    struct Farm {
        GeneralBuilding building;
        uint usablePlots;
    }

    struct WaterTower {
        GeneralBuilding building;
        uint dailyWaterReward;
    }

    struct Slaughterhouse {
        GeneralBuilding building;
        uint maxProductionSimultaneously;
        uint cooldownPerAnimal;
    }

    struct Dairies {
        GeneralBuilding building;
        uint maxProductionSimultaneously;
    }


    // farming

    struct Seed {
        uint id;
        uint requiredLandExperience;
        uint landExpReward;
        uint growTime;
        AlchemySeedReward alchemyReward;
        CookingSeedReward cookingReward;
        uint buyPrice;
    }

    struct AlchemySeedReward {
        IAlchemyItem.List id;
        uint min;
        uint max;
    }

    struct CookingSeedReward {
        ICookingItem.List id;
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
    }

    // reward and reqs;

    struct BuildingRequirement {
        BasicAlchemyRequirement[] requiredAlchemyItems;
        BasicMiscRequirement[] requiredMiscItems;
        BasicCookingRequirement[] requiredCookingItems;
        BasicRequirement[] requiredMaterials;
        uint requiredGold;
        uint requiredEssence;
        bool isValid;
    }


    struct CookingItemReward {
        ICookingItem.List id;
        uint amount;
    }

    struct AlchemyItemReward {
        IAlchemyItem.List id;
        uint amount;
    }

}