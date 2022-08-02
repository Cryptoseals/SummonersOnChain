import {Animals, ILand} from "../Interfaces/Lands/ILand.sol";
pragma solidity ^0.8.0;

contract CodexAnimals {

    string constant public index = "Codex";
    string constant public class = "Animals";
    string constant public version = "0.0.1";
    uint constant public indexOfGrownAnimals = 10000;

    function seedIDs() external view returns (uint[] memory){
        uint[] memory result = new uint[](18);
        for (uint i = 0; i < 18; i++) {
            result[i] = i + 1;
        }
        return result;
    }

    function seed(uint _id) public pure returns (ILand.Seed memory) {
        if (_id == 1) {
            return DillSeed();
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

    function babyAnimal(uint _id) public pure returns (Animals.BabyAnimal memory _animal) {
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

    function grownAnimal(uint _id) public pure returns (Animals.GrownAnimal memory _animal) {
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
    function Lamb() public pure returns (Animals.BabyAnimal memory _animal) {
        _animal.animalId = 1;
        _animal.building = Animals.AnimalPlace.BARN;
        _animal.growthTime = 2 days;
    }

    function Kid() public pure returns (Animals.BabyAnimal memory _animal) {
        _animal.animalId = 2;
        _animal.building = Animals.AnimalPlace.BARN;
        _animal.growthTime = 2 days;
    }

    function BabyPig() public pure returns (Animals.BabyAnimal memory _animal) {
        _animal.animalId = 3;
        _animal.building = Animals.AnimalPlace.BARN;
        _animal.growthTime = 1 days;
    }

    function Calf() public pure returns (Animals.BabyAnimal memory _animal) {
        _animal.animalId = 4;
        _animal.building = Animals.AnimalPlace.BARN;
        _animal.growthTime = 3 days;
    }

    function Chick() public pure returns (Animals.BabyAnimal memory _animal) {
        _animal.animalId = 5;
        _animal.building = Animals.AnimalPlace.POULTRY;
        _animal.growthTime = 1 days;
    }

    function Duckling() public pure returns (Animals.BabyAnimal memory _animal) {
        _animal.animalId = 6;
        _animal.building = Animals.AnimalPlace.POULTRY;
        _animal.growthTime = 2 days;
    }

    function Gosling() public pure returns (Animals.BabyAnimal memory _animal) {
        _animal.animalId = 7;
        _animal.building = Animals.AnimalPlace.POULTRY;
        _animal.growthTime = 60 hours;
    }

    function Poult() public pure returns (Animals.BabyAnimal memory _animal) {
        _animal.animalId = 8;
        _animal.building = Animals.AnimalPlace.POULTRY;
        _animal.growthTime = 3 days;
    }



    // grown

    function Sheep() public pure returns (Animals.GrownAnimal memory _animal) {
        _animal.animalId = 1 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 1;
        _animal.minSecondaryBuildingLevel = 1;
    }

    function Goat() public pure returns (Animals.GrownAnimal memory _animal) {
        _animal.animalId = 2 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 2;
        _animal.minSecondaryBuildingLevel = 2;
    }

    function Pig() public pure returns (Animals.GrownAnimal memory _animal) {
        _animal.animalId = 3 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 3;
        _animal.minSecondaryBuildingLevel = 3;
    }

    function Cow() public pure returns (Animals.GrownAnimal memory _animal) {
        _animal.animalId = 4 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 4;
        _animal.minSecondaryBuildingLevel = 4;
    }

    function Chicken() public pure returns (Animals.GrownAnimal memory _animal) {
        _animal.animalId = 5 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 1;
        _animal.minSecondaryBuildingLevel = 1;
    }

    function Duck() public pure returns (Animals.GrownAnimal memory _animal) {
        _animal.animalId = 6 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 2;
        _animal.minSecondaryBuildingLevel = 2;
    }

    function Goose() public pure returns (Animals.GrownAnimal memory _animal) {
        _animal.animalId = 7 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 3;
        _animal.minSecondaryBuildingLevel = 3;
    }

    function Turkey() public pure returns (Animals.GrownAnimal memory _animal) {
        _animal.animalId = 8 + indexOfGrownAnimals;
        _animal.minMainBuildingLevel = 4;
        _animal.minSecondaryBuildingLevel = 4;
    }

    // seed
    function DillSeed() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        // reward section,

        //@param id is alchemy item id
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        // example
        _seed.requiredLandExperience = 0;
    }

    function Rucola() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Manaflower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function FireFlower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Parsley() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Shadowberry() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Mistyflower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Mana_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Demon_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Raindrop_Mushroom() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Bloodberry() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function King_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Ancient_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Fellherb() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Wild_Rose() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Red_Rose() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Dragon_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }

    function Golden_Flower() public pure returns (ILand.Seed memory _seed) {
        _seed.id = 1;
        _seed.growTime = 8 hours;
        _seed.reward.id = 1;
        _seed.reward.min = 1;
        _seed.reward.max = 3;
        _seed.landExpReward = 100;
        _seed.requiredLandExperience = 0;
    }
}
