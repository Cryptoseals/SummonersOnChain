import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Codex/ICodexHelmets.sol";
import "../Interfaces/Codex/ICodexArmors.sol";
import "../Interfaces/Codex/ICodexBoots.sol";
import "../Interfaces/Codex/ICodexWeapons.sol";
import "../Interfaces/Codex/ICodexOffHands.sol";
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
        uint helmetTokenId;
        uint armorTokenId;
        uint bootsTokenId;
        uint weaponTokenId;
        uint offHandTokenId;
        uint sealTokenId;
        GameObjects.SummonedCompanion companion;
    }

    // @TODO mappings of equipped item tokenIds
    mapping(uint => uint) public EquippedHelmets;
    mapping(uint => uint) public EquippedArmors;
    mapping(uint => uint) public EquippedBoots;
    mapping(uint => uint) public EquippedWeapons;
    mapping(uint => uint) public EquippedOffHands;
    mapping(uint => uint) public EquippedSeals;
    mapping(uint => GameObjects.Stats) public PreCalculatedEquipmentStats;
    // @TODO, generated stats formula
    mapping(uint => GameObjects.GeneratedStats) public PreCalculatedGeneratedEquipmentStats;
    mapping(uint => GameObjects.SummonedCompanion) public SummonedCompanions;

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
        EquippedHelmets[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;

        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedArmors[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedWeapons[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipOffHand(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedOffHands[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedEquipmentStats[summoner] = calculatedStats;
        GameObjects.GeneratedStats memory calculatedGeneratedStats = getEquippedItemGeneratedStats(summoner);
        PreCalculatedGeneratedEquipmentStats[summoner] = calculatedGeneratedStats;
    }

    function equipBoots(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedBoots[summoner] = id;

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
        uint _seal = EquippedSeals[summoner];
        GameObjects.SummonedCompanion memory _companion = SummonedCompanions[summoner];
        return EquippedGear(_helmet, _armor, _boots, _weapon, _offHand, _seal, _companion);
    }

    function getEquippedItems(uint summoner) public view returns (EquippedGear memory) {
        uint _helmet = EquippedHelmets[summoner];
        uint _armor = EquippedArmors[summoner];
        uint _boots = EquippedBoots[summoner];
        uint _weapon = EquippedWeapons[summoner];
        uint _offHand = EquippedOffHands[summoner];
        uint _seal = EquippedSeals[summoner];
        GameObjects.SummonedCompanion memory _companion = SummonedCompanions[summoner];
        return EquippedGear(_helmet, _armor, _boots, _weapon, _offHand, _seal, _companion);
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
        GameObjects.GeneratedStats memory fromArmor = getBonusGeneratedStatsFromArmors(gear.helmetTokenId, gear.armorTokenId, gear.bootsTokenId);
        GameObjects.GeneratedStats memory fromWeapon = getBonusGeneratedStatsFromArmors(gear.weaponTokenId, gear.offHandTokenId, gear.sealTokenId);
        result = sumGeneratedStats(result, fromArmor);
        result = sumGeneratedStats(result, fromWeapon);
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
        bytes calldata data
    ) external override returns (bytes4) {
        return this.onERC721Received.selector;
    }

}
