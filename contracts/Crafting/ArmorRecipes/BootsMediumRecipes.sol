import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract BootsMediumRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 22) return SoldiersSandals();
        else if (id == 23) return ExecutionersSandals();
        else if (id == 24) return HuntersSandals();
        else if (id == 25) return RangerSandals();
        else if (id == 26) return MercenaryShoes();
        else if (id == 27) return NobleShoes();
        else if (id == 28) return BloodstainedShoes();
        else if (id == 29) return ShoesOfDusk();
        else if (id == 30) return ShadowBoots();
        else if (id == 31) return HeadmastersBoots();
        else if (id == 32) return ElvenBoots();
        else if (id == 33) return ChosensBoots();
        else if (id == 34) return ProphetsBoots();
        else if (id == 35) return EldersBoots();
        else if (id == 36) return AncientShoes();
        else if (id == 37) return MoonlightShoes();
        else if (id == 38) return SunlightShoes();
        else if (id == 39) return CycleShoes();
        else if (id == 40) return DemonicGreaves();
        else if (id == 41) return AngelicGreaves();
        else if (id == 42) return EternalGreaves();
        
    }

    function SoldiersSandals() public view returns (CraftingRecipe memory _recipe) {
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

    function ExecutionersSandals() public view returns (CraftingRecipe memory _recipe) {
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

    function HuntersSandals() public view returns (CraftingRecipe memory _recipe) {
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

    function RangerSandals() public view returns (CraftingRecipe memory _recipe) {
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

    function MercenaryShoes() public view returns (CraftingRecipe memory _recipe) {
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

    function NobleShoes() public view returns (CraftingRecipe memory _recipe) {
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

    function BloodstainedShoes() public view returns (CraftingRecipe memory _recipe) {
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

    function ShoesOfDusk() public view returns (CraftingRecipe memory _recipe) {
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

    function ShadowBoots() public view returns (CraftingRecipe memory _recipe) {
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

    function HeadmastersBoots() public view returns (CraftingRecipe memory _recipe) {
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

    function ElvenBoots() public view returns (CraftingRecipe memory _recipe) {
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

    function ChosensBoots() public view returns (CraftingRecipe memory _recipe) {
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

    function ProphetsBoots() public view returns (CraftingRecipe memory _recipe) {
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

    function EldersBoots() public view returns (CraftingRecipe memory _recipe) {
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

    function AncientShoes() public view returns (CraftingRecipe memory _recipe) {
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

    function MoonlightShoes() public view returns (CraftingRecipe memory _recipe) {
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

    function SunlightShoes() public view returns (CraftingRecipe memory _recipe) {
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

    function CycleShoes() public view returns (CraftingRecipe memory _recipe) {
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
            itemType: ItemType.BOOTS,
            id: 37
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.BOOTS,
            id: 38
        });
    }

    function DemonicGreaves() public view returns (CraftingRecipe memory _recipe) {
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

    function AngelicGreaves() public view returns (CraftingRecipe memory _recipe) {
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

    function EternalGreaves() public view returns (CraftingRecipe memory _recipe) {
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