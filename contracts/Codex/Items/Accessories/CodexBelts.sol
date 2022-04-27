import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import "../../../Inventory/EquipableUtils.sol";
import "../../../Core/Navigator/InitNavigator.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

pragma solidity ^0.8.0;

contract CodexBelts is InitNavigator, OwnableUpgradeable {
    ICodexPrefixAndSuffix PrefixContract;
    ICodexPrefixAndSuffix SuffixContract;

    string constant public index = "Codex";
    string constant public class = "Belts";
    string constant public version = "0.0.1";

    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_DEX;
    uint[21] public BASE_INT;
    uint[21] public BASE_VIT;
    uint[21] public BASE_LUK;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_EDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;
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
        uint[21] memory _BASE_LUK
    ) external onlyOwner {
        BASE_STR = _BASE_STR;
        BASE_AGI = _BASE_AGI;
        BASE_DEX = _BASE_DEX;
        BASE_INT = _BASE_INT;
        BASE_VIT = _BASE_VIT;
        BASE_LUK = _BASE_LUK;
    }

    function initializeCodex2(
        uint[21] memory _BASE_DEF,
        uint[21] memory _BASE_MDEF,
        uint[21] memory _BASE_EDEF,
        uint[21] memory _BASE_HP,
        uint[21] memory _BASE_DODGE,
        uint[21] memory _BASE_ACC
    ) external onlyOwner {
        BASE_DEF = _BASE_DEF;
        BASE_MDEF = _BASE_MDEF;
        BASE_EDEF = _BASE_EDEF;
        BASE_HP = _BASE_HP;
        BASE_DODGE = _BASE_DODGE;
        BASE_ACC = _BASE_ACC;
    }


    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Belt memory _belt) public view returns (GameObjects.Belt memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_belt.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _pre.statBonus);
        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_belt.elementalStats, _eleStatFromPreFixAndSuffix);
        _belt.metadata.name = string(abi.encodePacked(_pre.title, " ", _belt.metadata.name, " ", _suf.title));
        return _belt;
    }

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Belt memory _belt) public view returns (GameObjects.Belt memory) {
        _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_belt.generatedStatBonus, _pre.generatedStatBonus);

        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _pre.statBonus);


        _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_belt.elementalStats, _pre.elementalStats);
        _belt.metadata.name = string(abi.encodePacked(_pre.title, " ", _belt.metadata.name));
        return _belt;
    }

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Belt memory _belt) public view returns (GameObjects.Belt memory) {
        _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_belt.generatedStatBonus, _suf.generatedStatBonus);

        _belt.statBonus = EquipableUtils.sumStats(_belt.statBonus, _suf.statBonus);


        _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_belt.elementalStats, _suf.elementalStats);
        _belt.metadata.name = string(abi.encodePacked(_belt.metadata.name, " ", _suf.title));
        return _belt;
    }

    function applyTier(GameObjects.Belt memory _belt, uint tier, uint percentage) public view returns (GameObjects.Belt memory){
        if (tier == 0) return _belt;
        _belt.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_belt.generatedStatBonus, (tier) * percentage);
        _belt.elementalStats.ElementalDef = beltEle(percentage);
        _belt.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_belt.elementalStats, (tier) * percentage);
        return _belt;
    }
    function belt(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Belt memory) {
        GameObjects.Belt memory _belt;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;
        require(_equipable.itemTier < 10, "tier");

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _belt = applyTier(TatteredLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 2) {
            _belt = applyTier(RaggedLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 3) {
            _belt = applyTier(RawLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 4) {
            _belt = applyTier(ThinLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 5) {
            _belt = applyTier(CoarseLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 6) {
            _belt = applyTier(RuggedLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 7) {
            _belt = applyTier(ThickLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 8) {
            _belt = applyTier(ReinforcedLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 9) {
            _belt = applyTier(HardenedLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 10) {
            _belt = applyTier(LordlyLeatherBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 11) {
            _belt = applyTier(CopperEmblazonedBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 12) {
            _belt = applyTier(TinEmblazonedBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 13) {
            _belt = applyTier(IronEmblazonedBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 14) {
            _belt = applyTier(SilverEmblazonedBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 15) {
            _belt = applyTier(GoldEmblazonedBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 16) {
            _belt = applyTier(PlatinumSealedBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 17) {
            _belt = applyTier(MyhrilSealedBelt(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 18) {
            _belt = applyTier(OricalchumSealedBelt(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 19) {
            _belt = applyTier(ObsidianSealedBelt(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 20) {
            _belt = applyTier(LuminiteSealedBelt(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 21) {
            _belt = applyTier(EternalSealedBelt(_equipable.itemTier), _equipable.itemTier, 13);
        }

        if (_equipable.element == GameObjects.Element.VOID) {
            _belt.elementalStats.ElementalDef.VOID_DEF = _belt.generatedStatBonus.M_DEF;
        }

        if (_equipable.prefixId > 0 && _equipable.suffixId == 0) return applyPrefix(_prefix, _belt);
        if (_equipable.prefixId == 0 && _equipable.suffixId > 0) return applySuffix(_suffix, _belt);
        if (_equipable.prefixId > 0 && _equipable.suffixId > 0) return applyPrefixAndSuffix(_prefix, _suffix, _belt);

        return _belt;
    }

    function beltCore(uint itemId, uint itemTier) public view returns (GameObjects.Belt memory) {
        GameObjects.Belt memory _belt;
        require(itemTier < 10, "tier");


        if (itemId == 1) {
            _belt = applyTier(TatteredLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 2) {
            _belt = applyTier(RaggedLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 3) {
            _belt = applyTier(RawLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 4) {
            _belt = applyTier(ThinLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 5) {
            _belt = applyTier(CoarseLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 6) {
            _belt = applyTier(RuggedLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 7) {
            _belt = applyTier(ThickLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 8) {
            _belt = applyTier(ReinforcedLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 9) {
            _belt = applyTier(HardenedLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 10) {
            _belt = applyTier(LordlyLeatherBelt(itemTier), itemTier, 10);
        } else if (itemId == 11) {
            _belt = applyTier(CopperEmblazonedBelt(itemTier), itemTier, 10);
        } else if (itemId == 12) {
            _belt = applyTier(TinEmblazonedBelt(itemTier), itemTier, 10);
        } else if (itemId == 13) {
            _belt = applyTier(IronEmblazonedBelt(itemTier), itemTier, 10);
        } else if (itemId == 14) {
            _belt = applyTier(SilverEmblazonedBelt(itemTier), itemTier, 10);
        } else if (itemId == 15) {
            _belt = applyTier(GoldEmblazonedBelt(itemTier), itemTier, 10);
        } else if (itemId == 16) {
            _belt = applyTier(PlatinumSealedBelt(itemTier), itemTier, 10);
        } else if (itemId == 17) {
            _belt = applyTier(MyhrilSealedBelt(itemTier), itemTier, 10);
        } else if (itemId == 18) {
            _belt = applyTier(OricalchumSealedBelt(itemTier), itemTier, 13);
        } else if (itemId == 19) {
            _belt = applyTier(ObsidianSealedBelt(itemTier), itemTier, 13);
        } else if (itemId == 20) {
            _belt = applyTier(LuminiteSealedBelt(itemTier), itemTier, 13);
        } else if (itemId == 21) {
            _belt = applyTier(EternalSealedBelt(itemTier), itemTier, 13);
        }

        return _belt;
    }

    function TatteredLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 1;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Tattered Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 1;
        _belt.requirement.classRequirement = new GameObjects.Class[](0);
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(0);
        _belt.generatedStatBonus = beltGenStats(0);
    }

    function RaggedLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 2;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Ragged Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 5;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(1);
        _belt.generatedStatBonus = beltGenStats(1);
    }

    function RawLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 3;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Raw Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 10;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(2);
        _belt.generatedStatBonus = beltGenStats(2);
    }

    function ThinLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 4;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Thin Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 15;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(3);
        _belt.generatedStatBonus = beltGenStats(3);
    }

    function CoarseLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 5;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Coarse Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 20;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(4);
        _belt.generatedStatBonus = beltGenStats(4);
    }

    function RuggedLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 6;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Rugged Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 25;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(5);
        _belt.generatedStatBonus = beltGenStats(5);
    }

    function ThickLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 7;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Thick Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 30;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(6);
        _belt.generatedStatBonus = beltGenStats(6);
    }

    function ReinforcedLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 8;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Reinforced Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 35;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(7);
        _belt.generatedStatBonus = beltGenStats(7);
    }

    function HardenedLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 9;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Hardened Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 40;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(8);
        _belt.generatedStatBonus = beltGenStats(8);
    }

    function LordlyLeatherBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 10;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Lordly Leather Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 45;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(9);
        _belt.generatedStatBonus = beltGenStats(9);
    }

    function CopperEmblazonedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 11;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Copper Emblazoned Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 50;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(10);
        _belt.generatedStatBonus = beltGenStats(10);
    }

    function TinEmblazonedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 12;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Tin Emblazoned Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 55;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(11);
        _belt.generatedStatBonus = beltGenStats(11);
    }

    function IronEmblazonedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 13;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Iron Emblazoned Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 60;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(12);
        _belt.generatedStatBonus = beltGenStats(12);
    }

    function SilverEmblazonedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 14;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Silver Emblazoned Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 65;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(13);
        _belt.generatedStatBonus = beltGenStats(13);
    }

    function GoldEmblazonedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 15;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Gold Emblazoned Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 70;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(14);
        _belt.generatedStatBonus = beltGenStats(14);
    }

    function PlatinumSealedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 16;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Platinum Sealed Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 75;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(15);
        _belt.generatedStatBonus = beltGenStats(15);
    }

    function MyhrilSealedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 17;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Mythril Sealed Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 80;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(16);
        _belt.generatedStatBonus = beltGenStats(16);
    }

    function OricalchumSealedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 18;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Oricalchum Sealed Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 85;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(17);
        _belt.generatedStatBonus = beltGenStats(17);
    }

    function ObsidianSealedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 19;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Obsidian Sealed Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 90;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(18);
        _belt.generatedStatBonus = beltGenStats(18);
    }

    function LuminiteSealedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 20;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Luminite Sealed Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 95;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(19);
        _belt.generatedStatBonus = beltGenStats(19);
    }

    function EternalSealedBelt(uint tier) public view returns (GameObjects.Belt memory _belt) {
        _belt.metadata.id = 21;
        _belt.metadata.baseType = GameObjects.ItemType.BELT;
        _belt.metadata.name = "Eternal Sealed Belt";
        _belt.metadata.description = "";
        _belt.metadata.upgradable = true;

        _belt.requirement.level = 100;
        _belt.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _belt.statBonus = beltStats(20);
        _belt.generatedStatBonus = beltGenStats(20);
    }


    function beltStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : BASE_LUK[index]});
        return stats;
    }

    function beltEle(uint index) internal view returns (GameObjects.ElementalDef memory) {
        GameObjects.ElementalDef memory stats = GameObjects.ElementalDef({FIRE_DEF : BASE_EDEF[index], EARTH_DEF : BASE_EDEF[index], COLD_DEF : BASE_EDEF[index], LIGHTNING_DEF : BASE_EDEF[index], DARK_DEF : BASE_EDEF[index], HOLY_DEF : BASE_EDEF[index], VOID_DEF : 0});
        return stats;
    }

    function beltGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
        GameObjects.GeneratedStats memory stats = GameObjects.GeneratedStats({
        HP : BASE_HP[index],
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : BASE_DEF[index],
        M_DEF : BASE_MDEF[index],
        ACCURACY : BASE_ACC[index],
        DODGE : BASE_DODGE[index],
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });
        return stats;
    }
}
