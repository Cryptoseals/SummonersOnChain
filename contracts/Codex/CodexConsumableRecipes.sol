import {GameObjects_BuffEffects} from "../Interfaces/GameObjects/IGameObjects.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexBuffEffectRecipes {
    string constant public index = "Codex";
    string constant public class = "BuffEffectRecipes";
    string constant public version = "0.0.1";

    function getAllConsumabless() external pure returns (GameObjects_BuffEffects.BuffEffectRecipe[] memory) {
        GameObjects_BuffEffects.BuffEffectRecipe[] memory result = new GameObjects_BuffEffects.BuffEffectRecipe[](25);
        for (uint i = 1; i < 25; i++) {
            result[i - 1] = recipe_by_id(i);
        }
        return result;
    }

    function recipe_by_id(uint _id) public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        if (_id == 1) {
            return EldersPotion();
        }
//        else if (_id == 2) {
//            return TonicOfTranscendence();
//        }
//        else if (_id == 3) {
//            return CraftsmansPotion();
//        }
//        else if (_id == 4) {
//            return TonicOfAnger();
//        }
//        else if (_id == 5) {
//            return PhialOfAgility();
//        }
//        else if (_id == 6) {
//            return PotionOfIronSkin();
//        }
//        else if (_id == 7) {
//            return ElixirOfSolutions();
//        }
//        else if (_id == 8) {
//            return AthletesFlask();
//        }
//        else if (_id == 9) {
//            return PerfumeOfBlackwidow();
//        }
//        else if (_id == 10) {
//            return VialOfMotherEarth();
//        }
//        else if (_id == 11) {
//            return PotionOfCharge();
//        }
//        else if (_id == 12) {
//            return ElixirOfFrosty();
//        }
//        else if (_id == 13) {
//            return DragonBreathPotion();
//        }
//        else if (_id == 14) {
//            return VialOfSpirit();
//        }
//        else if (_id == 15) {
//            return NightmareFlask();
//        }
//        else if (_id == 16) {
//            return NihilityTonic();
//        }
//        else if (_id == 17) {
//            return PhialOfGladiator();
//        }
//        else if (_id == 18) {
//            return PotionOfArchmage();
//        }
//        else if (_id == 19) {
//            return PotionOfPrecision();
//        }
//        else if (_id == 20) {
//            return ExactionPotion();
//        }
//        else if (_id == 21) {
//            return MercilessFlask();
//        }
//        else if (_id == 22) {
//            return ElixirOfMobility();
//        }
//        else if (_id == 23) {
//            return TonicOfToughness();
//        }
//        else if (_id == 24) {
//            return PiercingTonic();
//        }
        revert("wrong");
    }

    function EldersPotion() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 1;

        // alchemy item requirement, pass amount to generateRequirement function
        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 1;
        _requiredAlchemyItems[0].amount = 2;

        // misc item req
        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 1;
        _requiredMiscItems[0].amount = 1;

        // cooking item req
        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 1;
        _requiredCookingItems[0].amount = 1;

        // consumable item req
        GameObjects_BuffEffects.BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 1;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredMiscItems = _requiredMiscItems;
        _recipe.requiredConsumableItem = _requiredConsumables;

        _recipe.requiredEssence = 15e18;
    }




    function generateRequirement (uint length) internal pure returns(GameObjects_BuffEffects.BasicRequirement[] memory){
        return new GameObjects_BuffEffects.BasicRequirement[](length);
    }
}
