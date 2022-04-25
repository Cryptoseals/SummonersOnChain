import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import "../../../Inventory/EquipableUtils.sol";
import "../../../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract CodexRings is InitNavigator {
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


    function initializeCodex(address _navigator) external initializer {
        initializeNavigator(_navigator);
        initializeSTR();
        initializeAGI();
        initializeDEX();
        initializeINT();
        initializeVIT();
        initializeLUK();
        initializeATK();
        initializeMATK();
        initializeDEF();
        initializeMDEF();
        initializeEDEF();
        initializeHP();
        initializeACC();
        initializeDODGE();
        initializeCRIT();
        initializeCRITDMG();
        PrefixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.PREFIX_CODEX));
        SuffixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.SUFFIX_CODEX));
    }

    function initializeSTR() public {
        BASE_STR = [3, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300];
    }

    function initializeAGI() public {
        BASE_AGI = [1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100];
    }

    function initializeDEX() public {
        BASE_DEX = [1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100];
    }

    function initializeINT() public {
        BASE_INT = [4, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300, 320, 340, 360, 380, 400];
    }

    function initializeVIT() public {
        BASE_VIT = [2, 8, 15, 23, 30, 38, 45, 53, 60, 68, 75, 83, 90, 98, 105, 113, 120, 128, 135, 143, 150];
    }

    function initializeATK() public {
        BASE_ATK = [10, 12, 16, 19, 24, 31, 39, 47, 62, 79, 101, 128, 163, 208, 265, 338, 431, 550, 701, 895, 1141];
    }

    function initializeMATK() public {
        BASE_MATK = [15, 18, 23, 29, 36, 46, 58, 71, 93, 119, 151, 192, 245, 312, 398, 507, 646, 825, 1052, 1342, 1712];
    }

    function initializeLUK() public {
        BASE_LUK = [3, 13, 25, 38, 50, 63, 75, 88, 100, 113, 125, 138, 150, 163, 175, 188, 200, 213, 225, 238, 250];
    }

    function initializeDEF() public {
        BASE_DEF = [5, 6, 7, 9, 10, 12, 15, 18, 21, 26, 31, 38, 46, 55, 67, 81, 99, 120, 145, 177, 215];
    }

    function initializeMDEF() public {
        BASE_MDEF = [20, 24, 28, 33, 40, 48, 58, 70, 84, 102, 123, 149, 181, 219, 266, 323, 393, 477, 580, 705, 857];
    }

    function initializeEDEF() public {
        BASE_EDEF = [18, 21, 25, 30, 36, 43, 52, 63, 76, 92, 111, 134, 163, 197, 240, 291, 354, 430, 522, 635, 772];
    }

    function initializeHP() public {
        BASE_HP = [13, 63, 125, 188, 250, 313, 375, 438, 500, 563, 625, 688, 750, 813, 875, 938, 1000, 1063, 1125, 1188, 1250];
    }

    function initializeACC() public {
        BASE_ACC = [24, 28, 34, 41, 50, 60, 72, 88, 106, 129, 157, 190, 231, 281, 341, 415, 504, 613, 746, 907, 1103];
    }

    function initializeDODGE() public {
        BASE_DODGE = [50, 61, 78, 99, 125, 160, 203, 259, 330, 421, 537, 665, 874, 1115, 1423, 1816, 2317, 2957, 3773, 4815, 6145];
    }

    function initializeCRIT() public {
        BASE_CRIT = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5];
    }

    function initializeCRITDMG() public {
        BASE_CRITDMG = [23, 25, 27, 29, 32, 35, 38, 41, 45, 50, 54, 59, 60, 60, 60, 60, 60, 60, 60, 60, 60];
    }

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Ring memory _ring) public view returns (GameObjects.Ring memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_ring.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _pre.statBonus);
        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ring.elementalStats, _eleStatFromPreFixAndSuffix);
        _ring.metadata.name = string(abi.encodePacked(_pre.title, " ", _ring.metadata.name, " ", _suf.title));
        return _ring;
    }

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Ring memory _ring) public view returns (GameObjects.Ring memory) {
        _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_ring.generatedStatBonus, _pre.generatedStatBonus);

        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _pre.statBonus);

        _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ring.elementalStats, _pre.elementalStats);
        _ring.metadata.name = string(abi.encodePacked(_pre.title, " ", _ring.metadata.name));
        return _ring;
    }

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Ring memory _ring) public view returns (GameObjects.Ring memory) {
        _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_ring.generatedStatBonus, _suf.generatedStatBonus);

        _ring.statBonus = EquipableUtils.sumStats(_ring.statBonus, _suf.statBonus);

        _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ring.elementalStats, _suf.elementalStats);
        _ring.metadata.name = string(abi.encodePacked(_ring.metadata.name, " ", _suf.title));
        return _ring;
    }

    function applyTier(GameObjects.Ring memory _ring, uint tier, uint percentage) public view returns (GameObjects.Ring memory){
        if (tier == 0) return _ring;
        _ring.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_ring.generatedStatBonus, (tier) * percentage);
        _ring.elementalStats.ElementalDef = ringEle(percentage);
        _ring.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_ring.elementalStats, (tier) * percentage);
        return _ring;
    }

    function ring(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Ring memory) {
        GameObjects.Ring memory _ring;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;
        require(_equipable.itemTier < 10, "tier");

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _ring = applyTier(CopperRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 2) {
            _ring = applyTier(TinRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 3) {
            _ring = applyTier(IronRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 4) {
            _ring = applyTier(SilverRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 5) {
            _ring = applyTier(GoldRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 6) {
            _ring = applyTier(AmberRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 7) {
            _ring = applyTier(PearlRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 8) {
            _ring = applyTier(AmethystRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 9) {
            _ring = applyTier(CoralRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 10) {
            _ring = applyTier(RubyRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 11) {
            _ring = applyTier(ShinyRubyRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 12) {
            _ring = applyTier(TopazRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 13) {
            _ring = applyTier(ShinyTopazRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 14) {
            _ring = applyTier(AzuriteRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 15) {
            _ring = applyTier(ShinyAzuriteRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 16) {
            _ring = applyTier(EmeraldRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 17) {
            _ring = applyTier(ShinyEmeraldRing(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 18) {
            _ring = applyTier(SapphireRing(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 19) {
            _ring = applyTier(ShinySapphireRing(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 20) {
            _ring = applyTier(DiamondRing(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 21) {
            _ring = applyTier(ShinyDiamondRing(_equipable.itemTier), _equipable.itemTier, 13);
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

    function CopperRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 1;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Copper Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 1;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(0);
        _ring.generatedStatBonus = ringGenStats(0);
    }

    function TinRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 2;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Tin Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 5;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(1);
        _ring.generatedStatBonus = ringGenStats(1);
    }

    function IronRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 3;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Iron Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 10;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(2);
        _ring.generatedStatBonus = ringGenStats(2);
    }

    function SilverRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 4;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Silver Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 15;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(3);
        _ring.generatedStatBonus = ringGenStats(3);
    }

    function GoldRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 5;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Gold Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 20;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(4);
        _ring.generatedStatBonus = ringGenStats(4);
    }

    function AmberRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 6;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Amber Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 25;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(5);
        _ring.generatedStatBonus = ringGenStats(5);
    }

    function PearlRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 7;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Pearl Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 30;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(6);
        _ring.generatedStatBonus = ringGenStats(6);
    }

    function AmethystRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 8;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Amethyst Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 35;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(7);
        _ring.generatedStatBonus = ringGenStats(7);
    }

    function CoralRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 9;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Coral Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 40;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(8);
        _ring.generatedStatBonus = ringGenStats(8);
    }

    function RubyRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 10;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Ruby Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 45;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(9);
        _ring.generatedStatBonus = ringGenStats(9);
    }

    function ShinyRubyRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 11;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Shiny Ruby Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 50;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(10);
        _ring.generatedStatBonus = ringGenStats(10);
    }

    function TopazRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 12;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Topaz Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 55;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(11);
        _ring.generatedStatBonus = ringGenStats(11);
    }

    function ShinyTopazRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 13;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Shiny Topaz Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 60;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(12);
        _ring.generatedStatBonus = ringGenStats(12);
    }

    function AzuriteRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 14;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Azurite Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 65;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(13);
        _ring.generatedStatBonus = ringGenStats(13);
    }

    function ShinyAzuriteRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 15;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Shiny Azurite Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 70;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(14);
        _ring.generatedStatBonus = ringGenStats(14);
    }

    function EmeraldRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 16;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Emerald Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 75;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(15);
        _ring.generatedStatBonus = ringGenStats(15);
    }

    function ShinyEmeraldRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 17;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Shiny Emerald Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 80;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(16);
        _ring.generatedStatBonus = ringGenStats(16);
    }

    function SapphireRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 18;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Sapphire Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 85;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(17);
        _ring.generatedStatBonus = ringGenStats(17);
    }

    function ShinySapphireRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 19;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Shiny Sapphire Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 90;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(18);
        _ring.generatedStatBonus = ringGenStats(18);
    }

    function DiamondRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 20;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Diamond Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 95;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(19);
        _ring.generatedStatBonus = ringGenStats(19);
    }

    function ShinyDiamondRing(uint tier) public view returns (GameObjects.Ring memory _ring) {
        _ring.metadata.id = 21;
        _ring.metadata.baseType = GameObjects.ItemType.RING;
        _ring.metadata.name = "Shiny Diamond Ring";
        _ring.metadata.description = "";
        _ring.metadata.upgradable = true;

        _ring.requirement.level = 100;
        _ring.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _ring.statBonus = ringStats(20);
        _ring.generatedStatBonus = ringGenStats(20);
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
}
