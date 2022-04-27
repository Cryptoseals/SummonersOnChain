import "../../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import "../../../Inventory/EquipableUtils.sol";
import "../../../Core/Navigator/InitNavigator.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

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

    function applyPrefixAndSuffix(GameObjects.Prefix memory _pre, GameObjects.Suffix memory _suf, GameObjects.Amulet memory _amulet) public view returns (GameObjects.Amulet memory) {
        GameObjects.GeneratedStats memory _genStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedStats(_pre.generatedStatBonus, _suf.generatedStatBonus);
        _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_amulet.generatedStatBonus, _genStatFromPreFixAndSuffix);

        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _pre.statBonus);
        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _suf.statBonus);

        GameObjects.ElementalStats memory _eleStatFromPreFixAndSuffix = EquipableUtils.sumGeneratedElementalStats(_pre.elementalStats, _suf.elementalStats);

        _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_amulet.elementalStats, _eleStatFromPreFixAndSuffix);
        _amulet.metadata.name = string(abi.encodePacked(_pre.title, " ", _amulet.metadata.name, " ", _suf.title));
        return _amulet;
    }

    function applyPrefix(GameObjects.Prefix memory _pre, GameObjects.Amulet memory _amulet) public view returns (GameObjects.Amulet memory) {
        _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_amulet.generatedStatBonus, _pre.generatedStatBonus);

        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _pre.statBonus);

        _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_amulet.elementalStats, _pre.elementalStats);
        _amulet.metadata.name = string(abi.encodePacked(_pre.title, " ", _amulet.metadata.name));
        return _amulet;
    }

    function applySuffix(GameObjects.Suffix memory _suf, GameObjects.Amulet memory _amulet) public view returns (GameObjects.Amulet memory) {
        _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsPercentage(_amulet.generatedStatBonus, _suf.generatedStatBonus);

        _amulet.statBonus = EquipableUtils.sumStats(_amulet.statBonus, _suf.statBonus);

        _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_amulet.elementalStats, _suf.elementalStats);
        _amulet.metadata.name = string(abi.encodePacked(_amulet.metadata.name, " ", _suf.title));
        return _amulet;
    }

    function applyTier(GameObjects.Amulet memory _amulet, uint tier, uint percentage) public view returns (GameObjects.Amulet memory){
        if (tier == 0) return _amulet;
        _amulet.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_amulet.generatedStatBonus, (tier) * percentage);
        _amulet.elementalStats.ElementalDef = amuletEle(percentage);
        _amulet.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_amulet.elementalStats, (tier) * percentage);
        return _amulet;
    }

    function amulet(GameObjects.EquippedItemStruct memory _equipable) public view returns (GameObjects.Amulet memory) {
        GameObjects.Amulet memory _amulet;
        GameObjects.Prefix memory _prefix;
        GameObjects.Suffix memory _suffix;
        require(_equipable.itemTier < 10, "tier");

        if (_equipable.prefixId > 0) _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        if (_equipable.suffixId > 0) _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _amulet = applyTier(CopperAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 2) {
            _amulet = applyTier(TinAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 3) {
            _amulet = applyTier(IronAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 4) {
            _amulet = applyTier(SilverAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 5) {
            _amulet = applyTier(GoldAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 6) {
            _amulet = applyTier(AmberAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 7) {
            _amulet = applyTier(PearlAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 8) {
            _amulet = applyTier(AmethystAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 9) {
            _amulet = applyTier(CoralAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 10) {
            _amulet = applyTier(RubyAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 11) {
            _amulet = applyTier(ShinyRubyAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 12) {
            _amulet = applyTier(TopazAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 13) {
            _amulet = applyTier(ShinyTopazAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 14) {
            _amulet = applyTier(AzuriteAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 15) {
            _amulet = applyTier(ShinyAzuriteAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 16) {
            _amulet = applyTier(EmeraldAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 17) {
            _amulet = applyTier(ShinyEmeraldAmulet(_equipable.itemTier), _equipable.itemTier, 10);
        } else if (_equipable.itemId == 18) {
            _amulet = applyTier(SapphireAmulet(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 19) {
            _amulet = applyTier(ShinySapphireAmulet(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 20) {
            _amulet = applyTier(DiamondAmulet(_equipable.itemTier), _equipable.itemTier, 13);
        } else if (_equipable.itemId == 21) {
            _amulet = applyTier(ShinyDiamondAmulet(_equipable.itemTier), _equipable.itemTier, 13);
        }
        _amulet.metadata.baseType = GameObjects.ItemType.AMULET;
        _amulet.metadata.upgradable = true;
        if (_equipable.element == GameObjects.Element.VOID) {
            _amulet.elementalStats.ElementalDef.VOID_DEF = _amulet.generatedStatBonus.M_DEF;
            _amulet.elementalStats.ElementalAtk.VOID_ATK = _amulet.generatedStatBonus.M_ATK;
        }

        if (_equipable.prefixId > 0 && _equipable.suffixId == 0) return applyPrefix(_prefix, _amulet);
        if (_equipable.prefixId == 0 && _equipable.suffixId > 0) return applySuffix(_suffix, _amulet);
        if (_equipable.prefixId > 0 && _equipable.suffixId > 0) return applyPrefixAndSuffix(_prefix, _suffix, _amulet);
        return _amulet;
    }

    function amuletCore(uint itemId, uint itemTier) public view returns (GameObjects.Amulet memory) {
        GameObjects.Amulet memory _amulet;
        require(itemTier < 10, "tier");

        if (itemId == 1) {
            _amulet = applyTier(CopperAmulet(itemTier), itemTier, 10);
        } else if (itemId == 2) {
            _amulet = applyTier(TinAmulet(itemTier), itemTier, 10);
        } else if (itemId == 3) {
            _amulet = applyTier(IronAmulet(itemTier), itemTier, 10);
        } else if (itemId == 4) {
            _amulet = applyTier(SilverAmulet(itemTier), itemTier, 10);
        } else if (itemId == 5) {
            _amulet = applyTier(GoldAmulet(itemTier), itemTier, 10);
        } else if (itemId == 6) {
            _amulet = applyTier(AmberAmulet(itemTier), itemTier, 10);
        } else if (itemId == 7) {
            _amulet = applyTier(PearlAmulet(itemTier), itemTier, 10);
        } else if (itemId == 8) {
            _amulet = applyTier(AmethystAmulet(itemTier), itemTier, 10);
        } else if (itemId == 9) {
            _amulet = applyTier(CoralAmulet(itemTier), itemTier, 10);
        } else if (itemId == 10) {
            _amulet = applyTier(RubyAmulet(itemTier), itemTier, 10);
        } else if (itemId == 11) {
            _amulet = applyTier(ShinyRubyAmulet(itemTier), itemTier, 10);
        } else if (itemId == 12) {
            _amulet = applyTier(TopazAmulet(itemTier), itemTier, 10);
        } else if (itemId == 13) {
            _amulet = applyTier(ShinyTopazAmulet(itemTier), itemTier, 10);
        } else if (itemId == 14) {
            _amulet = applyTier(AzuriteAmulet(itemTier), itemTier, 10);
        } else if (itemId == 15) {
            _amulet = applyTier(ShinyAzuriteAmulet(itemTier), itemTier, 10);
        } else if (itemId == 16) {
            _amulet = applyTier(EmeraldAmulet(itemTier), itemTier, 10);
        } else if (itemId == 17) {
            _amulet = applyTier(ShinyEmeraldAmulet(itemTier), itemTier, 10);
        } else if (itemId == 18) {
            _amulet = applyTier(SapphireAmulet(itemTier), itemTier, 13);
        } else if (itemId == 19) {
            _amulet = applyTier(ShinySapphireAmulet(itemTier), itemTier, 13);
        } else if (itemId == 20) {
            _amulet = applyTier(DiamondAmulet(itemTier), itemTier, 13);
        } else if (itemId == 21) {
            _amulet = applyTier(ShinyDiamondAmulet(itemTier), itemTier, 13);
        }
        return _amulet;
    }

    function CopperAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 1;
        _amulet.metadata.name = "Copper Amulet";
        _amulet.metadata.description = "";
        _amulet.requirement.level = 1;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _amulet.statBonus = amuletStats(0);
        _amulet.generatedStatBonus = amuletGenStats(0);
    }

    function TinAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 2;
        _amulet.metadata.name = "Tin Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 5;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(1);
        _amulet.generatedStatBonus = amuletGenStats(1);
    }

    function IronAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 3;
        _amulet.metadata.name = "Iron Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 10;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(2);
        _amulet.generatedStatBonus = amuletGenStats(2);
    }

    function SilverAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 4;
        _amulet.metadata.name = "Silver Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 15;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(3);
        _amulet.generatedStatBonus = amuletGenStats(3);
    }

    function GoldAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 5;
        _amulet.metadata.name = "Gold Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 20;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(4);
        _amulet.generatedStatBonus = amuletGenStats(4);
    }

    function AmberAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 6;
        _amulet.metadata.name = "Amber Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 25;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(5);
        _amulet.generatedStatBonus = amuletGenStats(5);
    }

    function PearlAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 7;
        _amulet.metadata.name = "Pearl Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 30;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(6);
        _amulet.generatedStatBonus = amuletGenStats(6);
    }

    function AmethystAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 8;
        _amulet.metadata.name = "Amethyst Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 35;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(7);
        _amulet.generatedStatBonus = amuletGenStats(7);
    }

    function CoralAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 9;
        _amulet.metadata.name = "Coral Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 40;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(8);
        _amulet.generatedStatBonus = amuletGenStats(8);
    }

    function RubyAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 10;
        _amulet.metadata.name = "Ruby Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 45;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(9);
        _amulet.generatedStatBonus = amuletGenStats(9);
    }

    function ShinyRubyAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 11;
        _amulet.metadata.name = "Shiny Ruby Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 50;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(10);
        _amulet.generatedStatBonus = amuletGenStats(10);
    }

    function TopazAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 12;
        _amulet.metadata.name = "Topaz Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 55;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(11);
        _amulet.generatedStatBonus = amuletGenStats(11);
    }

    function ShinyTopazAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 13;
        _amulet.metadata.name = "Shiny Topaz Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 60;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(12);
        _amulet.generatedStatBonus = amuletGenStats(12);
    }

    function AzuriteAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 14;
        _amulet.metadata.name = "Azurite Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 65;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(13);
        _amulet.generatedStatBonus = amuletGenStats(13);
    }

    function ShinyAzuriteAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 15;
        _amulet.metadata.name = "Shiny Azurite Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 70;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(14);
        _amulet.generatedStatBonus = amuletGenStats(14);
    }

    function EmeraldAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 16;
        _amulet.metadata.name = "Emerald Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 75;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(15);
        _amulet.generatedStatBonus = amuletGenStats(15);
    }

    function ShinyEmeraldAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 17;
        _amulet.metadata.name = "Shiny Emerald Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 80;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(16);
        _amulet.generatedStatBonus = amuletGenStats(16);
    }

    function SapphireAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 18;
        _amulet.metadata.name = "Sapphire Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 85;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(17);
        _amulet.generatedStatBonus = amuletGenStats(17);
    }

    function ShinySapphireAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 19;
        _amulet.metadata.name = "Shiny Sapphire Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 90;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(18);
        _amulet.generatedStatBonus = amuletGenStats(18);
    }

    function DiamondAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 20;
        _amulet.metadata.name = "Diamond Amulet";
        _amulet.metadata.description = "";

        _amulet.requirement.level = 95;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(19);
        _amulet.generatedStatBonus = amuletGenStats(19);
    }

    function ShinyDiamondAmulet(uint tier) public view returns (GameObjects.Amulet memory _amulet) {
        _amulet.metadata.id = 21;
        _amulet.metadata.name = "Shiny Diamond Amulet";
        _amulet.metadata.description = "";


        _amulet.requirement.level = 100;
        _amulet.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _amulet.statBonus = amuletStats(20);
        _amulet.generatedStatBonus = amuletGenStats(20);
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
