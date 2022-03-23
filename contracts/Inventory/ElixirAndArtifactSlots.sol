import "../Interfaces/Attributes/IAttributes.sol";
import "../Interfaces/Summoners/ISummoners.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/Codex/IAllCodexViews.sol";
import "../Interfaces/NonFungibles/EquipableItems/IEquipableItems.sol";
import "../Interfaces/NonFungibles/ElixirsAndArtifacts/IElixirsAndArtifacts.sol";
import "../Core/Navigator/InitNavigator.sol";
import "./EquipableUtils.sol";

pragma solidity ^0.8.0;

contract ElixirSlots is Initializable, InitNavigator {

    uint public constant ELIXIR_SLOTS = 3;
    uint public constant ARTIFACT_SLOTS = 3;

    // summoner elixir slots. summoner id -> equipped
    mapping(uint => mapping(uint => ConsumedElixir)) public ElixirSlots;
    mapping(uint => mapping(uint => EquippedArtifact)) public ArtifactSlots;

    struct ConsumedElixir {
        uint tokenId;
        uint elixirId;
        uint tier;
        uint expirationTime;
    }

    struct EquippedArtifact {
        uint tokenId;
        uint artifactId;
        uint tier;
    }

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }

    function consumeElixir(uint summoner, uint slot, uint id) external {
        require(slot > 0 && slot <= ELIXIR_SLOTS, "");
        // check ownership, remove previous effects and apply new
        require(
            IERC721(contractAddress(INavigator.CONTRACT.ELIXIRS)).ownerOf(id) == msg.sender,
            "!"
        );
        IElixirsAndArtifacts elixirContract = IElixirsAndArtifacts(contractAddress(INavigator.CONTRACT.ELIXIRS));
        uint elixirId = elixirContract.itemType(id);
        uint tier = elixirContract.tier(id);
        GameObjects.Elixir memory elixir = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX)).elixir(elixirId, tier);
        require(elixirContract.burnItem(id), "?!");
        ElixirSlots[summoner][slot] = ConsumedElixir({
            elixirId : elixirId,
            tier : tier,
            tokenId : id,
            expirationTime : block.timestamp + elixir.expirationTime
        });
    }

    function equipArtifact(uint summoner, uint slot, uint id) external {
        require(slot > 0 && slot <= ARTIFACT_SLOTS, "");
        // check ownership, remove previous effects and apply new
        require(
            IERC721(contractAddress(INavigator.CONTRACT.ARTIFACTS)).ownerOf(id) == msg.sender,
            "!"
        );
        IElixirsAndArtifacts artifactContract = IElixirsAndArtifacts(contractAddress(INavigator.CONTRACT.ARTIFACTS));
        uint artifactId = artifactContract.itemType(id);
        uint tier = artifactContract.tier(id);
        require(artifactContract.burnItem(id), "?!");
        ArtifactSlots[summoner][slot] = EquippedArtifact({
        artifactId : artifactId,
        tier : tier,
        tokenId : id
        });
    }

    function activeElixirs(uint summoner) external view returns (GameObjects.Stats memory _stats,GameObjects.GeneratedStats memory _gen_stats,GameObjects.ElementalStats memory _ele_stats){
        for (uint i = 1; i <= ELIXIR_SLOTS; i++) {
            ConsumedElixir memory _consumed = ElixirSlots[summoner][i];
            if(_consumed.expirationTime < block.timestamp) continue;

            GameObjects.Elixir memory elixir = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX)).elixir(_consumed.elixirId, _consumed.tier);
            EquipableUtils.sumStats(_stats, elixir.statBonus);
            EquipableUtils.sumGeneratedStats(_gen_stats, elixir.generatedStatBonus);
            EquipableUtils.sumGeneratedElementalStats(_ele_stats, elixir.elementalStats);
        }
    }

    function activeArtifacts(uint summoner) external view returns (GameObjects.Stats memory _stats,GameObjects.GeneratedStats memory _gen_stats,GameObjects.ElementalStats memory _ele_stats){
        for (uint i = 1; i <= ARTIFACT_SLOTS; i++) {
            EquippedArtifact memory _consumed = ArtifactSlots[summoner][i];
            GameObjects.Artifact memory artifact = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX)).artifact(_consumed.artifactId, _consumed.tier);
            EquipableUtils.sumStats(_stats, artifact.statBonus);
            EquipableUtils.sumGeneratedStats(_gen_stats, artifact.generatedStatBonus);
            EquipableUtils.sumGeneratedElementalStats(_ele_stats, artifact.elementalStats);
        }
    }
}
