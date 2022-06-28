import {GameObjects, ICraftingRecipe, ICraftingMaterials} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
pragma solidity ^0.8.0;

contract ArmorMediumRecipes {
    function recipe(uint id) external view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        if (id == 22) return SoldiersTunic();
        else if (id == 23) return ExecutionersTunic();
        else if (id == 24) return HuntersShirt();
        else if (id == 25) return RangerShirt();
        else if (id == 26) return MercenaryCoat();
        else if (id == 27) return NobleCoat();
        else if (id == 28) return BloodstainedCoat();
        else if (id == 29) return CoatOfDusk();
        else if (id == 30) return ShadowLongcoat();
        else if (id == 31) return HeadmastersLongcoat();
        else if (id == 32) return ElvenLongcoat();
        else if (id == 33) return ChosensLongcoat();
        else if (id == 34) return ProphetsLongcoat();
        else if (id == 35) return EldersLongcoat();
        else if (id == 36) return AncientLongcoat();
        else if (id == 37) return MoonlightLongcoat();
        else if (id == 38) return SunlightLongcoat();
        else if (id == 39) return CycleLongcoat();
        else if (id == 40) return DemonicSuit();
        else if (id == 41) return AngelicSuit();
        else if (id == 42) return EternalSuit();

        revert(".ma");
    }

    function SoldiersTunic() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.TATTERED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.JUTE,
        amount : 10
        });
    }

    function ExecutionersTunic() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](2);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount :16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_JUTE,
        amount : 12
        });
    }

    function HuntersShirt() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.TATTERED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_WOOL,
        amount : 8
        });
    }

    function RangerShirt() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.TATTERED_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_WOOL,
        amount : 12
        });
    }

    function MercenaryCoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_COTTON,
        amount : 8
        });
    }

    function NobleCoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_COTTON,
        amount : 12
        });
    }

    function BloodstainedCoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LINEN,
        amount : 8
        });
    }

    function CoatOfDusk() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LINEN,
        amount : 12
        });
    }

    function ShadowLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_SILK,
        amount : 8
        });
    }

    function HeadmastersLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_SILK,
        amount : 12
        });
    }

    function ElvenLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_HEMP,
        amount : 8
        });
    }

    function ChosensLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_HEMP,
        amount : 12
        });
    }

    function ProphetsLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 8
        });
    }

    function EldersLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 12
        });
    }

    function AncientLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 8
        });
    }

    function MoonlightLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 12
        });
    }

    function SunlightLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);
        
        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 8
        });
    }

    function CycleLongcoat() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 12
        });

        _recipe.equipmentRequirements = new ICraftingRecipe.RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = ICraftingRecipe.RequiredEquipment({
            itemType: GameObjects.ItemType.ARMOR,
            id: 37
        });

        _recipe.equipmentRequirements[1] = ICraftingRecipe.RequiredEquipment({
            itemType: GameObjects.ItemType.ARMOR,
            id: 38
        });
    }

    function DemonicSuit() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_RAYON,
        amount : 8
        });
    }

    function AngelicSuit() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](3);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 16
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 8
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_RAYON,
        amount : 12
        });
    }

    function EternalSuit() public view returns (ICraftingRecipe.CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new ICraftingRecipe.MaterialRequirement[](11);

        _recipe.materialRequirements[0] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[1] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[2] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[3] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[4] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[5] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[6] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[7] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[8] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[9] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[10] = ICraftingRecipe.MaterialRequirement({
        material : ICraftingMaterials.CraftingMaterial.BOLT_OF_RAYON,
        amount : 16
        });
    }
}