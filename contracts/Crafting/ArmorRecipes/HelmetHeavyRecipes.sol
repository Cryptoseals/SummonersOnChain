import "../../Interfaces/Crafting/ICraftingRecipe.sol";
pragma solidity ^0.8.0;

contract HelmetHeavyRecipes {
    function recipe(uint id) external view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        if(id == 1) return SoldiersHelmet();
        else if (id == 2) return ExecutionersHelmet();
        else if (id == 3) return KnightsHelmet();
        else if (id == 4) return DwarvenHelmet();
        else if (id == 5) return ScaleHelmet();
        else if (id == 6) return WingedHelmet();
        else if (id == 7) return JuggernautHelmet();
        else if (id == 8) return DraconicHelmet();
        else if (id == 9) return DragonsilverHelmet();
        else if (id == 10) return GoldenHelmet();
        else if (id == 11) return MidassHelmet();
        else if (id == 12) return ChosensHelmet();
        else if (id == 13) return TemplarHelmet();
        else if (id == 14) return VanguardHelmet();
        else if (id == 15) return VoidDwellerHelmet();
        else if (id == 16) return MoonlightHelmet();
        else if (id == 17) return SunlightHelmet();
        else if (id == 18) return CycleHelmet();
        else if (id == 19) return DemonicHelmet();
        else if (id == 20) return AngelicHelmet();
        else if (id == 21) return EternalHelmet();
        
    }

    function SoldiersHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

       _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.COPPER,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.TATTERED_LEATHER,
        amount : 10
        });
    }

    function ExecutionersHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.COPPER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount :7
        });
    }

    function KnightsHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.TIN_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.COPPER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 5
        });
    }

    function DwarvenHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.TIN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.COPPER_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 7
        });
    }

    function ScaleHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.IRON_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.TIN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 5
        });
    }

    function WingedHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.IRON_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.TIN_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 7
        });
    }

    function JuggernautHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.SILVER_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.IRON_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 7
        });
    }

    function DraconicHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.SILVER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.IRON_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 7
        });
    }

    function DragonsilverHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.GOLD_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.SILVER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 5
        });
    }

    function GoldenHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.GOLD_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.SILVER_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 7
        });
    }

    function MidassHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.GOLD_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 5
        });
    }

    function ChosensHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.GOLD_INGOT,
        amount : 2
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 7
        });
    }

    function TemplarHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 5
        });
    }

    function VanguardHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 7
        });
    }

    function VoidDwellerHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 5
        });
    }

    function MoonlightHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 7
        });
    }

    function SunlightHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 5
        });
    }

    function CycleHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 7
        });

        _recipe.equipmentRequirements = new ICraftingRecipe.RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = ICraftingRecipe.RequiredEquipment({
            itemType: GameObjects.ItemType.HELMET,
            id: 16
        });

        _recipe.equipmentRequirements[1] = ICraftingRecipe.RequiredEquipment({
            itemType: GameObjects.ItemType.HELMET,
            id: 17
        });
    }

    function DemonicHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.LUMINITE_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 5
        });
    }

    function AngelicHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.LUMINITE_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT,
        amount : 5
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 7
        });
    }

    function EternalHelmet() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](11);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.LUMINITE_INGOT,
        amount : 15
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.COPPER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.TIN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[3] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.IRON_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[4] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.SILVER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[5] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.GOLD_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[6] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[7] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[8] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.ORICALCHUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[9] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[10] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 10
        });
    }
}