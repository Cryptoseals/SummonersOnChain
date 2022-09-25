import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract HelmetMediumRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 22) return SoldiersCap();
        else if (id == 23) return ExecutionersCap();
        else if (id == 24) return HuntersBandana();
        else if (id == 25) return RangerBandana();
        else if (id == 26) return MercenaryCap();
        else if (id == 27) return NobleCap();
        else if (id == 28) return BloodstainedHood();
        else if (id == 29) return HoodOfDusk();
        else if (id == 30) return ShadowMask();
        else if (id == 31) return HeadmastersHood();
        else if (id == 32) return ElvenHood();
        else if (id == 33) return ChosensHood();
        else if (id == 34) return ProphetsHood();
        else if (id == 35) return EldersHood();
        else if (id == 36) return AncientMask();
        else if (id == 37) return MoonlightHood();
        else if (id == 38) return SunlightHood();
        else if (id == 39) return CycleHood();
        else if (id == 40) return DemonicHood();
        else if (id == 41) return AngelicHood();
        else if (id == 42) return EternalHood();
        
    }

    function SoldiersCap() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TATTERED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.JUTE,
        amount : 10
        });
    }

    function ExecutionersCap() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount :10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_JUTE,
        amount : 7
        });
    }

    function HuntersBandana() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TATTERED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_WOOL,
        amount : 5
        });
    }

    function RangerBandana() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TATTERED_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_WOOL,
        amount : 7
        });
    }

    function MercenaryCap() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_COTTON,
        amount : 5
        });
    }

    function NobleCap() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_COTTON,
        amount : 7
        });
    }

    function BloodstainedHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LINEN,
        amount : 5
        });
    }

    function HoodOfDusk() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LINEN,
        amount : 7
        });
    }

    function ShadowMask() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_SILK,
        amount : 5
        });
    }

    function HeadmastersHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_SILK,
        amount : 7
        });
    }

    function ElvenHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_HEMP,
        amount : 5
        });
    }

    function ChosensHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_HEMP,
        amount : 7
        });
    }

    function ProphetsHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 5
        });
    }

    function EldersHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 7
        });
    }

    function AncientMask() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 5
        });
    }

    function MoonlightHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 7
        });
    }

    function SunlightHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);
        
        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 5
        });
    }

    function CycleHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 7
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.HELMET,
            id: 37
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.HELMET,
            id: 38
        });
    }

    function DemonicHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_RAYON,
        amount : 5
        });
    }

    function AngelicHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 5
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_RAYON,
        amount : 7
        });
    }

    function EternalHood() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](20);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 15
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 10
        });

        _recipe.materialRequirements[10] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_JUTE,
        amount : 10
        });

        _recipe.materialRequirements[11] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_WOOL,
        amount : 10
        });

        _recipe.materialRequirements[12] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_COTTON,
        amount : 10
        });

        _recipe.materialRequirements[13] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LINEN,
        amount : 10
        });

        _recipe.materialRequirements[14] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_SILK,
        amount : 10
        });

        _recipe.materialRequirements[15] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_HEMP,
        amount : 10
        });

        _recipe.materialRequirements[16] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 10
        });

        _recipe.materialRequirements[17] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 10
        });

        _recipe.materialRequirements[18] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 10
        });

        _recipe.materialRequirements[19] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_RAYON,
        amount : 10
        });
    }
}