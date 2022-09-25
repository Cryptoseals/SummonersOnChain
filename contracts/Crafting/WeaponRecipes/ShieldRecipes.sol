import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

contract ShieldRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if (id == 127) return SmallWoodenShield();
        else if (id == 128) return SmallCopperShield();
        else if (id == 129) return MediumCopperShield();
        else if (id == 130) return SmallTinShield();
        else if (id == 131) return MediumTinShield();
        else if (id == 132) return SilverShield();
        else if (id == 133) return GoldenShield();
        else if (id == 134) return MythrilShield();
        else if (id == 135) return DarksteelShield();
        else if (id == 136) return OricalchumShield();
        else if (id == 137) return MoonlightShield();
        else if (id == 138) return SunlightShield();
        else if (id == 139) return CycleShield();
        else if (id == 140) return PhantasmalShield();
        else if (id == 141) return HolyPaladinsShield();
        else if (id == 142) return LuminousShield();
        else if (id == 143) return ShieldOfCalamity();
        else if (id == 144) return Reflector();
        else if (id == 145) return EssenceCapacitorShield();
        else if (id == 146) return AetherealShield();
        else if (id == 147) return TheProtector();
        revert(".sh");

    }

    function SmallWoodenShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD,
        amount : 10
        });
    }

    function SmallCopperShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 3
        });
    }

    function MediumCopperShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 3
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 3
        });
    }

    function SmallTinShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 3
        });
    }

    function MediumTinShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 3
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 3
        });
    }

    function SilverShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 3
        });
    }

    function GoldenShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 3
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 3
        });
    }

    function MythrilShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 3
        });
    }

    function DarksteelShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 3
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 3
        });
    }

    function OricalchumShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 3
        });
    }

    function MoonlightShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 3
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 3
        });
    }

    function SunlightShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 3
        });
    }

    function CycleShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 3
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 3
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 137
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 138
        });
    }

    function PhantasmalShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 3
        });
    }

    function HolyPaladinsShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 3
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 3
        });
    }

    function LuminousShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 3
        });
    }

    function ShieldOfCalamity() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 3
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 3
        });
    }

    function Reflector() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 3
        });
    }

    function EssenceCapacitorShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 3
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 3
        });
    }

    function AetherealShield() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 3
        });
    }

    function TheProtector() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](30);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[10] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[11] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[12] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[13] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[14] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[15] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[16] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[17] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[18] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[19] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[20] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[21] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[22] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[23] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[24] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[25] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[26] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[27] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[28] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[29] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 4
        });
    }

}