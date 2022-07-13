import {IAttributes} from "../Interfaces/Attributes/IAttributes.sol";
import {IAllCodexViews} from "../Interfaces/Codex/IAllCodexViews.sol";
import {IEquipableItems} from "../Interfaces/NonFungibles/EquipableItems/IEquipableItems.sol";
import {InitNavigator, INavigator, Initializable, GameEntities, ISummoners} from "../Core/Navigator/InitNavigator.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments, GameObjects_Elixir} from "../Interfaces/GameObjects/IGameObjects.sol";
import {IElixirsAndArtifacts} from "../Interfaces/NonFungibles/ElixirsAndArtifacts/IElixirsAndArtifacts.sol";
import {EquipableUtils} from "./EquipableUtils.sol";


pragma solidity ^0.8.0;

contract Equipable is Initializable, InitNavigator {

    // held nfts

    struct ConsumedElixir {
        uint tokenId;
        uint elixirId;
        uint tier;
        uint turnLeft;
    }

    struct EquippedArtifact {
        uint tokenId;
        uint artifactId;
        uint tier;
    }

    // summoner -> item type / slot -> item struct
    mapping(uint => mapping(GameObjects.ItemType => GameObjects_Equipments.EquippedItemStruct)) public EquippedGears;

    mapping(uint => uint) public EquippedSeals;
    // summoner -> slot -> precalculated
    mapping(uint => mapping(GameObjects.ItemType => GameObjects_Stats.Stats)) public PreCalculatedEquipmentStats;
    mapping(uint => mapping(GameObjects.ItemType => GameObjects_Stats.GeneratedStats)) public PreCalculatedGeneratedEquipmentStats;
    mapping(uint => mapping(GameObjects.ItemType => GameObjects_Stats.ElementalStats)) public PreCalculatedEquipmentElementalStats;
    mapping(uint => GameObjects.Element) public DamageTypesOfSummoners;
    mapping(uint => GameObjects_Equipments.SummonedCompanion) public SummonedCompanions;

    // summoner elixir slots. summoner id -> equipped
    mapping(uint => mapping(uint => ConsumedElixir)) public ElixirSlots;
    mapping(uint => mapping(uint => EquippedArtifact)) public ArtifactSlots;

    uint public constant ELIXIR_SLOTS = 3;
    uint public constant ARTIFACT_SLOTS = 3;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function canEquip(uint summoner, GameObjects_Equipments.ItemRequirement memory _requirement) internal view returns (bool) {
        //        IAttributes attributesContract = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES));
        GameEntities.SummonerData memory _summoner = ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS)).summonerData(summoner);
        //        GameObjects_Stats.Stats memory _summonerStats = attributesContract.stats(summoner);
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

    function weak() internal pure {
        revert("You are too weak to equip this.");
    }

    function _handleEquip(uint summoner, uint id) internal returns (uint oldTokenToRefund) {
        (GameObjects.ItemType _type, uint _itemId, uint256 tier, uint prefix, uint prefixTier, uint suffix, uint suffixTier, GameObjects.Element element) = IEquipableItems(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS)).item(id);

        GameObjects_Equipments.EquipableItem memory _equipableItem;
        GameObjects_Equipments.Weapon memory _equipableW;

        if (_type == GameObjects.ItemType.HELMET) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.HELMET].tokenId;
            _equipableItem = IAllCodexViews(contractAddress(INavigator.CONTRACT.HELMETS_CODEX)).helmetCore(_itemId, tier);

        } else if (_type == GameObjects.ItemType.ARMOR) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.ARMOR].tokenId;
            GameObjects_Equipments.EquipableItem memory _armor = IAllCodexViews(contractAddress(INavigator.CONTRACT.BODY_ARMORS_CODEX)).armorCore(_itemId, tier);

        } else if (_type == GameObjects.ItemType.WEAPON) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.WEAPON].tokenId;
            _equipableW = IAllCodexViews(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)).weaponCore(_itemId, tier);
            DamageTypesOfSummoners[summoner] = element;
        } else if (_type == GameObjects.ItemType.OFFHAND) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.OFFHAND].tokenId;
            _equipableW = IAllCodexViews(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)).weaponCore(_itemId, tier);

        } else if (_type == GameObjects.ItemType.BOOTS) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.BOOTS].tokenId;
            _equipableItem = IAllCodexViews(contractAddress(INavigator.CONTRACT.BOOTS_CODEX)).bootsCore(_itemId, tier);

        } else if (_type == GameObjects.ItemType.AMULET) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.AMULET].tokenId;
            _equipableItem = IAllCodexViews(contractAddress(INavigator.CONTRACT.AMULETS_CODEX)).amuletCore(_itemId, tier);

        } else if (_type == GameObjects.ItemType.RING) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.RING].tokenId;
            _equipableItem = IAllCodexViews(contractAddress(INavigator.CONTRACT.RINGS_CODEX)).ringCore(_itemId, tier);

        } else if (_type == GameObjects.ItemType.EARRING) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.EARRING].tokenId;
            _equipableItem = IAllCodexViews(contractAddress(INavigator.CONTRACT.EARRINGS_CODEX)).earringsCore(_itemId, tier);

        } else if (_type == GameObjects.ItemType.BELT) {
            oldTokenToRefund = EquippedGears[summoner][GameObjects.ItemType.BELT].tokenId;
            _equipableItem = IAllCodexViews(contractAddress(INavigator.CONTRACT.BELTS_CODEX)).beltCore(_itemId, tier);

        } else {
            revert("Not Implemented");
        }

        if (_type == GameObjects.ItemType.WEAPON || _type == GameObjects.ItemType.OFFHAND) {
            if (!canEquip(summoner, _equipableW.requirement)) weak();
        } else {
            if (!canEquip(summoner, _equipableItem.requirement)) weak();
        }
        _equipGear(summoner, id, _type, _itemId, tier, prefix, prefixTier, suffix, suffixTier, element);
    }

    function _equipGear(uint summoner, uint id, GameObjects.ItemType _type, uint _itemId, uint256 tier, uint prefix, uint prefixTier, uint suffix, uint suffixTier, GameObjects.Element element) internal {
        EquippedGears[summoner][_type] = GameObjects_Equipments.EquippedItemStruct({
        tokenId : id,
        prefixId : prefix,
        suffixId : suffix,
        prefixTier : prefixTier,
        suffixTier : suffixTier,
        itemId : _itemId,
        itemTier : tier,
        element : element});
    }

    function consumeElixir(uint summoner, uint slot, uint id) external senderIsSummonerOwner(summoner) notInFight(summoner) {
        require(slot > 0 && slot <= ELIXIR_SLOTS, "");
        // check ownership, remove previous effects and apply new
        IElixirsAndArtifacts elixirContract = IElixirsAndArtifacts(contractAddress(INavigator.CONTRACT.ELIXIRS));
        require(
            elixirContract.ownerOf(id) == msg.sender,
            "!"
        );
        uint elixirId = elixirContract.itemType(id);
        for (uint i = 1; i <= ELIXIR_SLOTS;) {
            require(elixirId != ElixirSlots[summoner][i].tokenId, "same");
        unchecked {i++;}
        }
        uint tier = elixirContract.tier(id);
        GameObjects_Elixir.Elixir memory elixir = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX)).elixir(elixirId, tier);
        require(elixirContract.burnItem(id), "?!");
        ElixirSlots[summoner][slot] = ConsumedElixir({
        elixirId : elixirId,
        tier : tier,
        tokenId : id,
        turnLeft : elixir.turnDuration
        });
    }

    function reduceElixirDuration(uint summoner) external onlyGameContracts {
        for (uint i = 1; i <= ELIXIR_SLOTS;) {
            if (ElixirSlots[summoner][i].turnLeft > 0) ElixirSlots[summoner][i].turnLeft -= 1;
        unchecked {i++;}
        }
    }

    function equipArtifact(uint summoner, uint slot, uint id) external senderIsSummonerOwner(summoner) notInFight(summoner) {
        require(slot > 0 && slot <= ARTIFACT_SLOTS, "");
        // check ownership, remove previous effects and apply new
        require(
            IEquipableItems(contractAddress(INavigator.CONTRACT.ARTIFACTS)).ownerOf(id) == msg.sender,
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

    function activeElixirs(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats,
        GameObjects_Stats.GeneratedStats memory _gen_stats,
        GameObjects_Stats.ElementalStats memory _ele_stats){
        for (uint i = 1; i <= ELIXIR_SLOTS; i++) {
            ConsumedElixir memory _consumed = ElixirSlots[summoner][i];
            if (_consumed.turnLeft == 0) continue;

            GameObjects_Elixir.Elixir memory elixir = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX)).elixir(_consumed.elixirId, _consumed.tier);
            _stats = EquipableUtils.sumStats(_stats, elixir.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, elixir.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, elixir.elementalStats);
        }
    }

    function activeElixirBonusEffects(uint summoner) public view returns (GameObjects_Elixir.ElixirBonusEffect memory _fx){
        IAllCodexViews elixircodex = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX));
        for (uint i = 1; i <= ELIXIR_SLOTS; i++) {
            ConsumedElixir memory _consumed = ElixirSlots[summoner][i];
            if (_consumed.turnLeft == 0) continue;

            GameObjects_Elixir.Elixir memory elixir = elixircodex.elixir(_consumed.elixirId, _consumed.tier);
            _fx.BonusEXPPercentage += elixir.bonus.BonusEXPPercentage + (_consumed.tier * elixir.bonus.BonusEXPPercentagePerTier);
            _fx.BonusMaterialPercentage += elixir.bonus.BonusMaterialPercentage + (_consumed.tier * elixir.bonus.BonusMaterialPercentagePerTier);
            _fx.BonusEssencePercentage += elixir.bonus.BonusEssencePercentage + (_consumed.tier * elixir.bonus.BonusEssencePercentagePerTier);
            _fx.BonusGoldPercentage += elixir.bonus.BonusGoldPercentage + (_consumed.tier * elixir.bonus.BonusGoldPercentagePerTier);
        }
    }

    function activeArtifacts(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats){
        for (uint i = 1; i <= ARTIFACT_SLOTS; i++) {
            EquippedArtifact memory _consumed = ArtifactSlots[summoner][i];
            GameObjects_Equipments.Artifact memory artifact = IAllCodexViews(contractAddress(INavigator.CONTRACT.ELIXIRS_CODEX)).artifact(_consumed.artifactId, _consumed.tier);
            _stats = EquipableUtils.sumStats(_stats, artifact.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, artifact.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, artifact.elementalStats);
        }
    }

    function activeEffects(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats){
        (GameObjects_Stats.Stats memory _stats1, GameObjects_Stats.GeneratedStats memory _gen_stats1, GameObjects_Stats.ElementalStats memory _ele_stats1) = activeElixirs(summoner);
        (GameObjects_Stats.Stats memory _stats2, GameObjects_Stats.GeneratedStats memory _gen_stats2, GameObjects_Stats.ElementalStats memory _ele_stats2) = activeElixirs(summoner);
        _stats = EquipableUtils.sumStats(_stats1, _stats2);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats1, _gen_stats2);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats1, _ele_stats2);
    }

    // @notice equip pet
    function summonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
        _escrowNFT(_contract, id, msg.sender);
    }


    function unequipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        delete EquippedSeals[summoner];
    }

    function unequip(uint summoner, GameObjects.ItemType _type) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        uint id;
        if (_type == GameObjects.ItemType.WEAPON) {
            id = EquippedGears[summoner][GameObjects.ItemType.WEAPON].tokenId;
            delete EquippedGears[summoner][GameObjects.ItemType.WEAPON];
            DamageTypesOfSummoners[summoner] = GameObjects.Element.PHYSICAL;
        } else if (_type == GameObjects.ItemType.OFFHAND) {
            id = EquippedGears[summoner][GameObjects.ItemType.OFFHAND].tokenId;
            delete EquippedGears[summoner][GameObjects.ItemType.OFFHAND];
        } else if (_type == GameObjects.ItemType.HELMET) {
            id = EquippedGears[summoner][GameObjects.ItemType.HELMET].tokenId;
            delete EquippedGears[summoner][GameObjects.ItemType.HELMET];
        } else if (_type == GameObjects.ItemType.ARMOR) {
            id = EquippedGears[summoner][GameObjects.ItemType.ARMOR].tokenId;
            delete EquippedGears[summoner][GameObjects.ItemType.ARMOR];
        } else if (_type == GameObjects.ItemType.BOOTS) {
            id = EquippedGears[summoner][GameObjects.ItemType.BOOTS].tokenId;
            delete EquippedGears[summoner][GameObjects.ItemType.BOOTS];
        } else if (_type == GameObjects.ItemType.AMULET) {
            id = EquippedGears[summoner][GameObjects.ItemType.AMULET].tokenId;
            delete EquippedGears[summoner][GameObjects.ItemType.AMULET];
        } else if (_type == GameObjects.ItemType.RING) {
            id = EquippedGears[summoner][GameObjects.ItemType.RING].tokenId;
            delete EquippedGears[summoner][GameObjects.ItemType.RING];
        } else if (_type == GameObjects.ItemType.EARRING) {
            id = EquippedGears[summoner][GameObjects.ItemType.EARRING].tokenId;
            delete EquippedGears[summoner][GameObjects.ItemType.EARRING];
        } else if (_type == GameObjects.ItemType.BELT) {
            id = EquippedGears[summoner][GameObjects.ItemType.BELT].tokenId;
            delete EquippedGears[summoner][GameObjects.ItemType.BELT];
        } else {
            revert("Not Implemented");
        }
        if (id > 0) {
            _returnNFT(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS), msg.sender, id);
        }
    }


    // @notice equip pet
    function unsummonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
    }


    function getSummonerBattleStats(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats) {

        (
        GameObjects_Stats.Stats memory statsFromWeapon,
        GameObjects_Stats.GeneratedStats memory genFromWeapon,
        GameObjects_Stats.ElementalStats memory eleFromWeapon
        ) = getBattleStatsFromWeapons(summoner);
        (
        GameObjects_Stats.Stats memory statsFromArmor,
        GameObjects_Stats.GeneratedStats memory genFromArmor,
        GameObjects_Stats.ElementalStats memory eleFromArmor
        ) = getBattleStatsFromArmors(summoner);
        (
        GameObjects_Stats.Stats memory statsFromJewelry,
        GameObjects_Stats.GeneratedStats memory genFromJewelry,
        GameObjects_Stats.ElementalStats memory eleFromJewelry
        ) = getBattleStatsFromJewelries(summoner);

        _stats = EquipableUtils.sumStats(statsFromArmor, statsFromWeapon);
        _stats = EquipableUtils.sumStats(_stats, statsFromJewelry);
        _gen_stats = EquipableUtils.sumGeneratedStats(genFromArmor, genFromWeapon);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, genFromJewelry);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(eleFromArmor, eleFromWeapon);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, eleFromJewelry);
        _ele_stats.SummonerDamageType = DamageTypesOfSummoners[summoner];
    }

    function getBattleStatsFromArmors(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats) {
        GameObjects_Equipments.EquipableItem memory _helmet;
        if (EquippedGears[summoner][GameObjects.ItemType.HELMET].itemId != 0) {
            _helmet = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.HELMETS_CODEX)
            ).helmet(EquippedGears[summoner][GameObjects.ItemType.HELMET]);
            _stats = EquipableUtils.sumStats(_stats, _helmet.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _helmet.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _helmet.elementalStats);
        }

        GameObjects_Equipments.EquipableItem memory _armor;
        if (EquippedGears[summoner][GameObjects.ItemType.ARMOR].itemId != 0) {
            _armor = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.BODY_ARMORS_CODEX)
            ).armor(EquippedGears[summoner][GameObjects.ItemType.ARMOR]);
            _stats = EquipableUtils.sumStats(_stats, _armor.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _armor.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _armor.elementalStats);
        }

        GameObjects_Equipments.EquipableItem memory _boots;
        if (EquippedGears[summoner][GameObjects.ItemType.BOOTS].itemId != 0) {
            _boots = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.BOOTS_CODEX)
            ).boots(EquippedGears[summoner][GameObjects.ItemType.BOOTS]);
            _stats = EquipableUtils.sumStats(_stats, _boots.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _boots.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _boots.elementalStats);
        }
    }

    function getBattleStatsFromJewelries(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats) {
        GameObjects_Equipments.EquipableItem memory _amulet;
        if (EquippedGears[summoner][GameObjects.ItemType.AMULET].itemId != 0) {
            _amulet = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.AMULETS_CODEX)
            ).amulet(EquippedGears[summoner][GameObjects.ItemType.AMULET]);
            _stats = EquipableUtils.sumStats(_stats, _amulet.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _amulet.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _amulet.elementalStats);
        }
        GameObjects_Equipments.EquipableItem memory _ring;
        if (EquippedGears[summoner][GameObjects.ItemType.RING].itemId != 0) {
            _ring = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.RINGS_CODEX)
            ).ring(EquippedGears[summoner][GameObjects.ItemType.RING]);
            _stats = EquipableUtils.sumStats(_stats, _ring.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _ring.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _ring.elementalStats);
        }

        GameObjects_Equipments.EquipableItem memory _earring;
        if (EquippedGears[summoner][GameObjects.ItemType.EARRING].itemId != 0) {
            _earring = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.EARRINGS_CODEX)
            ).earrings(EquippedGears[summoner][GameObjects.ItemType.EARRING]);
            _stats = EquipableUtils.sumStats(_stats, _earring.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _earring.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _earring.elementalStats);
        }
        GameObjects_Equipments.EquipableItem memory _belt;
        if (EquippedGears[summoner][GameObjects.ItemType.BELT].itemId != 0) {
            _belt = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.BELTS_CODEX)
            ).belt(EquippedGears[summoner][GameObjects.ItemType.BELT]);
            _stats = EquipableUtils.sumStats(_stats, _belt.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _belt.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _belt.elementalStats);
        }
    }

    function getBattleStatsFromWeapons(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats) {
        GameObjects_Equipments.Weapon memory _weapon;
        if (EquippedGears[summoner][GameObjects.ItemType.WEAPON].itemId != 0) {
            _weapon = IAllCodexViews(
                contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)
            ).weapon(EquippedGears[summoner][GameObjects.ItemType.WEAPON]);
            _stats = EquipableUtils.sumStats(_stats, _weapon.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _weapon.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _weapon.elementalStats);
        }

        GameObjects_Equipments.Weapon memory _offHand;
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

    function equipped(uint summoner, GameObjects.ItemType[] calldata slots) external view returns (GameObjects_Equipments.EquippedItemStruct[] memory){
        GameObjects_Equipments.EquippedItemStruct[] memory results = new GameObjects_Equipments.EquippedItemStruct[](slots.length);
        uint i;
        for (i; i < slots.length; i++) {
            results[i] = EquippedGears[summoner][slots[i]];
        }
        return results;
    }

    function _escrowNFT(address _erc721, uint _token, address from) internal {
        IEquipableItems(_erc721).transferFrom(from, address(this), _token);
    }

    function _returnNFT(address _erc721, address to, uint _token) internal {
        IEquipableItems(_erc721).transferFrom(address(this), to, _token);
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
