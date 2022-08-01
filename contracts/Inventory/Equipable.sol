import {IAttributes} from "../Interfaces/Attributes/IAttributes.sol";
import {IAllCodexViews} from "../Interfaces/Codex/IAllCodexViews.sol";
import {IEquipableItems} from "../Interfaces/NonFungibles/EquipableItems/IEquipableItems.sol";
import {InitNavigator, INavigator, Initializable, GameEntities, ISummoners} from "../Core/Navigator/InitNavigator.sol";
import {GameObjects, GameObjects_Stats, GameObjects_Equipments, GameObjects_BuffEffects} from "../Interfaces/GameObjects/IGameObjects.sol";
import {IConsumablesAndArtifactsToken} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IConsumablesAndArtifacts.sol";
import {EquipableUtils} from "./EquipableUtils.sol";


pragma solidity ^0.8.0;

contract Equipable is Initializable, InitNavigator {

    // held nfts
    IEquipableItems equips;
    IConsumablesAndArtifactsToken consumables;
    IConsumablesAndArtifactsToken artifactContract;
    IAllCodexViews buffEffectCodex;
    IAllCodexViews artifactCodex;
    IAllCodexViews HELMETS_CODEX;
    IAllCodexViews BODY_ARMORS_CODEX;
    IAllCodexViews BOOTS_CODEX;
    IAllCodexViews AMULETS_CODEX;
    IAllCodexViews RINGS_CODEX;
    IAllCodexViews EARRINGS_CODEX;
    IAllCodexViews BELTS_CODEX;
    IAllCodexViews WEAPONS_CODEX;

    struct ConsumedItem {
        uint consumableId;
        uint tier;
        uint turnLeft;
    }

    // summoner -> item type / slot -> item struct
    mapping(uint => mapping(GameObjects.ItemType => GameObjects_Equipments.EquippedItemStruct)) public EquippedGears;

    mapping(uint => uint) public EquippedSeals;
    // summoner -> slot -> precalculated
    //    mapping(uint => mapping(GameObjects.ItemType => GameObjects_Stats.Stats)) public PreCalculatedEquipmentStats;
    //    mapping(uint => mapping(GameObjects.ItemType => GameObjects_Stats.GeneratedStats)) public PreCalculatedGeneratedEquipmentStats;
    //    mapping(uint => mapping(GameObjects.ItemType => GameObjects_Stats.ElementalStats)) public PreCalculatedEquipmentElementalStats;
    mapping(uint => GameObjects.Element) public DamageTypesOfSummoners;
    mapping(uint => GameObjects_Equipments.SummonedCompanion) public SummonedCompanions;

    // summoner elixir slots. summoner id -> equipped
    mapping(uint => mapping(uint => ConsumedItem)) public ConsumableSlots;
    mapping(uint => mapping(uint => uint)) public ArtifactSlots;

    uint public constant CONSUMABLE_SLOTS = 3;
    uint public constant ARTIFACT_SLOTS = 3;

    function initialize(address _navigator) external initializer {
        initializeNavigator(_navigator);
    }

    function initializeContracts() external {
        equips = IEquipableItems(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS));
        HELMETS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.HELMETS_CODEX));
        BODY_ARMORS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.BODY_ARMORS_CODEX));
        BOOTS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.BOOTS_CODEX));
        AMULETS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.AMULETS_CODEX));
        RINGS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.RINGS_CODEX));
        EARRINGS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.EARRINGS_CODEX));
        BELTS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.BELTS_CODEX));
        WEAPONS_CODEX = IAllCodexViews(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX));
        buffEffectCodex = IAllCodexViews(contractAddress(INavigator.CONTRACT.CONSUMABLES_CODEX));
        consumables = IConsumablesAndArtifactsToken(contractAddress(INavigator.CONTRACT.CONSUMABLES));
        artifactContract = IConsumablesAndArtifactsToken(contractAddress(INavigator.CONTRACT.ARTIFACTS));
    }

    function canEquip(uint summoner, GameObjects_Equipments.ItemRequirement memory _requirement) internal view returns (bool) {
        //        IAttributes attributesContract = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES));
        GameEntities.SummonerData memory _summoner = Summoners.summonerData(summoner);
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

        // @warning check if owner
        require(equips.ownerOf(id) == msg.sender, "not owned");
        // call NFT contract to get items tier and type.
        uint oldTokenToRefund = _handleEquip(summoner, id);
        _escrowNFT(address(equips), id, msg.sender);
        if (oldTokenToRefund > 0) {
            _returnNFT(address(equips), msg.sender, id);
        }
    }

    function weak() internal pure {
        revert("You are too weak to equip this.");
    }

    function _handleEquip(uint summoner, uint id) internal returns (uint oldTokenToRefund) {
        (GameObjects.ItemType _type, uint _itemId, uint256 tier, uint prefix, uint prefixTier, uint suffix, uint suffixTier, GameObjects.Element element) = equips.item(id);

        GameObjects_Equipments.EquipableItem memory _equipableItem;
        GameObjects_Equipments.Weapon memory _equipableW;
        oldTokenToRefund = EquippedGears[summoner][_type].tokenId;

        if (_type == GameObjects.ItemType.HELMET) {
            _equipableItem = HELMETS_CODEX.helmetCore(_itemId, tier);
        } else if (_type == GameObjects.ItemType.ARMOR) {
            _equipableItem = BODY_ARMORS_CODEX.armorCore(_itemId, tier);
        } else if (_type == GameObjects.ItemType.WEAPON) {
            _equipableW = WEAPONS_CODEX.weaponCore(_itemId, tier);
            DamageTypesOfSummoners[summoner] = element;
        } else if (_type == GameObjects.ItemType.OFFHAND) {
            _equipableW = WEAPONS_CODEX.weaponCore(_itemId, tier);
        } else if (_type == GameObjects.ItemType.BOOTS) {
            _equipableItem = BOOTS_CODEX.bootsCore(_itemId, tier);
        } else if (_type == GameObjects.ItemType.AMULET) {
            _equipableItem = AMULETS_CODEX.amuletCore(_itemId, tier);
        } else if (_type == GameObjects.ItemType.RING) {
            _equipableItem = RINGS_CODEX.ringCore(_itemId, tier);
        } else if (_type == GameObjects.ItemType.EARRING) {
            _equipableItem = EARRINGS_CODEX.earringsCore(_itemId, tier);
        } else if (_type == GameObjects.ItemType.BELT) {
            _equipableItem = BELTS_CODEX.beltCore(_itemId, tier);
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

    // @param "id" is encoded token id for elixir, e.g 10001 = elixir 1 tier 1
    function consumeElixir(uint summoner, uint slot, uint id) external senderIsSummonerOwner(summoner) notInFight(summoner) {
        require(slot > 0 && slot <= CONSUMABLE_SLOTS, "ms");
        // check ownership, remove previous effects and apply new
        require(
            consumables.balanceOf(msg.sender, id) > 0,
            "!"
        );
        (uint consumableId, uint tier) = consumables.decodeConsumableItem(id);

        for (uint i = 1; i <= CONSUMABLE_SLOTS;) {
            if (consumableId == ConsumableSlots[summoner][i].consumableId) {
                require(ConsumableSlots[summoner][i].turnLeft == 0, "sm");
            }

        unchecked {i++;}
        }
        uint turnDuration = buffEffectCodex.buffEffectTurnDuration(consumableId, tier);
        consumables.burnConsumableItem(msg.sender, id, 1);
        ConsumableSlots[summoner][slot] = ConsumedItem({
        consumableId : consumableId,
        tier : tier,
        turnLeft : turnDuration
        });
    }

    function reduceConsumableDuration(uint summoner) external onlyGameContracts {
        for (uint i = 1; i <= CONSUMABLE_SLOTS;) {
            if (ConsumableSlots[summoner][i].turnLeft > 0) ConsumableSlots[summoner][i].turnLeft -= 1;
        unchecked {i++;}
        }
    }

    function equipArtifact(uint summoner, uint slot, uint id) external senderIsSummonerOwner(summoner) notInFight(summoner) {
        require(slot > 0 && slot <= ARTIFACT_SLOTS, "");
        // check ownership, remove previous effects and apply new
        require(
            artifactContract.ownerOf(id) == msg.sender,
            "!"
        );
        require(artifactContract.burnItem(id), "?!");
        ArtifactSlots[summoner][slot] = id;
    }

    function activeConsumableEffects(uint summoner) public view returns (
        GameObjects_BuffEffects.ElixirBonusEffect memory _fx,
        GameObjects_Stats.Stats memory _stats,
        GameObjects_Stats.GeneratedStats memory _gen_stats,
        GameObjects_Stats.ElementalStats memory _ele_stats){

        GameObjects_BuffEffects.BuffEffect memory buffEffect;
        ConsumedItem memory _consumed;
        for (uint i = 1; i <= CONSUMABLE_SLOTS; i++) {
            _consumed = ConsumableSlots[summoner][i];
            if (_consumed.turnLeft == 0 || _consumed.consumableId == 0) continue;
            buffEffect = buffEffectCodex.buffEffect(_consumed.consumableId, _consumed.tier);
            _stats = EquipableUtils.sumStats(_stats, buffEffect.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, buffEffect.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, buffEffect.elementalStats);
        }
    }

    function activeArtifacts(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats){
        uint _consumed;
        IAllCodexViews ac = IAllCodexViews(address(artifactContract));
        GameObjects_Equipments.Artifact memory artifact;
        for (uint i = 1; i <= ARTIFACT_SLOTS; i++) {
            uint _consumed = ArtifactSlots[summoner][i];
            if (_consumed == 0) continue;
            artifact = ac.artifact(_consumed);
            _stats = EquipableUtils.sumStats(_stats, artifact.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, artifact.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, artifact.elementalStats);
        }
    }

    function activeEffects(uint summoner) public view returns (
        GameObjects_Stats.Stats memory,
        GameObjects_Stats.GeneratedStats memory,
        GameObjects_Stats.ElementalStats memory,
        GameObjects_Stats.Stats memory,
        GameObjects_Stats.GeneratedStats memory,
        GameObjects_Stats.ElementalStats memory){
        (,GameObjects_Stats.Stats memory _stats1,
        GameObjects_Stats.GeneratedStats memory _gen_stats1,
        GameObjects_Stats.ElementalStats memory _ele_stats1) = activeConsumableEffects(summoner);
        (GameObjects_Stats.Stats memory _stats2,
        GameObjects_Stats.GeneratedStats memory _gen_stats2,
        GameObjects_Stats.ElementalStats memory _ele_stats2) = activeArtifacts(summoner);
        return (
        _stats1,
        _gen_stats1,
        _ele_stats1,
        _stats2,
        _gen_stats2,
        _ele_stats2
        );
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
            _returnNFT(address(equips), msg.sender, id);
        }
    }


    // @notice equip pet
    function unsummonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
    }

    function getSummonerBattleStats(uint summoner) public view returns (
        GameObjects_Stats.Stats memory,
        GameObjects_Stats.GeneratedStats memory,
        GameObjects_Stats.ElementalStats memory) {

        (GameObjects_Stats.Stats memory _stats,
        GameObjects_Stats.GeneratedStats memory _gen_stats,
        GameObjects_Stats.ElementalStats memory _ele_stats) = _getSummonerBattleStatsFromEq(summoner);

        // add stat percentage boost from elixir and artifacts
        (GameObjects_Stats.Stats memory _stats2,
        GameObjects_Stats.GeneratedStats memory _gen_stats2,
        GameObjects_Stats.ElementalStats memory _ele_stats2,
        GameObjects_Stats.Stats memory _stats3,
        GameObjects_Stats.GeneratedStats memory _gen_stats3,
        GameObjects_Stats.ElementalStats memory _ele_stats3) = activeEffects(summoner);

        _stats = EquipableUtils.sumStatsAsPercentage(_stats, _stats2);
        _stats = EquipableUtils.sumStatsAsPercentage(_stats, _stats3);

        _gen_stats = EquipableUtils.sumGeneratedStatsAsPercentage(_gen_stats, _gen_stats2);
        _gen_stats = EquipableUtils.sumGeneratedStatsAsPercentage(_gen_stats, _gen_stats3);

        _ele_stats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ele_stats, _ele_stats2);
        _ele_stats = EquipableUtils.sumGeneratedElementalStatsAsPercentage(_ele_stats, _ele_stats3);
        _ele_stats.SummonerDamageType = DamageTypesOfSummoners[summoner];
        return (
        _stats,
        _gen_stats,
        _ele_stats);
    }

    function _getSummonerBattleStatsFromEq(uint summoner) internal view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats) {

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

    }

    function getBattleStatsFromArmors(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats) {
        GameObjects_Equipments.EquipableItem memory _item;
        if (EquippedGears[summoner][GameObjects.ItemType.HELMET].itemId != 0) {
            _item = HELMETS_CODEX.helmet(EquippedGears[summoner][GameObjects.ItemType.HELMET]);
            _stats = EquipableUtils.sumStats(_stats, _item.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _item.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _item.elementalStats);
        }

        if (EquippedGears[summoner][GameObjects.ItemType.ARMOR].itemId != 0) {
            _item = BODY_ARMORS_CODEX.armor(EquippedGears[summoner][GameObjects.ItemType.ARMOR]);
            _stats = EquipableUtils.sumStats(_stats, _item.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _item.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _item.elementalStats);
        }

        if (EquippedGears[summoner][GameObjects.ItemType.BOOTS].itemId != 0) {
            _item = BOOTS_CODEX.boots(EquippedGears[summoner][GameObjects.ItemType.BOOTS]);
            _stats = EquipableUtils.sumStats(_stats, _item.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _item.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _item.elementalStats);
        }
    }

    function getBattleStatsFromJewelries(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats) {
        GameObjects_Equipments.EquipableItem memory _item;
        if (EquippedGears[summoner][GameObjects.ItemType.AMULET].itemId != 0) {
            _item = AMULETS_CODEX.amulet(EquippedGears[summoner][GameObjects.ItemType.AMULET]);
            _stats = EquipableUtils.sumStats(_stats, _item.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _item.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _item.elementalStats);
        }

        if (EquippedGears[summoner][GameObjects.ItemType.RING].itemId != 0) {
            _item = RINGS_CODEX.ring(EquippedGears[summoner][GameObjects.ItemType.RING]);
            _stats = EquipableUtils.sumStats(_stats, _item.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _item.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _item.elementalStats);
        }

        if (EquippedGears[summoner][GameObjects.ItemType.EARRING].itemId != 0) {
            _item = EARRINGS_CODEX.earrings(EquippedGears[summoner][GameObjects.ItemType.EARRING]);
            _stats = EquipableUtils.sumStats(_stats, _item.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _item.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _item.elementalStats);
        }

        if (EquippedGears[summoner][GameObjects.ItemType.BELT].itemId != 0) {
            _item = BELTS_CODEX.belt(EquippedGears[summoner][GameObjects.ItemType.BELT]);
            _stats = EquipableUtils.sumStats(_stats, _item.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _item.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _item.elementalStats);
        }
    }

    function getBattleStatsFromWeapons(uint summoner) public view returns (GameObjects_Stats.Stats memory _stats, GameObjects_Stats.GeneratedStats memory _gen_stats, GameObjects_Stats.ElementalStats memory _ele_stats) {
        GameObjects_Equipments.Weapon memory _item;
        if (EquippedGears[summoner][GameObjects.ItemType.WEAPON].itemId != 0) {
            _item = WEAPONS_CODEX.weapon(EquippedGears[summoner][GameObjects.ItemType.WEAPON]);
            _stats = EquipableUtils.sumStats(_stats, _item.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _item.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _item.elementalStats);
        }

        if (EquippedGears[summoner][GameObjects.ItemType.OFFHAND].itemId != 0) {
            _item = WEAPONS_CODEX.weapon(EquippedGears[summoner][GameObjects.ItemType.OFFHAND]);
            _stats = EquipableUtils.sumStats(_stats, _item.statBonus);
            _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _item.generatedStatBonus);
            _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _item.elementalStats);
        }
        // TODO, add seal stat calculation
    }

    function equipped(uint summoner, GameObjects.ItemType[] calldata slots) external view returns (GameObjects_Equipments.EquippedItemStruct[] memory){
        GameObjects_Equipments.EquippedItemStruct[] memory results = new GameObjects_Equipments.EquippedItemStruct[](slots.length);
        for (uint i = 0; i < slots.length;) {
            results[i] = EquippedGears[summoner][slots[i]];
        unchecked {i++;}
        }
        return results;
    }

    function consumableSlots (uint summoner, uint[] calldata slots) external view returns(ConsumedItem[] memory){
        ConsumedItem[] memory results = new ConsumedItem[](slots.length);
        for (uint i = 0; i < slots.length;) {
            results[i] = ConsumableSlots[summoner][slots[i]];
        unchecked {i++;}
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
