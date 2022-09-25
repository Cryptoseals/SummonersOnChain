import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract BeltRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 1) return DeformedBelt();
        else if (id == 2) return AntiqueBelt();
        else if (id == 3) return PurgeBelt();
        else if (id == 4) return BarbedBelt();
        else if (id == 5) return ReflectiveBelt();
        else if (id == 6) return StormForgedBelt();
        else if (id == 7) return VerdantBelt();
        else if (id == 8) return ShadowfallBelt();
        else if (id == 9) return MalignantBelt();
        else if (id == 10) return SealedBelt();
        else if (id == 11) return TemplarBelt();
        else if (id == 12) return ChannelerBelt();
        else if (id == 13) return ChosensBelt();
        else if (id == 14) return AstraBelt();
        else if (id == 15) return SoulbinderBelt();
        else if (id == 16) return MoonlightBelt();
        else if (id == 17) return SunlightBelt();
        else if (id == 18) return CycleBelt();
        else if (id == 19) return InfernalBelt();
        else if (id == 20) return DivineBelt();
        else if (id == 21) return EternalBelt();
        revert(".b");
    }

    function DeformedBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TATTERED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 10
        });
    }

    function AntiqueBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 9
        });
    }

    function PurgeBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 6
        });
    }

    function BarbedBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 9
        });
    }

    function ReflectiveBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 6
        });
    }

    function StormForgedBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 9
        });
    }

    function VerdantBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 6
        });
    }

    function ShadowfallBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 9
        });
    }

    function MalignantBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 6
        });
    }

    function SealedBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 9
        });
    }

    function TemplarBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 6
        });
    }

    function ChannelerBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 9
        });
    }

    function ChosensBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 6
        });
    }

    function AstraBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 9
        });
    }

    function SoulbinderBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 6
        });      
    }

    function MoonlightBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 9
        });      
    }

    function SunlightBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 6
        });
    }

    function CycleBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 9
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);

        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.BELT,
            id: 16
        });
        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.BELT,
            id: 17
        });
    }

    function InfernalBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 6
        });
    }

    function DivineBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 9
        });
    }

    function EternalBelt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](20);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TATTERED_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[10] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 14
        });

        _recipe.materialRequirements[11] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 14
        });

        _recipe.materialRequirements[12] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 14
        });

        _recipe.materialRequirements[13] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 14
        });

        _recipe.materialRequirements[14] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 14
        });

        _recipe.materialRequirements[15] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 14
        });

        _recipe.materialRequirements[16] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 14
        });

        _recipe.materialRequirements[17] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 14
        });

        _recipe.materialRequirements[18] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 14
        });

        _recipe.materialRequirements[19] = MaterialRequirement({
        material : CraftingMaterial.DIAMOND,
        amount : 14
        });
    }
}