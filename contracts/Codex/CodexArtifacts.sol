import {GameObjects} from "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexArtifacts {
    string constant public index = "Codex";
    string constant public class = "Artifacts";
    string constant public version = "0.0.1";

    function artifact(uint _id, uint _tier) public pure returns (GameObjects.Artifact memory) {
        if (_id == 1) {
            return DummyArtifact(_tier);
        }

        revert("invalid");
    }

    function DummyArtifact(uint tier) public pure returns (GameObjects.Artifact memory _artifact) {
        _artifact.metadata.id = 1;
        _artifact.metadata.baseType = GameObjects.ItemType.ARTIFACT;
        _artifact.metadata.name = "Dummy Artifact";
        _artifact.metadata.description = "Dummy Artifact is best artifact";
        _artifact.metadata.upgradable = true;

        _artifact.requirement.level = 1;
        _artifact.requirement.classRequirement = new GameObjects.Class[](0);
        _artifact.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _artifact.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _artifact.generatedStatBonus = GameObjects.GeneratedStats({HP : 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION: 0});
    }
}
