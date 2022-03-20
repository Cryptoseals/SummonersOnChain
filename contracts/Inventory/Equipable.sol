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
    mapping(uint => GameObjects.Stats) public PreCalculatedStats;
    // @TODO, generated stats formula
    mapping(uint => GameObjects.GeneratedStats) public PreCalculatedGeneratedStats;
    mapping(uint => GameObjects.SummonedCompanion) public SummonedCompanions;

    function equipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        EquippedSeals[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function equipHelmet(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) /* @TODO , nftIsOwned(address(0))*/ {
        // @TODO Get Info From ITEM NFT Contract and apply tier
        EquippedHelmets[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function equipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedArmors[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function equipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedWeapons[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function equipOffHand(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedOffHands[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function equipBoots(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedBoots[summoner] = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    // @notice equip pet
    function summonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function unequipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        delete EquippedSeals[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function unequipHelmet(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) /* @TODO , nftIsOwned(address(0))*/ {
        // @TODO refund the item nft.
        delete EquippedHelmets[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function unequipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedArmors[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function unequipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedWeapons[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function unequipOffHand(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedOffHands[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    function unequipBoots(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedBoots[summoner];
        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
    }

    // @notice equip pet
    function unsummonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;

        GameObjects.Stats memory calculatedStats = getEquippedItemStats(summoner);
        PreCalculatedStats[summoner] = calculatedStats;
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
        GameObjects.Stats memory fromArmor = getBonusFromArmors(gear.helmetTokenId, gear.armorTokenId, gear.bootsTokenId);
        GameObjects.Stats memory fromWeapon = getBonusFromWeapons(gear.weaponTokenId, gear.offHandTokenId, gear.sealTokenId);
        result = sumStats(result, fromArmor);
        result = sumStats(result, fromWeapon);
        return result;
    }

    function getBonusFromArmors(uint helmet, uint armor, uint boots) public view returns (GameObjects.Stats memory _stats) {
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

    function getBonusFromWeapons(uint weapon, uint offHand, uint seal) public view returns (GameObjects.Stats memory _stats) {
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
