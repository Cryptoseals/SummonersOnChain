import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {ICodexPrefixAndSuffix} from "../../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import {InitNavigator, INavigator} from "../../../Core/Navigator/InitNavigator.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments} from "../../../Interfaces/GameObjects/IGameObjects.sol";
import {EquipableUtils} from "../../../Inventory/EquipableUtils.sol";

pragma solidity ^0.8.0;

contract CodexAmulets is InitNavigator, OwnableUpgradeable {
    ICodexPrefixAndSuffix PrefixContract;
    ICodexPrefixAndSuffix SuffixContract;

    string constant public index = "Codex";
    string constant public class = "Amulets";
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

    function initializeContracts() external {
        PrefixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.PREFIX_CODEX));
        SuffixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.SUFFIX_CODEX));
    }

    function initializeCodex1(uint[21] memory _BASE_STR,
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

    function initializeCodex2(uint[21] memory _BASE_DEF,
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

    function applyPrefixAndSuffix(GameObjects_Equipments.Prefix memory _pre, GameObjects_Equipments.Suffix memory _suf, GameObjects_Equipments.EquipableItem memory _amulet) public view returns (GameObjects_Equipments.EquipableItem memory) {
        if (_pre.isPercentage) {
            _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_amulet.generatedStatBonus, _pre.generatedStatBonus);
            _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_amulet.elementalStats, _pre.elementalStats);
        } else {
            _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_amulet.generatedStatBonus, _pre.generatedStatBonus);
            _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_amulet.elementalStats, _pre.elementalStats);
        }

        if (_suf.isPercentage) {
            _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_amulet.generatedStatBonus, _suf.generatedStatBonus);
            _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_amulet.elementalStats, _suf.elementalStats);
        } else {
            _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_amulet.generatedStatBonus, _suf.generatedStatBonus);
            _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_amulet.elementalStats, _suf.elementalStats);
        }
        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _pre.statBonus);
        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _suf.statBonus);


        return _amulet;
    }

    function applyPrefix(GameObjects_Equipments.Prefix memory _pre, GameObjects_Equipments.EquipableItem memory _amulet) public view returns (GameObjects_Equipments.EquipableItem memory) {
        if (_pre.isPercentage) {
            _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_amulet.generatedStatBonus, _pre.generatedStatBonus);
            _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_amulet.elementalStats, _pre.elementalStats);
        } else {
            _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_amulet.generatedStatBonus, _pre.generatedStatBonus);
            _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_amulet.elementalStats, _pre.elementalStats);
        }
        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _pre.statBonus);

        return _amulet;
    }

    function applySuffix(GameObjects_Equipments.Suffix memory _suf, GameObjects_Equipments.EquipableItem memory _amulet) public view returns (GameObjects_Equipments.EquipableItem memory) {
        if (_suf.isPercentage) {
            _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_amulet.generatedStatBonus, _suf.generatedStatBonus);
            _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_amulet.elementalStats, _suf.elementalStats);
        } else {
            _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStats(_amulet.generatedStatBonus, _suf.generatedStatBonus);
            _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStats(_amulet.elementalStats, _suf.elementalStats);
        }
        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _suf.statBonus);

        return _amulet;
    }

    function applyTier(GameObjects_Equipments.EquipableItem memory _amulet, uint tier, uint percentage) public view returns (GameObjects_Equipments.EquipableItem memory){
        if (tier == 0) return _amulet;
        _amulet.statBonus = EquipableUtils.sumStatsAsTier(_amulet.statBonus, tier * percentage);
        _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_amulet.generatedStatBonus, (tier) * percentage);
        _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_amulet.elementalStats, (tier) * percentage);
        return _amulet;
    }

    function allAmulet() external view returns (GameObjects_Equipments.EquipableItem[] memory){
        GameObjects_Equipments.EquipableItem[] memory result = new GameObjects_Equipments.EquipableItem[](21);
        for (uint i = 1; i < 22; i++) {
            result[i - 1] = amuletCore(i, 1);
        }
        return result;
    }

    function amulet(GameObjects_Equipments.EquippedItemStruct memory _equipable) public view returns (GameObjects_Equipments.EquipableItem memory) {
        GameObjects_Equipments.EquipableItem memory _amulet;
        GameObjects_Equipments.Prefix memory _prefix;
        GameObjects_Equipments.Suffix memory _suffix;
        require(_equipable.itemTier < 10, "tier");

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _amulet = applyTier(FrailAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 2) {
            _amulet = applyTier(AntiqueAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 3) {
            _amulet = applyTier(PurgeAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 4) {
            _amulet = applyTier(BarbedAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 5) {
            _amulet = applyTier(ReflectiveAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 6) {
            _amulet = applyTier(StormForgedAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 7) {
            _amulet = applyTier(VerdantAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 8) {
            _amulet = applyTier(ShadowfallAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 9) {
            _amulet = applyTier(MalignantAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 10) {
            _amulet = applyTier(SealedAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 11) {
            _amulet = applyTier(TemplarAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 12) {
            _amulet = applyTier(ChannelerAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 13) {
            _amulet = applyTier(ChosensAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 14) {
            _amulet = applyTier(AstraAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 15) {
            _amulet = applyTier(SoulbinderAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 16) {
            _amulet = applyTier(MoonlightAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 17) {
            _amulet = applyTier(SunlightAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 18) {
            _amulet = applyTier(CycleAmulet(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 19) {
            _amulet = applyTier(InfernalAmulet(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 20) {
            _amulet = applyTier(DivineAmulet(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 21) {
            _amulet = applyTier(EternalAmulet(_equipable.itemTier), _equipable.itemTier, 13);
        }
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;
        if (_equipable.element == GameObjects.Element.VOID) {
            _amulet.elementalStats.ElementalDef.VOID_DEF = _amulet.generatedStatBonus.M_DEF;
            _amulet.elementalStats.ElementalAtk.VOID_ATK = _amulet.generatedStatBonus.M_ATK;
        }

        if (_equipable.prefixId > 0) _amulet = applyPrefix(_prefix, _amulet);
        if (_equipable.suffixId > 0) _amulet = applySuffix(_suffix, _amulet);
        return _amulet;
    }

    function amuletCore(uint itemId, uint itemTier) public view returns (GameObjects_Equipments.EquipableItem memory) {
        GameObjects_Equipments.EquipableItem memory _amulet;
        require(itemTier < 10, "tier");

        if (itemId == 1) {
            _amulet = applyTier(FrailAmulet(itemTier), itemTier, 10);
        } else if (itemId == 2) {
            _amulet = applyTier(AntiqueAmulet(itemTier), itemTier, 10);
        } else if (itemId == 3) {
            _amulet = applyTier(PurgeAmulet(itemTier), itemTier, 10);
        } else if (itemId == 4) {
            _amulet = applyTier(BarbedAmulet(itemTier), itemTier, 10);
        } else if (itemId == 5) {
            _amulet = applyTier(ReflectiveAmulet(itemTier), itemTier, 10);
        } else if (itemId == 6) {
            _amulet = applyTier(StormForgedAmulet(itemTier), itemTier, 10);
        } else if (itemId == 7) {
            _amulet = applyTier(VerdantAmulet(itemTier), itemTier, 10);
        } else if (itemId == 8) {
            _amulet = applyTier(ShadowfallAmulet(itemTier), itemTier, 10);
        } else if (itemId == 9) {
            _amulet = applyTier(MalignantAmulet(itemTier), itemTier, 10);
        } else if (itemId == 10) {
            _amulet = applyTier(SealedAmulet(itemTier), itemTier, 10);
        } else if (itemId == 11) {
            _amulet = applyTier(TemplarAmulet(itemTier), itemTier, 10);
        } else if (itemId == 12) {
            _amulet = applyTier(ChannelerAmulet(itemTier), itemTier, 10);
        } else if (itemId == 13) {
            _amulet = applyTier(ChosensAmulet(itemTier), itemTier, 10);
        } else if (itemId == 14) {
            _amulet = applyTier(AstraAmulet(itemTier), itemTier, 10);
        } else if (itemId == 15) {
            _amulet = applyTier(SoulbinderAmulet(itemTier), itemTier, 10);
        } else if (itemId == 16) {
            _amulet = applyTier(MoonlightAmulet(itemTier), itemTier, 10);
        } else if (itemId == 17) {
            _amulet = applyTier(SunlightAmulet(itemTier), itemTier, 10);
        } else if (itemId == 18) {
            _amulet = applyTier(CycleAmulet(itemTier), itemTier, 13);
        } else if (itemId == 19) {
            _amulet = applyTier(InfernalAmulet(itemTier), itemTier, 13);
        } else if (itemId == 20) {
            _amulet = applyTier(DivineAmulet(itemTier), itemTier, 13);
        } else if (itemId == 21) {
            _amulet = applyTier(EternalAmulet(itemTier), itemTier, 13);
        }
        return _amulet;
    }

    function FrailAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 1;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 1;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(0);
        _amulet.generatedStatBonus = amuletGenStats(0);
        _amulet.elementalStats = amuletEleStats(0);
    }

    function AntiqueAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 2;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 7;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(1);
        _amulet.generatedStatBonus = amuletGenStats(1);
        _amulet.elementalStats = amuletEleStats(1);
    }

    function PurgeAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 3;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 12;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(2);
        _amulet.generatedStatBonus = amuletGenStats(2);
        _amulet.elementalStats = amuletEleStats(2);
    }

    function BarbedAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 4;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 17;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(3);
        _amulet.generatedStatBonus = amuletGenStats(3);
        _amulet.elementalStats = amuletEleStats(3);
    }

    function ReflectiveAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 5;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 22;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(4);
        _amulet.generatedStatBonus = amuletGenStats(4);
        _amulet.elementalStats = amuletEleStats(4);
    }

    function StormForgedAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 6;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 27;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(5);
        _amulet.generatedStatBonus = amuletGenStats(5);
        _amulet.elementalStats = amuletEleStats(5);
    }

    function VerdantAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 7;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 32;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(6);
        _amulet.generatedStatBonus = amuletGenStats(6);
        _amulet.elementalStats = amuletEleStats(6);
    }

    function ShadowfallAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 8;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 37;
        // _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(7);
        _amulet.generatedStatBonus = amuletGenStats(7);
        _amulet.elementalStats = amuletEleStats(7);
    }

    function MalignantAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 9;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 42;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(8);
        _amulet.generatedStatBonus = amuletGenStats(8);
        _amulet.elementalStats = amuletEleStats(8);
    }

    function SealedAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 10;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 47;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(9);
        _amulet.generatedStatBonus = amuletGenStats(9);
        _amulet.elementalStats = amuletEleStats(9);
    }

    function TemplarAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 11;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 52;
        //   _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(10);
        _amulet.generatedStatBonus = amuletGenStats(10);
        _amulet.elementalStats = amuletEleStats(10);
    }

    function ChannelerAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 12;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 57;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(11);
        _amulet.generatedStatBonus = amuletGenStats(11);
        _amulet.elementalStats = amuletEleStats(11);
    }

    function ChosensAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 13;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 62;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(12);
        _amulet.generatedStatBonus = amuletGenStats(12);
        _amulet.elementalStats = amuletEleStats(12);
    }

    function AstraAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 14;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 67;
        // _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(13);
        _amulet.generatedStatBonus = amuletGenStats(13);
        _amulet.elementalStats = amuletEleStats(13);
    }

    function SoulbinderAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 15;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 72;
        // _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(14);
        _amulet.generatedStatBonus = amuletGenStats(14);
        _amulet.elementalStats = amuletEleStats(14);
    }

    function MoonlightAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 16;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 77;
        //   _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(15);
        _amulet.generatedStatBonus = amuletGenStats(15);
        _amulet.elementalStats = amuletEleStats(15);
    }

    function SunlightAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 17;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 82;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(16);
        _amulet.generatedStatBonus = amuletGenStats(16);
        _amulet.elementalStats = amuletEleStats(16);
    }

    function CycleAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 18;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 87;
        //  _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(17);
        _amulet.generatedStatBonus = amuletGenStats(17);
        _amulet.elementalStats = amuletEleStats(17);
    }

    function InfernalAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 19;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 92;
        // _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(18);
        _amulet.generatedStatBonus = amuletGenStats(18);
        _amulet.elementalStats = amuletEleStats(18);
    }

    function DivineAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 20;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 97;
        // _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(19);
        _amulet.generatedStatBonus = amuletGenStats(19);
        _amulet.elementalStats = amuletEleStats(19);
    }

    function EternalAmulet(uint tier) public view returns (GameObjects_Equipments.EquipableItem memory _amulet) {
        _amulet.metadata.id = 21;
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;

        _amulet.requirement.level = 100;
        // _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(20);
        _amulet.generatedStatBonus = amuletGenStats(20);
        _amulet.elementalStats = amuletEleStats(20);
    }


    function amuletStats(uint _index) internal view returns (GameObjects_Stats.Stats memory) {
        GameObjects_Stats.Stats memory stats = GameObjects_Stats.Stats({
        STR : BASE_STR[_index],
        DEX : BASE_DEX[_index],
        AGI : BASE_AGI[_index],
        INT : BASE_INT[_index],
        VIT : BASE_VIT[_index],
        LUCK : BASE_LUK[_index]});
        return stats;
    }

    function amuletEleD(uint _index) internal view returns (GameObjects_Stats.ElementalAtk memory) {
        GameObjects_Stats.ElementalAtk memory stats = GameObjects_Stats.ElementalAtk({FIRE_ATK : BASE_MATK[_index], EARTH_ATK : BASE_MATK[_index], COLD_ATK : BASE_MATK[_index], LIGHTNING_ATK : BASE_MATK[_index], DARK_ATK : BASE_MATK[_index], HOLY_ATK : BASE_MATK[_index], VOID_ATK : 0});
        return stats;
    }

    function amuletEle(uint _index) internal view returns (GameObjects_Stats.ElementalDef memory) {
        GameObjects_Stats.ElementalDef memory stats = GameObjects_Stats.ElementalDef({FIRE_DEF : BASE_MDEF[_index], EARTH_DEF : BASE_MDEF[_index], COLD_DEF : BASE_MDEF[_index], LIGHTNING_DEF : BASE_MDEF[_index], DARK_DEF : BASE_MDEF[_index], HOLY_DEF : BASE_MDEF[_index], VOID_DEF : 0});
        return stats;
    }

    function amuletGenStats(uint _index) internal view returns (GameObjects_Stats.GeneratedStats memory) {
        GameObjects_Stats.GeneratedStats memory stats = GameObjects_Stats.GeneratedStats({
        HP : BASE_HP[_index],
        P_ATK : BASE_ATK[_index],
        M_ATK : BASE_MATK[_index],
        P_DEF : BASE_DEF[_index],
        M_DEF : BASE_MDEF[_index],
        ACCURACY : BASE_ACC[_index],
        DODGE : BASE_DODGE[_index],
        CRIT : BASE_CRIT[_index],
        CRIT_MULTIPLIER : BASE_CRITDMG[_index],
        INFUSION : 0
        });
        return stats;
    }

    function amuletEleStats(uint _index) internal view returns (GameObjects_Stats.ElementalStats memory _genStats) {
        _genStats.ElementalDef = GameObjects_Stats.ElementalDef({FIRE_DEF : BASE_EDEF[_index], EARTH_DEF : BASE_EDEF[_index], COLD_DEF : BASE_EDEF[_index], LIGHTNING_DEF : BASE_EDEF[_index], DARK_DEF : BASE_EDEF[_index], HOLY_DEF : BASE_EDEF[_index], VOID_DEF : 0});
        _genStats.ElementalAtk = GameObjects_Stats.ElementalAtk({FIRE_ATK : BASE_MATK[_index], EARTH_ATK : BASE_MATK[_index], COLD_ATK : BASE_MATK[_index], LIGHTNING_ATK : BASE_MATK[_index], DARK_ATK : BASE_MATK[_index], HOLY_ATK : BASE_MATK[_index], VOID_ATK : 0});
    }
}
