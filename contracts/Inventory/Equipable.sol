import "../Interfaces/Attributes/IAttributes.sol";
import "../Interfaces/Summoners/ISummoners.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
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
    mapping(uint => uint) public EquippedWeapons;
    mapping(uint => uint) public EquippedOffHands;
    mapping(uint => uint) public EquippedHelmets;
    mapping(uint => uint) public EquippedArmors;
    mapping(uint => uint) public EquippedBoots;
    mapping(uint => uint) public EquippedAmulet;
    mapping(uint => uint) public EquippedEarring;
    mapping(uint => uint) public EquippedRing;
    mapping(uint => uint) public EquippedBelt;
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
        ISummoners summonerContract = ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS));
        IAttributes attributesContract = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES));
        GameEntities.SummonerData memory _summoner = summonerContract.summonerData(summoner);
        GameObjects.Stats memory _summonerStats = attributesContract.stats(summoner);
        return _summoner.level >= _requirement.level &&
        _summoner.state != GameEntities.SummonerState.IN_FIGHT &&
        checkStats(_summonerStats, _requirement);
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

    function equip(uint summoner, GameObjects.ItemType _type, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        // @warning check if owner

        uint tier = IEquipableItems(contractAddress(INavigator.CONTRACT.EQUIPABLE_ITEMS)).tier(id);
        if (_type == GameObjects.ItemType.HELMET) {
            // @TODO Get Info From ITEM NFT Contract and apply tier
            GameObjects.Helmet memory _helmet = IAllCodexViews(contractAddress(INavigator.CONTRACT.HELMETS_CODEX)).helmet(id, tier);
            if (!canEquip(summoner, _helmet.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedHelmets[summoner] = id;
        } else if (_type == GameObjects.ItemType.ARMOR) {
            GameObjects.Armor memory _armor = IAllCodexViews(contractAddress(INavigator.CONTRACT.ARMORS_CODEX)).armor(id, tier);
            if (!canEquip(summoner, _armor.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedArmors[summoner] = id;
        } else if (_type == GameObjects.ItemType.WEAPON) {
            GameObjects.Weapon memory _weapon = IAllCodexViews(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)).weapon(id, tier);
            if (!canEquip(summoner, _weapon.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedWeapons[summoner] = id;
            DamageTypesOfSummoners[summoner] = _weapon.damageType;
        } else if (_type == GameObjects.ItemType.OFFHAND) {
            GameObjects.OffHand memory _offHand = IAllCodexViews(contractAddress(INavigator.CONTRACT.OFF_HANDS_CODEX)).offHand(id, tier);
            if (!canEquip(summoner, _offHand.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedOffHands[summoner] = id;
        } else if (_type == GameObjects.ItemType.BOOTS) {
            GameObjects.Boots memory _boots = IAllCodexViews(contractAddress(INavigator.CONTRACT.BOOTS_CODEX)).boots(id, tier);
            if (!canEquip(summoner, _boots.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedBoots[summoner] = id;
        } else if (_type == GameObjects.ItemType.AMULET) {
            GameObjects.Amulet memory _amulet = IAllCodexViews(contractAddress(INavigator.CONTRACT.AMULETS_CODEX)).amulet(id, tier);
            if (!canEquip(summoner, _amulet.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedAmulet[summoner] = id;
        } else if (_type == GameObjects.ItemType.RING) {
            GameObjects.Ring memory _ring = IAllCodexViews(contractAddress(INavigator.CONTRACT.RINGS_CODEX)).ring(id, tier);
            if (!canEquip(summoner, _ring.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedRing[summoner] = id;
        } else if (_type == GameObjects.ItemType.BELT) {
            GameObjects.Belt memory _belt = IAllCodexViews(contractAddress(INavigator.CONTRACT.BELTS_CODEX)).belt(id, tier);
            if (!canEquip(summoner, _belt.requirement)) revert CannotEquip("You are too weak to equip this.");
            EquippedBelt[summoner] = id;
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
        uint _weapon = EquippedWeapons[summoner];
        uint _offHand = EquippedOffHands[summoner];
        uint _helmet = EquippedHelmets[summoner];
        uint _armor = EquippedArmors[summoner];
        uint _boots = EquippedBoots[summoner];
        uint _amulet = EquippedAmulet[summoner];
        uint _ring = EquippedRing[summoner];
        uint _earring = EquippedEarring[summoner];
        uint _belt = EquippedBelt[summoner];
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
        (EquippedGear memory gear, uint[] memory tiers) = getEquippedItemTokenIds(summoner);

        (
        GameObjects.Stats memory statsFromWeapon,
        GameObjects.GeneratedStats memory genFromWeapon,
        GameObjects.ElementalStats memory eleFromWeapon
        ) = getBattleStatsFromWeapons(
            gear.weaponTokenId,
            gear.offHandTokenId,
            gear.sealTokenId, tiers);
        (
        GameObjects.Stats memory statsFromArmor,
        GameObjects.GeneratedStats memory genFromArmor,
        GameObjects.ElementalStats memory eleFromArmor
        ) = getBattleStatsFromArmors(
            gear.helmetTokenId,
            gear.armorTokenId,
            gear.bootsTokenId,
            tiers);
        (
        GameObjects.Stats memory statsFromJewelry,
        GameObjects.GeneratedStats memory genFromJewelry,
        GameObjects.ElementalStats memory eleFromJewelry
        ) = getBattleStatsFromJewelries(
            gear.amuletTokenId,
            gear.ringTokenId,
            gear.earringTokenId,
            gear.beltTokenId,
            tiers);
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

    function getBattleStatsFromArmors(uint helmet, uint armor, uint boots, uint[] memory tiers) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {
        GameObjects.Helmet memory _helmet = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.HELMETS_CODEX)
        ).helmet(helmet, tiers[2]);

        GameObjects.Armor memory _armor = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.ARMORS_CODEX)
        ).armor(armor, tiers[3]);

        GameObjects.Boots memory _boots = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.BOOTS_CODEX)
        ).boots(boots, tiers[4]);

        _stats = EquipableUtils.sumStats(_stats, _helmet.statBonus);
        _stats = EquipableUtils.sumStats(_stats, _armor.statBonus);
        _stats = EquipableUtils.sumStats(_stats, _boots.statBonus);

        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _helmet.generatedStatBonus);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _armor.generatedStatBonus);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _boots.generatedStatBonus);

        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _helmet.elementalStats);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _armor.elementalStats);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _boots.elementalStats);

    }

    function getBattleStatsFromJewelries(uint amulet, uint ring, uint earring, uint belt, uint[] memory tiers) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {
        GameObjects.Amulet memory _amulet = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.AMULETS_CODEX)
        ).amulet(amulet, tiers[5]);

        GameObjects.Ring memory _ring = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.RINGS_CODEX)
        ).ring(ring, tiers[6]);

        GameObjects.Earring memory _earring = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.EARRINGS_CODEX)
        ).earring(earring, tiers[7]);
        GameObjects.Belt memory _belt = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.BELTS_CODEX)
        ).belt(belt, tiers[8]);

        _stats = EquipableUtils.sumStats(_stats, _amulet.statBonus);
        _stats = EquipableUtils.sumStats(_stats, _ring.statBonus);
        _stats = EquipableUtils.sumStats(_stats, _earring.statBonus);
        _stats = EquipableUtils.sumStats(_stats, _belt.statBonus);

        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _amulet.generatedStatBonus);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _ring.generatedStatBonus);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _earring.generatedStatBonus);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _belt.generatedStatBonus);

        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _amulet.elementalStats);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _ring.elementalStats);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _earring.elementalStats);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _belt.elementalStats);
    }

    function getBattleStatsFromWeapons(uint weapon, uint offHand, uint seal, uint[] memory tiers) public view returns (GameObjects.Stats memory _stats, GameObjects.GeneratedStats memory _gen_stats, GameObjects.ElementalStats memory _ele_stats) {
        GameObjects.Weapon memory _weapon = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)
        ).weapon(weapon, tiers[0]);

        GameObjects.OffHand memory _offHand = IAllCodexViews(
            contractAddress(INavigator.CONTRACT.OFF_HANDS_CODEX)
        ).offHand(offHand, tiers[1]);

        // TODO, add seal stat calculation

        _stats = EquipableUtils.sumStats(_stats, _weapon.statBonus);
        _stats = EquipableUtils.sumStats(_stats, _offHand.statBonus);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _weapon.generatedStatBonus);
        _gen_stats = EquipableUtils.sumGeneratedStats(_gen_stats, _offHand.generatedStatBonus);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _weapon.elementalStats);
        _ele_stats = EquipableUtils.sumGeneratedElementalStats(_ele_stats, _offHand.elementalStats);
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
