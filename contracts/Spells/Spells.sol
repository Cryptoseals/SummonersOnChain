import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Interfaces/Core/Constants/Constants.sol";
import "../Interfaces/Core/Calculator/ICalculator.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Codex/CodexSpells.sol";

pragma solidity ^0.8.0;

contract Spells is Initializable, InitNavigator {

    mapping(uint => GameObjects.Stats) public SummonerStats;

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }
}
