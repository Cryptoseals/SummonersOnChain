import "../Core/Navigator/InitNavigator.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/structs/EnumerableSetUpgradeable.sol";
import "../Interfaces/Crafting/Processing/IProcessingMaterialRecipes.sol";

pragma solidity ^0.8.0;

contract CraftingMaterials is Initializable, OwnableUpgradeable, InitNavigator, ERC1155Upgradeable {
    using EnumerableSetUpgradeable for EnumerableSetUpgradeable.UintSet;
    using Strings for uint256;

    uint nextProcessId;

    mapping(uint => ICraftingMaterials.ProcessingProcess) public ActiveProcessings;
    mapping(address => EnumerableSetUpgradeable.UintSet) AccountsActiveProcessings;

    function initialize(address _navigator, string memory uri) external initializer {
        initializeNavigator(_navigator);
        __ERC1155_init(uri);
        __Ownable_init();
    }

    function mintMaterial(ICraftingMaterials.CraftingMaterial material, address to, uint amount) external onlyGameContracts {
        _mint(to, uint(material), amount, new bytes(0));
    }
    // test purposes
//    function mintDev(ICraftingMaterials.CraftingMaterial material, uint amount) external {
//        _mint(msg.sender, uint(material), amount, new bytes(0));
//    }

    function burnMaterial(address from, uint id, uint amount) external onlyGameContracts {
        _burn(from, uint(id), amount);
    }

    function processMaterial(ICraftingMaterials.MaterialTypes materialType,
        ICraftingMaterials.CraftingMaterial targetMaterial, uint amount) external {
        ICraftingMaterials.ProcessingRecipe memory _recipe;

        if (materialType == ICraftingMaterials.MaterialTypes.ORE) {
            _recipe = IProcessingMaterialRecipes(contractAddress(INavigator.CONTRACT.ORE_PROCESSING_RECIPES)).recipe(targetMaterial, amount);
        } else if (materialType == ICraftingMaterials.MaterialTypes.WOOD) {
            _recipe = IProcessingMaterialRecipes(contractAddress(INavigator.CONTRACT.WOOD_PROCESSING_RECIPES)).recipe(targetMaterial, amount);
        } else if (materialType == ICraftingMaterials.MaterialTypes.CLOTH) {
            _recipe = IProcessingMaterialRecipes(contractAddress(INavigator.CONTRACT.CLOTH_PROCESSING_RECIPES)).recipe(targetMaterial, amount);
        }  else if (materialType == ICraftingMaterials.MaterialTypes.GEMSTONE) {
            _recipe = IProcessingMaterialRecipes(contractAddress(INavigator.CONTRACT.GEMSTONE_PROCESSING_RECIPES)).recipe(targetMaterial, amount);
        } else {
            revert("?");
        }

        _burn(msg.sender, uint(_recipe.requiredMaterial), _recipe.amount);

        ActiveProcessings[nextProcessId] = ICraftingMaterials.ProcessingProcess({
        amount : amount,
        rewardMaterial : targetMaterial,
        when : block.timestamp + _recipe.requiredTime,
        who : msg.sender,
        isClaimed : false,
        startingDate : block.timestamp
        });

        AccountsActiveProcessings[msg.sender].add(nextProcessId);

        nextProcessId++;
    }

    function claimProcess(uint[] memory processIds) external {
        for (uint i = 0; i < processIds.length; i++) {
            ICraftingMaterials.ProcessingProcess memory process = ActiveProcessings[processIds[i]];
            require(process.isClaimed == false, "claimed");
            require(process.who == msg.sender, "unauth");
            require(process.when <= block.timestamp, "time");

            AccountsActiveProcessings[msg.sender].remove(processIds[i]);
            ActiveProcessings[processIds[i]].isClaimed = true;

            _mint(msg.sender, uint(process.rewardMaterial), process.amount, new bytes(0));
        }
    }

    function partialClaimProcess(uint processId, uint amount) external {
        require(ActiveProcessings[processId].isClaimed == false, "claimed");
        require(ActiveProcessings[processId].who == msg.sender, "unauth");
        require(amount <= ActiveProcessings[processId].amount, "scam?");

        uint timeRequiredPerMaterial = (ActiveProcessings[processId].when - ActiveProcessings[processId].startingDate) / ActiveProcessings[processId].amount;
        require(block.timestamp > ActiveProcessings[processId].startingDate + timeRequiredPerMaterial * amount, "early");

        ActiveProcessings[processId].startingDate += timeRequiredPerMaterial * amount;
        ActiveProcessings[processId].amount -= amount;

        if(ActiveProcessings[processId].amount == 0) {
            AccountsActiveProcessings[msg.sender].remove(processId);
        }

        _mint(msg.sender, uint(ActiveProcessings[processId].rewardMaterial), amount, new bytes(0));
    }

    function upgradeMaterial(ICraftingMaterials.MaterialTypes materialType,
        ICraftingMaterials.CraftingMaterial targetMaterial, uint amount) external {
        ICraftingMaterials.UpgradingRecipe memory _recipe;
        if (materialType == ICraftingMaterials.MaterialTypes.ORE) {
            _recipe = IProcessingMaterialRecipes(contractAddress(INavigator.CONTRACT.ORE_UPGRADING_RECIPES)).upgradeRecipe(targetMaterial, amount);
        } else if (materialType == ICraftingMaterials.MaterialTypes.WOOD) {
            _recipe = IProcessingMaterialRecipes(contractAddress(INavigator.CONTRACT.WOOD_UPGRADING_RECIPES)).upgradeRecipe(targetMaterial, amount);
        } else if (materialType == ICraftingMaterials.MaterialTypes.CLOTH) {
            _recipe = IProcessingMaterialRecipes(contractAddress(INavigator.CONTRACT.CLOTH_UPGRADING_RECIPES)).upgradeRecipe(targetMaterial, amount);
        }  else if (materialType == ICraftingMaterials.MaterialTypes.GEMSTONE) {
            _recipe = IProcessingMaterialRecipes(contractAddress(INavigator.CONTRACT.GEMSTONE_UPGRADING_RECIPES)).upgradeRecipe(targetMaterial, amount);
        } else {
            revert("?");
        }
        _burn(msg.sender, uint(_recipe.requiredMaterial), _recipe.amount);
        _mint(msg.sender, uint(targetMaterial), amount, new bytes(0));
    }

    function activeProcessingsOfUser(address account) external view returns (uint[] memory _result) {
        return AccountsActiveProcessings[account].values();
    }

    function setURI(string memory __uri) external onlyOwner {
        _setURI(__uri);
    }

    function tokenURI(uint256 id) public view returns (string memory) {
        return string(abi.encodePacked(uri(id), id.toString()));
    }
}
