import {GameObjects_Equipments} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.15;

interface ICodexArtifacts {
    function artifact(uint _id, uint _tier) external pure returns (GameObjects_Equipments.Artifact memory);
}
