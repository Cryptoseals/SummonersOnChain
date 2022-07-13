import {GameObjects, GameObjects} from "../GameObjects/IGameObjects.sol";
import {IMonster} from "../GameObjects/IMonster.sol";
pragma solidity ^0.8.15;

interface ICodexEnemies {
    function enemy(GameObjects.Element ele, uint256 _id, uint256 _lvl)
    external
    view
    returns (IMonster.Monster memory);
}
