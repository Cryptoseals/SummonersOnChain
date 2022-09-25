import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract RingRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 1) return FrailRing();
        else if (id == 2) return AntiqueRing();
        else if (id == 3) return PurgeRing();
        else if (id == 4) return BarbedRing();
        else if (id == 5) return ReflectiveRing();
        else if (id == 6) return StormForgedRing();
        else if (id == 7) return VerdantRing();
        else if (id == 8) return ShadowfallRing();
        else if (id == 9) return MalignantRing();
        else if (id == 10) return SealedRing();
        else if (id == 11) return TemplarRing();
        else if (id == 12) return ChannelerRing();
        else if (id == 13) return ChosensRing();
        else if (id == 14) return AstraRing();
        else if (id == 15) return SoulbinderRing();
        else if (id == 16) return MoonlightRing();
        else if (id == 17) return SunlightRing();
        else if (id == 18) return CycleRing();
        else if (id == 19) return InfernalRing();
        else if (id == 20) return DivineRing();
        else if (id == 21) return EternalRing();
        revert(".rg");

    }
 
    function FrailRing() public view returns (CraftingRecipe memory _recipe) {
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

    function AntiqueRing() public view returns (CraftingRecipe memory _recipe) {
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

    function PurgeRing() public view returns (CraftingRecipe memory _recipe) {
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

    function BarbedRing() public view returns (CraftingRecipe memory _recipe) {
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

    function ReflectiveRing() public view returns (CraftingRecipe memory _recipe) {
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

    function StormForgedRing() public view returns (CraftingRecipe memory _recipe) {
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

    function VerdantRing() public view returns (CraftingRecipe memory _recipe) {
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

    function ShadowfallRing() public view returns (CraftingRecipe memory _recipe) {
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

    function MalignantRing() public view returns (CraftingRecipe memory _recipe) {
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

    function SealedRing() public view returns (CraftingRecipe memory _recipe) {
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

    function TemplarRing() public view returns (CraftingRecipe memory _recipe) {
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

    function ChannelerRing() public view returns (CraftingRecipe memory _recipe) {
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

    function ChosensRing() public view returns (CraftingRecipe memory _recipe) {
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

    function AstraRing() public view returns (CraftingRecipe memory _recipe) {
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

    function SoulbinderRing() public view returns (CraftingRecipe memory _recipe) {
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

    function MoonlightRing() public view returns (CraftingRecipe memory _recipe) {
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

    function SunlightRing() public view returns (CraftingRecipe memory _recipe) {
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

    function CycleRing() public view returns (CraftingRecipe memory _recipe) {
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
        amount : 7});

        _recipe.equipmentRequirements = new RequiredEquipment[](2);

        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.RING,
            id: 16
        });
        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.RING,
            id: 17
        });

    }

    function InfernalRing() public view returns (CraftingRecipe memory _recipe) {
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

    function DivineRing() public view returns (CraftingRecipe memory _recipe) {
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

    function EternalRing() public view returns (CraftingRecipe memory _recipe) {
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