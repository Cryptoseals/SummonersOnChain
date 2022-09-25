import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

contract AmuletRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 1) return FrailAmulet();
        else if (id == 2) return AntiqueAmulet();
        else if (id == 3) return PurgeAmulet();
        else if (id == 4) return BarbedAmulet();
        else if (id == 5) return ReflectiveAmulet();
        else if (id == 6) return StormForgedAmulet();
        else if (id == 7) return VerdantAmulet();
        else if (id == 8) return ShadowfallAmulet();
        else if (id == 9) return MalignantAmulet();
        else if (id == 10) return SealedAmulet();
        else if (id == 11) return TemplarAmulet();
        else if (id == 12) return ChannelerAmulet();
        else if (id == 13) return ChosensAmulet();
        else if (id == 14) return AstraAmulet();
        else if (id == 15) return SoulbinderAmulet();
        else if (id == 16) return MoonlightAmulet();
        else if (id == 17) return SunlightAmulet();
        else if (id == 18) return CycleAmulet();
        else if (id == 19) return InfernalAmulet();
        else if (id == 20) return DivineAmulet();
        else if (id == 21) return EternalAmulet();

        revert(".am");
    }

    function FrailAmulet() public view returns (CraftingRecipe memory _recipe) {
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

    function AntiqueAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 12
        });
    }

    function PurgeAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 12
        });
    }

    function BarbedAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 6
        });
    }

    function ReflectiveAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 12
        });
    }

    function StormForgedAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 6
        });
    }

    function VerdantAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 12
        });
    }

    function ShadowfallAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 6
        });
    }

    function MalignantAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 12
        });
    }

    function SealedAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 6
        });
    }

    function TemplarAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 12
        });
    }

    function ChannelerAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 6
        });
    }

    function ChosensAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 12
        });
    }

    function AstraAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 6
        });
    }

    function SoulbinderAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 12
        });      
    }

    function MoonlightAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 6
        });      
    }

    function SunlightAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 12
        });
    }

    function CycleAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 6
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);

        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.AMULET,
            id: 16
        });
        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.AMULET,
            id: 17
        });
    }

    function InfernalAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.DIAMOND,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 12
        });
    }

    function DivineAmulet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 9
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.DIAMOND,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 6
        });
    }

    function EternalAmulet() public view returns (CraftingRecipe memory _recipe) {
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