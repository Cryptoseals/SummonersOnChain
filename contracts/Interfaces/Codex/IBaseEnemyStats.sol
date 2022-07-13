import {GameObjects} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.15;

interface IBaseEnemyStats {
    function enemyEDEFbonus(GameObjects.Element element, uint level) external view returns(uint);
    function enemyEDEF(GameObjects.Element element, uint level) external view returns(uint);
    function enemyMDEF(GameObjects.Element element, uint level) external view returns(uint);
    function enemyPDEF(GameObjects.Element element, uint level) external view returns(uint);
    function enemyHP(GameObjects.Element element, uint level) external view returns(uint);
    function enemyACC(GameObjects.Element element, uint level) external view returns(uint);
    function enemyDODGE(GameObjects.Element element, uint level) external view returns(uint);
    function enemySTAT(GameObjects.Element element, uint level) external view returns(uint);
    function enemyATK(GameObjects.Element element, uint level) external view returns(uint);
    function enemyCRIT(GameObjects.Element element, uint level) external view returns(uint);
    function enemyCRIT_MULT(GameObjects.Element element, uint level) external view returns(uint);
}
