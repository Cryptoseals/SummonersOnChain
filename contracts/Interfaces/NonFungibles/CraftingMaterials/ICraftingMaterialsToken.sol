import {ICraftingMaterials} from "../../GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

interface ICraftingMaterialsToken {
    function mintMaterial(ICraftingMaterials.CraftingMaterial material, address to, uint amount) external;
    function burnMaterial(address from, uint id, uint amount) external;
}
