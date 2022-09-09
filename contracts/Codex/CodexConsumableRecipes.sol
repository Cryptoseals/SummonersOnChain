import {BasicRequirement,BuffEffectRecipe} from "../Interfaces/GameObjects/IGameObjects.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexBuffEffectRecipes {
    string constant public index = "Codex";
    string constant public class = "BuffEffectRecipes";
    string constant public version = "0.0.1";

    function getAllConsumabless() external pure returns (BuffEffectRecipe[] memory) {
        BuffEffectRecipe[] memory result = new BuffEffectRecipe[](60);
        for (uint i = 1; i < 61; i++) {
            result[i - 1] = recipe_by_id(i);
        }
        return result;
    }

    function recipe_by_id(uint _id) public pure returns (BuffEffectRecipe memory _recipe) {
        if (_id == 1) {return EldersPotion();}
        else if (_id == 2) {return TonicOfTranscendence();}
        else if (_id == 3) {return CraftsmansPotion();}
        else if (_id == 4) {return TonicOfAnger();}
        else if (_id == 5) {return PhialOfAgility();}
        else if (_id == 6) {return PotionOfIronSkin();}
        else if (_id == 7) {return ElixirOfSolutions();}
        else if (_id == 8) {return AthletesFlask();}
        else if (_id == 9) {return PerfumeOfBlackwidow();}
        else if (_id == 10) {return VialOfMotherEarth();}
        else if (_id == 11) {return PotionOfCharge();}
        else if (_id == 12) {return ElixirOfFrosty();}
        else if (_id == 13) {return DragonBreathPotion();}
        else if (_id == 14) {return VialOfSpirit();}
        else if (_id == 15) {return NightmareFlask();}
        else if (_id == 16) {return NihilityTonic();}
        else if (_id == 17) {return PhialOfGladiator();}
        else if (_id == 18) {return PotionOfArchmage();}
        else if (_id == 19) {return PotionOfPrecision();}
        else if (_id == 20) {return ExactionPotion();}
        else if (_id == 21) {return MercilessFlask();}
        else if (_id == 22) {return ElixirOfMobility();}
        else if (_id == 23) {return TonicOfToughness();}
        else if (_id == 24) {return PiercingTonic();}
        else if (_id == 25) {return WateryMushroomSoup();}
        else if (_id == 26) {return GrilledSteak();}
        else if (_id == 27) {return ApplePie();}
        else if (_id == 28) {return BaconOmelet();}
        else if (_id == 29) {return Bread();}
        else if (_id == 30) {return TomatoSoup();}
        else if (_id == 31) {return CandyCornCookie();}
        else if (_id == 32) {return MashedPotato();}
        else if (_id == 33) {return EggsBenedict();}
        else if (_id == 34) {return Ribs();}
        else if (_id == 35) {return Sausages();}
        else if (_id == 36) {return GrapeCookie();}
        else if (_id == 37) {return MeatyPastry();}
        else if (_id == 38) {return SugarCookie();}
        else if (_id == 39) {return CherryCookie();}
        else if (_id == 40) {return BananaBread();}
        else if (_id == 41) {return StrawberryCookie();}
        else if (_id == 42) {return SimpleMeatStew();}
        else if (_id == 43) {return FishStew();}
        else if (_id == 44) {return OceanFishStew();}
        else if (_id == 45) {return HotChicken();}
        else if (_id == 46) {return GrapePie();}
        else if (_id == 47) {return RedGrapePie();}
        else if (_id == 48) {return BlackGrapePie();}
        else if (_id == 49) {return PotatoFries();}
        else if (_id == 50) {return FruitSalad();}
        else if (_id == 51) {return Hamburger();}
        else if (_id == 52) {return DeluxeBurger();}
        else if (_id == 53) {return Cheeseburger();}
        else if (_id == 54) {return SpicyCheeseburger();}
        else if (_id == 55) {return MeatChili();}
        else if (_id == 56) {return Sushi();}
        else if (_id == 57) {return MeatballWithPotatoFries();}
        else if (_id == 58) {return SpicySteakWithMushrooms();}
        else if (_id == 59) {return ChocolateCake();}
        else if (_id == 60) {return BeefSkewer();}

        revert("wrong");
    }

    function EldersPotion() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 1;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 22;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[1].id = 20;
        _requiredAlchemyItems[1].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 20e18;
    }

    function TonicOfTranscendence() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 2;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 14;
        _requiredAlchemyItems[0].amount = 5;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 24;
        _requiredCookingItems[0].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 10e18;
    }

    function CraftsmansPotion() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 3;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 19;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[1].id = 21;
        _requiredAlchemyItems[1].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 15e18;
    }

    function TonicOfAnger() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 4;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 13;
        _requiredAlchemyItems[0].amount = 4;
        _requiredAlchemyItems[1].id = 15;
        _requiredAlchemyItems[1].amount = 4;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 5;
        _requiredCookingItems[0].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function PhialOfAgility() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 5;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 1;
        _requiredAlchemyItems[0].amount = 15;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 28;
        _requiredCookingItems[0].amount = 15;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function PotionOfIronSkin() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 6;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(3);
        _requiredAlchemyItems[0].id = 6;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[1].id = 17;
        _requiredAlchemyItems[1].amount = 3;
        _requiredAlchemyItems[2].id = 30;
        _requiredAlchemyItems[2].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function ElixirOfSolutions() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 7;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(3);
        _requiredAlchemyItems[0].id = 4;
        _requiredAlchemyItems[0].amount = 4;
        _requiredAlchemyItems[1].id = 19;
        _requiredAlchemyItems[1].amount = 6;
        _requiredAlchemyItems[2].id = 32;
        _requiredAlchemyItems[2].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function AthletesFlask() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 8;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 1;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[2].id = 16;
        _requiredAlchemyItems[2].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function PerfumeOfBlackwidow() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 9;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 31;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = 32;
        _requiredAlchemyItems[1].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function VialOfMotherEarth() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 10;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(3);
        _requiredAlchemyItems[0].id = 12;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = 13;
        _requiredAlchemyItems[1].amount = 5;
        _requiredAlchemyItems[2].id = 20;
        _requiredAlchemyItems[2].amount = 3;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotionOfCharge() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 11;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 9;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = 27;
        _requiredAlchemyItems[1].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function ElixirOfFrosty() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 12;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 27;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[1].id = 30;
        _requiredAlchemyItems[1].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function DragonBreathPotion() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 13;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 5;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = 9;
        _requiredAlchemyItems[1].amount = 3;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 5;
        _requiredCookingItems[0].amount = 3;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function VialOfSpirit() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 14;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 26;
        _requiredAlchemyItems[0].amount = 6;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 1;
        _requiredCookingItems[0].amount = 3;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredEssence = 45e18;
    }

    function NightmareFlask() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 15;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(3);
        _requiredAlchemyItems[0].id = 7;
        _requiredAlchemyItems[0].amount = 4;
        _requiredAlchemyItems[1].id = 10;
        _requiredAlchemyItems[1].amount = 1;
        _requiredAlchemyItems[2].id = 32;
        _requiredAlchemyItems[2].amount = 6;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function NihilityTonic() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 16;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(3);
        _requiredAlchemyItems[0].id = 2;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = 3;
        _requiredAlchemyItems[1].amount = 3;
        _requiredAlchemyItems[2].id = 10;
        _requiredAlchemyItems[2].amount = 2;
        _requiredAlchemyItems[3].id = 29;
        _requiredAlchemyItems[3].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 75e18;
    }

    function PhialOfGladiator() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 17;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 6;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = 24;
        _requiredAlchemyItems[1].amount = 5;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 11;
        _requiredCookingItems[0].amount = 7;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotionOfArchmage() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 18;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 11;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = 31;
        _requiredAlchemyItems[1].amount = 1;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 24;
        _requiredCookingItems[0].amount = 3;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotionOfPrecision() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 19;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 9;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = 24;
        _requiredAlchemyItems[1].amount = 3;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 2;
        _requiredCookingItems[0].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function ExactionPotion() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 20;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 21;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = 23;
        _requiredAlchemyItems[1].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 20e18;
    }

    function MercilessFlask() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 21;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 18;
        _requiredAlchemyItems[0].amount = 4;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 5;
        _requiredCookingItems[0].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function ElixirOfMobility() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 22;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 23;
        _requiredAlchemyItems[0].amount = 3;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 27;
        _requiredCookingItems[0].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function TonicOfToughness() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 23;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 30;
        _requiredAlchemyItems[0].amount = 2;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 4;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[0].id = 18;
        _requiredCookingItems[0].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function PiercingTonic() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 24;

        BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 8;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = 15;
        _requiredAlchemyItems[1].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function WateryMushroomSoup() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 25;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 13;
        _requiredCookingItems[0].amount = 1;
        _requiredCookingItems[1].id = 15;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 25;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function GrilledSteak() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 26;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 11;
        _requiredCookingItems[0].amount = 3;
        _requiredCookingItems[1].id = 25;
        _requiredCookingItems[1].amount = 1;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function ApplePie() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 27;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 1;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 2;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function BaconOmelet() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 28;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 12;
        _requiredCookingItems[0].amount = 8;
        _requiredCookingItems[1].id = 10;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function Bread() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 29;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 8;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = 32;
        _requiredCookingItems[1].amount = 1;
        _requiredCookingItems[2].id = 15;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function TomatoSoup() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 30;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 6;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = 20;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 25;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function CandyCornCookie() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 31;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 9;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 2;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function MashedPotato() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 32;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 31;
        _requiredCookingItems[0].amount = 1;
        _requiredCookingItems[1].id = 14;
        _requiredCookingItems[1].amount = 6;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function EggsBenedict() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 33;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 12;
        _requiredCookingItems[0].amount = 12;
        _requiredCookingItems[1].id = 10;
        _requiredCookingItems[1].amount = 7;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function Ribs() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 34;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 4;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function Sausages() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 35;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 4;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = 7;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function GrapeCookie() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 36;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 19;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function MeatyPastry() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 37;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 6;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function SugarCookie() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 38;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 29;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function CherryCookie() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 39;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 23;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function BananaBread() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 40;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 30;
        _requiredCookingItems[0].amount = 1;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function StrawberryCookie() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 41;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 22;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function SimpleMeatStew() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 42;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 6;
        _requiredCookingItems[1].id = 2;
        _requiredCookingItems[1].amount = 1;
        _requiredCookingItems[2].id = 7;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function FishStew() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 43;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 16;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 7;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = 6;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function OceanFishStew() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 44;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 17;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 7;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = 6;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function HotChicken() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 45;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 5;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[1].id = 0;
        _requiredCookingItems[1].amount = 7;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function GrapePie() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 46;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 19;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function RedGrapePie() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 47;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 21;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function BlackGrapePie() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 48;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 20;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function PotatoFries() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 49;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 31;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = 33;
        _requiredCookingItems[1].amount = 2;
        _requiredCookingItems[2].id = 25;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function FruitSalad() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 50;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(4);
        _requiredCookingItems[0].id = 30;
        _requiredCookingItems[0].amount = 3;
        _requiredCookingItems[1].id = 23;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = 1;
        _requiredCookingItems[2].amount = 3;
        _requiredCookingItems[3].id = 19;
        _requiredCookingItems[3].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function Hamburger() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 51;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 6;
        _requiredCookingItems[1].amount = 4;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function DeluxeBurger() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 52;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 3;
        _requiredCookingItems[1].amount = 3;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function Cheeseburger() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 53;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 24;
        _requiredCookingItems[1].amount = 3;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function SpicyCheeseburger() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 54;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 5;
        _requiredCookingItems[1].amount = 6;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function MeatChili() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 55;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 5;
        _requiredCookingItems[1].amount = 6;
        _requiredCookingItems[2].id = 6;
        _requiredCookingItems[2].amount = 4;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function Sushi() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 56;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 16;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 2;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = 3;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function MeatballWithPotatoFries() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 57;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 31;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 4;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function SpicySteakWithMushrooms() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 58;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 11;
        _requiredCookingItems[0].amount = 12;
        _requiredCookingItems[1].id = 13;
        _requiredCookingItems[1].amount = 6;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 4;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function ChocolateCake() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 59;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 26;
        _requiredCookingItems[0].amount = 3;
        _requiredCookingItems[1].id = 27;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = 30;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function BeefSkewer() public pure returns (BuffEffectRecipe memory _recipe) {
        _recipe.id = 60;

        BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 11;
        _requiredCookingItems[0].amount = 12;
        _requiredCookingItems[1].id = 6;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = 18;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function generateRequirement (uint length) internal pure returns(BasicRequirement[] memory){
        return new BasicRequirement[](length);
    }
}