import "./ICrafting/ICraftingArmor.sol";
import "./ICrafting/ICraftingWeapon.sol";
import "./ICrafting/ICraftingJewelry.sol";
pragma solidity ^0.8.0;

interface ICraftingObjects is ICraftingWeapon, ICraftingArmor, ICraftingJewelry {

}
