import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Core/Common/Errors.sol";
import {IAttributes} from "../Interfaces/Attributes/IAttributes.sol";
import {SummonerData} from "../Interfaces/GameObjects/IGameEntities.sol";
import {Class, Stats} from "../Interfaces/GameObjects/IGameObjects.sol";
import {EquipableUtils} from "../Inventory/EquipableUtils.sol";
import {ICodexSpells} from "../Interfaces/Codex/ICodexSpells.sol";
import {SpellCategories, Spell} from "../Interfaces/GameObjects/ISpell.sol";
import {GameConstants} from "../Interfaces/Core/Constants/Constants.sol";
import {ICalculator} from "../Interfaces/Core/Calculator/ICalculator.sol";
import {IFungibleInGameToken} from "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import {InitNavigator, INavigator, ISummoners} from "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract Spells is Initializable, InitNavigator {
    // @dev summoner-> spell -> spell level
    mapping(uint256 => mapping(SpellCategories => mapping(uint256 => uint256)))
        public SummonerSpellLevels;
    ICodexSpells codexSpells;
    IFungibleInGameToken essence;
    IAttributes attributes;

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }

    function initializeContracts() external {
        codexSpells = ICodexSpells(
            contractAddress(INavigator.CONTRACT.SPELLS_CODEX)
        );
        essence = IFungibleInGameToken(
            contractAddress(INavigator.CONTRACT.ESSENCE)
        );
        attributes = IAttributes(
            contractAddress(INavigator.CONTRACT.ATTRIBUTES)
        );
    }

    function learnSpell(
        uint256 _summoner,
        SpellCategories category,
        uint256 spellId
    ) external senderIsSummonerOwner(_summoner) {
        require(
            SummonerSpellLevels[_summoner][category][spellId] == 0,
            "learnt"
        );
        Spell memory spell = codexSpells.spell(category, spellId, 1);
        SummonerData memory summoner = Summoners.summonerData(
            _summoner
        );
        require(summoner.level >= spell.requirements.level, "lvl");
        require(checkClass(summoner.class, category), "class");
        essence.burnToken(msg.sender, spell.learningCost);
        SummonerSpellLevels[_summoner][category][spellId] = 1;
    }

    function checkClass(Class _summonerClass, SpellCategories cat)
        internal
        view
        returns (bool)
    {
        bool[11] memory _validSpells = codexSpells.classSpells(_summonerClass);
        return _validSpells[uint256(cat)];
    }

    function upgradeSpell(
        uint256 summoner,
        SpellCategories category,
        uint256 spellId
    ) external senderIsSummonerOwner(summoner) {
        require(SummonerSpellLevels[summoner][category][spellId] > 0, "not");
        uint256 nextTier = SummonerSpellLevels[summoner][category][spellId] + 1;
        Spell memory spell = codexSpells.spell(category, spellId, nextTier);
        SummonerData memory _summoner = Summoners.summonerData(
            summoner
        );
        require(_summoner.level >= spell.requirements.level, "lvl");
        uint256 nextTierCost = spell.learningCost *
            spell.upgradeCostMultiplier *
            nextTier;

        essence.burnToken(msg.sender, nextTierCost);
        SummonerSpellLevels[summoner][category][spellId]++;
    }

    function checkAttributesUpgrade(
        uint256 summoner,
        uint256 tier,
        Stats memory _spellAttr,
        Stats memory _perTier
    ) internal view returns (bool) {
        Stats memory _summonerAttr = attributes.stats(summoner);

        for (uint256 i = 1; i <= tier; i++) {
            _spellAttr = EquipableUtils.sumStats(_spellAttr, _perTier);
        }

        return
            _summonerAttr.STR >= _spellAttr.STR &&
            _summonerAttr.DEX >= _spellAttr.DEX &&
            _summonerAttr.INT >= _spellAttr.INT &&
            _summonerAttr.AGI >= _spellAttr.AGI &&
            _summonerAttr.VIT >= _spellAttr.VIT &&
            _summonerAttr.LUCK >= _spellAttr.LUCK;
    }

    function spellLevel(
        uint256 summoner,
        SpellCategories category,
        uint256 spellId
    ) public view returns (uint256) {
        return SummonerSpellLevels[summoner][category][spellId];
    }
}
