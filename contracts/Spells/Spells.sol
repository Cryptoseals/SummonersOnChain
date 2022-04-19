import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/Attributes/IAttributes.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Inventory/EquipableUtils.sol";
import "../Interfaces/Codex/ICodexSpells.sol";
import "../Interfaces/GameObjects/ISpell.sol";
import "../Interfaces/Core/Constants/Constants.sol";
import "../Interfaces/Core/Calculator/ICalculator.sol";
import "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract Spells is Initializable, InitNavigator {

    // @dev summoner-> spell -> spell level
    mapping(uint => mapping(uint => uint)) public SummonerSpellLevels;

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }

    function learnSpell(uint _summoner, ISpell.SpellCategories category, uint spellId) external senderIsSummonerOwner(_summoner) {
        require(SummonerSpellLevels[_summoner][spellId] == 0, "learnt");
        ISpell.Spell memory spell = ICodexSpells(contractAddress(INavigator.CONTRACT.SPELLS_CODEX)).spell(spellId, 1);
        GameEntities.SummonerData memory summoner = ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).summonerData(_summoner);
        require(summoner.level >= spell.requirements.level, "lvl");
        require(checkClass(summoner.class, category), "class");
        require(checkAttributes(_summoner, spell.requirements.statRequirement), "low");
        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.ESSENCE)).burnToken(msg.sender, spell.learningCost);
        SummonerSpellLevels[_summoner][spellId] = 1;
    }
    function upgradeSpell(uint _summoner, ISpell.SpellCategories category, uint spellId) external senderIsSummonerOwner(_summoner) {
        require(SummonerSpellLevels[_summoner][spellId] != 0, "not learnt");
        uint nextTier = SummonerSpellLevels[_summoner][spellId]+1;
        ISpell.Spell memory spell = ICodexSpells(contractAddress(INavigator.CONTRACT.SPELLS_CODEX)).spell(spellId, nextTier);
        GameObjects.Stats memory summed = EquipableUtils.sumStats(spell.requirements.statRequirement, spell.requirements.additionalStatRequirementsPerTier);
    }

    function checkClass(GameObjects.Class _summonerClass, ISpell.SpellCategories cat) internal view returns (bool) {
        bool[11] memory _validSpells = ICodexSpells(contractAddress(INavigator.CONTRACT.SPELLS_CODEX)).classSpells(_summonerClass);
        return _validSpells[uint(cat)];
    }

    function checkAttributes(uint summoner, GameObjects.Stats memory _spellAttr) internal view returns (bool) {
        GameObjects.Stats memory _summonerAttr = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES)).stats(summoner);
        return _summonerAttr.STR >= _spellAttr.STR &&
        _summonerAttr.DEX >= _spellAttr.DEX &&
        _summonerAttr.INT >= _spellAttr.INT &&
        _summonerAttr.AGI >= _spellAttr.AGI &&
        _summonerAttr.VIT >= _spellAttr.VIT &&
        _summonerAttr.LUCK >= _spellAttr.LUCK;
    }

    function upgradeSpell(uint summoner, uint spellId) external senderIsSummonerOwner(summoner) {
        require(SummonerSpellLevels[summoner][spellId] > 0, "not");
        ISpell.Spell memory spell = ICodexSpells(contractAddress(INavigator.CONTRACT.SPELLS_CODEX)).spell(spellId, 1);

        uint nextTier = SummonerSpellLevels[summoner][spellId];
        uint nextTierCost = spell.learningCost * spell.upgradeCostMultiplier * nextTier;

        require(checkAttributesUpgrade(summoner, nextTier, spell.requirements.statRequirement, spell.requirements.additionalStatRequirementsPerTier), "low");


        IFungibleInGameToken(contractAddress(INavigator.CONTRACT.ESSENCE)).burnToken(msg.sender, nextTierCost);
        SummonerSpellLevels[summoner][spellId]++;
    }

    function checkAttributesUpgrade(uint summoner, uint tier,
        GameObjects.Stats memory _spellAttr, GameObjects.Stats memory _perTier) internal view returns (bool) {
        GameObjects.Stats memory _summonerAttr = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES)).stats(summoner);

        for (uint i = 1; i <= tier; i++) {
            _spellAttr = EquipableUtils.sumStats(_spellAttr, _perTier);
        }

        return _summonerAttr.STR >= _spellAttr.STR &&
        _summonerAttr.DEX >= _spellAttr.DEX &&
        _summonerAttr.INT >= _spellAttr.INT &&
        _summonerAttr.AGI >= _spellAttr.AGI &&
        _summonerAttr.VIT >= _spellAttr.VIT &&
        _summonerAttr.LUCK >= _spellAttr.LUCK;
    }

}
