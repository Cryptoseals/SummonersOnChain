import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract AxeRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 64) return WoodenAxe();
        else if (id == 65) return HandAxe();
        else if (id == 66) return Pickaxe();
        else if (id == 67) return SkullAxe();
        else if (id == 68) return BattleAxe();
        else if (id == 69) return SilverAxe();
        else if (id == 70) return BerserkersAxe();
        else if (id == 71) return VerdantAxe();
        else if (id == 72) return WarlordsAxe();
        else if (id == 73) return CrescentAxe();
        else if (id == 74) return AxeOfMoonlight();
        else if (id == 75) return AxeOfSunlight();
        else if (id == 76) return CycleAxe();
        else if (id == 77) return PhantasmalAxe();
        else if (id == 78) return EmeraldAxe();
        else if (id == 79) return LuminescentAxe();
        else if (id == 80) return EldersAxe();
        else if (id == 81) return FallenOrdersAxe();
        else if (id == 82) return IncursionAxe();
        else if (id == 83) return TotemicAxe();
        else if (id == 84) return Blooddrinker();
        revert(".ax");
    }

    function WoodenAxe() public view returns (CraftingRecipe memory _recipe) {
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

    function HandAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 11
        });
    }

    function Pickaxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 6
        });
    }

    function SkullAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 11
        });
    }

    function BattleAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 6
        });
    }

    function SilverAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 11
        });
    }

    function BerserkersAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 6
        });
    }

    function VerdantAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 11
        });
    }

    function WarlordsAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 6
        });
    }

    function CrescentAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 11
        });
    }

    function AxeOfMoonlight() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 6
        });
    }

    function AxeOfSunlight() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 11
        });
    }

    function CycleAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 6
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 74
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 75
        });
    }

    function PhantasmalAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 11
        });
    }

    function EmeraldAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 6
        });
    }

    function LuminescentAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 11
        });
    }

    function EldersAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 6
        });
    }

    function FallenOrdersAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 11
        });
    }

    function IncursionAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 14
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 6
        });
    }

    function TotemicAxe() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 24
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 10
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 11
        });
    }

    function Blooddrinker() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](20);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 29
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