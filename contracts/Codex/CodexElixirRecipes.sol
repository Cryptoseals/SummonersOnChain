import "../Interfaces/GameObjects/IGameObjects.sol";
import "./Common/Rarity.sol";

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract CodexElixirRecipes is Rarity {
    string constant public index = "Codex";
    string constant public class = "ElixirRecipe";

    function lifetime_by_tier(uint _id) public pure returns (uint256) {
        if (_id == 1) {
            return 15 minutes;
        } else if (_id == 2) {
            return 60 minutes;
        } else if (_id == 3) {
            return 4 hours;
        } else if (_id == 4) {
            return 8 hours;
        } else if (_id == 5) {
            return 1 days;
        }
        revert("not found");
    }

    function getAllElixirs(uint8 tier) external pure returns (GameObjects.ElixirRecipe[] memory) {
        GameObjects.ElixirRecipe[] memory result = new GameObjects.ElixirRecipe[](15);
        for (uint i = 1; i <= 15; i++) {
            result[i - 1] = recipe_by_id(i, tier);
        }
        return result;
    }

    function recipe_by_id(uint _id, uint8 _tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        if (_id == 1) {
            return EldersPotion(_tier);
        }
        if (_id == 2) {
            return ElixirOfWealth(_tier);
        }
        if (_id == 3) {
            return TonicOfTranscendence(_tier);
        }
        if (_id == 4) {
            return BlacksmithsPotion(_tier);
        }
        if (_id == 5) {
            return TonicOfAnger(_tier);
        }
        if (_id == 6) {
            return PhialOfAgility(_tier);
        }
        if (_id == 7) {
            return PotionOfIronSkin(_tier);
        }
        if (_id == 8) {
            return ElixirOfSolutions(_tier);
        }
        if (_id == 9) {
            return ExperimentersFlask(_tier);
        }
        if (_id == 10) {
            return PerfumeOfBewitching(_tier);
        }
        if (_id == 11) {
            return VialOfCapability(_tier);
        }
        if (_id == 12) {
            return PotionOfAcumen(_tier);
        }
        if (_id == 13) {
            return ElixirOfAdvantage(_tier);
        }
        if (_id == 14) {
            return TrollsBlood(_tier);
        }
        if (_id == 15) {
            return VialOfSpirit(_tier);
        }
        revert("wrong");
    }

    function EldersPotion(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 41;
        _requiredItems[1] = 13;
        _requiredItems[2] = 40;
        _recipe.id = 1;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function ElixirOfWealth(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 42;
        _requiredItems[1] = 40;
        _requiredItems[2] = 63;
        _recipe.id = 2;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function TonicOfTranscendence(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 53;
        _requiredItems[1] = 54;
        _requiredItems[2] = 52;
        _recipe.id = 3;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function BlacksmithsPotion(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 44;
        _requiredItems[1] = 55;
        _requiredItems[2] = 64;
        _recipe.id = 4;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function TonicOfAnger(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 36;
        _requiredItems[1] = 56;
        _requiredItems[2] = 65;
        _recipe.id = 5;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function PhialOfAgility(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 46;
        _requiredItems[1] = 57;
        _requiredItems[2] = 66;
        _recipe.id = 6;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function PotionOfIronSkin(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 13;
        _requiredItems[1] = 47;
        _requiredItems[2] = 58;
        _recipe.id = 7;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function ElixirOfSolutions(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 48;
        _requiredItems[1] = 54;
        _requiredItems[2] = 59;
        _recipe.id = 8;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function ExperimentersFlask(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 41;
        _requiredItems[1] = 43;
        _requiredItems[2] = 60;
        _recipe.id = 9;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function PerfumeOfBewitching(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 32;
        _requiredItems[1] = 49;
        _requiredItems[2] = 61;
        _recipe.id = 10;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function VialOfCapability(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 46;
        _requiredItems[1] = 47;
        _requiredItems[2] = 58;
        _recipe.id = 11;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function PotionOfAcumen(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 51;
        _requiredItems[1] = 52;
        _requiredItems[2] = 62;
        _recipe.id = 12;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function ElixirOfAdvantage(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 45;
        _requiredItems[1] = 50;
        _requiredItems[2] = 52;
        _recipe.id = 13;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function TrollsBlood(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 3;
        _requiredItems[1] = 58;
        _requiredItems[2] = 58;
        _recipe.id = 14;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }

    function VialOfSpirit(uint8 tier) public pure returns (GameObjects.ElixirRecipe memory _recipe) {
        uint[] memory _requiredItems = new uint[](3);
        _requiredItems[0] = 52;
        _requiredItems[1] = 53;
        _requiredItems[2] = 62;
        _recipe.id = 15;
        _recipe.requiredMiscItemTypes = _requiredItems;
    }
}
