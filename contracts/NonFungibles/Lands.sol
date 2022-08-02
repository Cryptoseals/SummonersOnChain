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



    ICodexLands landCodex;
    IMiscItems miscs;
    IAlchemyItems alchemy;
    ICookingItems cooking;
    ICraftingMaterialsToken materials;
    mapping(uint => ILand.LandStatsStruct) public LandStats;

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
        ILand.LandStatsStruct storage stats = LandStats[landId];
        ILand.BuildingRequirement memory reqs;

        if (building == BuildingList.LandDetails) {
            ILand.GeneralBuilding memory _landDetails = landCodex.land(stats.LandDetailsTier);
            require(stats.LandDetailsTier < _landDetails.maxLevel, "m");
            reqs = _landDetails.upgradeReqs;
            stats.LandDetailsTier++;
        }
        else if (building == BuildingList.Poultry) {
            ILand.Poultry memory _poultries = landCodex.poultry(stats.PoultriesTier);
            require(stats.PoultriesTier < _poultries.building.maxLevel, "m");
            reqs = _poultries.building.upgradeReqs;
            stats.PoultriesTier++;
        }
        else if (building == BuildingList.BarnHouse) {
            ILand.BarnHouse memory _barn = landCodex.barnHouse(stats.BarnHousesTier);
            require(stats.BarnHousesTier < _barn.building.maxLevel, "m");
            reqs = _barn.building.upgradeReqs;
            stats.BarnHousesTier++;
        }
        else if (building == BuildingList.StorageBuilding) {
            ILand.Storages memory _storage = landCodex.storages(stats.StorageBuildingsTier);
            require(stats.StorageBuildingsTier < _storage.building.maxLevel, "m");
            reqs = _storage.building.upgradeReqs;
            stats.StorageBuildingsTier++;
        }
        else if (building == BuildingList.Mill) {
            ILand.Mill memory _mill = landCodex.mill(stats.MillsTier);
            require(stats.MillsTier < _mill.building.maxLevel, "m");
            reqs = _mill.building.upgradeReqs;
            stats.MillsTier++;
        }
        else if (building == BuildingList.Farms) {
            ILand.Farm memory _farms = landCodex.farm(stats.FarmsTier);
            require(stats.FarmsTier < _farms.building.maxLevel, "m");
            reqs = _farms.building.upgradeReqs;
            stats.FarmsTier++;
        }
        else if (building == BuildingList.WaterTower) {
            ILand.WaterTower memory _watertower = landCodex.waterTower(stats.WaterTowersTier);
            require(stats.WaterTowersTier < _watertower.building.maxLevel, "m");
            reqs = _watertower.building.upgradeReqs;
            stats.WaterTowersTier++;
        }
        else if (building == BuildingList.Slaughterhouse) {
            ILand.Slaughterhouse memory _slaughterhouse = landCodex.slaughterhouse(stats.SlaughterhousesTier);
            require(stats.SlaughterhousesTier < _slaughterhouse.building.maxLevel, "m");
            reqs = _slaughterhouse.building.upgradeReqs;
            stats.SlaughterhousesTier++;
        }
        else if (building == BuildingList.Dairy) {
            ILand.Dairies memory _dairy = landCodex.dairies(stats.DairiesTier);
            require(stats.DairiesTier < _dairy.building.maxLevel, "m");
            reqs = _dairy.building.upgradeReqs;
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

    function landStats(uint landId) external view returns (ILand.LandStatsStruct memory){
        require(_exists(landId), "e");
        return LandStats[landId];
    }

}
