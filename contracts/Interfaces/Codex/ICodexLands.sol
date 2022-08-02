import {Animals, ILand} from "../Lands/ILand.sol";

pragma solidity ^0.8.0;

interface ICodexLands {
    function seedIDs() external view returns (uint[] memory);

    function seed(uint _id) external pure returns (ILand.Seed memory);

    function babyAnimalIDs() external view returns (uint[] memory);

    function babyAnimal(uint _id) external pure returns (Animals.BabyAnimal memory _animal);

    function grownAnimalIDs() external view returns (uint[] memory);

    function grownAnimal(uint _id) external pure returns (Animals.GrownAnimal memory _animal);


    // BUILDINGS

    function land(uint tier) external view returns (ILand.GeneralBuilding memory _land);

    function landBuildReqs(uint tier) external pure returns (ILand.BuildingRequirement memory _reqs);

    function poultry(uint tier) external view returns (ILand.Poultry memory _poultry);

    function poultryBuildReqs(uint tier) external pure returns (ILand.BuildingRequirement memory _reqs);

    function barnHouse(uint tier) external view returns (ILand.BarnHouse memory _barnHouse);

    function mill(uint tier) external view returns (ILand.Mill memory _mill);

    function farm(uint tier) external view returns (ILand.Farm memory _farm);

    function waterTower(uint tier) external view returns (ILand.WaterTower memory _waterTower);

    function slaughterhouse(uint tier) external view returns (ILand.Slaughterhouse memory _slaughterhouse);

    function dairies(uint tier) external view returns (ILand.Dairies memory _dairies);

    function storages(uint tier) external view returns (ILand.Storages memory);

    function barnBuilding(uint tier) external view returns (ILand.BuildingRequirement memory);

    function storageBuilding(uint tier) external view returns (ILand.BuildingRequirement memory);

    function millBuilding(uint tier) external view returns (ILand.BuildingRequirement memory);

    function farmBuilding(uint tier) external view returns (ILand.BuildingRequirement memory);

    function waterBuilding(uint tier) external view returns (ILand.BuildingRequirement memory);

    function slaughterhouseBuilding(uint tier) external view returns (ILand.BuildingRequirement memory);

    function dairiesBuilding(uint tier) external view returns (ILand.BuildingRequirement memory);

}