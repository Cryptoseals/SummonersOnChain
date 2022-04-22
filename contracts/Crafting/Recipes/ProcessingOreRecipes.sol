import "../../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";
pragma solidity ^0.8.0;



//    enum CraftingMaterial {
//        COPPER, TIN, IRON, SILVER, GOLD, PLATINUM, MYTHRIL, ORICALCHUM, OBSIDIAN, LUMINITE,
//        COPPER_INGOT, TIN_INGOT, IRON_INGOT, SILVER_INGOT, GOLD_INGOT, PLATINUM_INGOT, MYTHRIL_INGOT, ORICALCHUM_INGOT, OBSIDIAN_INGOT, LUMINITE_INGOT,
//        GREEN_WOOD, SOFT_WOOD, AGED_WOOD, HARD_WOOD, PETRIFIED_WOOD, RED_OAK_WOOD, ELDER_WOOD, ANCIENT_WOOD, EBONYGREEN_WOOD, SOFT_WOOD, AGED_WOOD, HARD_WOOD, PETRIFIED_WOOD, RED_OAK_WOOD, ELDER_WOOD, ANCIENT_WOOD, SNAKEWOOD,
//        GREEN_WOOD_PLANK, SOFT_WOOD_PLANK, AGED_WOOD_PLANK, HARD_WOOD_PLANK, PETRIFIED_WOOD_PLANK, RED_OAK_WOOD_PLANK, ELDER_WOOD_PLANK, ANCIENT_WOOD_PLANK, EBONYGREEN_WOOD_PLANK, SOFT_WOOD_PLANK, AGED_WOOD_PLANK, HARD_WOOD_PLANK, PETRIFIED_WOOD_PLANK, RED_OAK_WOOD_PLANK, ELDER_WOOD_PLANK, ANCIENT_WOOD_PLANK, SNAKEWOOD_PLANK,
//        TATTERED_LEATHER, RAGGED_LEATHER, RAW_LEATHER, THIN_LEATHER, COARSE_LEATHER, RUGGED_LEATHER, THICK_LEATHER, REINFORCED_LEATHER, HARDENED_LEATHER, LORDLY_LEATHER,
//        PROCESSED_TATTERED_LEATHER, PROCESSED_RAGGED_LEATHER, PROCESSED_RAW_LEATHER, PROCESSED_THIN_LEATHER, PROCESSED_COARSE_LEATHER, PROCESSED_RUGGED_LEATHER, PROCESSED_THICK_LEATHER, PROCESSED_REINFORCED_LEATHER, PROCESSED_HARDENED_LEATHER, PROCESSED_LORDLY_LEATHER,
//        JUTE, WOOL, COTTON, LINEN, SILK, HEMP, CASHMERE, VISCOSE, LYOCELL, RAYON,
//        BOLT_OF_JUTE, BOLT_OF_WOOL, BOLT_OF_COTTON, BOLT_OF_LINEN, BOLT_OF_SILK, BOLT_OF_HEMP, BOLT_OF_CASHMERE, BOLT_OF_VISCOSE, BOLT_OF_LYOCELL, BOLT_OF_RAYON
//    }



contract ProcessingOreRecipes {

    function recipe (ICraftingMaterials.CraftingMaterial material, uint amount) external view returns(ICraftingMaterials.ProcessingRecipe memory _recipe){
        if(material == ICraftingMaterials.CraftingMaterial.COPPER_INGOT) {
            return CopperIngot(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.TIN_INGOT) {
            return TinIngot(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.IRON_INGOT) {
            return IronIngot(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.SILVER_INGOT) {
            return SilverIngot(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.GOLD_INGOT) {
            return GoldIngot(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.PLATINUM_INGOT) {
            return PlatinumIngot(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.MYTHRIL_INGOT) {
            return MythrilIngot(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.OBSIDIAN_INGOT) {
            return ObsidianIngot(amount);
        } else if (material == ICraftingMaterials.CraftingMaterial.LUMINITE_INGOT) {
            return LuminiteIngot(amount);
        }

        revert("?");
    }

    function CopperIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.COPPER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 15 minutes;
    }

    function TinIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.TIN;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 20 minutes;
    }

    function IronIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.IRON;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 25 minutes;
    }

    function SilverIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.SILVER;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 30 minutes;
    }

    function GoldIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.GOLD;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 35 minutes;
    }

    function PlatinumIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.PLATINUM;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 40 minutes;
    }

    function MythrilIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.MYTHRIL;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 45 minutes;
    }

    function OricalchumIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.ORICALCHUM;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 50 minutes;
    }

    function ObsidianIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.OBSIDIAN;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 55 minutes;
    }

    function LuminiteIngot (uint amount) public view returns(ICraftingMaterials.ProcessingRecipe memory _recipe) {
        _recipe.requiredMaterial = ICraftingMaterials.CraftingMaterial.LUMINITE;
        _recipe.amount = amount * 10;
        _recipe.requiredTime = amount * 1 hours;
    }
}
