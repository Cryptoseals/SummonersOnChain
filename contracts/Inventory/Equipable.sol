import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Interfaces/Attributes/IAttributes.sol";
import "../Interfaces/Summoners/ISummoners.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/Codex/ICodexHelmets.sol";
import "../Interfaces/Codex/ICodexArmors.sol";
import "../Interfaces/Codex/ICodexBoots.sol";
import "../Interfaces/Codex/ICodexWeapons.sol";
import "../Interfaces/Codex/ICodexOffHands.sol";
import "../Interfaces/Codex/ICodexRings.sol";
import "../Interfaces/Codex/ICodexEarrings.sol";
import "../Interfaces/Codex/ICodexBelts.sol";
import "../Interfaces/Codex/ICodexAmulets.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Core/Navigator/InitNavigator.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

pragma solidity ^0.8.0;

contract Equipable is InitNavigator, IERC721Receiver {

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }

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
    mapping(uint => GameObjects.SummonedCompanion) public SummonedCompanions;


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

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;

        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipHelmet(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) /* @TODO , nftIsOwned(address(0))*/ {
        // @TODO Get Info From ITEM NFT Contract and apply tier
        uint tier;
        GameObjects.Helmet memory _helmet = ICodexHelmets(contractAddress(INavigator.CONTRACT.HELMETS_CODEX)).helmet(id, tier);
        if (!canEquip(summoner, _helmet.requirement)) revert CannotEquip("You are too weak to equip this.");

        EquippedHelmets[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;

        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {

        uint tier;
        GameObjects.Armor memory _armor = ICodexArmors(contractAddress(INavigator.CONTRACT.ARMORS_CODEX)).armor(id, tier);
        if (!canEquip(summoner, _armor.requirement)) revert CannotEquip("You are too weak to equip this.");


        EquippedArmors[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {

        uint tier;
        GameObjects.Weapon memory _weapon = ICodexWeapons(contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)).weapon(id, tier);
        if (!canEquip(summoner, _weapon.requirement)) revert CannotEquip("You are too weak to equip this.");

        EquippedWeapons[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipOffHand(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {

        uint tier;
        GameObjects.OffHand memory _offHand = ICodexOffHands(contractAddress(INavigator.CONTRACT.OFF_HANDS_CODEX)).offHand(id, tier);
        if (!canEquip(summoner, _offHand.requirement)) revert CannotEquip("You are too weak to equip this.");

        EquippedOffHands[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipBoots(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        uint tier;
        GameObjects.Boots memory _boots = ICodexBoots(contractAddress(INavigator.CONTRACT.BOOTS_CODEX)).boots(id, tier);
        if (!canEquip(summoner, _boots.requirement)) revert CannotEquip("You are too weak to equip this.");

        EquippedBoots[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipAmulet(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        uint tier;
        GameObjects.Amulet memory _amulet = ICodexAmulets(contractAddress(INavigator.CONTRACT.AMULETS_CODEX)).amulet(id, tier);
        if (!canEquip(summoner, _amulet.requirement)) revert CannotEquip("You are too weak to equip this.");

        EquippedAmulet[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipRing(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        uint tier;
        GameObjects.Ring memory _ring = ICodexRings(contractAddress(INavigator.CONTRACT.RINGS_CODEX)).ring(id, tier);
        if (!canEquip(summoner, _ring.requirement)) revert CannotEquip("You are too weak to equip this.");

        EquippedRing[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipBelt(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        uint tier;
        GameObjects.Belt memory _belt = ICodexBelts(contractAddress(INavigator.CONTRACT.BELTS_CODEX)).belt(id, tier);
        if (!canEquip(summoner, _belt.requirement)) revert CannotEquip("You are too weak to equip this.");

        EquippedBelt[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    // @notice equip pet
    function summonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        delete EquippedSeals[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipHelmet(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) /* @TODO , nftIsOwned(address(0))*/ {
        // @TODO refund the item nft.
        delete EquippedHelmets[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedArmors[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedWeapons[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipOffHand(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedOffHands[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipBoots(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedBoots[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipAmulet(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedAmulet[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipRing(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedRing[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipEarring(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedEarring[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function unequipBelt(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedBelt[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    // @notice equip pet
    function unsummonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function getEquippedItemTokenIds(uint summoner) public view returns (EquippedGear memory) {
        uint _helmet = EquippedHelmets[summoner];
        uint _armor = EquippedArmors[summoner];
        uint _boots = EquippedBoots[summoner];
        uint _weapon = EquippedWeapons[summoner];
        uint _offHand = EquippedOffHands[summoner];
        uint _amulet = EquippedAmulet[summoner];
        uint _ring = EquippedRing[summoner];
        uint _earring = EquippedEarring[summoner];
        uint _belt = EquippedBelt[summoner];
        uint _seal = EquippedSeals[summoner];
        GameObjects.SummonedCompanion memory _companion = SummonedCompanions[summoner];

        /*
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
        */

        return EquippedGear(_weapon, _offHand, _helmet, _armor, _boots, _amulet, _ring, _earring, _belt, _seal, _companion);
    }

    function getEquippedItemStats(uint summoner) public view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory result = GameObjects.Stats(0, 0, 0, 0, 0, 0);
        EquippedGear memory gear = getEquippedItemTokenIds(summoner);
        GameObjects.Stats memory fromArmor = getBonusStatsFromArmors(gear.helmetTokenId, gear.armorTokenId, gear.bootsTokenId);
        GameObjects.Stats memory fromWeapon = getBonusStatsFromWeapons(gear.weaponTokenId, gear.offHandTokenId, gear.sealTokenId);
        result = sumStats(result, fromArmor);
        result = sumStats(result, fromWeapon);
        return result;
    }

    function getEquippedItemGeneratedStats(uint summoner) public view returns (GameObjects.GeneratedStats memory) {
        GameObjects.GeneratedStats memory result = GameObjects.GeneratedStats(0, 0, 0, 0, 0, 0, 0, 0, 0);
        EquippedGear memory gear = getEquippedItemTokenIds(summoner);

        // @TODO GET TIERS FROM ITEMS NFT CONTRACT.
        uint[] memory _tiers = new uint[](10);
        GameObjects.GeneratedStats memory fromArmor = getBonusGeneratedStatsFromArmors(
            gear.helmetTokenId,
            gear.armorTokenId,
            gear.bootsTokenId);
        GameObjects.GeneratedStats memory fromWeapon = getBonusGeneratedStatsFromArmors(
            gear.weaponTokenId,
            gear.offHandTokenId,
            gear.sealTokenId);
        GameObjects.GeneratedStats memory fromJewelries = getBonusGeneratedStatsFromJewelries(
            gear.amuletTokenId,
            gear.ringTokenId,
            gear.earringTokenId,
            gear.beltTokenId, _tiers);
        result = sumGeneratedStats(result, fromArmor);
        result = sumGeneratedStats(result, fromWeapon);
        result = sumGeneratedStats(result, fromJewelries);
        return result;
    }

    function getBonusStatsFromArmors(uint helmet, uint armor, uint boots) public view returns (GameObjects.Stats memory _stats) {
        ICodexHelmets _helmetCodex = ICodexHelmets(
            contractAddress(INavigator.CONTRACT.HELMETS_CODEX)
        );
        GameObjects.Helmet memory _helmet = _helmetCodex.helmet(helmet, 1);

        ICodexArmors _armorCodex = ICodexArmors(
            contractAddress(INavigator.CONTRACT.ARMORS_CODEX)
        );
        GameObjects.Armor memory _armor = _armorCodex.armor(armor, 1);

        ICodexBoots _bootsCodex = ICodexBoots(
            contractAddress(INavigator.CONTRACT.BOOTS_CODEX)
        );
        GameObjects.Boots memory _boots = _bootsCodex.boots(armor, 1);

        _stats = sumStats(_stats, _helmet.statBonus);
        _stats = sumStats(_stats, _armor.statBonus);
        _stats = sumStats(_stats, _boots.statBonus);
    }

    function getBonusGeneratedStatsFromArmors(uint helmet, uint armor, uint boots) public view returns (GameObjects.GeneratedStats memory _stats) {
        ICodexHelmets _helmetCodex = ICodexHelmets(
            contractAddress(INavigator.CONTRACT.HELMETS_CODEX)
        );
        GameObjects.Helmet memory _helmet = _helmetCodex.helmet(helmet, 1);

        ICodexArmors _armorCodex = ICodexArmors(
            contractAddress(INavigator.CONTRACT.ARMORS_CODEX)
        );
        GameObjects.Armor memory _armor = _armorCodex.armor(armor, 1);

        ICodexBoots _bootsCodex = ICodexBoots(
            contractAddress(INavigator.CONTRACT.BOOTS_CODEX)
        );
        GameObjects.Boots memory _boots = _bootsCodex.boots(armor, 1);

        _stats = sumGeneratedStats(_stats, _helmet.generatedStatBonus);
        _stats = sumGeneratedStats(_stats, _armor.generatedStatBonus);
        _stats = sumGeneratedStats(_stats, _boots.generatedStatBonus);
    }

    function getBonusGeneratedStatsFromJewelries(uint amulet, uint ring, uint earring, uint belt, uint[] memory tiers) public view returns (GameObjects.GeneratedStats memory _stats) {
        GameObjects.Amulet memory _amulet = ICodexAmulets(
            contractAddress(INavigator.CONTRACT.AMULETS_CODEX)
        ).amulet(amulet, tiers[5]);

        GameObjects.Ring memory _ring = ICodexRings(
            contractAddress(INavigator.CONTRACT.RINGS_CODEX)
        ).ring(ring, tiers[6]);

        GameObjects.Earring memory _earring = ICodexEarrings(
            contractAddress(INavigator.CONTRACT.EARRINGS_CODEX)
        ).earring(earring, tiers[7]);

        GameObjects.Belt memory _belt = ICodexBelts(
            contractAddress(INavigator.CONTRACT.BELTS_CODEX)
        ).belt(belt, tiers[8]);

        _stats = sumGeneratedStats(_stats, _amulet.generatedStatBonus);
        _stats = sumGeneratedStats(_stats, _ring.generatedStatBonus);
        _stats = sumGeneratedStats(_stats, _earring.generatedStatBonus);
        _stats = sumGeneratedStats(_stats, _belt.generatedStatBonus);
    }

    function getBonusStatsFromWeapons(uint weapon, uint offHand, uint seal) public view returns (GameObjects.Stats memory _stats) {
        ICodexWeapons _weaponCodex = ICodexWeapons(
            contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)
        );
        GameObjects.Weapon memory _weapon = _weaponCodex.weapon(weapon, 1);

        ICodexOffHands _offHandsCodex = ICodexOffHands(
            contractAddress(INavigator.CONTRACT.OFF_HANDS_CODEX)
        );
        GameObjects.OffHand memory _offHand = _offHandsCodex.offHand(offHand, 1);

        // TODO, add seal stat calculation

        _stats = sumStats(_stats, _weapon.statBonus);
        _stats = sumStats(_stats, _offHand.statBonus);
    }

    function getBonusGeneratedStatsFromWeapons(uint weapon, uint offHand, uint seal) public view returns (GameObjects.GeneratedStats memory _stats) {
        ICodexWeapons _weaponCodex = ICodexWeapons(
            contractAddress(INavigator.CONTRACT.WEAPONS_CODEX)
        );
        GameObjects.Weapon memory _weapon = _weaponCodex.weapon(weapon, 1);

        ICodexOffHands _offHandsCodex = ICodexOffHands(
            contractAddress(INavigator.CONTRACT.OFF_HANDS_CODEX)
        );
        GameObjects.OffHand memory _offHand = _offHandsCodex.offHand(offHand, 1);

        // TODO, add seal stat calculation

        _stats = sumGeneratedStats(_stats, _weapon.generatedStatBonus);
        _stats = sumGeneratedStats(_stats, _offHand.generatedStatBonus);
    }

    function getPreCalculatedStats(uint summoner) external view returns (GameObjects.Stats memory){
        return PreCalculatedEquipmentStats[summoner];
    }

    function getPreCalculatedGeneratedStats(uint summoner) external view returns (GameObjects.GeneratedStats memory){
        return PreCalculatedGeneratedEquipmentStats[summoner];
    }

    // utils

    function sumStats(GameObjects.Stats memory _a, GameObjects.Stats memory _b) internal pure returns (GameObjects.Stats memory) {
        _a.STR += _b.STR;
        _a.AGI += _b.AGI;
        _a.DEX += _b.DEX;
        _a.INT += _b.INT;
        _a.VIT += _b.VIT;
        _a.LUCK += _b.LUCK;
        return _a;
    }

    function sumGeneratedStats(GameObjects.GeneratedStats memory _a, GameObjects.GeneratedStats memory _b) internal pure returns (GameObjects.GeneratedStats memory) {
        _a.P_ATK += _b.P_ATK;
        _a.M_ATK += _b.M_ATK;
        _a.P_DEF += _b.P_DEF;
        _a.M_DEF += _b.M_DEF;
        _a.ACCURACY += _b.ACCURACY;
        _a.DODGE += _b.DODGE;
        _a.CRIT += _b.CRIT;
        _a.CRIT_MULTIPLIER += _b.CRIT_MULTIPLIER;
        return _a;
    }

    function _escrowNFT(address _erc721, uint _token, address from) internal {
        IERC721(_erc721).transferFrom(from, address(this), _token);
    }

    function _returnNFT(address _erc721, uint _token, address to) internal {
        IERC721(_erc721).transferFrom(address(this), to, _token);
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata _data
    ) external pure override returns (bytes4) {
        return this.onERC721Received.selector;
    }

}
