import {GameObjects, GameObjects_Stats} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.15;

interface IBaseEnemyStats {
    function enemyDEF(GameObjects.Element element, uint level) external view returns(uint);
    function enemyHP(GameObjects.Element element, uint level) external view returns(uint);
    function enemyACC(GameObjects.Element element, uint level) external view returns(uint);
    function enemyDODGE(GameObjects.Element element, uint level) external view returns(uint);
    function enemySTAT(GameObjects.Element element, uint level) external view returns(uint);
    function enemyATK(GameObjects.Element element, uint level) external view returns(uint);
    function enemyCRIT(GameObjects.Element element, uint level) external view returns(uint);
    function enemyCRIT_MULT(GameObjects.Element element, uint level) external view returns(uint);
    function getStatSet(uint level) external view returns (GameObjects_Stats.Stats memory, GameObjects_Stats.GeneratedStats memory, GameObjects_Stats.ElementalStats memory);
}
