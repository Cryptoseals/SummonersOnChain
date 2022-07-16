import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {GameObjects_Elixir} from "../Interfaces/GameObjects/IGameObjects.sol";
import {InitNavigator} from "../Core/Navigator/InitNavigator.sol";
import {Rarity} from "./Common/Rarity.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexElixirRecipes is Rarity, InitNavigator, OwnableUpgradeable  {
    string constant public index = "Codex";
    string constant public class = "ElixirRecipes";
    string constant public version = "0.0.1";

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
        __Ownable_init();
    }
    function getAllElixirs() external pure returns (GameObjects_Elixir.ElixirRecipe[] memory) {
        GameObjects_Elixir.ElixirRecipe[] memory result = new GameObjects_Elixir.ElixirRecipe[](15);
        for (uint i = 1; i <= 15; i++) {
            result[i - 1] = recipe_by_id(i);
        }
        return result;
    }

    function recipe_by_id(uint _id) public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        if (_id == 1) {
            return EldersPotion();
        }
        else if (_id == 2) {
            return TonicOfTranscendence();
        }
        else if (_id == 3) {
            return CraftsmansPotion();
        }
        else if (_id == 4) {
            return TonicOfAnger();
        }
        else if (_id == 5) {
            return PhialOfAgility();
        }
        else if (_id == 6) {
            return PotionOfIronSkin();
        }
        else if (_id == 7) {
            return ElixirOfSolutions();
        }
        else if (_id == 8) {
            return AthletesFlask();
        }
        else if (_id == 9) {
            return PerfumeOfBlackwidow();
        }
        else if (_id == 10) {
            return VialOfMotherEarth();
        }
        else if (_id == 11) {
            return PotionOfCharge();
        }
        else if (_id == 12) {
            return ElixirOfFrosty();
        }
        else if (_id == 13) {
            return DragonBreathPotion();
        }
        else if (_id == 14) {
            return VialOfSpirit();
        }
        else if (_id == 15) {
            return NightmareFlask();
        }
        else if (_id == 16) {
            return NihilityTonic();
        }
        else if (_id == 17) {
            return PhialOfGladiator();
        }
        else if (_id == 18) {
            return PotionOfArchmage();
        }
        else if (_id == 19) {
            return PotionOfPrecision();
        }
        else if (_id == 20) {
            return ExactionPotion();
        }
        else if (_id == 21) {
            return MercilessFlask();
        }
        else if (_id == 22) {
            return ElixirOfMobility();
        }
        else if (_id == 23) {
            return TonicOfToughness();
        }
        else if (_id == 24) {
            return PiercingTonic();
        }
        revert("wrong");
    }

    function EldersPotion() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 41;
        _requiredItems[1] = 13;
        _requiredItems[2] = 40;
        _recipe.id = 1;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 100e18;
        _recipe.requiredEssence = 15e18;
    }

    function TonicOfTranscendence() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 53;
        _requiredItems[1] = 54;
        _requiredItems[2] = 52;
        _recipe.id = 2;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 150e18;
        _recipe.requiredEssence = 15e18;
    }

    function CraftsmansPotion() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 44;
        _requiredItems[1] = 55;
        _requiredItems[2] = 64;
        _recipe.id = 3;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 150e18;
        _recipe.requiredEssence = 15e18;
    }

    function TonicOfAnger() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 36;
        _requiredItems[1] = 56;
        _requiredItems[2] = 65;
        _recipe.id = 4;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 100e18;
        _recipe.requiredEssence = 10e18;
    }

    function PhialOfAgility() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 46;
        _requiredItems[1] = 57;
        _requiredItems[2] = 66;
        _recipe.id = 5;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 100e18;
        _recipe.requiredEssence = 10e18;
    }

    function PotionOfIronSkin() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 13;
        _requiredItems[1] = 47;
        _requiredItems[2] = 58;
        _recipe.id = 6;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 100e18;
        _recipe.requiredEssence = 10e18;
    }

    function ElixirOfSolutions() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 48;
        _requiredItems[1] = 54;
        _requiredItems[2] = 59;
        _recipe.id = 7;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 100e18;
        _recipe.requiredEssence = 10e18;
    }

    function AthletesFlask() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 41;
        _requiredItems[1] = 43;
        _requiredItems[2] = 60;
        _recipe.id = 8;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 100e18;
        _recipe.requiredEssence = 10e18;
    }

    function PerfumeOfBlackwidow() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 32;
        _requiredItems[1] = 49;
        _requiredItems[2] = 61;
        _recipe.id = 9;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 100e18;
        _recipe.requiredEssence = 10e18;
    }

    function VialOfMotherEarth() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 35;
        _requiredItems[1] = 48;
        _requiredItems[2] = 62;
        _recipe.id = 10;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 220e18;
        _recipe.requiredEssence = 25e18;
    }

    function PotionOfCharge() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 40;
        _requiredItems[1] = 57;
        _requiredItems[2] = 63;
        _recipe.id = 11;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 220e18;
        _recipe.requiredEssence = 25e18;
    }

    function ElixirOfFrosty() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 46;
        _requiredItems[1] = 57;
        _requiredItems[2] = 59;
        _recipe.id = 12;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 220e18;
        _recipe.requiredEssence = 25e18;
    }

    function DragonBreathPotion() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 11;
        _requiredItems[1] = 64;
        _requiredItems[2] = 66;
        _recipe.id = 13;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 220e18;
        _recipe.requiredEssence = 25e18;
    }

    function VialOfSpirit() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 47;
        _requiredItems[1] = 57;
        _requiredItems[2] = 61;
        _recipe.id = 14;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 220e18;
        _recipe.requiredEssence = 25e18;
    }

    function NightmareFlask() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 12;
        _requiredItems[1] = 50;
        _requiredItems[2] = 51;
        _recipe.id = 15;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 220e18;
        _recipe.requiredEssence = 25e18;
    }

    function NihilityTonic() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 13;
        _requiredItems[1] = 32;
        _requiredItems[2] = 59;
        _recipe.id = 16;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 220e18;
        _recipe.requiredEssence = 25e18;
    }

    function PhialOfGladiator() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 47;
        _requiredItems[1] = 36;
        _requiredItems[2] = 58;
        _recipe.id = 17;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 220e18;
        _recipe.requiredEssence = 25e18;
    }

    function PotionOfArchmage() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 41;
        _requiredItems[1] = 45;
        _requiredItems[2] = 49;
        _recipe.id = 18;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 220e18;
        _recipe.requiredEssence = 25e18;
    }

    function PotionOfPrecision() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 9;
        _requiredItems[1] = 19;
        _requiredItems[2] = 41;
        _recipe.id = 19;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 175e18;
        _recipe.requiredEssence = 17e18;
    }

    function ExactionPotion() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 23;
        _requiredItems[1] = 37;
        _requiredItems[2] = 55;
        _recipe.id = 20;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 175e18;
        _recipe.requiredEssence = 17e18;
    }

    function MercilessFlask() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 23;
        _requiredItems[1] = 40;
        _requiredItems[2] = 42;
        _recipe.id = 21;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 175e18;
        _recipe.requiredEssence = 17e18;
    }

    function ElixirOfMobility() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 38;
        _requiredItems[1] = 46;
        _requiredItems[2] = 60;
        _recipe.id = 22;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 175e18;
        _recipe.requiredEssence = 17e18;
    }

    function TonicOfToughness() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 17;
        _requiredItems[1] = 36;
        _requiredItems[2] = 58;
        _recipe.id = 23;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 175e18;
        _recipe.requiredEssence = 17e18;
    }

    function PiercingTonic() public pure returns (GameObjects_Elixir.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 2;
        _requiredItems[1] = 35;
        _requiredItems[2] = 52;
        _recipe.id = 24;
        _recipe.requiredMiscItemIDs = _requiredItems;

        _recipe.requiredGold = 175e18;
        _recipe.requiredEssence = 17e18;
    }
}
