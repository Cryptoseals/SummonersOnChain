import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract EarringsRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 1) return FrailEarrings();
        else if (id == 2) return AntiqueEarrings();
        else if (id == 3) return PurgeEarrings();
        else if (id == 4) return BarbedEarrings();
        else if (id == 5) return ReflectiveEarrings();
        else if (id == 6) return StormForgedEarrings();
        else if (id == 7) return VerdantEarrings();
        else if (id == 8) return ShadowfallEarrings();
        else if (id == 9) return MalignantEarrings();
        else if (id == 10) return SealedEarrings();
        else if (id == 11) return TemplarEarrings();
        else if (id == 12) return ChannelerEarrings();
        else if (id == 13) return ChosensEarrings();
        else if (id == 14) return AstraEarrings();
        else if (id == 15) return SoulbinderEarrings();
        else if (id == 16) return MoonlightEarrings();
        else if (id == 17) return SunlightEarrings();
        else if (id == 18) return CycleEarrings();
        else if (id == 19) return InfernalEarrings();
        else if (id == 20) return DivineEarrings();
        else if (id == 21) return EternalEarrings();
        revert(".er");

    }

    function FrailEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 10
        });
    }

    function AntiqueEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 14
        });
    }

    function PurgeEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 7
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 7
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 14
        });
    }

    function BarbedEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 7
        });
    }

    function ReflectiveEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 7
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 7
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 14
        });
    }

    function StormForgedEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 7
        });
    }

    function VerdantEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 7
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 7
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 14
        });
    }

    function ShadowfallEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 7
        });
    }

    function MalignantEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 7
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 7
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 14
        });
    }

    function SealedEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 7
        });
    }

    function TemplarEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 7
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 7
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 14
        });
    }

    function ChannelerEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 7
        });
    }

    function ChosensEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 7
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 7
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 14
        });
    }

    function AstraEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 7
        });
    }

    function SoulbinderEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 7
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 7
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 14
        });      
    }

    function SunlightEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 7
        });      
    }

    function MoonlightEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 7
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 7
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 14
        });
    }

    function CycleEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 7
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);

        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.EARRING,
            id: 16
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.EARRING,
            id: 17
        });
    }

    function InfernalEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 7
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.DIAMOND,
        amount : 7
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 14
        });
    }

    function DivineEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.DIAMOND,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 7
        });
    }

    function EternalEarrings() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](20);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[10] = MaterialRequirement({
        material : CraftingMaterial.DIAMOND,
        amount : 20
        });

        _recipe.materialRequirements[11] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 15
        });

        _recipe.materialRequirements[12] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 15
        });

        _recipe.materialRequirements[13] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 15
        });

        _recipe.materialRequirements[14] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 15
        });

        _recipe.materialRequirements[15] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 15
        });

        _recipe.materialRequirements[16] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 15
        });

        _recipe.materialRequirements[17] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 15
        });

        _recipe.materialRequirements[18] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 15
        });

        _recipe.materialRequirements[19] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 15
        });
    }
}