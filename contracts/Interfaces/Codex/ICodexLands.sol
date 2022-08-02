import {Animals, ILand} from "../Lands/ILand.sol";

pragma solidity ^0.8.0;

interface ICodexLands {
    function seedIDs() external view returns (uint[] memory);

    function seed(uint _id) external pure returns (ILand.Seed memory);

    function babyAnimalIDs() external view returns (uint[] memory);

    function babyAnimal(uint _id) external pure returns (Animals.BabyAnimal memory _animal);

    function grownAnimalIDs() external view returns (uint[] memory);

    function grownAnimal(uint _id) external pure returns (Animals.GrownAnimal memory _animal);
}
