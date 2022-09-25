import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract ArmorHeavyRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 1) return SoldiersArmor();
        else if (id == 2) return ExecutionersArmor();
        else if (id == 3) return KnightsArmor();
        else if (id == 4) return DwarvenArmor();
        else if (id == 5) return ScaleArmor();
        else if (id == 6) return WingedArmor();
        else if (id == 7) return JuggernautArmor();
        else if (id == 8) return DraconicArmor();
        else if (id == 9) return DragonsilverArmor();
        else if (id == 10) return GoldenArmor();
        else if (id == 11) return MidassArmor();
        else if (id == 12) return ChosensArmor();
        else if (id == 13) return TemplarArmor();
        else if (id == 14) return VanguardArmor();
        else if (id == 15) return VoidDwellerArmor();
        else if (id == 16) return MoonlightArmor();
        else if (id == 17) return SunlightArmor();
        else if (id == 18) return CycleArmor();
        else if (id == 19) return DemonicArmor();
        else if (id == 20) return AngelicArmor();
        else if (id == 21) return EternalArmor();
    }

    function SoldiersArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TATTERED_LEATHER,
        amount : 10
        });
    }

    function ExecutionersArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount :12
        });
    }

    function KnightsArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 8
        });
    }

    function DwarvenArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 12
        });
    }

    function ScaleArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 8
        });
    }

    function WingedArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 12
        });
    }

    function JuggernautArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 8
        });
    }

    function DraconicArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 12
        });
    }

    function DragonsilverArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 8
        });
    }

    function GoldenArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 12
        });
    }

    function MidassArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 8
        });
    }

    function ChosensArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 12
        });
    }

    function TemplarArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 8
        });
    }

    function VanguardArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 12
        });
    }

    function VoidDwellerArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 8
        });
    }

    function MoonlightArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 12
        });
    }

    function SunlightArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 8
        });
    }

    function CycleArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 12
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.ARMOR,
            id: 16
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.ARMOR,
            id: 17
        });
    }

    function DemonicArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 8
        });
    }

    function AngelicArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 16
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 8
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 12
        });
    }

    function EternalArmor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](20);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[10] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[11] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[12] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[13] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[14] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[15] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[16] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[17] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[18] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[19] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 16
        });

    }
}