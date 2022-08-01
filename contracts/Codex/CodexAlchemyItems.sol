import {GameObjects, GameObjects_BuffEffects} from "../Interfaces/GameObjects/IGameObjects.sol";
import "./Common/Rarity.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexAlchemyItems is Rarity {
    string constant public index = "Codex";
    string constant public class = "AlchemyItems";
    string constant public version = "0.0.1";

    function getAllAlchemyItems() external pure returns (GameObjects_BuffEffects.AlchemyItem[] memory) {
        GameObjects_BuffEffects.AlchemyItem[] memory result = new GameObjects_BuffEffects.AlchemyItem[](66);
        for (uint i = 1; i <= 66; i++) {
            result[i - 1] = item(i);
        }
        return result;
    }

    function item(uint _id) public pure returns (GameObjects_BuffEffects.AlchemyItem memory _misc) {
        if (_id == 0) {
            return Dummy();
        }

        revert("wrong");
    }

    function Dummy() public pure returns (GameObjects_BuffEffects.AlchemyItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.ALCHEMY;
        _misc.metadata.id = 0;
    }
}