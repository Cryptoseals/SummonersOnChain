import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

contract BowRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 43) return SimpleBow();
        else if (id == 44) return Crossbow();
        else if (id == 45) return LongBow();
        else if (id == 46) return CompositeBow();
        else if (id == 47) return RecurveCrossbow();
        else if (id == 48) return GreatBow();
        else if (id == 49) return ReinforcedBow();
        else if (id == 50) return VerdantBow();
        else if (id == 51) return TemplarsCrossbow();
        else if (id == 52) return ElvenBow();
        else if (id == 53) return Moonlightbow();
        else if (id == 54) return Sunlightbow();
        else if (id == 55) return CycleBow();
        else if (id == 56) return PhantasmalBow ();
        else if (id == 57) return BowOfUndeadKing();
        else if (id == 58) return PyroCrossbow();
        else if (id == 59) return Ghostbolt();
        else if (id == 60) return SkeletalBolter();
        else if (id == 61) return Astrarrow();
        else if (id == 62) return Comet();
        else if (id == 63) return Deathwhisperer();
        
    }

    function SimpleBow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TATTERED_LEATHER,
        amount : 10
        });
    }

    function Crossbow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 12
        });
    }

    function LongBow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 13
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 7
        });
    }

    function CompositeBow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 12
        });
    }

    function RecurveCrossbow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 13
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 7
        });
    }

    function GreatBow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 12
        });
    }

    function ReinforcedBow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 13
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 7
        });
    }

    function VerdantBow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 12
        });
    }

    function TemplarsCrossbow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 13
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 7
        });
    }

    function ElvenBow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 12
        });
    }

    function Moonlightbow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 13
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 7
        });
    }

    function Sunlightbow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 12
        });
    }

    function CycleBow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 13
        });

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 7
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 53
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 54
        });
    }

    function PhantasmalBow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 12
        });
    }

    function BowOfUndeadKing() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 13
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 7
        });
    }

    function PyroCrossbow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 12
        });
    }

    function Ghostbolt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 13
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 7
        });
    }

    function SkeletalBolter() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 12
        });
    }

    function Astrarrow() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 13
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 7
        });
    }

    function Comet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 23
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 12
        });
    }

    function Deathwhisperer() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](20);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 25
        });

        _recipe.materialRequirements[10] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_TATTERED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[11] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAGGED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[12] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[13] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THIN_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[14] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_COARSE_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[15] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RUGGED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[16] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_THICK_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[17] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_REINFORCED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[18] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_HARDENED_LEATHER,
        amount : 20
        });

        _recipe.materialRequirements[19] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_LORDLY_LEATHER,
        amount : 20
        });
    }
}