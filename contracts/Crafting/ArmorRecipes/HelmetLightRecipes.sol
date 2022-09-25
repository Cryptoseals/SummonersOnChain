import {CraftingRecipe, RequiredEquipment} from "../../Interfaces/Crafting/ICraftingRecipe.sol";
import {ItemType, MaterialRequirement} from "../../Interfaces/GameObjects/IGameObjects.sol";
import {CraftingMaterial} from "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;

contract HelmetLightRecipes {
    function recipe(uint id) external view returns (CraftingRecipe memory _recipe) {
        if(id == 43) return SoldiersHat();
        else if (id == 44) return PriestsHat();
        else if (id == 45) return FaithHat();
        else if (id == 46) return TraineesHat();
        else if (id == 47) return MagiciansHat();
        else if (id == 48) return SealedMask();
        else if (id == 49) return GateKeepersMask();
        else if (id == 50) return ElementalistsMask();
        else if (id == 51) return AlchemistsMask();
        else if (id == 52) return ArchmagesMask();
        else if (id == 53) return ElvenCirclet();
        else if (id == 54) return ChosensCirclet();
        else if (id == 55) return ProphetsCirclet();
        else if (id == 56) return EldersCirclet();
        else if (id == 57) return AncientCirclet();
        else if (id == 58) return MoonlightCirclet();
        else if (id == 59) return SunlightCirclet();
        else if (id == 60) return CycleCirclet();
        else if (id == 61) return DemonicCrown();
        else if (id == 62) return AngelicCrown();
        else if (id == 63) return EternalCrown();
        
    }

    function SoldiersHat() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](1);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.JUTE,
        amount : 20
        });
    }

    function PriestsHat() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_JUTE,
        amount : 17
        });
    }

    function FaithHat() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_WOOL,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_JUTE,
        amount : 10
        });
    }

    function TraineesHat() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_WOOL,
        amount : 17
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_JUTE,
        amount : 5
        });
    }

    function MagiciansHat() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_COTTON,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_WOOL,
        amount : 10
        });
    }

    function SealedMask() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_COTTON,
        amount : 17
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_WOOL,
        amount : 5
        });
    }

    function GateKeepersMask() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LINEN,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_COTTON,
        amount : 10
        });
    }

    function ElementalistsMask() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LINEN,
        amount : 17
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_COTTON,
        amount : 5
        });
    }

    function AlchemistsMask() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_SILK,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LINEN,
        amount : 10
        });
    }

    function ArchmagesMask() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_SILK,
        amount : 17
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LINEN,
        amount : 5
        });
    }

    function ElvenCirclet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_HEMP,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_SILK,
        amount : 10
        });
    }

    function ChosensCirclet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_HEMP,
        amount : 17
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_SILK,
        amount : 5
        });
    }

    function ProphetsCirclet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_HEMP,
        amount : 10
        });
    }

    function EldersCirclet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 17
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_HEMP,
        amount : 5
        });
    }

    function AncientCirclet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 10
        });
    }

    function MoonlightCirclet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 17
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 5
        });
    }

    function SunlightCirclet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 10
        });
    }

    function CycleCirclet() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 17
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 5
        });

        _recipe.equipmentRequirements = new RequiredEquipment[](2);
        _recipe.equipmentRequirements[0] = RequiredEquipment({
            itemType: ItemType.HELMET,
            id: 58
        });

        _recipe.equipmentRequirements[1] = RequiredEquipment({
            itemType: ItemType.HELMET,
            id: 59
        });
    }

    function DemonicCrown() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_RAYON,
        amount : 10
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 10
        });
    }

    function AngelicCrown() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](2);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_RAYON,
        amount : 17
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 5
        });
    }

    function EternalCrown() public view returns (CraftingRecipe memory _recipe) {
        _recipe.requiredGold = 50;
        _recipe.requiredEssence = 5;

        _recipe.materialRequirements = new MaterialRequirement[](10);

        _recipe.materialRequirements[0] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_RAYON,
        amount : 35
        });

        _recipe.materialRequirements[1] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_JUTE,
        amount : 16
        });

        _recipe.materialRequirements[2] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_WOOL,
        amount : 16
        });

        _recipe.materialRequirements[3] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_COTTON,
        amount : 16
        });

        _recipe.materialRequirements[4] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LINEN,
        amount : 16
        });

        _recipe.materialRequirements[5] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_SILK,
        amount : 16
        });

        _recipe.materialRequirements[6] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_HEMP,
        amount : 16
        });

        _recipe.materialRequirements[7] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_CASHMERE,
        amount : 16
        });

        _recipe.materialRequirements[8] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_VISCOSE,
        amount : 16
        });

        _recipe.materialRequirements[9] = MaterialRequirement({
        material : CraftingMaterial.BOLT_OF_LYOCELL,
        amount : 16
        });
    }
}