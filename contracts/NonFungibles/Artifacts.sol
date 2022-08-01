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

    ArtifactProps props;
    ICodexRandom rng;
    mapping(uint => uint[]) public tokenToArtifactProps;
    mapping(uint => uint) public tokenToEnchantmentLevel;

    uint constant MAX_PROPS = 3;
    uint constant PROPS = 30;


    struct ArtifactDTO {
        uint tokenId;
        uint[] props;
        GameObjects_Equipments.Artifact artifact;
    }

    function initialize(address _navigator, string memory name, string memory symbol) initializer external {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
        __Ownable_init();
    }

    function initializeContracts() external {
        props = ArtifactProps(contractAddress(INavigator.CONTRACT.ARTIFACT_PROPS_CODEX));
        rng = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
    }

    function mintItem(address player, uint artifactTier) external onlyGameContracts {
        uint nextToken = totalSupply() + 1;
        tokenToEnchantmentLevel[nextToken] = artifactTier;


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

    function artifact(uint id) public view returns (GameObjects_Equipments.Artifact memory _result){
        require(_exists(id), "not found");
        GameObjects_Equipments.Artifact[] memory artifactProps = props.properties(tokenToArtifactProps[id], tokenToEnchantmentLevel[id]);
        for (uint i = 0; i < artifactProps.length; i++) {
            _result.statBonus = EquipableUtils.sumStats(_result.statBonus, artifactProps[i].statBonus);
            _result.generatedStatBonus = EquipableUtils.sumGeneratedStats(_result.generatedStatBonus, artifactProps[i].generatedStatBonus);
            _result.elementalStats = EquipableUtils.sumGeneratedElementalStats(_result.elementalStats, artifactProps[i].elementalStats);
        }
        return _result;
    }

    function tokensOfOwner(address _owner) public view returns (uint[] memory) {
        uint[] memory _tokensOfOwner = new uint[](balanceOf(_owner));
        uint i;

        for (i = 0; i < _tokensOfOwner.length; i++) {
            _tokensOfOwner[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return (_tokensOfOwner);
    }

    function artifactsOfOwner(address _owner) public view returns (ArtifactDTO[] memory) {
        ArtifactDTO[] memory _artifactsOfOwner = new ArtifactDTO[](balanceOf(_owner));
        uint i;
        for (i = 0; i < _artifactsOfOwner.length;) {
            _artifactsOfOwner[i].tokenId = tokenOfOwnerByIndex(_owner, i);
            _artifactsOfOwner[i].artifact = artifact(_artifactsOfOwner[i].tokenId);
            _artifactsOfOwner[i].props = tokenToArtifactProps[_artifactsOfOwner[i].tokenId];
        unchecked {i++;}
        }
        return _artifactsOfOwner;
    }
}
