import {ICodexPrefixAndSuffix, GameObjects} from "../../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";
import {InitNavigator, INavigator} from "../../../Core/Navigator/InitNavigator.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

pragma solidity ^0.8.0;

contract CodexRings is InitNavigator, OwnableUpgradeable {
    ICodexPrefixAndSuffix PrefixContract;
    ICodexPrefixAndSuffix SuffixContract;

    string constant public index = "Codex";
    string constant public class = "Rings";
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
        PrefixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.PREFIX_CODEX));
        SuffixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.SUFFIX_CODEX));
        __Ownable_init();
    }

    function initializeCodex1(
        uint[21] memory _BASE_STR,
        uint[21] memory _BASE_AGI,
        uint[21] memory _BASE_DEX,
        uint[21] memory _BASE_INT,
        uint[21] memory _BASE_VIT,
        uint[21] memory _BASE_LUK,
        uint[21] memory _BASE_ATK,
        uint[21] memory _BASE_MATK) external onlyOwner {
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


    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Ring memory _ring) public view returns (GameObjects.Ring memory) {

        if (_pre.isPercentage) {
            _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_ring.generatedStatBonus, _pre.generatedStatBonus);
            _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ring.elementalStats, _pre.elementalStats);
        } else {
            _ring.generatedStatBonus = EquipableUtils.sumGeneratedStats(_ring.generatedStatBonus, _pre.generatedStatBonus);
            _ring.elementalStats = EquipableUtils.sumGeneratedElementalStats(_ring.elementalStats, _pre.elementalStats);
        }

        if (_suf.isPercentage) {
            _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_ring.generatedStatBonus, _suf.generatedStatBonus);
            _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ring.elementalStats, _suf.elementalStats);
        } else {
            _ring.generatedStatBonus = EquipableUtils.sumGeneratedStats(_ring.generatedStatBonus, _suf.generatedStatBonus);
            _ring.elementalStats = EquipableUtils.sumGeneratedElementalStats(_ring.elementalStats, _suf.elementalStats);
        }

        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _pre.statBonus);
        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _suf.statBonus);

        //        _ring.metadata.name = string(abi.encodePacked(_pre.title, " ", _ring.metadata.name, " ", _suf.title));
        return _ring;
    }

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Ring memory _ring) public view returns (GameObjects.Ring memory) {
        if (_pre.isPercentage) {
            _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_ring.generatedStatBonus, _pre.generatedStatBonus);
            _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ring.elementalStats, _pre.elementalStats);
        } else {
            _ring.generatedStatBonus = EquipableUtils.sumGeneratedStats(_ring.generatedStatBonus, _pre.generatedStatBonus);
            _ring.elementalStats = EquipableUtils.sumGeneratedElementalStats(_ring.elementalStats, _pre.elementalStats);
        }

        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _pre.statBonus);

        //        _ring.metadata.name = string(abi.encodePacked(_pre.title, " ", _ring.metadata.name));
        return _ring;
    }

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Ring memory _ring) public view returns (GameObjects.Ring memory) {
        if (_suf.isPercentage) {
            _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_ring.generatedStatBonus, _suf.generatedStatBonus);
            _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ring.elementalStats, _suf.elementalStats);
        } else {
            _ring.generatedStatBonus = EquipableUtils.sumGeneratedStats(_ring.generatedStatBonus, _suf.generatedStatBonus);
            _ring.elementalStats = EquipableUtils.sumGeneratedElementalStats(_ring.elementalStats, _suf.elementalStats);
        }

        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _suf.statBonus);

        //        _ring.metadata.name = string(abi.encodePacked(_ring.metadata.name, " ", _suf.title));
        return _ring;
    }

    function applyTier(GameObjects.Ring memory _ring, uint tier, uint percentage) public view returns (GameObjects.Ring memory){
        if (tier == 0) return _ring;
        _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_ring.generatedStatBonus, (tier) * percentage);
        _ring.elementalStats.ElementalDef = ringEle(percentage);
        _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_ring.elementalStats, (tier) * percentage);
        return _ring;
    }

    function allRings() external view returns (GameObjects.Ring[] memory){
        GameObjects.Ring[] memory result = new GameObjects.Ring[](21);
        for (uint i = 1; i < 22; i++) {
            result[i - 1] = ringCore(i, 1);
        }
        return result;
    }

    function ring(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Ring memory) {
        GameObjects.Ring memory _ring;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;
        require(_equipable.itemTier < 10, "tier");

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _ring = applyTier(FrailRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 2) {
            _ring = applyTier(AntiqueRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 3) {
            _ring = applyTier(PurgeRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 4) {
            _ring = applyTier(BarbedRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 5) {
            _ring = applyTier(ReflectiveRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 6) {
            _ring = applyTier(StormForgedRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 7) {
            _ring = applyTier(VerdantRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 8) {
            _ring = applyTier(ShadowfallRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 9) {
            _ring = applyTier(MalignantRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 10) {
            _ring = applyTier(SealedRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 11) {
            _ring = applyTier(TemplarRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 12) {
            _ring = applyTier(ChannelerRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 13) {
            _ring = applyTier(ChosensRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 14) {
            _ring = applyTier(AstraRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 15) {
            _ring = applyTier(SoulbinderRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 16) {
            _ring = applyTier(MoonlightRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 17) {
            _ring = applyTier(SunlightRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 18) {
            _ring = applyTier(CycleRing(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 19) {
            _ring = applyTier(InfernalRing(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 20) {
            _ring = applyTier(DivineRing(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 21) {
            _ring = applyTier(EternalRing(_equipable.itemTier), _equipable.itemTier, 13);
        }

        if (_equipable.element == GameObjects.Element.VOID) {
            _ring.elementalStats.ElementalDef.VOID_DEF = _ring.generatedStatBonus.M_DEF;
            _ring.elementalStats.ElementalAtk.VOID_ATK = _ring.generatedStatBonus.M_ATK;
        }

        if (_equipable.prefixId > 0 && _equipable.suffixId == 0) return applyPrefix(_prefix, _ring);
        if (_equipable.prefixId == 0 && _equipable.suffixId > 0) return applySuffix(_suffix, _ring);
        if (_equipable.prefixId > 0 && _equipable.suffixId > 0) return applyPrefixAndSuffix(_prefix, _suffix, _ring);

        return _ring;
    }

    function ringCore(uint itemId, uint itemTier) public view returns (GameObjects.Ring memory) {
        GameObjects.Ring memory _ring;
        require(itemTier < 10, "tier");


        if (itemId == 1) {
            _ring = applyTier(FrailRing(itemTier), itemTier, 10);
        } else if (itemId == 2) {
            _ring = applyTier(AntiqueRing(itemTier), itemTier, 10);
        } else if (itemId == 3) {
            _ring = applyTier(PurgeRing(itemTier), itemTier, 10);
        } else if (itemId == 4) {
            _ring = applyTier(BarbedRing(itemTier), itemTier, 10);
        } else if (itemId == 5) {
            _ring = applyTier(ReflectiveRing(itemTier), itemTier, 10);
        } else if (itemId == 6) {
            _ring = applyTier(StormForgedRing(itemTier), itemTier, 10);
        } else if (itemId == 7) {
            _ring = applyTier(VerdantRing(itemTier), itemTier, 10);
        } else if (itemId == 8) {
            _ring = applyTier(ShadowfallRing(itemTier), itemTier, 10);
        } else if (itemId == 9) {
            _ring = applyTier(MalignantRing(itemTier), itemTier, 10);
        } else if (itemId == 10) {
            _ring = applyTier(SealedRing(itemTier), itemTier, 10);
        } else if (itemId == 11) {
            _ring = applyTier(TemplarRing(itemTier), itemTier, 10);
        } else if (itemId == 12) {
            _ring = applyTier(ChannelerRing(itemTier), itemTier, 10);
        } else if (itemId == 13) {
            _ring = applyTier(ChosensRing(itemTier), itemTier, 10);
        } else if (itemId == 14) {
            _ring = applyTier(AstraRing(itemTier), itemTier, 10);
        } else if (itemId == 15) {
            _ring = applyTier(SoulbinderRing(itemTier), itemTier, 10);
        } else if (itemId == 16) {
            _ring = applyTier(MoonlightRing(itemTier), itemTier, 10);
        } else if (itemId == 17) {
            _ring = applyTier(SunlightRing(itemTier), itemTier, 10);
        } else if (itemId == 18) {
            _ring = applyTier(CycleRing(itemTier), itemTier, 13);
        } else if (itemId == 19) {
            _ring = applyTier(InfernalRing(itemTier), itemTier, 13);
        } else if (itemId == 20) {
            _ring = applyTier(DivineRing(itemTier), itemTier, 13);
        } else if (itemId == 21) {
            _ring = applyTier(EternalRing(itemTier), itemTier, 13);
        }

        return _ring;
    }

    function FrailRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 1;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Frail Ring";
        // _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 1;
        // _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(0);
        _ring.generatedStatBonus = ringGenStats(0);
        _ring.elementalStats = ringEleStats(0);
    }

    function AntiqueRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 2;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Antique Ring";
        // _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 6;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(1);
        _ring.generatedStatBonus = ringGenStats(1);
        _ring.elementalStats = ringEleStats(1);
    }

    function PurgeRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 3;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Purge Ringg";
        // _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 11;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(2);
        _ring.generatedStatBonus = ringGenStats(2);
        _ring.elementalStats = ringEleStats(2);
    }

    function BarbedRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 4;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Barbed Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 16;
        // _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(3);
        _ring.generatedStatBonus = ringGenStats(3);
        _ring.elementalStats = ringEleStats(3);
    }

    function ReflectiveRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 5;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Reflective Ring";
        // _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 21;
        // _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(4);
        _ring.generatedStatBonus = ringGenStats(4);
        _ring.elementalStats = ringEleStats(4);
    }

    function StormForgedRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 6;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Storm Forged Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 26;
        // _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(5);
        _ring.generatedStatBonus = ringGenStats(5);
        _ring.elementalStats = ringEleStats(5);
    }

    function VerdantRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 7;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Verdant Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 31;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(6);
        _ring.generatedStatBonus = ringGenStats(6);
        _ring.elementalStats = ringEleStats(6);
    }

    function ShadowfallRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 8;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Shadowfall Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 36;
        // _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(7);
        _ring.generatedStatBonus = ringGenStats(7);
        _ring.elementalStats = ringEleStats(7);
    }

    function MalignantRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 9;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Malignant Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 41;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(8);
        _ring.generatedStatBonus = ringGenStats(8);
        _ring.elementalStats = ringEleStats(8);
    }

    function SealedRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 10;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Sealed Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 46;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(9);
        _ring.generatedStatBonus = ringGenStats(9);
        _ring.elementalStats = ringEleStats(9);
    }

    function TemplarRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 11;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Templar Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 51;
        // _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(10);
        _ring.generatedStatBonus = ringGenStats(10);
        _ring.elementalStats = ringEleStats(10);
    }

    function ChannelerRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 12;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Channeler Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 56;
        // _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(11);
        _ring.generatedStatBonus = ringGenStats(11);
        _ring.elementalStats = ringEleStats(11);
    }

    function ChosensRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 13;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Choosen's Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 61;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(12);
        _ring.generatedStatBonus = ringGenStats(12);
        _ring.elementalStats = ringEleStats(12);
    }

    function AstraRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 14;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Astra Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 66;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(13);
        _ring.generatedStatBonus = ringGenStats(13);
        _ring.elementalStats = ringEleStats(13);
    }

    function SoulbinderRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 15;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Soulbinder Ring";
        // _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 71;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(14);
        _ring.generatedStatBonus = ringGenStats(14);
        _ring.elementalStats = ringEleStats(14);
    }

    function MoonlightRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 16;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Sun Ring";
        // _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 76;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(15);
        _ring.generatedStatBonus = ringGenStats(15);
        _ring.elementalStats = ringEleStats(15);
    }

    function SunlightRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 17;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Moon Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 81;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(16);
        _ring.generatedStatBonus = ringGenStats(16);
        _ring.elementalStats = ringEleStats(16);
    }

    function CycleRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 18;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        //  _ring.metadata.name = "Cycle Ring";
        //  _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 86;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(17);
        _ring.generatedStatBonus = ringGenStats(17);
        _ring.elementalStats = ringEleStats(17);
    }

    function InfernalRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 19;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Infernal Ring";
        // _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 91;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(18);
        _ring.generatedStatBonus = ringGenStats(18);
        _ring.elementalStats = ringEleStats(18);
    }

    function DivineRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 20;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Divine Ring";
        // _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 96;
        //   _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(19);
        _ring.generatedStatBonus = ringGenStats(19);
        _ring.elementalStats = ringEleStats(19);
    }

    function EternalRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 21;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        // _ring.metadata.name = "Eternal Ring";
        // _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 100;
        //  _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(20);
        _ring.generatedStatBonus = ringGenStats(20);
        _ring.elementalStats = ringEleStats(20);
    }


    function ringStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : BASE_LUK[index]});
        return stats;
    }

    function ringEleD(uint index) internal view returns (GameObjects.ElementalAtk memory) {
        GameObjects.ElementalAtk memory stats = GameObjects.ElementalAtk({FIRE_ATK : BASE_MATK[index], EARTH_ATK : BASE_MATK[index], COLD_ATK : BASE_MATK[index], LIGHTNING_ATK : BASE_MATK[index], DARK_ATK : BASE_MATK[index], HOLY_ATK : BASE_MATK[index], VOID_ATK : 0});
        return stats;
    }

    function ringEle(uint index) internal view returns (GameObjects.ElementalDef memory) {
        GameObjects.ElementalDef memory stats = GameObjects.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function ringGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
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


    function ringEleStats(uint index) internal view returns (GameObjects.ElementalStats memory _genStats) {
        _genStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : BASE_EDEF[index], EARTH_DEF : BASE_EDEF[index], COLD_DEF : BASE_EDEF[index], LIGHTNING_DEF : BASE_EDEF[index], DARK_DEF : BASE_EDEF[index], HOLY_DEF : BASE_EDEF[index], VOID_DEF : 0});
        _genStats.ElementalAtk = GameObjects.ElementalAtk({FIRE_ATK : BASE_MATK[index], EARTH_ATK : BASE_MATK[index], COLD_ATK : BASE_MATK[index], LIGHTNING_ATK : BASE_MATK[index], DARK_ATK : BASE_MATK[index], HOLY_ATK : BASE_MATK[index], VOID_ATK : 0});
    }
}
