import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

contract DaggerRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id ==  22) return BreadKnife();
        else if (id ==  23) return Twinkle();
        else if (id ==  24) return Razor();
        else if (id ==  25) return Quickblade();
        else if (id ==  26) return PocketKiller();
        else if (id ==  27) return SilverDagger();
        else if (id ==  28) return GoldenStiletto();
        else if (id ==  29) return VerdantKris();
        else if (id ==  30) return NightfallDagger();
        else if (id ==  31) return Voidslasher();
        else if (id ==  32) return DaggerOfMoonlight();
        else if (id ==  33) return DaggerOfSunlight();
        else if (id ==  34) return CycleDagger();
        else if (id ==  35) return PhantasmalDagger();
        else if (id ==  36) return DefilingRazor();
        else if (id ==  37) return DaggerOfTheSuccubus();
        else if (id ==  38) return Pyrodagger();
        else if (id ==  39) return PointOfZero();
        else if (id ==  40) return DaggerOfIncursion();
        else if (id ==  41) return Kingmaker();
        else if (id ==  42) return Blooddrainer();
        
    }
    
    function BreadKnife() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD,
        amount : 10
        });
    }

    function Twinkle() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 13
        });
    }

    function Razor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 8
        });
    }

    function Quickblade() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 13
        });
    }

    function PocketKiller() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 8
        });
    }

    function SilverDagger() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 13
        });
    }

    function GoldenStiletto() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 8
        });
    }

    function VerdantKris() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 13
        });
    }

    function NightfallDagger() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 8
        });
    }

    function Voidslasher() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 13
        });
    }

    function DaggerOfMoonlight() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 8
        });
    }

    function DaggerOfSunlight() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 13
        });
    }

    function CycleDagger() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 8
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 32
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 33
        });
    }

    function PhantasmalDagger() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 13
        });
    }

    function DefilingRazor() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 8
        });
    }

    function DaggerOfTheSuccubus() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 13
        });
    }

    function Pyrodagger() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 8
        });
    }

    function PointOfZero() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 13
        });
    }

    function DaggerOfIncursion() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 8
        });
    }

    function Kingmaker() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 22
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 13
        });
    }

    function Blooddrainer() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](20);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 25
        });

        _recipe.materialRequirements[10] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[11] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[12] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[13] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[14] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[15] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[16] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[17] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[18] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[19] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 20
        });
    }

}