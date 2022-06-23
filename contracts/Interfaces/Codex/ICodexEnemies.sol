import "../GameObjects/IGameObjects.sol";
import "../GameObjects/IMonster.sol";
pragma solidity ^0.8.0;

interface ICodexEnemies {
    function enemy(GameObjects.Element ele, uint256 _id, uint256 _lvl)
    external
    view
    returns (IMonster.Monster memory);
}
