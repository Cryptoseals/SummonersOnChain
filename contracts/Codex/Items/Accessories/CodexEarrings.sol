import {ICodexPrefixAndSuffix, GameObjects} from "../../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {InitNavigator, INavigator} from "../../../Core/Navigator/InitNavigator.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

pragma solidity ^0.8.0;

contract CodexEarrings is InitNavigator, OwnableUpgradeable {

    string constant public index = "Codex";
    string constant public class = "Earrings";
    string constant public version = "0.0.1";

    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_INT;
    uint[21] public BASE_VIT;
    uint[21] public BASE_LUK;
    uint[21] public BASE_ATK;
    uint[21] public BASE_MATK;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_EDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;
    uint[21] public BASE_CRIT;
    uint[21] public BASE_CRITDMG;
    uint[21] public BASE_ACC;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);

        __Ownable_init();
    }

    function initializeCodex1(uint[21] memory _BASE_STR,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_INT,
        uint[21] memory _BASE_VIT,
        uint[21] memory _BASE_LUK,
        uint[21] memory _BASE_ATK,
        uint[21] memory _BASE_MATK,
        uint[21] memory _BASE_DEF) external onlyOwner {
        BASE_STR = _BASE_STR;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_INT = _BASE_INT;
        BASE_VIT = _BASE_VIT;
        BASE_LUK = _BASE_LUK;
        BASE_ATK = _BASE_ATK;
        BASE_MATK = _BASE_MATK;
    }

    function initializeCodex2(
        uint[21] memory _BASE_DEF,
        uint[21] memory _BASE_MDEF,
        uint[21] memory _BASE_EDEF,
        uint[21] memory _BASE_HP,
        uint[21] memory _BASE_DODGE,
        uint[21] memory _BASE_CRIT,
        uint[21] memory _BASE_CRITDMG,
        uint[21] memory _BASE_ACC) external onlyOwner {
        BASE_DEF = _BASE_DEF;
        BASE_MDEF = _BASE_MDEF;
        BASE_EDEF = _BASE_EDEF;
        BASE_HP = _BASE_HP;
        BASE_DODGE = _BASE_DODGE;
        BASE_CRIT = _BASE_CRIT;
        BASE_CRITDMG = _BASE_CRITDMG;
        BASE_ACC = _BASE_ACC;
    }

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Earring memory _earrings) public view returns (GameObjects.Earring memory) {

        if (_pre.isPercentage) {
            _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_earrings.generatedStatBonus, _pre.generatedStatBonus);
            _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_earrings.elementalStats, _pre.elementalStats);
        } else {
            _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStats(_earrings.generatedStatBonus, _pre.generatedStatBonus);
            _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStats(_earrings.elementalStats, _pre.elementalStats);
        }
        if (_suf.isPercentage) {
            _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_earrings.generatedStatBonus, _suf.generatedStatBonus);
            _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_earrings.elementalStats, _suf.elementalStats);
        } else {
            _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStats(_earrings.generatedStatBonus, _suf.generatedStatBonus);
            _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStats(_earrings.elementalStats, _suf.elementalStats);
        }

        _earrings.statBonus = EquipableUtils.sumStats(_earrings.statBonus, _pre.statBonus);
        _earrings.statBonus = EquipableUtils.sumStats(_earrings.statBonus, _suf.statBonus);

        _earrings.metadata.name = string(abi.encodePacked(_pre.title, " ", _earrings.metadata.name, " ", _suf.title));
        return _earrings;
    }

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Earring memory _earrings) public view returns (GameObjects.Earring memory) {
        if (_pre.isPercentage) {
            _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_earrings.generatedStatBonus, _pre.generatedStatBonus);
            _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_earrings.elementalStats, _pre.elementalStats);
        } else {
            _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStats(_earrings.generatedStatBonus, _pre.generatedStatBonus);
            _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStats(_earrings.elementalStats, _pre.elementalStats);
        }

        _earrings.statBonus = EquipableUtils.sumStats(_earrings.statBonus, _pre.statBonus);

        _earrings.metadata.name = string(abi.encodePacked(_pre.title, " ", _earrings.metadata.name));
        return _earrings;
    }

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Earring memory _earrings) public view returns (GameObjects.Earring memory) {
        if (_suf.isPercentage) {
            _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_earrings.generatedStatBonus, _suf.generatedStatBonus);
        } else {
            _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStats(_earrings.generatedStatBonus, _suf.generatedStatBonus);
        }

        _earrings.statBonus = EquipableUtils.sumStats(_earrings.statBonus, _suf.statBonus);

        if (_suf.isPercentage) {
            _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_earrings.elementalStats, _suf.elementalStats);
        } else {
            _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStats(_earrings.elementalStats, _suf.elementalStats);
        }

        _earrings.metadata.name = string(abi.encodePacked(_earrings.metadata.name, " ", _suf.title));
        return _earrings;
    }

    function applyTier(GameObjects.Earring memory _earrings, uint tier, uint percentage) public view returns (GameObjects.Earring memory){
        if (tier == 0) return _earrings;
        _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_earrings.generatedStatBonus, (tier) * percentage);
        _earrings.elementalStats.ElementalDef = earringEle(percentage);
        _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_earrings.elementalStats, (tier) * percentage);
        return _earrings;
    }

    function allEarrings() external view returns (GameObjects.Earring[] memory){
        GameObjects.Earring[] memory result = new GameObjects.Earring[](21);
        for (uint i = 1; i < 22; i++) {
            result[i - 1] = earringsCore(i, 1);
        }
        return result;
    }

    function earrings(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Earring memory) {
        GameObjects.Earring memory _earrings;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;
        require(_equipable.itemTier < 10, "tier");

        if (_equipable.prefixId > 0) _prefix = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.PREFIX_CODEX)).prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.SUFFIX_CODEX)).suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _earrings = applyTier(FrailEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 2) {
            _earrings = applyTier(AntiqueEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 3) {
            _earrings = applyTier(PurgeEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 4) {
            _earrings = applyTier(BarbedEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 5) {
            _earrings = applyTier(ReflectiveEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 6) {
            _earrings = applyTier(StormForgedEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 7) {
            _earrings = applyTier(VerdantEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 8) {
            _earrings = applyTier(ShadowfallEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 9) {
            _earrings = applyTier(MalignantEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 10) {
            _earrings = applyTier(SealedEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 11) {
            _earrings = applyTier(TemplarEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 12) {
            _earrings = applyTier(ChannelerEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 13) {
            _earrings = applyTier(ChosensEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 14) {
            _earrings = applyTier(AstraEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 15) {
            _earrings = applyTier(SoulbinderEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 16) {
            _earrings = applyTier(MoonlightEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 17) {
            _earrings = applyTier(SunlightEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 18) {
            _earrings = applyTier(CycleEarrings(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 19) {
            _earrings = applyTier(InfernalEarrings(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 20) {
            _earrings = applyTier(DivineEarrings(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 21) {
            _earrings = applyTier(EternalEarrings(_equipable.itemTier), _equipable.itemTier, 13);
        }

        if (_equipable.element == GameObjects.Element.VOID) {
            _earrings.elementalStats.ElementalDef.VOID_DEF = _earrings.generatedStatBonus.M_DEF;
            _earrings.elementalStats.ElementalAtk.VOID_ATK = _earrings.generatedStatBonus.M_ATK;
        }

        if (_equipable.prefixId > 0 && _equipable.suffixId == 0) return applyPrefix(_prefix, _earrings);
        if (_equipable.prefixId == 0 && _equipable.suffixId > 0) return applySuffix(_suffix, _earrings);
        if (_equipable.prefixId > 0 && _equipable.suffixId > 0) return applyPrefixAndSuffix(_prefix, _suffix, _earrings);

        return _earrings;
    }

    function earringsCore(uint itemId, uint itemTier) public view returns (GameObjects.Earring memory) {
        GameObjects.Earring memory _earrings;
        require(itemTier < 10, "tier");

        if (itemId == 1) {
            _earrings = applyTier(FrailEarrings(itemTier), itemTier, 10);
        } else if (itemId == 2) {
            _earrings = applyTier(AntiqueEarrings(itemTier), itemTier, 10);
        } else if (itemId == 3) {
            _earrings = applyTier(PurgeEarrings(itemTier), itemTier, 10);
        } else if (itemId == 4) {
            _earrings = applyTier(BarbedEarrings(itemTier), itemTier, 10);
        } else if (itemId == 5) {
            _earrings = applyTier(ReflectiveEarrings(itemTier), itemTier, 10);
        } else if (itemId == 6) {
            _earrings = applyTier(StormForgedEarrings(itemTier), itemTier, 10);
        } else if (itemId == 7) {
            _earrings = applyTier(VerdantEarrings(itemTier), itemTier, 10);
        } else if (itemId == 8) {
            _earrings = applyTier(ShadowfallEarrings(itemTier), itemTier, 10);
        } else if (itemId == 9) {
            _earrings = applyTier(MalignantEarrings(itemTier), itemTier, 10);
        } else if (itemId == 10) {
            _earrings = applyTier(SealedEarrings(itemTier), itemTier, 10);
        } else if (itemId == 11) {
            _earrings = applyTier(TemplarEarrings(itemTier), itemTier, 10);
        } else if (itemId == 12) {
            _earrings = applyTier(ChannelerEarrings(itemTier), itemTier, 10);
        } else if (itemId == 13) {
            _earrings = applyTier(ChosensEarrings(itemTier), itemTier, 10);
        } else if (itemId == 14) {
            _earrings = applyTier(AstraEarrings(itemTier), itemTier, 10);
        } else if (itemId == 15) {
            _earrings = applyTier(SoulbinderEarrings(itemTier), itemTier, 10);
        } else if (itemId == 16) {
            _earrings = applyTier(MoonlightEarrings(itemTier), itemTier, 10);
        } else if (itemId == 17) {
            _earrings = applyTier(SunlightEarrings(itemTier), itemTier, 10);
        } else if (itemId == 18) {
            _earrings = applyTier(CycleEarrings(itemTier), itemTier, 13);
        } else if (itemId == 19) {
            _earrings = applyTier(InfernalEarrings(itemTier), itemTier, 13);
        } else if (itemId == 20) {
            _earrings = applyTier(DivineEarrings(itemTier), itemTier, 13);
        } else if (itemId == 21) {
            _earrings = applyTier(EternalEarrings(itemTier), itemTier, 13);
        }

        return _earrings;
    }

    function FrailEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 1;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Frail Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 1;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(0);
        _earrings.generatedStatBonus = earringGenStats(0);
        _earrings.elementalStats = earringEleStats(0);
    }

    function AntiqueEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 2;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Antique Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 6;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(1);
        _earrings.generatedStatBonus = earringGenStats(1);
        _earrings.elementalStats = earringEleStats(1);
    }

    function PurgeEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 3;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Purge Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 11;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(2);
        _earrings.generatedStatBonus = earringGenStats(2);
        _earrings.elementalStats = earringEleStats(2);
    }

    function BarbedEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 4;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Barbed Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 16;
        //   _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(3);
        _earrings.generatedStatBonus = earringGenStats(3);
        _earrings.elementalStats = earringEleStats(3);
    }

    function ReflectiveEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 5;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Reflective Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 21;
        //   _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(4);
        _earrings.generatedStatBonus = earringGenStats(4);
        _earrings.elementalStats = earringEleStats(4);
    }

    function StormForgedEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 6;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Storm Forged Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 26;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(5);
        _earrings.generatedStatBonus = earringGenStats(5);
        _earrings.elementalStats = earringEleStats(5);
    }

    function VerdantEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 7;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Verdant Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 31;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(6);
        _earrings.generatedStatBonus = earringGenStats(6);
        _earrings.elementalStats = earringEleStats(6);
    }

    function ShadowfallEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 8;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Shadowfall Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 36;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(7);
        _earrings.generatedStatBonus = earringGenStats(7);
        _earrings.elementalStats = earringEleStats(7);
    }

    function MalignantEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 9;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Malignant Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 41;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(8);
        _earrings.generatedStatBonus = earringGenStats(8);
        _earrings.elementalStats = earringEleStats(8);
    }

    function SealedEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 10;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Sealed Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 46;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(9);
        _earrings.generatedStatBonus = earringGenStats(9);
        _earrings.elementalStats = earringEleStats(9);
    }

    function TemplarEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 11;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Templar Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 51;
        //   _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(10);
        _earrings.generatedStatBonus = earringGenStats(10);
        _earrings.elementalStats = earringEleStats(10);
    }

    function ChannelerEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 12;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Channeler Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 56;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(11);
        _earrings.generatedStatBonus = earringGenStats(11);
        _earrings.elementalStats = earringEleStats(11);
    }

    function ChosensEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 13;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Chosen's Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 61;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(12);
        _earrings.generatedStatBonus = earringGenStats(12);
        _earrings.elementalStats = earringEleStats(12);
    }

    function AstraEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 14;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Astra Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 66;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(13);
        _earrings.generatedStatBonus = earringGenStats(13);
        _earrings.elementalStats = earringEleStats(13);
    }

    function SoulbinderEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 15;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Soulbinder Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 71;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(14);
        _earrings.generatedStatBonus = earringGenStats(14);
        _earrings.elementalStats = earringEleStats(14);
    }

    function MoonlightEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 16;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Sun Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 76;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(15);
        _earrings.generatedStatBonus = earringGenStats(15);
        _earrings.elementalStats = earringEleStats(15);
    }

    function SunlightEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 17;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Moon Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 81;
        // _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(16);
        _earrings.generatedStatBonus = earringGenStats(16);
        _earrings.elementalStats = earringEleStats(16);
    }

    function CycleEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 18;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Cycle Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 86;
        // _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(17);
        _earrings.generatedStatBonus = earringGenStats(17);
        _earrings.elementalStats = earringEleStats(17);
    }

    function InfernalEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 19;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Infernal Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 91;
        //  _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(18);
        _earrings.generatedStatBonus = earringGenStats(18);
        _earrings.elementalStats = earringEleStats(18);
    }

    function DivineEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 20;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        //  _earrings.metadata.name = "Divine Earrings";
        //  _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 96;
        // _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = earringStats(19);
        _earrings.generatedStatBonus = earringGenStats(19);
        _earrings.elementalStats = earringEleStats(19);
    }

    function EternalEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 21;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        // _earrings.metadata.name = "Eternal Earrings";
        // _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 100;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        //
        _earrings.statBonus = earringStats(20);
        _earrings.generatedStatBonus = earringGenStats(20);
        _earrings.elementalStats = earringEleStats(20);
    }


    function earringStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : BASE_LUK[index]});
        return stats;
    }

    function earringEleD(uint index) internal view returns (GameObjects.ElementalAtk memory) {
        GameObjects.ElementalAtk memory stats = GameObjects.ElementalAtk({FIRE_ATK : BASE_MATK[index], EARTH_ATK : BASE_MATK[index], COLD_ATK : BASE_MATK[index], LIGHTNING_ATK : BASE_MATK[index], DARK_ATK : BASE_MATK[index], HOLY_ATK : BASE_MATK[index], VOID_ATK : 0});
        return stats;
    }

    function earringEle(uint index) internal view returns (GameObjects.ElementalDef memory) {
        GameObjects.ElementalDef memory stats = GameObjects.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function earringGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
        GameObjects.GeneratedStats memory stats = GameObjects.GeneratedStats({
        HP : BASE_HP[index],
        P_ATK : BASE_ATK[index],
        M_ATK : BASE_MATK[index],
        P_DEF : BASE_DEF[index],
        M_DEF : BASE_MDEF[index],
        ACCURACY : BASE_ACC[index],
        DODGE : BASE_DODGE[index],
        CRIT : BASE_CRIT[index],
        CRIT_MULTIPLIER : BASE_CRITDMG[index],
        INFUSION : 0
        });
        return stats;
    }

    function earringEleStats(uint index) internal view returns (GameObjects.ElementalStats memory _genStats) {
        _genStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_EDEF[index], EARTH_DEF : BASE_EDEF[index], COLD_DEF : BASE_EDEF[index], LIGHTNING_DEF : BASE_EDEF[index], DARK_DEF : BASE_EDEF[index], HOLY_DEF : BASE_EDEF[index], VOID_DEF : 0});
        _genStats.ElementalAtk = GameObjects.ElementalAtk({FIRE_ATK : BASE_MATK[index], EARTH_ATK : BASE_MATK[index], COLD_ATK : BASE_MATK[index], LIGHTNING_ATK : BASE_MATK[index], DARK_ATK : BASE_MATK[index], HOLY_ATK : BASE_MATK[index], VOID_ATK : 0});
    }
}
