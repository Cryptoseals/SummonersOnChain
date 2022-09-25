import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

pragma solidity ^0.8.0;

contract FocusRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if (id == 106) return WellShapedRock();
        else if (id == 107) return EvergreenFlower();
        else if (id == 108) return IdolOfAberranth();
        else if (id == 109) return WarlordTotem();
        else if (id == 110) return BookOfPhilosopher();
        else if (id == 111) return SilverCoin();
        else if (id == 112) return GoldenChain();
        else if (id == 113) return ChannellingCrystal();
        else if (id == 114) return StarfallensFocus();
        else if (id == 115) return BlessedDice();
        else if (id == 116) return MoonstoneRelic();
        else if (id == 117) return SunfireRelic();
        else if (id == 118) return CycleRelic();
        else if (id == 119) return PhantasmalRelic();
        else if (id == 120) return AncientOrb();
        else if (id == 121) return ScrollOfLuminous();
        else if (id == 122) return HeavenfallenFeather();
        else if (id == 123) return Godbringt();
        else if (id == 124) return KeyOfTheExistence();
        else if (id == 125) return MistguardRelic();
        else if (id == 126) return Mistbringer();

        revert(".f");

    }

    function WellShapedRock() public view returns (CraftingRecipe memory _recipe) {
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

    function EvergreenFlower() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 9
        });
    }

    function IdolOfAberranth() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 6
        });
    }

    function WarlordTotem() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GREEN_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 9
        });
    }

    function BookOfPhilosopher() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.AGED_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SOFT_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.PROCESSED_RAW_LEATHER,
        amount : 4
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_COTTON,
        amount : 5
        });
    }

    function SilverCoin() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 9
        });
    }

    function GoldenChain() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 6
        });
    }

    function ChannellingCrystal() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 9
        });
    }

    function StarfallensFocus() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 6
        });
    }

    function BlessedDice() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PETRIFIED_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.HARD_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 9
        });
    }

    function MoonstoneRelic() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 6
        });
    }

    function SunfireRelic() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 9
        });
    }

    function CycleRelic() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 6
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 116
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.WEAPON,
            id: 117
        });
    }

    function PhantasmalRelic() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 6
        });
    }

    function AncientOrb() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 6
        });
    }

    function ScrollOfLuminous() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](4);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.ANCIENT_WOOD_PLANK,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ELDER_WOOD_PLANK,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 6
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 3
        });
    }

    function HeavenfallenFeather() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 6
        });
    }

    function Godbringt() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 9
        });
    }

    function KeyOfTheExistence() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.DIAMOND,
        amount : 6
        });
    }

    function MistguardRelic() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](3);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 6
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.DIAMOND,
        amount : 9
        });
    }

    function Mistbringer() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](20);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.LUMINITE_INGOT,
        amount : 20
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.COPPER_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.TIN_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.IRON_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.SILVER_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.GOLD_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.PLATINUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.MYTHRIL_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.ORICALCHUM_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.OBSIDIAN_INGOT,
        amount : 12
        });

        _recipe.materialRequirements[10] = MaterialRequirement({
        material : CraftingMaterial.AMBER,
        amount : 10
        });

        _recipe.materialRequirements[11] = MaterialRequirement({
        material : CraftingMaterial.PEARL,
        amount : 10
        });

        _recipe.materialRequirements[12] = MaterialRequirement({
        material : CraftingMaterial.AMETHYST,
        amount : 10
        });

        _recipe.materialRequirements[13] = MaterialRequirement({
        material : CraftingMaterial.CORAL,
        amount : 10
        });

        _recipe.materialRequirements[14] = MaterialRequirement({
        material : CraftingMaterial.RUBY,
        amount : 10
        });

        _recipe.materialRequirements[15] = MaterialRequirement({
        material : CraftingMaterial.TOPAZ,
        amount : 10
        });

        _recipe.materialRequirements[16] = MaterialRequirement({
        material : CraftingMaterial.AZURITE,
        amount : 10
        });

        _recipe.materialRequirements[17] = MaterialRequirement({
        material : CraftingMaterial.EMERALD,
        amount : 10
        });

        _recipe.materialRequirements[18] = MaterialRequirement({
        material : CraftingMaterial.SAPPHIRE,
        amount : 10
        });

        _recipe.materialRequirements[19] = MaterialRequirement({
        material : CraftingMaterial.DIAMOND,
        amount : 10
        });
    }

}