import "../../Interfaces/Crafting/ICraftingRecipe.sol";
pragma solidity ^0.8.0;

contract LightRecipes {
    function recipe(uint id) external view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        if (id == 43) return SoldiersTunic();
        else if (id == 44) return PriestsTunic();
        else if (id == 45) return FaithTunic();
        else if (id == 46) return TraineesTunic();
        else if (id == 47) return MagiciansShirt();
        else if (id == 48) return SealedShirt();
        else if (id == 49) return GateKeepersShirt();
        else if (id == 50) return ElementalistsShirt();
        else if (id == 51) return AlcemistsJacket();
        else if (id == 52) return ArchmagesJacket();
        else if (id == 53) return ElvenJacket();
        else if (id == 54) return ChosensJacket();
        else if (id == 55) return ProphetsJacket();
        else if (id == 56) return EldersJacket();
        else if (id == 57) return AncientCuirass();
        else if (id == 58) return MoonlightCuirass();
        else if (id == 59) return SunlightCuirass();
        else if (id == 60) return CycleCuirass();
        else if (id == 61) return DemonicRobe();
        else if (id == 62) return AngelicRobe();
        else if (id == 63) return EternalRobe();
        revert(".la");
    }

    function SoldiersTunic() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](1);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.JUTE,
        amount : 20
        });
    }

    function PriestsTunic() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE,
        amount : 28
        });
    }

    function FaithTunic() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_WOOL,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE,
        amount : 16
        });
    }

    function TraineesTunic() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_WOOL,
        amount : 28
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE,
        amount : 8
        });
    }

    function MagiciansShirt() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_COTTON,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_WOOL,
        amount : 16
        });
    }

    function SealedShirt() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_COTTON,
        amount : 28
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_WOOL,
        amount : 8
        });
    }

    function GateKeepersShirt() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LINEN,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_COTTON,
        amount : 16
        });
    }

    function ElementalistsShirt() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LINEN,
        amount : 28
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_COTTON,
        amount : 8
        });
    }

    function AlcemistsJacket() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_SILK,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LINEN,
        amount : 16
        });
    }

    function ArchmagesJacket() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_SILK,
        amount : 28
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LINEN,
        amount : 8
        });
    }

    function ElvenJacket() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_HEMP,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_SILK,
        amount : 16
        });
    }

    function ChosensJacket() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_HEMP,
        amount : 28
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_SILK,
        amount : 8
        });
    }

    function ProphetsJacket() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_HEMP,
        amount : 16
        });
    }

    function EldersJacket() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 28
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_HEMP,
        amount : 8
        });
    }

    function AncientCuirass() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 16
        });
    }

    function MoonlightCuirass() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 28
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 8
        });
    }

    function SunlightCuirass() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 16
        });
    }

    function CycleCuirass() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 28
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 8
        });

        _recipe.equipmentRequirements = new ICraftingRecipe.RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = ICraftingRecipe.RequiredEquipment({
            itemType: GameObjects.ItemType.ARMOR,
            id: 58
        });

        _recipe.equipmentRequirements[1] = ICraftingRecipe.RequiredEquipment({
            itemType: GameObjects.ItemType.ARMOR,
            id: 59
        });
    }

    function DemonicRobe() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_RAYON,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 16
        });
    }

    function AngelicRobe() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_RAYON,
        amount : 28
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 8
        });
    }

    function EternalRobe() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](10);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_RAYON,
        amount : 36
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE,
        amount : 20
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_WOOL,
        amount : 20
        });

        _recipe.materialRequirements[3] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_COTTON,
        amount : 20
        });

        _recipe.materialRequirements[4] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LINEN,
        amount : 20
        });

        _recipe.materialRequirements[5] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_SILK,
        amount : 20
        });

        _recipe.materialRequirements[6] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_HEMP,
        amount : 20
        });

        _recipe.materialRequirements[7] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 20
        });

        _recipe.materialRequirements[8] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 20
        });

        _recipe.materialRequirements[9] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 20
        });
    }
}