import "../GameObjects/IGameObjects.sol";


pragma solidity ^0.8.0;

interface IEquipable {
    function getEquipped(uint summoner) external view returns (
        GameObjects.EquippedHelmet memory _helmet,
        GameObjects.EquippedArmor memory _armor,
        GameObjects.EquippedBoots memory _boots,
        GameObjects.EquippedWeapon memory _weapon,
        GameObjects.EquippedShield memory _shield,
        GameObjects.EquippedSeal memory _seal,
        GameObjects.SummonedCompanion memory _companion);
}
