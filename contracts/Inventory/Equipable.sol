import "../Interfaces/Attributes/IAttributes.sol";
import "../Interfaces/Summoners/ISummoners.sol";
import "../Interfaces/Codex/IAllCodexViews.sol";
import "../Interfaces/NonFungibles/EquipableItems/IEquipableItems.sol";
import "../Core/Navigator/InitNavigator.sol";
import "./EquipableUtils.sol";



pragma solidity ^0.8.0;

contract Equipable is Initializable, InitNavigator {

    // held nfts

    mapping(address => mapping(uint => bool)) public Escrow;

    struct EquippedGear {
        uint weaponTokenId;
        uint offHandTokenId;
        uint helmetTokenId;
        uint armorTokenId;
        uint bootsTokenId;
        uint amuletTokenId;
        uint ringTokenId;
        uint earringTokenId;
        uint beltTokenId;
        uint sealTokenId;
        GameObjects.SummonedCompanion companion;
    }



    // @TODO mappings of equipped item tokenIds
    mapping(uint => GameObjects.EquippedItemStruct) public EquippedWeapons;
    mapping(uint => GameObjects.EquippedItemStruct) public EquippedOffHands;
    mapping(uint => GameObjects.EquippedItemStruct) public EquippedHelmets;
    mapping(uint => GameObjects.EquippedItemStruct) public EquippedArmors;
    mapping(uint => GameObjects.EquippedItemStruct) public EquippedBoots;
    mapping(uint => GameObjects.EquippedItemStruct) public EquippedAmulet;
    mapping(uint => GameObjects.EquippedItemStruct) public EquippedEarring;
    mapping(uint => GameObjects.EquippedItemStruct) public EquippedRing;
    mapping(uint => GameObjects.EquippedItemStruct) public EquippedBelt;
    mapping(uint => uint) public EquippedSeals;
    mapping(uint => GameObjects.Stats) public PreCalculatedEquipmentStats;
    mapping(uint => GameObjects.GeneratedStats) public PreCalculatedGeneratedEquipmentStats;
    mapping(uint => GameObjects.ElementalStats) public PreCalculatedEquipmentElementalStats;
    mapping(uint => GameObjects.Element) public DamageTypesOfSummoners;
    mapping(uint => GameObjects.SummonedCompanion) public SummonedCompanions;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function canEquip(uint summoner, GameObjects.ItemRequirement memory _requirement) internal view returns (bool) {
        //        IAttributes attributesContract = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES));
        GameEntities.SummonerData memory _summoner = ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).summonerData(summoner);
        //        GameObjects.Stats memory _summonerStats = attributesContract.stats(summoner);
        bool classOk;
        for (uint i = 0; i < _requirement.classRequirement.length; i++) {
            if(_summoner.class == _requirement.classRequirement[i]) classOk = true;
        }
        if(!classOk) revert("class");
        return _summoner.level >= _requirement.level &&
        _summoner.state != GameEntities.SummonerState.IN_FIGHT;
        //        checkStats(_summonerStats, _requirement);
    }

    function checkStats(GameObjects.Stats memory _stats, GameObjects.ItemRequirement memory _req) internal view returns (bool) {
        if (
            _req.statRequirement.STR > _stats.STR ||
            _req.statRequirement.DEX > _stats.DEX ||
            _req.statRequirement.AGI > _stats.AGI ||
            _req.statRequirement.INT > _stats.INT ||
            _req.statRequirement.VIT > _stats.VIT ||
            _req.statRequirement.LUCK > _stats.LUCK
        ) return false;
        return true;
    }

    function equipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        EquippedSeals[summoner] = id;
        _escrowNFT(contractAddress(INavigator.CONTRACT.CRYPTO_SEAL), id, msg.sender);
    }

    function equip(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        // @warning check if owner
        require(IEquipableItems(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS)).ownerOf(id) == msg.sender, "not owned");
        // call NFT contract to get items tier and type.
        (GameObjects.ItemType _type, uint _itemId, uint256 tier, uint prefix, uint prefixTier, uint suffix, uint suffixTier, GameObjects.Element element) = IEquipableItems(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS)).item(id);

        if (_type == GameObjects.ItemType.HELMET) {
            GameObjects.Helmet memory _helmet = IAllCodexViews(contractAddress(INavigator.CONTRACT.HELMETS_CODEX)).helmetCore(_itemId, tier);
            if (!canEquip(summoner, _helmet.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedHelmets[summoner].tokenId = id;
            EquippedHelmets[summoner].prefixId = prefix;
            EquippedHelmets[summoner].suffixId = suffix;
            EquippedHelmets[summoner].prefixTier = prefixTier;
            EquippedHelmets[summoner].suffixTier = suffixTier;
            EquippedHelmets[summoner].itemTier = tier;
            EquippedHelmets[summoner].element = element;
        } else if (_type == GameObjects.ItemType.ARMOR) {
            GameObjects.Armor memory _armor = IAllCodexViews(contractAddress(INavigator.CONTRACT.BODY_ARMORS_CODEX)).armorCore(_itemId, tier);
            if (!canEquip(summoner, _armor.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedArmors[summoner].tokenId = id;
            EquippedArmors[summoner].prefixId = prefix;
            EquippedArmors[summoner].suffixId = suffix;
            EquippedArmors[summoner].prefixTier = prefixTier;
            EquippedArmors[summoner].suffixTier = suffixTier;
            EquippedArmors[summoner].itemId = _itemId;
            EquippedArmors[summoner].itemTier = tier;
            EquippedArmors[summoner].element = element;

        } else if (_type == GameObjects.ItemType.WEAPON) {
            GameObjects.Weapon memory _weapon = IAllCodexViews(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)).weaponCore(_itemId, tier);
            if (!canEquip(summoner, _weapon.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedWeapons[summoner].tokenId = id;
            EquippedWeapons[summoner].prefixId = prefix;
            EquippedWeapons[summoner].suffixId = suffix;
            EquippedWeapons[summoner].prefixTier = prefixTier;
            EquippedWeapons[summoner].suffixTier = suffixTier;
            EquippedWeapons[summoner].itemId = _itemId;
            EquippedWeapons[summoner].itemTier = tier;
            EquippedWeapons[summoner].element = element;

            DamageTypesOfSummoners[summoner] = _weapon.damageType;

        } else if (_type == GameObjects.ItemType.OFFHAND) {
            GameObjects.Weapon memory _offHand = IAllCodexViews(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)).weaponCore(_itemId, tier);
            if (!canEquip(summoner, _offHand.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedOffHands[summoner].tokenId = id;
            EquippedOffHands[summoner].prefixId = prefix;
            EquippedOffHands[summoner].suffixId = suffix;
            EquippedOffHands[summoner].prefixTier = prefixTier;
            EquippedOffHands[summoner].suffixTier = suffixTier;
            EquippedOffHands[summoner].itemId = _itemId;
            EquippedOffHands[summoner].itemTier = tier;
            EquippedOffHands[summoner].element = element;

        } else if (_type == GameObjects.ItemType.BOOTS) {
            GameObjects.Boots memory _boots = IAllCodexViews(contractAddress(INavigator.CONTRACT.BOOTS_CODEX)).bootsCore(_itemId, tier);
            if (!canEquip(summoner, _boots.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedBoots[summoner].tokenId = id;
            EquippedBoots[summoner].prefixId = prefix;
            EquippedBoots[summoner].suffixId = suffix;
            EquippedBoots[summoner].prefixTier = prefixTier;
            EquippedBoots[summoner].suffixTier = suffixTier;
            EquippedBoots[summoner].itemId = _itemId;
            EquippedBoots[summoner].itemTier = tier;
            EquippedBoots[summoner].element = element;

        } else if (_type == GameObjects.ItemType.AMULET) {
            GameObjects.Amulet memory _amulet = IAllCodexViews(contractAddress(INavigator.CONTRACT.AMULETS_CODEX)).amuletCore(_itemId, tier);
            if (!canEquip(summoner, _amulet.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedAmulet[summoner].tokenId = id;
            EquippedAmulet[summoner].prefixId = prefix;
            EquippedAmulet[summoner].suffixId = suffix;
            EquippedAmulet[summoner].prefixTier = prefixTier;
            EquippedAmulet[summoner].suffixTier = suffixTier;
            EquippedAmulet[summoner].itemId = _itemId;
            EquippedAmulet[summoner].itemTier = tier;
            EquippedAmulet[summoner].element = element;

        } else if (_type == GameObjects.ItemType.RING) {
            GameObjects.Ring memory _ring = IAllCodexViews(contractAddress(INavigator.CONTRACT.RINGS_CODEX)).ringCore(_itemId, tier);
            if (!canEquip(summoner, _ring.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedRing[summoner].tokenId = id;
            EquippedRing[summoner].prefixId = prefix;
            EquippedRing[summoner].suffixId = suffix;
            EquippedRing[summoner].prefixTier = prefixTier;
            EquippedRing[summoner].suffixTier = suffixTier;
            EquippedRing[summoner].itemId = _itemId;
            EquippedRing[summoner].itemTier = tier;
            EquippedRing[summoner].element = element;
        }
        else if (_type == GameObjects.ItemType.EARRING) {
            GameObjects.Earring memory _earring = IAllCodexViews(contractAddress(INavigator.CONTRACT.EARRINGS_CODEX)).earringCore(_itemId, tier);
            if (!canEquip(summoner, _earring.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedEarring[summoner].tokenId = id;
            EquippedEarring[summoner].prefixId = prefix;
            EquippedEarring[summoner].suffixId = suffix;
            EquippedEarring[summoner].prefixTier = prefixTier;
            EquippedEarring[summoner].suffixTier = suffixTier;
            EquippedEarring[summoner].itemId = _itemId;
            EquippedEarring[summoner].itemTier = tier;
            EquippedEarring[summoner].element = element;
        } else if (_type == GameObjects.ItemType.BELT) {
            GameObjects.Belt memory _belt = IAllCodexViews(contractAddress(INavigator.CONTRACT.BELTS_CODEX)).beltCore(_itemId, tier);
            if (!canEquip(summoner, _belt.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedBelt[summoner].tokenId = id;
            EquippedBelt[summoner].prefixId = prefix;
            EquippedBelt[summoner].suffixId = suffix;
            EquippedBelt[summoner].prefixTier = prefixTier;
            EquippedBelt[summoner].suffixTier = suffixTier;
            EquippedBelt[summoner].itemId = _itemId;
            EquippedBelt[summoner].itemTier = tier;
            EquippedBelt[summoner].element = element;

        } else {
            revert InvalidItem("Not Implemented");
        }
        _applyCalculation(summoner);
        _escrowNFT(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS), id, msg.sender);
    }



    // @notice equip pet
    function summonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
        _applyCalculation(summoner);
    }


    function unequipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        delete EquippedSeals[summoner];
        _applyCalculation(summoner);
    }

    function unequip(uint summoner, GameObjects.ItemType _type, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        if (_type == GameObjects.ItemType.WEAPON) {
            delete EquippedWeapons[summoner];
            DamageTypesOfSummoners[summoner] = GameObjects.Element.PHYSICAL;
        } else if (_type == GameObjects.ItemType.OFFHAND) {
            delete EquippedOffHands[summoner];
        } else if (_type == GameObjects.ItemType.HELMET) {
            delete EquippedHelmets[summoner];
        } else if (_type == GameObjects.ItemType.ARMOR) {
            delete EquippedArmors[summoner];
        } else if (_type == GameObjects.ItemType.BOOTS) {
            delete EquippedBoots[summoner];
        } else if (_type == GameObjects.ItemType.AMULET) {
            delete EquippedAmulet[summoner];
        } else if (_type == GameObjects.ItemType.RING) {
            delete EquippedRing[summoner];
        } else if (_type == GameObjects.ItemType.EARRING) {
            delete EquippedEarring[summoner];
        } else if (_type == GameObjects.ItemType.BELT) {
            delete EquippedBelt[summoner];
        } else {
            revert InvalidItem("Not Implemented");
        }
        _applyCalculation(summoner);
        _returnNFT(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS), msg.sender, id);
    }


    // @notice equip pet
    function unsummonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
    }

    function getEquippedItemTokenIds(uint summoner) public view returns (EquippedGear memory, uint[] memory) {
        uint _weapon = EquippedWeapons[summoner].tokenId;
        uint _offHand = EquippedOffHands[summoner].tokenId;
        uint _helmet = EquippedHelmets[summoner].tokenId;
        uint _armor = EquippedArmors[summoner].tokenId;
        uint _boots = EquippedBoots[summoner].tokenId;
        uint _amulet = EquippedAmulet[summoner].tokenId;
        uint _ring = EquippedRing[summoner].tokenId;
        uint _earring = EquippedEarring[summoner].tokenId;
        uint _belt = EquippedBelt[summoner].tokenId;
        uint _seal = EquippedSeals[summoner];
        GameObjects.SummonedCompanion memory _companion = SummonedCompanions[summoner];
        uint[] memory result = new uint[](10);
        result[0] = _weapon;
        result[1] = _offHand;
        result[2] = _helmet;
        result[3] = _armor;
        result[4] = _boots;
        result[5] = _amulet;
        result[6] = _ring;
        result[7] = _earring;
        result[8] = _belt;
        result[9] = _seal;
        return (EquippedGear(_weapon, _offHand, _helmet, _armor, _boots, _amulet, _ring, _earring, _belt, _seal, _companion), result);
    }

    function getSummonerBattleStats(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {

        (
        GameObjects.Stats memory statsFromWeapon,
        GameObjects.GeneratedStats memory genFromWeapon,
        GameObjects.ElementalStats memory eleFromWeapon
        ) = getBattleStatsFromWeapons(summoner);
        (
        GameObjects.Stats memory statsFromArmor,
        GameObjects.GeneratedStats memory genFromArmor,
        GameObjects.ElementalStats memory eleFromArmor
        ) = getBattleStatsFromArmors(summoner);
        (
        GameObjects.Stats memory statsFromJewelry,
        GameObjects.GeneratedStats memory genFromJewelry,
        GameObjects.ElementalStats memory eleFromJewelry
        ) = getBattleStatsFromJewelries(summoner);

        _stats = EquipableUtils.sumStats(_stats, statsFromWeapon);
        _stats = EquipableUtils.sumStats(_stats, statsFromArmor);
        _stats = EquipableUtils.sumStats(_stats, statsFromJewelry);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, genFromWeapon);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, genFromArmor);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, genFromJewelry);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, eleFromWeapon);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, eleFromArmor);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, eleFromJewelry);
    }

    function getBattleStatsFromArmors(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {
        GameObjects.Helmet memory _helmet;
        if (EquippedHelmets[summoner].itemId != 0) {
            _helmet = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.HELMETS_CODEX)
            ).helmet(EquippedHelmets[summoner]);
            _stats = EquipableUtils.sumStats(_stats, _helmet.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _helmet.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _helmet.elementalStats);
        }

        GameObjects.Armor memory _armor;
        if (EquippedArmors[summoner].itemId != 0) {
            _armor = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.BODY_ARMORS_CODEX)
            ).armor(EquippedArmors[summoner]);
            _stats = EquipableUtils.sumStats(_stats, _armor.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _armor.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _armor.elementalStats);
        }

        GameObjects.Boots memory _boots;
        if (EquippedBoots[summoner].itemId != 0) {
            _boots = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.BOOTS_CODEX)
            ).boots(EquippedBoots[summoner]);
            _stats = EquipableUtils.sumStats(_stats, _boots.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _boots.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _boots.elementalStats);
        }
    }

    function getBattleStatsFromJewelries(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {
        GameObjects.Amulet memory _amulet;
        if (EquippedAmulet[summoner].itemId != 0) {
            _amulet = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.AMULETS_CODEX)
            ).amulet(EquippedAmulet[summoner]);
            _stats = EquipableUtils.sumStats(_stats, _amulet.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _amulet.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _amulet.elementalStats);
        }
        GameObjects.Ring memory _ring;
        if (EquippedRing[summoner].itemId != 0) {
            _ring = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.RINGS_CODEX)
            ).ring(EquippedRing[summoner]);
            _stats = EquipableUtils.sumStats(_stats, _ring.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _ring.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _ring.elementalStats);
        }

        GameObjects.Earring memory _earring;
        if (EquippedEarring[summoner].itemId != 0) {
            _earring = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.EARRINGS_CODEX)
            ).earring(EquippedEarring[summoner]);
            _stats = EquipableUtils.sumStats(_stats, _earring.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _earring.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _earring.elementalStats);
        }
        GameObjects.Belt memory _belt;
        if (EquippedBelt[summoner].itemId != 0) {
            _belt = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.BELTS_CODEX)
            ).belt(EquippedBelt[summoner]);
            _stats = EquipableUtils.sumStats(_stats, _belt.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _belt.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _belt.elementalStats);
        }
    }

    function getBattleStatsFromWeapons(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {
        GameObjects.Weapon memory _weapon;
        if (EquippedWeapons[summoner].itemId != 0) {
            _weapon = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)
            ).weapon(EquippedWeapons[summoner]);
            _stats = EquipableUtils.sumStats(_stats, _weapon.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _weapon.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _weapon.elementalStats);
        }

        GameObjects.Weapon memory _offHand;
        if (EquippedOffHands[summoner].itemId != 0) {
            _offHand = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)
            ).weapon(EquippedOffHands[summoner]);
            _stats = EquipableUtils.sumStats(_stats, _offHand.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _offHand.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _offHand.elementalStats);
        }
        // TODO, add seal stat calculation

    }


    function _applyCalculation(uint summoner) internal returns (bool) {
        (GameObjects.Stats memory _stats,
        GameObjects.GeneratedStats memory _gen_stats,
        GameObjects.ElementalStats memory _ele_stats) = getSummonerBattleStats(summoner);
        PreCalculatedEquipmentStats[summoner] = _stats;
        PreCalculatedGeneratedEquipmentStats[summoner] = _gen_stats;
        PreCalculatedEquipmentElementalStats[summoner] = _ele_stats;
        return true;
    }


    // views

    function getPreCalculatedStats(uint summoner) external view returns (GameObjects.Stats memory){
        return PreCalculatedEquipmentStats[summoner];
    }

    function getPreCalculatedGeneratedStats(uint summoner) external view returns (GameObjects.GeneratedStats memory){
        return PreCalculatedGeneratedEquipmentStats[summoner];
    }

    function _escrowNFT(address _erc721, uint _token, address from) internal {
        IERC721(_erc721).transferFrom(from, address(this), _token);
    }

    function _returnNFT(address _erc721, address to, uint _token) internal {
        IERC721(_erc721).transferFrom(address(this), to, _token);
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata _data
    ) external pure returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
