import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Core/Common/Errors.sol";
import {IAttributes} from "../Interfaces/Attributes/IAttributes.sol";
import {SummonerData} from "../Interfaces/GameObjects/IGameEntities.sol";
import {Class, Stats} from "../Interfaces/GameObjects/IGameObjects.sol";
import {EquipableUtils} from "../Inventory/EquipableUtils.sol";
import {ICodexSpells} from "../Interfaces/Codex/ICodexSpells.sol";
import {SpellCategories, Spell, SpellSlot} from "../Interfaces/GameObjects/ISpell.sol";
import {GameConstants} from "../Interfaces/Core/Constants/Constants.sol";
import {ICalculator} from "../Interfaces/Core/Calculator/ICalculator.sol";
import {IFungibleInGameToken} from "../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import {InitNavigator, INavigator, ISummoners} from "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract Spells is Initializable, InitNavigator {
    uint256 immutable MAX_SPELL_SLOT = 4;
    // @dev summoner-> spell -> spell level
    mapping(uint256 => mapping(uint256 => SpellSlot)) SpellSlots;
    mapping(uint256 => mapping(SpellCategories => mapping(uint256 => uint256)))
        public SummonerSpellLevels;
    mapping(uint256 => mapping(SpellCategories => mapping(uint256 => uint256)))
        public SummonerSpellCooldowns;
    ICodexSpells codexSpells;
    IFungibleInGameToken essence;
    IAttributes attributes;

    // summoner -> slot -> spell

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }

    function decreaseCooldowns(uint256 summoner) external onlyGameContracts {
        for (uint256 index = 0; index < MAX_SPELL_SLOT; index++) {
            SpellSlot memory slot = SpellSlots[summoner][index];
            if (SummonerSpellCooldowns[summoner][slot.category][slot.id] > 0) {
                SummonerSpellCooldowns[summoner][slot.category][slot.id]--;
            }
        }
    }

    function markSpellUsed(
        uint256 summoner,
        SpellCategories cat,
        uint256 spellId
    ) external onlyGameContracts {
        require(
            SummonerSpellCooldowns[summoner][cat][spellId] == 0,
            "cooldown"
        );
        SummonerSpellCooldowns[summoner][cat][spellId] = codexSpells
            .spell(cat, spellId, 1)
            .cooldown;
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
        SummonerData memory summoner = Summoners.summonerData(_summoner);
        require(summoner.level >= spell.requirements.level, "lvl");
        require(checkClass(summoner.class, category), "class");
        essence.burnToken(msg.sender, spell.learningCost);
        SummonerSpellLevels[_summoner][category][spellId] = 1;
    }

    function upgradeSpell(
        uint256 summoner,
        SpellCategories category,
        uint256 spellId
    ) external senderIsSummonerOwner(summoner) {
        require(SummonerSpellLevels[summoner][category][spellId] > 0, "not");
        uint256 nextTier = SummonerSpellLevels[summoner][category][spellId] + 1;
        Spell memory spell = codexSpells.spell(category, spellId, nextTier);
        require(nextTier < spell.maxSpellLevel, "max");
        SummonerData memory _summoner = Summoners.summonerData(summoner);
        require(_summoner.level >= spell.requirements.level, "lvl");
        uint256 nextTierCost = spell.learningCost *
            spell.upgradeCostMultiplier *
            nextTier;

        essence.burnToken(msg.sender, nextTierCost);
        SummonerSpellLevels[summoner][category][spellId]++;
    }

    function equipSpell(
        uint256 summoner,
        uint256 slot,
        SpellCategories category,
        uint256 spellId
    ) external senderIsSummonerOwner(summoner) {
        uint256 level = SummonerSpellLevels[summoner][category][spellId];
        require(level > 0, "not learnt");

        for (uint256 index = 0; index < MAX_SPELL_SLOT; index++) {
            SpellSlot memory _slot = SpellSlots[summoner][index];
            require(_slot.category != category && _slot.id != spellId, "same");
        }
        SpellSlots[summoner][slot] = SpellSlot({
            category: category,
            id: spellId
        });
    }

    function spellLevel(
        uint256 summoner,
        SpellCategories category,
        uint256 spellId
    ) public view returns (uint256) {
        return SummonerSpellLevels[summoner][category][spellId];
    }

    function spellSlots(uint256 summoner)
        public
        view
        returns (SpellSlot[] memory, uint256[] memory)
    {
        SpellSlot[] memory result = new SpellSlot[](MAX_SPELL_SLOT);
        uint256[] memory cooldowns = new uint256[](MAX_SPELL_SLOT);
        for (uint256 index = 0; index < MAX_SPELL_SLOT; index++) {
            result[index] = SpellSlots[summoner][index];
            cooldowns[index] = SummonerSpellCooldowns[summoner][
                result[index].category
            ][result[index].id];
        }

        return (result, cooldowns);
    }

    function isSpellEquipped(
        uint256 summoner,
        SpellCategories category,
        uint256 spellId
    ) external view returns (bool _isEquipped, uint256 lvl) {
        lvl = spellLevel(summoner, category, spellId);
        for (uint256 index = 0; index < 4; index++) {
            SpellSlot memory _slot = SpellSlots[summoner][index];
            _isEquipped = _slot.category == category && _slot.id == spellId;
            if (_isEquipped) break;
        }
    }

    function checkClass(Class _summonerClass, SpellCategories cat)
        internal
        view
        returns (bool)
    {
        bool[11] memory _validSpells = codexSpells.classSpells(_summonerClass);
        return _validSpells[uint256(cat)];
    }
}
