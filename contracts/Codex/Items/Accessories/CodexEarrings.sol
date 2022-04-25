import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import "../../../Inventory/EquipableUtils.sol";
import "../../../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract CodexEarrings is InitNavigator {
    ICodexPrefixAndSuffix PrefixContract;
    ICodexPrefixAndSuffix SuffixContract;

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
        BASE_AGI = [2, 8, 15, 23, 30, 38, 45, 53, 60, 68, 75, 83, 90, 98, 105, 113, 120, 128, 135, 143, 150];
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
        BASE_CRIT = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3];
    }

    function initializeCRITDMG() public {
        BASE_CRITDMG = [23, 25, 27, 29, 32, 35, 38, 41, 45, 50, 54, 59, 60, 60, 60, 60, 60, 60, 60, 60, 60];}

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Earring memory _earrings) public view returns (GameObjects.Earring memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_earrings.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _earrings.statBonus = EquipableUtils.sumStats(_earrings.statBonus, _pre.statBonus);
        _earrings.statBonus = EquipableUtils.sumStats(_earrings.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_earrings.elementalStats, _eleStatFromPreFixAndSuffix);
        _earrings.metadata.name = string(abi.encodePacked(_pre.title, " ", _earrings.metadata.name, " ", _suf.title));
        return _earrings;
    }

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Earring memory _earrings) public view returns (GameObjects.Earring memory) {
        _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_earrings.generatedStatBonus, _pre.generatedStatBonus);

        _earrings.statBonus = EquipableUtils.sumStats(_earrings.statBonus, _pre.statBonus);

        _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_earrings.elementalStats, _pre.elementalStats);
        _earrings.metadata.name = string(abi.encodePacked(_pre.title, " ", _earrings.metadata.name));
        return _earrings;
    }

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Earring memory _earrings) public view returns (GameObjects.Earring memory) {
        _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_earrings.generatedStatBonus, _suf.generatedStatBonus);

        _earrings.statBonus = EquipableUtils.sumStats(_earrings.statBonus, _suf.statBonus);

        _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_earrings.elementalStats, _suf.elementalStats);
        _earrings.metadata.name = string(abi.encodePacked(_earrings.metadata.name, " ", _suf.title));
        return _earrings;
    }

    function applyTier(GameObjects.Earring memory _earrings, uint tier, uint percentage) public view returns (GameObjects.Earring memory){
        if (tier == 0) return _earrings;
        _earrings.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_earrings.generatedStatBonus, (tier) * percentage);
        _earrings.elementalStats.ElementalDef = amuletEle(percentage);
        _earrings.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_earrings.elementalStats, (tier) * percentage);
        return _earrings;
    }

    function earrings(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Earring memory) {
        GameObjects.Earring memory _earrings;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;
        require(_equipable.itemTier < 10, "tier");

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _earrings = applyTier(CopperEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 2) {
            _earrings = applyTier(TinEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 3) {
            _earrings = applyTier(IronEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 4) {
            _earrings = applyTier(SilverEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 5) {
            _earrings = applyTier(GoldEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 6) {
            _earrings = applyTier(AmberEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 7) {
            _earrings = applyTier(PearlEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 8) {
            _earrings = applyTier(AmethystEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 9) {
            _earrings = applyTier(CoralEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 10) {
            _earrings = applyTier(RubyEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 11) {
            _earrings = applyTier(ShinyRubyEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 12) {
            _earrings = applyTier(TopazEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 13) {
            _earrings = applyTier(ShinyTopazEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 14) {
            _earrings = applyTier(AzuriteEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 15) {
            _earrings = applyTier(ShinyAzuriteEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 16) {
            _earrings = applyTier(EmeraldEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 17) {
            _earrings = applyTier(ShinyEmeraldEarrings(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 18) {
            _earrings = applyTier(SapphireEarrings(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 19) {
            _earrings = applyTier(ShinySapphireEarrings(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 20) {
            _earrings = applyTier(DiamondEarrings(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 21) {
            _earrings = applyTier(ShinyDiamondEarrings(_equipable.itemTier), _equipable.itemTier, 13);
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

    function CopperEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 1;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Copper Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 1;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(0);
        _earrings.generatedStatBonus = amuletGenStats(0);
    }

    function TinEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 2;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Tin Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 5;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(1);
        _earrings.generatedStatBonus = amuletGenStats(1);
    }

    function IronEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 3;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Iron Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 10;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(2);
        _earrings.generatedStatBonus = amuletGenStats(2);
    }

    function SilverEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 4;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Silver Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 15;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(3);
        _earrings.generatedStatBonus = amuletGenStats(3);
    }

    function GoldEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 5;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Gold Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 20;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(4);
        _earrings.generatedStatBonus = amuletGenStats(4);
    }

    function AmberEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 6;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Amber Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 25;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(5);
        _earrings.generatedStatBonus = amuletGenStats(5);
    }

    function PearlEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 7;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Pearl Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 30;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(6);
        _earrings.generatedStatBonus = amuletGenStats(6);
    }

    function AmethystEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 8;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Amethyst Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 35;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(7);
        _earrings.generatedStatBonus = amuletGenStats(7);
    }

    function CoralEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 9;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Coral Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 40;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(8);
        _earrings.generatedStatBonus = amuletGenStats(8);
    }

    function RubyEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 10;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Ruby Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 45;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(9);
        _earrings.generatedStatBonus = amuletGenStats(9);
    }

    function ShinyRubyEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 11;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Shiny Ruby Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 50;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(10);
        _earrings.generatedStatBonus = amuletGenStats(10);
    }

    function TopazEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 12;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Topaz Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 55;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(11);
        _earrings.generatedStatBonus = amuletGenStats(11);
    }

    function ShinyTopazEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 13;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Shiny Topaz Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 60;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(12);
        _earrings.generatedStatBonus = amuletGenStats(12);
    }

    function AzuriteEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 14;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Azurite Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 65;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(13);
        _earrings.generatedStatBonus = amuletGenStats(13);
    }

    function ShinyAzuriteEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 15;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Shiny Azurite Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 70;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(14);
        _earrings.generatedStatBonus = amuletGenStats(14);
    }

    function EmeraldEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 16;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Emerald Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 75;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(15);
        _earrings.generatedStatBonus = amuletGenStats(15);
    }

    function ShinyEmeraldEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 17;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Shiny Emerald Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 80;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(16);
        _earrings.generatedStatBonus = amuletGenStats(16);
    }

    function SapphireEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 18;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Sapphire Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 85;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(17);
        _earrings.generatedStatBonus = amuletGenStats(17);
    }

    function ShinySapphireEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 19;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Shiny Sapphire Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 90;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(18);
        _earrings.generatedStatBonus = amuletGenStats(18);
    }

    function DiamondEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 20;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Diamond Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 95;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(19);
        _earrings.generatedStatBonus = amuletGenStats(19);
    }

    function ShinyDiamondEarrings(uint tier) public view returns (GameObjects.Earring memory _earrings) {
        _earrings.metadata.id = 21;
        _earrings.metadata.baseType = GameObjects.ItemType.EARRING;
        _earrings.metadata.name = "Shiny Diamond Earrings";
        _earrings.metadata.description = "";
        _earrings.metadata.upgradable = true;

        _earrings.requirement.level = 100;
        _earrings.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _earrings.statBonus = amuletStats(20);
        _earrings.generatedStatBonus = amuletGenStats(20);
    }


    function amuletStats(uint index) internal view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory stats = GameObjects.Stats({
        STR : BASE_STR[index],
        DEX : BASE_DEX[index],
        AGI : BASE_AGI[index],
        INT : BASE_INT[index],
        VIT : BASE_VIT[index],
        LUCK : BASE_LUK[index]});
        return stats;
    }

    function amuletEleD(uint index) internal view returns (GameObjects.ElementalAtk memory) {
        GameObjects.ElementalAtk memory stats = GameObjects.ElementalAtk({FIRE_ATK : BASE_MATK[index], EARTH_ATK : BASE_MATK[index], COLD_ATK : BASE_MATK[index], LIGHTNING_ATK : BASE_MATK[index], DARK_ATK : BASE_MATK[index], HOLY_ATK : BASE_MATK[index], VOID_ATK : 0});
        return stats;
    }

    function amuletEle(uint index) internal view returns (GameObjects.ElementalDef memory) {
        GameObjects.ElementalDef memory stats = GameObjects.ElementalDef({FIRE_DEF : BASE_MDEF[index], EARTH_DEF : BASE_MDEF[index], COLD_DEF : BASE_MDEF[index], LIGHTNING_DEF : BASE_MDEF[index], DARK_DEF : BASE_MDEF[index], HOLY_DEF : BASE_MDEF[index], VOID_DEF : 0});
        return stats;
    }

    function amuletGenStats(uint index) internal view returns (GameObjects.GeneratedStats memory) {
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
