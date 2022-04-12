import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/ISpell.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Interfaces/Core/Constants/Constants.sol";
import "../Interfaces/Core/Calculator/ICalculator.sol";
import "../Core/Navigator/InitNavigator.sol";
import "../Codex/CodexSpells.sol";

pragma solidity ^0.8.0;

contract Spells is Initializable, InitNavigator {

    // @dev summoner-> spell -> spell level
    mapping(uint => mapping(uint => uint)) public SummonerSpellLevels;

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }

    function learnSpell(uint summoner, uint spellId) external senderIsSummonerOwner(summoner) {
        ISpell.Spell memory spell = ISpell(contractAddress(INavigator.CONTRACT.SPELLS_CODEX)).spell(spellId);
        GameEntities.SummonerData memory summoner = ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).summonerData(summoner);
        require(summoner.level >= spell.requirements.level, "lvl");

        // TODO , implement
    }
}
