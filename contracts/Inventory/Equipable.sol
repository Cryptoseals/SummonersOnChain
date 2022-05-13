import "../Interfaces/Attributes/IAttributes.sol";
import "../Interfaces/Codex/IAllCodexViews.sol";
import "../Interfaces/NonFungibles/EquipableItems/IEquipableItems.sol";
import "../Core/Navigator/InitNavigator.sol";
import "./EquipableUtils.sol";
import "../Interfaces/NonFungibles/ElixirsAndArtifacts/IElixirsAndArtifacts.sol";



pragma solidity ^0.8.0;

contract Equipable is Initializable, InitNavigator {

    // held nfts

    struct ConsumedElixir {
        uint tokenId;
        uint elixirId;
        uint tier;
        uint expirationTime;
    }

    struct EquippedArtifact {
        uint tokenId;
        uint artifactId;
        uint tier;
    }

    mapping(address => mapping(uint => bool)) public Escrow;




    // summoner -> item type / slot -> item struct
    mapping(uint => mapping(GameObjects.ItemType => GameObjects.EquippedItemStruct)) public EquippedGears;

    mapping(uint => uint) public EquippedSeals;
    // summoner -> slot -> precalculated
    mapping(uint => mapping(GameObjects.ItemType => GameObjects.Stats)) public PreCalculatedEquipmentStats;
    mapping(uint => mapping(GameObjects.ItemType => GameObjects.GeneratedStats)) public PreCalculatedGeneratedEquipmentStats;
    mapping(uint => mapping(GameObjects.ItemType => GameObjects.ElementalStats)) public PreCalculatedEquipmentElementalStats;
    mapping(uint => GameObjects.Element) public DamageTypesOfSummoners;
    mapping(uint => GameObjects.SummonedCompanion) public SummonedCompanions;

    // summoner elixir slots. summoner id -> equipped
    mapping(uint => mapping(uint => ConsumedElixir)) public ElixirSlots;
    mapping(uint => mapping(uint => EquippedArtifact)) public ArtifactSlots;

    uint public constant ELIXIR_SLOTS = 3;
    uint public constant ARTIFACT_SLOTS = 3;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function canEquip(uint summoner, GameObjects.ItemRequirement memory _requirement) internal view returns (bool) {
        //        IAttributes attributesContract = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES));
        GameEntities.SummonerData memory _summoner = ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).summonerData(summoner);
        //        GameObjects.Stats memory _summonerStats = attributesContract.stats(summoner);
        bool classOk;
        if (_requirement.classRequirement.length > 0) {
            for (uint i = 0; i < _requirement.classRequirement.length; i++) {
                if (_summoner.class == _requirement.classRequirement[i]) classOk = true;
            }
        } else {
            classOk = true;
        }
        if (!classOk) revert("class");
        return _summoner.level >= _requirement.level &&
        _summoner.state != GameEntities.SummonerState.IN_FIGHT;
        //        checkStats(_summonerStats, _requirement);
    }

    function equipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        EquippedSeals[summoner] = id;
        _escrowNFT(contractAddress(INavigator.CONTRACT.CRYPTO_SEAL), id, msg.sender);
    }

    function equip(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        address equips = contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS);
        // @warning check if owner
        require(IEquipableItems(equips).ownerOf(id) == msg.sender, "not owned");
        // call NFT contract to get items tier and type.
        uint oldTokenToRefund = _handleEquip(summoner, id);
        _escrowNFT(equips, id, msg.sender);
        if (oldTokenToRefund > 0) {
            _returnNFT(equips, msg.sender, id);
        }
    }

    function _handleEquip(uint summoner, uint id) internal returns (uint oldTokenToRefund) {
        (GameObjects.ItemType _type, uint _itemId, uint256 tier, uint prefix, uint prefixTier, uint suffix, uint suffixTier, GameObjects.Element element) = IEquipableItems(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS)).item(id);
        if (_type == GameObjects.ItemType.HELMET) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.HELMET].tokenId;
            GameObjects.Helmet memory _helmet = IAllCodexViews(contractAddress(INavigator.CONTRACT.HELMETS_CODEX)).helmetCore(_itemId, tier);
            if (!canEquip(summoner, _helmet.requirement)) revert CannotEquip("You are too weak to equip this.");
            _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
        } else if (_type == GameObjects.ItemType.ARMOR) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.ARMOR].tokenId;
            GameObjects.Armor memory _armor = IAllCodexViews(contractAddress(INavigator.CONTRACT.BODY_ARMORS_CODEX)).armorCore(_itemId, tier);
            if (!canEquip(summoner, _armor.requirement)) revert CannotEquip("You are too weak to equip this.");
            _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
        } else if (_type == GameObjects.ItemType.WEAPON) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.WEAPON].tokenId;
            GameObjects.Weapon memory _weapon = IAllCodexViews(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)).weaponCore(_itemId, tier);
            if (!canEquip(summoner, _weapon.requirement)) revert CannotEquip("You are too weak to equip this.");
            DamageTypesOfSummoners[summoner] = _weapon.damageType;
            _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
        } else if (_type == GameObjects.ItemType.OFFHAND) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.OFFHAND].tokenId;
            GameObjects.Weapon memory _offHand = IAllCodexViews(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)).weaponCore(_itemId, tier);
            if (!canEquip(summoner, _offHand.requirement)) revert CannotEquip("You are too weak to equip this.");
            _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
        } else if (_type == GameObjects.ItemType.BOOTS) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.BOOTS].tokenId;
            GameObjects.Boots memory _boots = IAllCodexViews(contractAddress(INavigator.CONTRACT.BOOTS_CODEX)).bootsCore(_itemId, tier);
            if (!canEquip(summoner, _boots.requirement)) revert CannotEquip("You are too weak to equip this.");
            _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
        } else if (_type == GameObjects.ItemType.AMULET) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.AMULET].tokenId;
            GameObjects.Amulet memory _amulet = IAllCodexViews(contractAddress(INavigator.CONTRACT.AMULETS_CODEX)).amuletCore(_itemId, tier);
            if (!canEquip(summoner, _amulet.requirement)) revert CannotEquip("You are too weak to equip this.");
            _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
        } else if (_type == GameObjects.ItemType.RING) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.RING].tokenId;
            GameObjects.Ring memory _ring = IAllCodexViews(contractAddress(INavigator.CONTRACT.RINGS_CODEX)).ringCore(_itemId, tier);
            if (!canEquip(summoner, _ring.requirement)) revert CannotEquip("You are too weak to equip this.");
            _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
        } else if (_type == GameObjects.ItemType.EARRING) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.EARRING].tokenId;
            GameObjects.Earring memory _earring = IAllCodexViews(contractAddress(INavigator.CONTRACT.EARRINGS_CODEX)).earringsCore(_itemId, tier);
            if (!canEquip(summoner, _earring.requirement)) revert CannotEquip("You are too weak to equip this.");
            _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
        } else if (_type == GameObjects.ItemType.BELT) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.BELT].tokenId;
            GameObjects.Belt memory _belt = IAllCodexViews(contractAddress(INavigator.CONTRACT.BELTS_CODEX)).beltCore(_itemId, tier);
            if (!canEquip(summoner, _belt.requirement)) revert CannotEquip("You are too weak to equip this.");
            _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
        } else {
            revert InvalidItem("Not Implemented");
        }

    }

    function _equipGear(uint summoner, uint id, GameObjects.ItemType _type, uint _itemId, uint256 tier, uint prefix, uint prefixTier, uint suffix, uint suffixTier, GameObjects.Element element) internal {
        EquippedGears[summoner][_type] = GameObjects.EquippedItemStruct({
        tokenId : id,
        prefixId : prefix,
        suffixId : suffix,
        prefixTier : prefixTier,
        suffixTier : suffixTier,
        itemId : _itemId,
        itemTier : tier,
        element : element});
//        _applyCalculation(summoner, _type);
    }

    function consumeElixir(uint summoner, uint slot, uint id) external senderIsSummonerOwner(summoner) notInFight(summoner) {
        require(slot > 0 && slot <= ELIXIR_SLOTS, "");
        // check ownership, remove previous effects and apply new
        require(
            IERC721(contractAddress(INavigator.CONTRACT.ELIXIRS)).ownerOf(id) == msg.sender,
            "!"
        );
        IElixirsAndArtifacts elixirContract = IElixirsAndArtifacts(contractAddress(INavigator.CONTRACT.ELIXIRS));
        uint elixirId = elixirContract.itemType(id);
        uint tier = elixirContract.tier(id);
        GameObjects.Elixir memory elixir = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX)).elixir(elixirId, tier);
        require(elixirContract.burnItem(id), "?!");
        ElixirSlots[summoner][slot] = ConsumedElixir({
        elixirId : elixirId,
        tier : tier,
        tokenId : id,
        expirationTime : block.timestamp + elixir.expirationTime
        });
    }

    function equipArtifact(uint summoner, uint slot, uint id) external senderIsSummonerOwner(summoner) notInFight(summoner) {
        require(slot > 0 && slot <= ARTIFACT_SLOTS, "");
        // check ownership, remove previous effects and apply new
        require(
            IERC721(contractAddress(INavigator.CONTRACT.ARTIFACTS)).ownerOf(id) == msg.sender,
            "!"
        );
        IElixirsAndArtifacts artifactContract = IElixirsAndArtifacts(contractAddress(INavigator.CONTRACT.ARTIFACTS));
        uint artifactId = artifactContract.itemType(id);
        uint tier = artifactContract.tier(id);
        require(artifactContract.burnItem(id), "?!");
        ArtifactSlots[summoner][slot] = EquippedArtifact({
        artifactId : artifactId,
        tier : tier,
        tokenId : id
        });
    }

    function activeElixirs(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats){
        for (uint i = 1; i <= ELIXIR_SLOTS; i++) {
            ConsumedElixir memory _consumed = ElixirSlots[summoner][i];
            if (_consumed.expirationTime < block.timestamp) continue;

            GameObjects.Elixir memory elixir = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX)).elixir(_consumed.elixirId, _consumed.tier);
            _stats = EquipableUtils.sumStats(_stats, elixir.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, elixir.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, elixir.elementalStats);
        }
    }

    function activeArtifacts(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats){
        for (uint i = 1; i <= ARTIFACT_SLOTS; i++) {
            EquippedArtifact memory _consumed = ArtifactSlots[summoner][i];
            GameObjects.Artifact memory artifact = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX)).artifact(_consumed.artifactId, _consumed.tier);
            _stats = EquipableUtils.sumStats(_stats, artifact.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, artifact.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, artifact.elementalStats);
        }
    }

    function activeEffects(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats){
        (GameObjects.Stats memory _stats1, GameObjects.GeneratedStats memory _gen_stats1, GameObjects.ElementalStats memory _ele_stats1) = activeElixirs(summoner);
        (GameObjects.Stats memory _stats2, GameObjects.GeneratedStats memory _gen_stats2, GameObjects.ElementalStats memory _ele_stats2) = activeElixirs(summoner);
        _stats = EquipableUtils.sumStats(_stats1, _stats2);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats1, _gen_stats2);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats1, _ele_stats2);
    }

    // @notice equip pet
    function summonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
        _escrowNFT(_contract, id, msg.sender);
//        _applyCalculation(summoner, GameObjects.ItemType.PET);
    }


    function unequipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        delete EquippedSeals[summoner];
//        _applyCalculation(summoner, GameObjects.ItemType.SEAL);
    }

    function unequip(uint summoner, GameObjects.ItemType _type, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        if (_type == GameObjects.ItemType.WEAPON) {
            delete EquippedGears[summoner][GameObjects.ItemType.WEAPON];
            DamageTypesOfSummoners[summoner] = GameObjects.Element.PHYSICAL;
        } else if (_type == GameObjects.ItemType.OFFHAND) {
            delete EquippedGears[summoner][GameObjects.ItemType.OFFHAND];
        } else if (_type == GameObjects.ItemType.HELMET) {
            delete EquippedGears[summoner][GameObjects.ItemType.HELMET];
        } else if (_type == GameObjects.ItemType.ARMOR) {
            delete EquippedGears[summoner][GameObjects.ItemType.ARMOR];
        } else if (_type == GameObjects.ItemType.BOOTS) {
            delete EquippedGears[summoner][GameObjects.ItemType.BOOTS];
        } else if (_type == GameObjects.ItemType.AMULET) {
            delete EquippedGears[summoner][GameObjects.ItemType.AMULET];
        } else if (_type == GameObjects.ItemType.RING) {
            delete EquippedGears[summoner][GameObjects.ItemType.RING];
        } else if (_type == GameObjects.ItemType.EARRING) {
            delete EquippedGears[summoner][GameObjects.ItemType.EARRING];
        } else if (_type == GameObjects.ItemType.BELT) {
            delete EquippedGears[summoner][GameObjects.ItemType.BELT];
        } else {
            revert InvalidItem("Not Implemented");
        }
//        _applyCalculation(summoner, _type);
        _returnNFT(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS), msg.sender, id);
    }


    // @notice equip pet
    function unsummonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
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

        _stats = EquipableUtils.sumStats(statsFromArmor, statsFromWeapon);
        _stats = EquipableUtils.sumStats(_stats, statsFromJewelry);
        _gen_stats = EquipableUtils.sumGeneratedStats(genFromArmor, genFromWeapon);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, genFromJewelry);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(eleFromArmor, eleFromWeapon);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, eleFromJewelry);
    }

    function getBattleStatsFromArmors(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {
        GameObjects.Helmet memory _helmet;
        if (EquippedGears[summoner][GameObjects.ItemType.HELMET].itemId != 0) {
            _helmet = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.HELMETS_CODEX)
            ).helmet(EquippedGears[summoner][GameObjects.ItemType.HELMET]);
            _stats = EquipableUtils.sumStats(_stats, _helmet.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _helmet.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _helmet.elementalStats);
        }

        GameObjects.Armor memory _armor;
        if (EquippedGears[summoner][GameObjects.ItemType.ARMOR].itemId != 0) {
            _armor = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.BODY_ARMORS_CODEX)
            ).armor(EquippedGears[summoner][GameObjects.ItemType.ARMOR]);
            _stats = EquipableUtils.sumStats(_stats, _armor.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _armor.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _armor.elementalStats);
        }

        GameObjects.Boots memory _boots;
        if (EquippedGears[summoner][GameObjects.ItemType.BOOTS].itemId != 0) {
            _boots = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.BOOTS_CODEX)
            ).boots(EquippedGears[summoner][GameObjects.ItemType.BOOTS]);
            _stats = EquipableUtils.sumStats(_stats, _boots.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _boots.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _boots.elementalStats);
        }
    }

    function getBattleStatsFromJewelries(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {
        GameObjects.Amulet memory _amulet;
        if (EquippedGears[summoner][GameObjects.ItemType.AMULET].itemId != 0) {
            _amulet = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.AMULETS_CODEX)
            ).amulet(EquippedGears[summoner][GameObjects.ItemType.AMULET]);
            _stats = EquipableUtils.sumStats(_stats, _amulet.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _amulet.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _amulet.elementalStats);
        }
        GameObjects.Ring memory _ring;
        if (EquippedGears[summoner][GameObjects.ItemType.RING].itemId != 0) {
            _ring = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.RINGS_CODEX)
            ).ring(EquippedGears[summoner][GameObjects.ItemType.RING]);
            _stats = EquipableUtils.sumStats(_stats, _ring.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _ring.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _ring.elementalStats);
        }

        GameObjects.Earring memory _earring;
        if (EquippedGears[summoner][GameObjects.ItemType.EARRING].itemId != 0) {
            _earring = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.EARRINGS_CODEX)
            ).earrings(EquippedGears[summoner][GameObjects.ItemType.EARRING]);
            _stats = EquipableUtils.sumStats(_stats, _earring.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _earring.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _earring.elementalStats);
        }
        GameObjects.Belt memory _belt;
        if (EquippedGears[summoner][GameObjects.ItemType.BELT].itemId != 0) {
            _belt = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.BELTS_CODEX)
            ).belt(EquippedGears[summoner][GameObjects.ItemType.BELT]);
            _stats = EquipableUtils.sumStats(_stats, _belt.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _belt.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _belt.elementalStats);
        }
    }

    function getBattleStatsFromWeapons(uint summoner) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {
        GameObjects.Weapon memory _weapon;
        if (EquippedGears[summoner][GameObjects.ItemType.WEAPON].itemId != 0) {
            _weapon = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)
            ).weapon(EquippedGears[summoner][GameObjects.ItemType.WEAPON]);
            _stats = EquipableUtils.sumStats(_stats, _weapon.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _weapon.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _weapon.elementalStats);
        }

        GameObjects.Weapon memory _offHand;
        if (EquippedGears[summoner][GameObjects.ItemType.OFFHAND].itemId != 0) {
            _offHand = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)
            ).weapon(EquippedGears[summoner][GameObjects.ItemType.OFFHAND]);
            _stats = EquipableUtils.sumStats(_stats, _offHand.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _offHand.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _offHand.elementalStats);
        }
        // TODO, add seal stat calculation
    }


    function _applyCalculation(uint summoner, GameObjects.ItemType _type) internal returns (bool) {

        if (_type == GameObjects.ItemType.WEAPON ||_type == GameObjects.ItemType.OFFHAND) {
            (GameObjects.Stats memory _stats,
            GameObjects.GeneratedStats memory _gen_stats,
            GameObjects.ElementalStats memory _ele_stats) = getBattleStatsFromWeapons(summoner);
            saveStats(summoner, _type, _stats, _gen_stats, _ele_stats);
        } else if (_type == GameObjects.ItemType.ARMOR || _type == GameObjects.ItemType.HELMET || _type == GameObjects.ItemType.BOOTS) {
            (GameObjects.Stats memory _stats,
            GameObjects.GeneratedStats memory _gen_stats,
            GameObjects.ElementalStats memory _ele_stats) = getBattleStatsFromArmors(summoner);
            saveStats(summoner, GameObjects.ItemType.ARMOR, _stats, _gen_stats, _ele_stats);
        } else if (
            _type == GameObjects.ItemType.AMULET ||
            _type == GameObjects.ItemType.EARRING ||
            _type == GameObjects.ItemType.RING ||
            _type == GameObjects.ItemType.BELT) {
            (GameObjects.Stats memory _stats,
            GameObjects.GeneratedStats memory _gen_stats,
            GameObjects.ElementalStats memory _ele_stats) = getBattleStatsFromJewelries(summoner);
            saveStats(summoner, GameObjects.ItemType.GENERAL_ACCESSORY, _stats, _gen_stats, _ele_stats);
        } else {
            revert("?!");
        }


        return true;
    }

    function saveStats(uint summoner, GameObjects.ItemType _type, GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) internal {
        PreCalculatedEquipmentStats[summoner][_type] = _stats;
        PreCalculatedGeneratedEquipmentStats[summoner][_type] = _gen_stats;
        PreCalculatedEquipmentElementalStats[summoner][_type] = _ele_stats;
    }


    function equipped(uint summoner, GameObjects.ItemType slot) external view returns (GameObjects.EquippedItemStruct memory){
        return EquippedGears[summoner][slot];
    }

    function getPreCalculated(uint summoner) external view returns (GameObjects.Stats memory, GameObjects.GeneratedStats memory, GameObjects.ElementalStats memory){
        return (precalculatedStats(summoner),
        precalculatedGenStats(summoner),
        precalculatedEleStats(summoner));
    }

    function precalculatedStats(uint summoner) internal view returns (
        GameObjects.Stats memory _stats
    ) {
        _stats = EquipableUtils.sumStats(
            PreCalculatedEquipmentStats[summoner][GameObjects.ItemType.GENERAL_ACCESSORY],
            PreCalculatedEquipmentStats[summoner][GameObjects.ItemType.ARMOR]
        );
        _stats = EquipableUtils.sumStats(
            _stats,
            PreCalculatedEquipmentStats[summoner][GameObjects.ItemType.WEAPON]
        );
    }

    function precalculatedGenStats(uint summoner) internal view returns (
        GameObjects.GeneratedStats memory _gen_stats
    ) {
        _gen_stats = EquipableUtils.sumGeneratedStats(
            PreCalculatedGeneratedEquipmentStats[summoner][GameObjects.ItemType.GENERAL_ACCESSORY],
            PreCalculatedGeneratedEquipmentStats[summoner][GameObjects.ItemType.ARMOR]
        );
        _gen_stats = EquipableUtils.sumGeneratedStats(
            _gen_stats,
            PreCalculatedGeneratedEquipmentStats[summoner][GameObjects.ItemType.WEAPON]
        );
    }

    function precalculatedEleStats(uint summoner) internal view returns (
        GameObjects.ElementalStats memory _ele_stats
    ) {
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(
            PreCalculatedEquipmentElementalStats[summoner][GameObjects.ItemType.GENERAL_ACCESSORY],
            PreCalculatedEquipmentElementalStats[summoner][GameObjects.ItemType.ARMOR]
        );
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(
            _ele_stats,
            PreCalculatedEquipmentElementalStats[summoner][GameObjects.ItemType.WEAPON]
        );
    }


    function getPreCalculatedStats(uint summoner) external view returns (GameObjects.Stats memory){
        return precalculatedStats(summoner);
    }

    function getPreCalculatedGeneratedStats(uint summoner) external view returns (GameObjects.GeneratedStats memory){
        return precalculatedGenStats(summoner);
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
