import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Core/Navigator/InitNavigator.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

pragma solidity ^0.8.0;

contract Equipable is InitNavigator, IERC721Receiver {

    constructor(address _navigator) InitNavigator(_navigator) {}

    // held nfts

    mapping(address => mapping(uint => bool)) public Escrow;


    struct EquippedGear {
        uint helmetTokenId;
        uint armorTokenId;
        uint bootsTokenId;
        uint weaponTokenId;
        uint shieldTokenId;
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
    mapping(uint => GameObjects.SummonedCompanion) public SummonedCompanions;

    function equipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        EquippedSeals[summoner] = id;
    }

    function equipHelmet(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) /* @TODO , nftIsOwned(address(0))*/ {
        // @TODO Get Info From ITEM NFT Contract and apply tier
        EquippedHelmets[summoner] = id;
    }

    function equipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedArmors[summoner] = id;
    }

    function equipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedWeapons[summoner] = id;
    }

    function equipOffHand(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedOffHands[summoner] = id;
    }

    function equipBoots(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedBoots[summoner] = id;
    }

    // @notice equip pet
    function summonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
    }

    function unequipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        delete EquippedSeals[summoner];
    }

    function unequipHelmet(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) /* @TODO , nftIsOwned(address(0))*/ {
        // @TODO refund the item nft.
        delete EquippedHelmets[summoner];
    }

    function unequipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedArmors[summoner];
    }

    function unequipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedWeapons[summoner];
    }

    function unequipOffHand(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedOffHands[summoner];
    }

    function unequipBoots(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedBoots[summoner];
    }

    // @notice equip pet
    function unsummonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
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
        GameObjects.Stats memory fromWeapon = getBonusFromWeapons(gear.weaponTokenId, gear.shieldTokenId, gear.sealTokenId);
        result.STR += fromArmor.STR + fromWeapon.STR;
        result.AGI += fromArmor.AGI + fromWeapon.AGI;
        result.DEX += fromArmor.DEX + fromWeapon.DEX;
        result.INT += fromArmor.INT + fromWeapon.INT;
        result.VIT += fromArmor.VIT + fromWeapon.VIT;
        result.LUCK += fromArmor.LUCK + fromWeapon.LUCK;
        return result;
    }

    function getBonusFromArmors(uint helmet, uint armor, uint boots) public view returns (GameObjects.Stats memory _stats) {

    }

    function getBonusFromWeapons(uint weapon, uint shield, uint seal) public view returns (GameObjects.Stats memory _stats) {

    }



    // utils
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
