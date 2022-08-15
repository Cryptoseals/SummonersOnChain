import {GameObjects_BuffEffects} from "../Interfaces/GameObjects/IGameObjects.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexBuffEffectRecipes {
    string constant public index = "Codex";
    string constant public class = "BuffEffectRecipes";
    string constant public version = "0.0.1";

    function getAllConsumabless() external pure returns (GameObjects_BuffEffects.BuffEffectRecipe[] memory) {
        GameObjects_BuffEffects.BuffEffectRecipe[] memory result = new GameObjects_BuffEffects.BuffEffectRecipe[](60);
        for (uint i = 1; i < 61; i++) {
            result[i - 1] = recipe_by_id(i);
        }
        return result;
    }

    function recipe_by_id(uint _id) public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
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

    function EldersPotion() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 1;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 21;
        _requiredAlchemyItems[0].amount = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 48;
        _requiredMiscItems[0].amount = 10;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 20e18;
    }

    function TonicOfTranscendence() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 2;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 13;
        _requiredAlchemyItems[0].amount = 5;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 24;
        _requiredCookingItems[0].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 10e18;
    }

    function CraftsmansPotion() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 3;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 18;
        _requiredAlchemyItems[0].amount = 7;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 39;
        _requiredMiscItems[0].amount = 7;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredMiscItems = _requiredMiscItems;
        _recipe.requiredEssence = 15e18;
    }

    function TonicOfAnger() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 4;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 12;
        _requiredAlchemyItems[0].amount = 10;
        _requiredAlchemyItems[1].id = 24;
        _requiredAlchemyItems[1].amount = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 5;
        _requiredCookingItems[0].amount = 10;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function PhialOfAgility() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 5;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 0;
        _requiredAlchemyItems[0].amount = 15;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 28;
        _requiredCookingItems[0].amount = 15;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function PotionOfIronSkin() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 6;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 61;
        _requiredAlchemyItems[0].amount = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(2);
        _requiredMiscItems[0].id = 34;
        _requiredMiscItems[0].amount = 10;
        _requiredMiscItems[1].id = 50;
        _requiredMiscItems[1].amount = 10;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 30e18;
    }

    function ElixirOfSolutions() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 7;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 3;
        _requiredAlchemyItems[0].amount = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 11;
        _requiredMiscItems[0].amount = 10;
        _requiredMiscItems[1].id = 29;
        _requiredMiscItems[1].amount = 10;

        _recipe.requiredMiscItems = _requiredMiscItems;
        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function AthletesFlask() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 8;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 15;
        _requiredAlchemyItems[0].amount = 15;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 5;
        _requiredMiscItems[0].amount = 15;

        _recipe.requiredMiscItems = _requiredMiscItems;
        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function PerfumeOfBlackwidow() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 9;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 30;
        _requiredAlchemyItems[0].amount = 15;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 45;
        _requiredMiscItems[0].amount = 15;

        _recipe.requiredMiscItems = _requiredMiscItems;
        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function VialOfMotherEarth() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 11;
        _requiredAlchemyItems[0].amount = 14;
        _requiredAlchemyItems[1].id = 19;
        _requiredAlchemyItems[1].amount = 14;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 3;
        _requiredMiscItems[0].amount = 14;

        _recipe.requiredMiscItems = _requiredMiscItems;
        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotionOfCharge() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 11;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 8;
        _requiredAlchemyItems[0].amount = 20;
        _requiredAlchemyItems[1].id = 26;
        _requiredAlchemyItems[1].amount = 20;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function ElixirOfFrosty() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 12;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 27;
        _requiredAlchemyItems[0].amount = 20;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 33;
        _requiredMiscItems[0].amount = 20;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 45e18;
    }

    function DragonBreathPotion() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 13;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 4;
        _requiredAlchemyItems[0].amount = 14;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 36;
        _requiredMiscItems[0].amount = 14;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 5;
        _requiredCookingItems[0].amount = 14;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 45e18;
    }

    function VialOfSpirit() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 14;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 25;
        _requiredAlchemyItems[0].amount = 20;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 1;
        _requiredCookingItems[0].amount = 20;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredEssence = 45e18;
    }

    function NightmareFlask() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 15;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(3);
        _requiredAlchemyItems[0].id = 6;
        _requiredAlchemyItems[0].amount = 14;
        _requiredAlchemyItems[1].id = 9;
        _requiredAlchemyItems[1].amount = 14;
        _requiredAlchemyItems[2].id = 31;
        _requiredAlchemyItems[2].amount = 14;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function NihilityTonic() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 16;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(3);
        _requiredAlchemyItems[0].id = 1;
        _requiredAlchemyItems[0].amount = 10;
        _requiredAlchemyItems[1].id = 2;
        _requiredAlchemyItems[1].amount = 10;
        _requiredAlchemyItems[2].id = 28;
        _requiredAlchemyItems[2].amount = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 24;
        _requiredMiscItems[0].amount = 10;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 75e18;
    }

    function PhialOfGladiator() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 17;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 5;
        _requiredAlchemyItems[0].amount = 14;
        _requiredAlchemyItems[1].id = 23;
        _requiredAlchemyItems[1].amount = 14;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 38;
        _requiredMiscItems[0].amount = 14;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotionOfArchmage() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 18;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 10;
        _requiredAlchemyItems[0].amount = 14;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(2);
        _requiredMiscItems[0].id = 51;
        _requiredMiscItems[0].amount = 14;
        _requiredMiscItems[0].id = 77;
        _requiredMiscItems[0].amount = 14;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotionOfPrecision() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 19;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 8;
        _requiredAlchemyItems[0].amount = 7;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 37;
        _requiredMiscItems[0].amount = 7;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 2;
        _requiredCookingItems[0].amount = 7;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 20e18;
    }

    function ExactionPotion() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 20;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 20;
        _requiredAlchemyItems[0].amount = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 73;
        _requiredMiscItems[0].amount = 10;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 20e18;
    }

    function MercilessFlask() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 21;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 17;
        _requiredAlchemyItems[0].amount = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredMiscItems = generateRequirement(1);
        _requiredMiscItems[0].id = 75;
        _requiredMiscItems[0].amount = 10;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredMiscItems = _requiredMiscItems;

        _recipe.requiredEssence = 20e18;
    }

    function ElixirOfMobility() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 22;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 22;
        _requiredAlchemyItems[0].amount = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(1);
        _requiredCookingItems[0].id = 27;
        _requiredCookingItems[0].amount = 10;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function TonicOfToughness() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 23;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(1);
        _requiredAlchemyItems[0].id = 28;
        _requiredAlchemyItems[0].amount = 7;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 4;
        _requiredCookingItems[0].amount = 7;
        _requiredCookingItems[1].id = 18;
        _requiredCookingItems[1].amount = 7;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function PiercingTonic() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 24;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredAlchemyItems = generateRequirement(2);
        _requiredAlchemyItems[0].id = 7;
        _requiredAlchemyItems[0].amount = 15;
        _requiredAlchemyItems[1].id = 14;
        _requiredAlchemyItems[1].amount = 15;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function WateryMushroomSoup() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 25;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 13;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 15;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 25;
        _requiredCookingItems[2].amount = 5;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 15e18;
    }

    function GrilledSteak() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 26;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 11;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 25;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 5;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 15e18;
    }

    function ApplePie() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 27;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 1;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 5;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 15e18;
    }

    function BaconOmelet() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 28;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 12;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 10;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 5;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 15e18;
    }

    function Bread() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 29;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 8;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 32;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 15;
        _requiredCookingItems[2].amount = 5;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 15e18;
    }

    function TomatoSoup() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 30;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 6;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 20;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 25;
        _requiredCookingItems[2].amount = 5;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 15e18;
    }

    function CandyCornCookie() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 31;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 9;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 5;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 15e18;
    }

    function MashedPotato() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 32;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 31;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = 14;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 5;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 15e18;
    }

    function EggsBenedict() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 33;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 12;
        _requiredCookingItems[0].amount = 15;
        _requiredCookingItems[1].id = 10;
        _requiredCookingItems[1].amount = 10;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;

        _recipe.requiredEssence = 26e18;
    }

    function Ribs() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 34;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 4;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function Sausages() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 35;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 4;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 7;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function GrapeCookie() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 36;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 19;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function MeatyPastry() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 37;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function SugarCookie() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 38;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 29;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function CherryCookie() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 39;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 23;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function BananaBread() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 40;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 30;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function StrawberryCookie() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 41;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 22;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 28;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function SimpleMeatStew() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 42;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = 2;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = 7;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function FishStew() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 43;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 16;
        _requiredCookingItems[0].amount = 15;
        _requiredCookingItems[1].id = 7;
        _requiredCookingItems[1].amount = 15;
        _requiredCookingItems[2].id = 6;
        _requiredCookingItems[2].amount = 15;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function OceanFishStew() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 44;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 17;
        _requiredCookingItems[0].amount = 15;
        _requiredCookingItems[1].id = 7;
        _requiredCookingItems[1].amount = 15;
        _requiredCookingItems[2].id = 6;
        _requiredCookingItems[2].amount = 15;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function HotChicken() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 45;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 5;
        _requiredCookingItems[0].amount = 15;
        _requiredCookingItems[1].id = 0;
        _requiredCookingItems[1].amount = 15;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 15;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function GrapePie() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 46;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 19;
        _requiredCookingItems[0].amount = 15;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 15;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 15;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function RedGrapePie() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 47;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 20;
        _requiredCookingItems[0].amount = 15;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 15;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 15;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function BlackGrapePie() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 48;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 21;
        _requiredCookingItems[0].amount = 15;
        _requiredCookingItems[1].id = 8;
        _requiredCookingItems[1].amount = 15;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 15;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotatoFries() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 49;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 31;
        _requiredCookingItems[0].amount = 15;
        _requiredCookingItems[1].id = 33;
        _requiredCookingItems[1].amount = 15;
        _requiredCookingItems[2].id = 25;
        _requiredCookingItems[2].amount = 15;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function FruitSalad() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 50;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(4);
        _requiredCookingItems[0].id = 30;
        _requiredCookingItems[0].amount = 20;
        _requiredCookingItems[1].id = 23;
        _requiredCookingItems[1].amount = 20;
        _requiredCookingItems[2].id = 1;
        _requiredCookingItems[2].amount = 20;
        _requiredCookingItems[3].id = 19;
        _requiredCookingItems[3].amount = 20;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 125e18;
    }

    function Hamburger() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 51;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 20;
        _requiredCookingItems[1].id = 6;
        _requiredCookingItems[1].amount = 20;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;

        _recipe.requiredEssence = 75e18;
    }

    function DeluxeBurger() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 52;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 25;
        _requiredCookingItems[1].id = 3;
        _requiredCookingItems[1].amount = 25;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 6;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;

        _recipe.requiredEssence = 125e18;
    }

    function Cheeseburger() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 53;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 20;
        _requiredCookingItems[1].id = 24;
        _requiredCookingItems[1].amount = 20;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;

        _recipe.requiredEssence = 75e18;
    }

    function SpicyCheeseburger() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 54;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(2);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 20;
        _requiredCookingItems[1].id = 5;
        _requiredCookingItems[1].amount = 20;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 4;
        _requiredConsumables[0].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;

        _recipe.requiredEssence = 75e18;
    }

    function MeatChili() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 55;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 25;
        _requiredCookingItems[1].id = 5;
        _requiredCookingItems[1].amount = 25;
        _requiredCookingItems[2].id = 6;
        _requiredCookingItems[2].amount = 25;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 75e18;
    }

    function Sushi() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 56;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 16;
        _requiredCookingItems[0].amount = 25;
        _requiredCookingItems[1].id = 2;
        _requiredCookingItems[1].amount = 25;
        _requiredCookingItems[2].id = 3;
        _requiredCookingItems[2].amount = 25;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 75e18;
    }

    function MeatballWithPotatoFries() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 57;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 10;
        _requiredCookingItems[0].amount = 25;
        _requiredCookingItems[1].id = 31;
        _requiredCookingItems[1].amount = 25;
        _requiredCookingItems[2].id = 33;
        _requiredCookingItems[2].amount = 25;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 75e18;
    }

    function SpicySteakWithMushrooms() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 58;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 11;
        _requiredCookingItems[0].amount = 25;
        _requiredCookingItems[1].id = 13;
        _requiredCookingItems[1].amount = 25;
        _requiredCookingItems[2].id = 32;
        _requiredCookingItems[2].amount = 25;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 75e18;
    }

    function ChocolateCake() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 59;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 26;
        _requiredCookingItems[0].amount = 25;
        _requiredCookingItems[1].id = 27;
        _requiredCookingItems[1].amount = 25;
        _requiredCookingItems[2].id = 30;
        _requiredCookingItems[2].amount = 25;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 75e18;
    }

    function BeefSkewer() public pure returns (GameObjects_BuffEffects.BuffEffectRecipe memory _recipe) {
        _recipe.id = 60;

        GameObjects_BuffEffects.BasicRequirement[] memory _requiredCookingItems = generateRequirement(3);
        _requiredCookingItems[0].id = 11;
        _requiredCookingItems[0].amount = 25;
        _requiredCookingItems[1].id = 6;
        _requiredCookingItems[1].amount = 25;
        _requiredCookingItems[2].id = 18;
        _requiredCookingItems[2].amount = 25;

        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 75e18;
    }

    function generateRequirement (uint length) internal pure returns(GameObjects_BuffEffects.BasicRequirement[] memory){
        return new GameObjects_BuffEffects.BasicRequirement[](length);
    }
}