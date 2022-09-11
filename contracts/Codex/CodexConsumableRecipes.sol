import {BasicRequirement, BasicAlchemyRequirement, BasicCookingRequirement,BuffEffectRecipe} from "../Interfaces/GameObjects/IGameObjects.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";
import {IAlchemyItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexBuffEffectRecipes {
    string constant public index = "Codex";
    string constant public class = "BuffEffectRecipes";
    string constant public version = "0.0.1";
    function getAllConsumables() external pure returns (BuffEffectRecipe[] memory) {
        BuffEffectRecipe[] memory result = new BuffEffectRecipe[](1);
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

        // IAlchemyItem.List.Green_Poisonous_Mushroom
        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Ancient_Flower;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Roots;
        _requiredAlchemyItems[1].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 20e18;
    }

    function TonicOfTranscendence() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(1);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Mana_Mushroom;
        _requiredAlchemyItems[0].amount = 5;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Wine;
        _requiredCookingItems[0].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 10e18;
    }

    function CraftsmansPotion() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Wood_Moss;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Cone;
        _requiredAlchemyItems[1].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 15e18;
    }

    function TonicOfAnger() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Red_Poisonous_Mushroom;
        _requiredAlchemyItems[0].amount = 4;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Red_Rose;
        _requiredAlchemyItems[1].amount = 4;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Chili_Pepper;
        _requiredCookingItems[0].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function PhialOfAgility() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(1);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Dill;
        _requiredAlchemyItems[0].amount = 15;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Butter;
        _requiredCookingItems[0].amount = 15;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 30e18;
    }

    function PotionOfIronSkin() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(3);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Parsley;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Bloodberry;
        _requiredAlchemyItems[1].amount = 3;
        _requiredAlchemyItems[2].id = IAlchemyItem.List.Organs;
        _requiredAlchemyItems[2].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function ElixirOfSolutions() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(3);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Manaflower;
        _requiredAlchemyItems[0].amount = 4;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Wood_Moss;
        _requiredAlchemyItems[1].amount = 6;
        _requiredAlchemyItems[2].id = IAlchemyItem.List.Stinky_Flower;
        _requiredAlchemyItems[2].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function AthletesFlask() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Dill;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[2].id = IAlchemyItem.List.Raindrop_Mushroom;
        _requiredAlchemyItems[2].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function PerfumeOfBlackwidow() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Gold_Dust;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Stinky_Flower;
        _requiredAlchemyItems[1].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function VialOfMotherEarth() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(3);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Green_Poisonous_Mushroom;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Red_Poisonous_Mushroom;
        _requiredAlchemyItems[1].amount = 5;
        _requiredAlchemyItems[2].id = IAlchemyItem.List.Roots;
        _requiredAlchemyItems[2].amount = 3;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotionOfCharge() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Dragonherb;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Golden_Flower;
        _requiredAlchemyItems[1].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function ElixirOfFrosty() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Frozen_Cube;
        _requiredAlchemyItems[0].amount = 6;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Organs;
        _requiredAlchemyItems[1].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function DragonBreathPotion() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.FireFlower;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Dragonherb;
        _requiredAlchemyItems[1].amount = 3;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Chili_Pepper;
        _requiredCookingItems[0].amount = 3;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function VialOfSpirit() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(1);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Dragon_Flower;
        _requiredAlchemyItems[0].amount = 6;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Apple;
        _requiredCookingItems[0].amount = 3;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredEssence = 45e18;
    }

    function NightmareFlask() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(3);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Shadowberry;
        _requiredAlchemyItems[0].amount = 4;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Shadowflower;
        _requiredAlchemyItems[1].amount = 1;
        _requiredAlchemyItems[2].id = IAlchemyItem.List.Stinky_Flower;
        _requiredAlchemyItems[2].amount = 6;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 45e18;
    }

    function NihilityTonic() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(3);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Rucola;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Basilicum;
        _requiredAlchemyItems[1].amount = 3;
        _requiredAlchemyItems[2].id = IAlchemyItem.List.Shadowflower;
        _requiredAlchemyItems[2].amount = 2;
        _requiredAlchemyItems[3].id = IAlchemyItem.List.Burning_Cube;
        _requiredAlchemyItems[3].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 75e18;
    }

    function PhialOfGladiator() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Parsley;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Wild_Rose;
        _requiredAlchemyItems[1].amount = 5;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Steak;
        _requiredCookingItems[0].amount = 7;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotionOfArchmage() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Mistyflower;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Gold_Dust;
        _requiredAlchemyItems[1].amount = 1;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Wine;
        _requiredCookingItems[0].amount = 3;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 45e18;
    }

    function PotionOfPrecision() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Dragonherb;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Wild_Rose;
        _requiredAlchemyItems[1].amount = 3;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Carrot;
        _requiredCookingItems[0].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function ExactionPotion() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Cone;
        _requiredAlchemyItems[0].amount = 3;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Fellherb;
        _requiredAlchemyItems[1].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 20e18;
    }

    function MercilessFlask() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(1);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.King_Flower;
        _requiredAlchemyItems[0].amount = 4;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Chili_Pepper;
        _requiredCookingItems[0].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function ElixirOfMobility() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(1);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Fellherb;
        _requiredAlchemyItems[0].amount = 3;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(1);
        _requiredCookingItems[0].id = ICookingItem.List.Chocolate;
        _requiredCookingItems[0].amount = 4;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function TonicOfToughness() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(1);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Organs;
        _requiredAlchemyItems[0].amount = 2;

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(2);
        _requiredCookingItems[0].id = ICookingItem.List.Bell_Pepper;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[0].id = ICookingItem.List.Turnip;
        _requiredCookingItems[0].amount = 2;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;
        _recipe.requiredCookingItems = _requiredCookingItems;

        _recipe.requiredEssence = 20e18;
    }

    function PiercingTonic() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicAlchemyRequirement[] memory _requiredAlchemyItems = generateAlchemyRequirement(2);
        _requiredAlchemyItems[0].id = IAlchemyItem.List.Raptorherb;
        _requiredAlchemyItems[0].amount = 5;
        _requiredAlchemyItems[1].id = IAlchemyItem.List.Demon_Mushroom;
        _requiredAlchemyItems[1].amount = 5;

        _recipe.requiredAlchemyItems = _requiredAlchemyItems;

        _recipe.requiredEssence = 30e18;
    }

    function WateryMushroomSoup() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Mushroom;
        _requiredCookingItems[0].amount = 1;
        _requiredCookingItems[1].id = ICookingItem.List.Water;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = ICookingItem.List.Salt;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function GrilledSteak() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Steak;
        _requiredCookingItems[0].amount = 3;
        _requiredCookingItems[1].id = ICookingItem.List.Salt;
        _requiredCookingItems[1].amount = 1;
        _requiredCookingItems[2].id = ICookingItem.List.Olive_Oil;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function ApplePie() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Apple;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 2;
        _requiredCookingItems[2].id = ICookingItem.List.Butter;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function BaconOmelet() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Egg;
        _requiredCookingItems[0].amount = 8;
        _requiredCookingItems[1].id = ICookingItem.List.Meat;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = ICookingItem.List.Sunflower_Oil;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function Bread() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Flour;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = ICookingItem.List.Olive_Oil;
        _requiredCookingItems[1].amount = 1;
        _requiredCookingItems[2].id = ICookingItem.List.Water;
        _requiredCookingItems[2].amount = 10;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function TomatoSoup() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Tomato;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = ICookingItem.List.Water;
        _requiredCookingItems[1].amount = 10;
        _requiredCookingItems[2].id = ICookingItem.List.Salt;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function CandyCornCookie() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Corn;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 2;
        _requiredCookingItems[2].id = ICookingItem.List.Butter;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function MashedPotato() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Potato;
        _requiredCookingItems[0].amount = 1;
        _requiredCookingItems[1].id = ICookingItem.List.Milk;
        _requiredCookingItems[1].amount = 6;
        _requiredCookingItems[2].id = ICookingItem.List.Butter;
        _requiredCookingItems[2].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function EggsBenedict() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(2);
        _requiredCookingItems[0].id = ICookingItem.List.Egg;
        _requiredCookingItems[0].amount = 12;
        _requiredCookingItems[1].id = ICookingItem.List.Meat;
        _requiredCookingItems[1].amount = 7;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 29;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function Ribs() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = ICookingItem.List.Bell_Pepper;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = ICookingItem.List.Olive_Oil;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function Sausages() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 5;
        _requiredCookingItems[1].id = ICookingItem.List.Bell_Pepper;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = ICookingItem.List.Onion;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function GrapeCookie() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Grapes;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = ICookingItem.List.Butter;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function MeatyPastry() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 6;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = ICookingItem.List.Butter;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function SugarCookie() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Sugar;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = ICookingItem.List.Butter;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function CherryCookie() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Cherry;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = ICookingItem.List.Butter;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function BananaBread() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Banana;
        _requiredCookingItems[0].amount = 1;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = ICookingItem.List.Olive_Oil;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function StrawberryCookie() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Strawberry;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = ICookingItem.List.Butter;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function SimpleMeatStew() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 6;
        _requiredCookingItems[1].id = ICookingItem.List.Carrot;
        _requiredCookingItems[1].amount = 1;
        _requiredCookingItems[2].id = ICookingItem.List.Onion;
        _requiredCookingItems[2].amount = 2;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function FishStew() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Sea_Fish;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = ICookingItem.List.Onion;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = ICookingItem.List.Tomato;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function OceanFishStew() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Ocean_Fish;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = ICookingItem.List.Onion;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = ICookingItem.List.Tomato;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function HotChicken() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Chili_Pepper;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[1].id = ICookingItem.List.Raw_White_Meat;
        _requiredCookingItems[1].amount = 7;
        _requiredCookingItems[2].id = ICookingItem.List.Olive_Oil;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function GrapePie() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Grapes;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = ICookingItem.List.Sunflower_Oil;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function RedGrapePie() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Red_Grapes;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = ICookingItem.List.Sunflower_Oil;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function BlackGrapePie() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Black_Grapes;
        _requiredCookingItems[0].amount = 4;
        _requiredCookingItems[1].id = ICookingItem.List.Flour;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = ICookingItem.List.Sunflower_Oil;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function PotatoFries() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Potato;
        _requiredCookingItems[0].amount = 2;
        _requiredCookingItems[1].id = ICookingItem.List.Sunflower_Oil;
        _requiredCookingItems[1].amount = 2;
        _requiredCookingItems[2].id = ICookingItem.List.Salt;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function FruitSalad() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(4);
        _requiredCookingItems[0].id = ICookingItem.List.Banana;
        _requiredCookingItems[0].amount = 3;
        _requiredCookingItems[1].id = ICookingItem.List.Cherry;
        _requiredCookingItems[1].amount = 3;
        _requiredCookingItems[2].id = ICookingItem.List.Apple;
        _requiredCookingItems[2].amount = 3;
        _requiredCookingItems[3].id = ICookingItem.List.Grapes;
        _requiredCookingItems[3].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function Hamburger() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(2);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = ICookingItem.List.Tomato;
        _requiredCookingItems[1].amount = 4;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 29;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function DeluxeBurger() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(2);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = ICookingItem.List.Cabbage;
        _requiredCookingItems[1].amount = 3;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 29;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function Cheeseburger() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(2);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = ICookingItem.List.Wine;
        _requiredCookingItems[1].amount = 3;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 29;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function SpicyCheeseburger() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(2);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = ICookingItem.List.Chili_Pepper;
        _requiredCookingItems[1].amount = 6;

        BasicRequirement[] memory _requiredConsumables = generateRequirement(1);
        _requiredConsumables[0].id = 29;
        _requiredConsumables[0].amount = 1;

        _recipe.requiredCookingItems = _requiredCookingItems;
        _recipe.requiredConsumableItem = _requiredConsumables;
    }

    function MeatChili() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = ICookingItem.List.Chili_Pepper;
        _requiredCookingItems[1].amount = 6;
        _requiredCookingItems[2].id = ICookingItem.List.Tomato;
        _requiredCookingItems[2].amount = 4;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function Sushi() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Sea_Fish;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = ICookingItem.List.Carrot;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = ICookingItem.List.Cabbage;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function MeatballWithPotatoFries() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Meat;
        _requiredCookingItems[0].amount = 10;
        _requiredCookingItems[1].id = ICookingItem.List.Potato;
        _requiredCookingItems[1].amount = 5;
        _requiredCookingItems[2].id = ICookingItem.List.Sunflower_Oil;
        _requiredCookingItems[2].amount = 4;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function SpicySteakWithMushrooms() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Steak;
        _requiredCookingItems[0].amount = 12;
        _requiredCookingItems[1].id = ICookingItem.List.Mushroom;
        _requiredCookingItems[1].amount = 6;
        _requiredCookingItems[2].id = ICookingItem.List.Olive_Oil;
        _requiredCookingItems[2].amount = 4;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function ChocolateCake() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Cacao;
        _requiredCookingItems[0].amount = 3;
        _requiredCookingItems[1].id = ICookingItem.List.Chocolate;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = ICookingItem.List.Banana;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function BeefSkewer() public pure returns (BuffEffectRecipe memory _recipe) {

        BasicCookingRequirement[] memory _requiredCookingItems = generateCookingRequirement(3);
        _requiredCookingItems[0].id = ICookingItem.List.Steak;
        _requiredCookingItems[0].amount = 12;
        _requiredCookingItems[1].id = ICookingItem.List.Tomato;
        _requiredCookingItems[1].amount = 4;
        _requiredCookingItems[2].id = ICookingItem.List.Turnip;
        _requiredCookingItems[2].amount = 3;

        _recipe.requiredCookingItems = _requiredCookingItems;
    }

    function generateRequirement (uint length) internal pure returns(BasicRequirement[] memory){
        return new BasicRequirement[](length);
    }
    function generateCookingRequirement (uint length) internal pure returns(BasicCookingRequirement[] memory){
        return new BasicCookingRequirement[](length);
    }
    function generateAlchemyRequirement (uint length) internal pure returns(BasicAlchemyRequirement[] memory){
        return new BasicAlchemyRequirement[](length);
    }
}