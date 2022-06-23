import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Interfaces/Core/Constants/Constants.sol";
import "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract Skills is Initializable, InitNavigator {

    mapping(uint => mapping(uint => uint)) public SummonerSkillLevels;

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }
}
