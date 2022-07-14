import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {ERC721EnumerableUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {GameObjects, GameObjects_Equipments} from "../Interfaces/GameObjects/IGameObjects.sol";
import {ICodexRandom} from "../Interfaces/Codex/ICodexRandom.sol";
import "../Core/Common/Errors.sol";
import {EquipableUtils} from "../Inventory/EquipableUtils.sol";

interface ArtifactProps {
    function properties(uint[] memory ids, uint tier) external view returns (GameObjects_Equipments.Artifact[] memory);
}

pragma solidity ^0.8.0;

contract Artifacts is Initializable, OwnableUpgradeable, InitNavigator, ERC721EnumerableUpgradeable {

    mapping(uint => uint[]) public tokenToArtifactProps;
    mapping(uint => uint) public tokenToEnchantmentLevel;

    uint constant MAX_PROPS = 3;
    uint constant PROPS = 30;

    function initialize(address _navigator, string memory name, string memory symbol) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
        __Ownable_init();
    }

    function mintItem(address player, uint artifactTier) external onlyGameContracts {
        uint nextToken = totalSupply() + 1;
        tokenToEnchantmentLevel[nextToken] = artifactTier;

        ICodexRandom rng = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));

        uint[] memory rolls = new uint[](3);

        for (uint i = 0; i < MAX_PROPS; i++) {
            rolls[i] = rng.dn(nextToken + gasleft() + block.number + i, PROPS) + 1;
        }

        tokenToArtifactProps[nextToken] = rolls;

        _mint(player, nextToken);
    }

    function burnItem(uint tokenId) external onlyGameContracts returns (bool) {
        _burn(tokenId);
        return true;
    }

    function upgrade(uint id) external onlyGameContracts {
        // @TODO implement upgrade costs and burners.
        tokenToEnchantmentLevel[id]++;
    }

    function tier(uint id) public view returns (uint _tier) {
        if (!_exists(id)) revert InvalidItem("DOES NOT EXIST");
        _tier = tokenToEnchantmentLevel[id];
    }

    function artifact(uint id) external view returns (GameObjects_Equipments.Artifact memory _result){
        require(_exists(id),"not found");
        ArtifactProps props = ArtifactProps(contractAddress(INavigator.CONTRACT.ARTIFACT_PROPS_CODEX));
        GameObjects_Equipments.Artifact[] memory artifactProps = props.properties(tokenToArtifactProps[id], tokenToEnchantmentLevel[id]);
        for (uint i = 0; i < artifactProps.length; i++) {
            _result.statBonus = EquipableUtils.sumStats(_result.statBonus, artifactProps[i].statBonus);
            _result.generatedStatBonus = EquipableUtils.sumGeneratedStats(_result.generatedStatBonus, artifactProps[i].generatedStatBonus);
            _result.elementalStats = EquipableUtils.sumGeneratedElementalStats(_result.elementalStats, artifactProps[i].elementalStats);
        }
        return _result;
    }

}
