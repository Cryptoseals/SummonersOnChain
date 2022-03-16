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
        GameObjects.EquippedHelmet helmet;
        GameObjects.EquippedArmor armor;
        GameObjects.EquippedBoots boots;
        GameObjects.EquippedWeapon weapon;
        GameObjects.EquippedShield shield;
        GameObjects.EquippedSeal seal;
        GameObjects.SummonedCompanion companion;
    }

    // @TODO , CREATE A SPECIAL STRUCT TO STORE DATA OF EACH EQUIPABLE,
    //(ARTIFACTS AND ELIXIR WILL BE IN THEIR OWN CONTRACT)

    mapping(uint => GameObjects.EquippedHelmet) public EquippedHelmets;
    mapping(uint => GameObjects.EquippedArmor) public EquippedArmors;
    mapping(uint => GameObjects.EquippedBoots) public EquippedBoots;
    mapping(uint => GameObjects.EquippedWeapon) public EquippedWeapons;
    mapping(uint => GameObjects.EquippedShield) public EquippedShields;
    mapping(uint => GameObjects.EquippedSeal) public EquippedSeals;
    mapping(uint => GameObjects.SummonedCompanion) public SummonedCompanions;

    function equipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        EquippedSeals[summoner].sealId = id;
    }

    function equipHelmet(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) /* @TODO , nftIsOwned(address(0))*/ {
        // @TODO Get Info From ITEM NFT Contract and apply tier
        EquippedHelmets[summoner].helmetId = id;
        EquippedHelmets[summoner].helmetId = id;
    }

    function equipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedArmors[summoner].armorId = id;
        EquippedArmors[summoner].armorTier = id;
    }

    function equipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedWeapons[summoner].weaponId = id;
        EquippedWeapons[summoner].weaponTier = id;
    }

    function equipShield(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedShields[summoner].shieldId = id;
        EquippedShields[summoner].shieldTier = id;
    }

    function equipBoots(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        EquippedBoots[summoner].bootsId = id;
        EquippedBoots[summoner].bootsTier = id;
    }

    // @notice equip pet
    function summonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
    }

    function unequipSeal(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) {
        delete EquippedSeals[summoner].sealId;
    }

    function unequipHelmet(uint summoner, uint id) external ensureNotPaused
    senderIsSummonerOwner(summoner) /* @TODO , nftIsOwned(address(0))*/ {
        // @TODO refund the item nft.
        delete EquippedHelmets[summoner].helmetId;
        delete EquippedHelmets[summoner].helmetId;
    }

    function unequipArmor(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedArmors[summoner].armorId;
        delete EquippedArmors[summoner].armorTier;
    }

    function unequipWeapon(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedWeapons[summoner].weaponId;
        delete EquippedWeapons[summoner].weaponTier;
    }

    function unequipShield(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedShields[summoner].shieldId;
        delete EquippedShields[summoner].shieldTier;
    }

    function unequipBoots(uint summoner, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        delete EquippedBoots[summoner].bootsId;
        delete EquippedBoots[summoner].bootsTier;
    }

    // @notice equip pet
    function unsummonCompanion(uint summoner, address _contract, uint id) external ensureNotPaused senderIsSummonerOwner(summoner) {
        SummonedCompanions[summoner].companionAddress = _contract;
        SummonedCompanions[summoner].companionId = id;
    }

    function getEquipped(uint summoner) public view returns (EquippedGear memory) {
        GameObjects.EquippedHelmet memory _helmet = EquippedHelmets[summoner];
        GameObjects.EquippedArmor memory _armor = EquippedArmors[summoner];
        GameObjects.EquippedBoots memory _boots = EquippedBoots[summoner];
        GameObjects.EquippedWeapon memory _weapon = EquippedWeapons[summoner];
        GameObjects.EquippedShield memory _shield = EquippedShields[summoner];
        GameObjects.EquippedSeal memory _seal = EquippedSeals[summoner];
        GameObjects.SummonedCompanion memory _companion = SummonedCompanions[summoner];
        return EquippedGear(_helmet, _armor, _boots, _weapon, _shield, _seal, _companion);
    }

    function getEquippedItemStats(uint summoner) public view returns (GameObjects.Stats memory) {
        GameObjects.Stats memory result = GameObjects.Stats(0,0,0,0,0,0);
        EquippedGear memory gear = getEquipped(summoner);
        return result;
    }

    function getEquippedHelmetStats(uint summoner) public returns(GameObjects.Stats memory) {
        // todo get stats from item codex of helmet by id and implement it;
        
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
