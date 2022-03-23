import "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexArtifacts {
    function artifact(uint _id, uint _tier) external pure returns (GameObjects.Artifact memory);
}
