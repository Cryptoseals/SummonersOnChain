import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../Core/Navigator/InitNavigator.sol";
import {Animals, ILand} from "../Interfaces/Lands/ILand.sol";
import {ICodexLands} from "../Interfaces/Codex/ICodexLands.sol";
import {IMiscItems, IAlchemyItems, ICookingItems} from "../Interfaces/Crafting/IBurnables.sol";
import {ICraftingMaterialsToken} from "../Interfaces/NonFungibles/CraftingMaterials/ICraftingMaterialsToken.sol";

pragma solidity ^0.8.0;

contract Lands is Initializable, OwnableUpgradeable, InitNavigator, ERC721EnumerableUpgradeable {

    enum BuildingList {
        LandDetails,
        Poultry,
        BarnHouse,
        StorageBuilding,
        Mill,
        Farms,
        WaterTower,
        Slaughterhouse,
        Dairy
    }

    struct LandStatsStruct {
        uint LandDetailsTier;
        uint PoultriesTier;
        uint BarnHousesTier;
        uint StorageBuildingsTier;
        uint MillsTier;
        uint FarmsTier;
        uint WaterTowersTier;
        uint SlaughterhousesTier;
        uint DairiesTier;
    }

    ICodexLands landCodex;
    IMiscItems miscs;
    IAlchemyItems alchemy;
    ICookingItems cooking;
    ICraftingMaterialsToken materials;
    mapping(uint => LandStatsStruct) public LandStats;

    modifier isOwned(uint landId) {
        require(ownerOf(landId) == msg.sender, "!");
        _;
    }

    function initialize(
        address _navigator,
        string memory name,
        string memory symbol
    ) external initializer {
        initializeNavigator(_navigator);
        __ERC721_init(name, symbol);
        __Ownable_init();
    }

    function initializeContracts() external {
        landCodex = ICodexLands(contractAddress(INavigator.CONTRACT.LANDS_CODEX));
        miscs = IMiscItems(contractAddress(INavigator.CONTRACT.MISC_ITEMS));
        cooking = ICookingItems(contractAddress(INavigator.CONTRACT.COOKING_ITEMS));
        alchemy = IAlchemyItems(contractAddress(INavigator.CONTRACT.ALCHEMY_ITEMS));
        materials = ICraftingMaterialsToken(contractAddress(INavigator.CONTRACT.CRAFTING_MATERIALS));
    }

    function mintItem(address player) external onlyGameContracts {
        uint landId = totalSupply();
        _initializeLand(landId);
        _mint(player, landId);
    }

    function _initializeLand(uint id) internal {
        require(!_exists(id), "no");
        LandStats[id].LandDetailsTier = 1;
        LandStats[id].FarmsTier = 1;
        LandStats[id].PoultriesTier = 1;
        LandStats[id].BarnHousesTier = 1;
    }

    function upgradeBuilding(uint landId, BuildingList building) external isOwned(landId) {
        LandStatsStruct storage stats = LandStats[landId];
        ILand.BuildingRequirement memory reqs;

        if (building == BuildingList.LandDetails) {
            reqs = landCodex.landBuildReqs(stats.LandDetailsTier);
            stats.LandDetailsTier++;
        }
        else if (building == BuildingList.Poultry) {
            reqs = landCodex.poultryBuildReqs(stats.PoultriesTier);
            stats.PoultriesTier++;
        }
        else if (building == BuildingList.BarnHouse) {
            reqs = landCodex.barnBuilding(stats.BarnHousesTier);
            stats.BarnHousesTier++;
        }
        else if (building == BuildingList.StorageBuilding) {
            reqs = landCodex.storageBuilding(stats.StorageBuildingsTier);
            stats.StorageBuildingsTier++;
        }
        else if (building == BuildingList.Mill) {
            reqs = landCodex.millBuilding(stats.MillsTier);
            stats.MillsTier++;
        }
        else if (building == BuildingList.Farms) {
            reqs = landCodex.farmBuilding(stats.FarmsTier);
            stats.FarmsTier++;
        }
        else if (building == BuildingList.WaterTower) {
            reqs = landCodex.waterBuilding(stats.WaterTowersTier);
            stats.WaterTowersTier++;
        }
        else if (building == BuildingList.Slaughterhouse) {
            reqs = landCodex.slaughterhouseBuilding(stats.SlaughterhousesTier);
            stats.SlaughterhousesTier++;
        }
        else if (building == BuildingList.Dairy) {
            reqs = landCodex.dairiesBuilding(stats.DairiesTier);
            stats.DairiesTier++;
        }

        require(reqs.isValid, "v");

        for (uint i = 0; i < reqs.requiredMiscItems.length; i++) {
            materials.burnMaterial(msg.sender, reqs.requiredMaterials[i].id, reqs.requiredMaterials[i].amount);
        }

        for (uint i = 0; i < reqs.requiredMiscItems.length; i++) {
            miscs.burnMiscItem(msg.sender, reqs.requiredMiscItems[i].id, reqs.requiredMiscItems[i].amount);
        }

        for (uint i = 0; i < reqs.requiredCookingItems.length; i++) {
            cooking.burnCookingItem(msg.sender, reqs.requiredCookingItems[i].id, reqs.requiredCookingItems[i].amount);
        }

        for (uint i = 0; i < reqs.requiredAlchemyItems.length; i++) {
            alchemy.burnAlchemyItem(msg.sender, reqs.requiredAlchemyItems[i].id, reqs.requiredAlchemyItems[i].amount);
        }
    }

}
