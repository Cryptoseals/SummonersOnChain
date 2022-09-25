import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

contract StaffRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if (id == 85) return WoodenStaff();
        else if (id == 86) return MarbleStaff();
        else if (id == 87) return TotemicStaff();
        else if (id == 88) return AuraStaff();
        else if (id == 89) return BattleseenStaff();
        else if (id == 90) return WizardStaff();
        else if (id == 91) return VerdantStaff();
        else if (id == 92) return RubyStaff();
        else if (id == 93) return StarfallensStaff();
        else if (id == 94) return Lightbringer();
        else if (id == 95) return StaffOfMoonlight();
        else if (id == 96) return StaffOfSunlight();
        else if (id == 97) return CycleStaff();
        else if (id == 98) return PhantasmalStaff();
        else if (id == 99) return ArchmagesStaff();
        else if (id == 100) return LuminescentStaff();
        else if (id == 101) return AncientElementalistsStaff();
        else if (id == 102) return Spellcatcher();
        else if (id == 103) return IncursionStaff();
        else if (id == 104) return EldersMark();
        else if (id == 105) return Soultrapper();
        revert(".st");
    }

    function WoodenStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](1);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD,
        amount : 20
        });
    }

    function MarbleStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](1);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 35
        });
    }

    function TotemicStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 20
        });
    }

    function AuraStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 10
        });
    }

    function BattleseenStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 20
        });
    }

    function WizardStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 10
        });
    }

    function VerdantStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 20
        });
    }

    function RubyStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 10
        });
    }

    function StarfallensStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 20
        });
    }

    function Lightbringer() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 10
        });
    }

    function StaffOfMoonlight() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 20
        });
    }

    function StaffOfSunlight() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 10
        });
    }

    function CycleStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 20
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 95
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 96
        });
    }

    function PhantasmalStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 10
        });
    }

    function ArchmagesStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 20
        });
    }

    function LuminescentStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 10
        });
    }

    function AncientElementalistsStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 20
        });
    }

    function Spellcatcher() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 10
        });
    }

    function IncursionStaff() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 20
        });
    }

    function EldersMark() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 10
        });
    }

    function Soultrapper() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](10);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SNAKEWOOD_PLANK,
        amount : 70
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 40
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 40
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 40
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 40
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 40
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.RED_OAK_WOOD_PLANK,
        amount : 40
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 40
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 40
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.EBONY_WOOD_PLANK,
        amount : 40
        });
    }
}