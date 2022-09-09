import {Stats, GeneratedStats, ElementalStats, Element} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.15;

interface IBaseEnemyStats {
    function enemyDEF(Element element, uint level) external view returns(uint);
    function enemyHP(Element element, uint level) external view returns(uint);
    function enemyACC(Element element, uint level) external view returns(uint);
    function enemyDODGE(Element element, uint level) external view returns(uint);
    function enemySTAT(Element element, uint level) external view returns(uint);
    function enemyATK(Element element, uint level) external view returns(uint);
    function enemyCRIT(Element element, uint level) external view returns(uint);
    function enemyCRIT_MULT(Element element, uint level) external view returns(uint);
    function getStatSet(uint level) external view returns (Stats memory, GeneratedStats memory, ElementalStats memory);
}
