import {GameObjects, GameObjects_BuffEffects} from "../Interfaces/GameObjects/IGameObjects.sol";
import "./Common/Rarity.sol";
pragma solidity ^0.8.0;

contract CodexCookingItems {

    function getAllCookingItems() external pure returns (GameObjects_BuffEffects.CookingItem[] memory) {
        GameObjects_BuffEffects.CookingItem[] memory result = new GameObjects_BuffEffects.CookingItem[](66);
        for (uint i = 1; i <= 66; i++) {
            result[i - 1] = item(i);
        }
        return result;
    }

    function item(uint _id) public pure returns (GameObjects_BuffEffects.CookingItem memory _misc) {
        if (_id == 0) {
            return Dummy();
        }

        revert("wrong");
    }

    function Dummy() public pure returns (GameObjects_BuffEffects.CookingItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.ALCHEMY;
        _misc.metadata.id = 0;
    }
}
