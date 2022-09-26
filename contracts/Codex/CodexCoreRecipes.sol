import {MaterialRequirement, BasicMiscRequirement, BasicAlchemyRequirement, CoreRecipe} from "../Interfaces/GameObjects/IGameObjects.sol";
import {ICookingItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/ICookingItem.sol";
import {IAlchemyItem} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IAlchemyItem.sol";
import {IMiscs} from "../Interfaces/NonFungibles/ConsumablesAndArtifacts/IMisc.sol";
import {CraftingMaterial} from "../Interfaces/GameObjects/ICrafting/ICraftingMaterials.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexCoreRecipes {
    string public constant index = "Codex";
    string public constant class = "CoreRecipes";
    string public constant version = "0.0.1";

    function getAllCoreRecipes() external pure returns (CoreRecipe[] memory) {
        CoreRecipe[] memory result = new CoreRecipe[](1);
        for (uint256 i = 1; i < 97; i++) {
            result[i - 1] = recipe_by_id(i);
        }
        return result;
    }

    function recipe_by_id(uint256 _id)
        public
        pure
        returns (CoreRecipe memory _recipe)
    {
        if (_id == 1) {return EarthCore();}
        else if (_id == 2) {return LightningCore();}
        else if (_id == 3) {return FireCore();}
        else if (_id == 4) {return ColdCore();}
        else if (_id == 5) {return DarkCore();}
        else if (_id == 6) {return HolyCore();}
        else if (_id == 7) {return VoidCore();}
        else if (_id == 8) {return PhysicalCore();}
        else if (_id == 9) {return ArcaneCore();}
        else if (_id == 10) {return SolarionCore();}
        else if (_id == 11) {return TemplarCore();}
        else if (_id == 12) {return PhoenixCore();}
        else if (_id == 13) {return CelestionCore();}
        else if (_id == 14) {return BaphometCore();}
        else if (_id == 15) {return SujinCore();}
        else if (_id == 16) {return SentinelCore();}
        else if (_id == 17) {return VerdantCore();}
        else if (_id == 18) {return WatcherCore();}
        else if (_id == 19) {return DeathbringerCore();}
        else if (_id == 20) {return WraithCore();}
        else if (_id == 21) {return SpellcasterCore();}
        else if (_id == 22) {return LuminousCore();}
        else if (_id == 23) {return FallenCore();}
        else if (_id == 24) {return GreedyCore();}
        else if (_id == 25) {return BlacksmithCore();}
        else if (_id == 26) {return SunCore();}
        else if (_id == 27) {return MoonCore();}
        else if (_id == 28) {return StormCore();}
        else if (_id == 29) {return GladiatorCore();}
        else if (_id == 30) {return VoidheartCore();}
        else if (_id == 31) {return TrollCore();}
        else if (_id == 32) {return WarmongerCore();}
        else if (_id == 33) {return AssassinCore();}
        else if (_id == 34) {return DeathCore();}
        else if (_id == 35) {return AcrobatCore();}
        else if (_id == 36) {return ShadowCore();}
        else if (_id == 37) {return ConcentrationCore();}
        else if (_id == 38) {return GuardianCore();}
        else if (_id == 39) {return SavageCore();}
        else if (_id == 40) {return CultistCore();}
        else if (_id == 41) {return FaithCore();}
        else if (_id == 42) {return WandererCore();}
        else if (_id == 43) {return RootsCore();}
        else if (_id == 44) {return OrderCore();}
        else if (_id == 45) {return SealCore();}
        else if (_id == 46) {return ResistanceCore();}
        else if (_id == 47) {return FortitudeCore();}
        else if (_id == 48) {return RunesCore();}
        else if (_id == 49) {return MalevolenceCore();}
        else if (_id == 50) {return EclipseCore();}
        else if (_id == 51) {return ImmortalCore();}
        else if (_id == 52) {return SanctityCore();}
        else if (_id == 53) {return WisdomCore();}
        else if (_id == 54) {return BerserkerCore();}
        else if (_id == 55) {return WizardCore();}
        else if (_id == 56) {return ElementalistCore();}
        else if (_id == 57) {return FerociousCore();}
        else if (_id == 58) {return WickedCore();}
        else if (_id == 59) {return SharpshooterCore();}
        else if (_id == 60) {return SkirmishingCore();}
        else if (_id == 61) {return DefiantCore();}
        else if (_id == 62) {return MercilessCore();}
        else if (_id == 63) {return FieryCore();}
        else if (_id == 64) {return ThunderousCore();}
        else if (_id == 65) {return RighteousCore();}
        else if (_id == 66) {return FrozenCore();}
        else if (_id == 67) {return NaturalCore();}
        else if (_id == 68) {return SacredCore();}
        else if (_id == 69) {return EternalCore();}
        else if (_id == 70) {return DevastatingCore();}
        else if (_id == 71) {return ForgedCore();}
        else if (_id == 72) {return MysticalCore();}
        else if (_id == 73) {return CleverCore();}
        else if (_id == 74) {return EnormousCore();}
        else if (_id == 75) {return EtherealCore();}
        else if (_id == 76) {return VengefulCore();}
        else if (_id == 77) {return DivineCore();}
        else if (_id == 78) {return ElusiveCore();}
        else if (_id == 79) {return ProtectiveCore();}
        else if (_id == 80) {return PristineCore();}
        else if (_id == 81) {return GlacialCore();}
        else if (_id == 82) {return RuggedCore();}
        else if (_id == 83) {return RuthlessCore();}
        else if (_id == 84) {return LuridCore();}
        else if (_id == 85) {return PastoralCore();}
        else if (_id == 86) {return SupremeCore();}
        else if (_id == 87) {return BanishingCore();}
        else if (_id == 88) {return SharpenedCore();}
        else if (_id == 89) {return ObsidianCore();}
        else if (_id == 90) {return DevotedCore();}
        else if (_id == 91) {return RevivalCore();}
        else if (_id == 92) {return DamnedCore();}
        else if (_id == 93) {return UnholyCore();}
        else if (_id == 94) {return SmokyCore();}
        else if (_id == 95) {return ShardyCore();}
        else if (_id == 96) {return ShinyCore();}

        revert("wrong");
    }

    function EarthCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 1;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Green_Poisonous_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Junk;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function LightningCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 2;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Raindrop_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Rope;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function FireCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 3;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.FireFlower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Bronze_Coin;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function ColdCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 4;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Frozen_Cube;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Poisonous_Fang;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function DarkCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 5;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Shadowflower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Fish_Bone;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function HolyCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 6;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.King_Flower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Feathers;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function VoidCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 7;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Mistyflower;
        _recipe.requiredAlchemyItems[0].amount = 15;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Unknown_Key;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.CORAL;
        _recipe.requiredMaterials[0].amount = 25;
    }

    function PhysicalCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 8;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Raptorherb;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Silver_Chalice;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function ArcaneCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 9;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Manaflower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Golden_Chalice;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function SolarionCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 10;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Roots;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Needle;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function TemplarCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 11;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Cone;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Scissor;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function PhoenixCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 12;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Wild_Rose;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Alcohol;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function CelestionCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 13;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Mistyflower;
        _recipe.requiredAlchemyItems[0].amount = 12;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Mirror;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.CORAL;
        _recipe.requiredMaterials[0].amount = 20;
    }

    function BaphometCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 14;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Organs;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Broom;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function SujinCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 15;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dill;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Broken_Knife;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function SentinelCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 16;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Rucola;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Unknown_Map;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function VerdantCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 17;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Basilicum;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Ribbon;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function WatcherCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 18;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Manaflower;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Nails;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function DeathbringerCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 19;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Demon_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 12;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Bucket;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.CORAL;
        _recipe.requiredMaterials[0].amount = 20;
    }

    function WraithCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 20;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dragonherb;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Seed;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function SpellcasterCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 21;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Shadowberry;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Tribal_Mask;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function LuminousCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 22;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.King_Flower;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Skull;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function FallenCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 23;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Green_Poisonous_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Engagement_Ring;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function GreedyCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 24;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Red_Poisonous_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Broken_Teeth;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function BlacksmithCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 25;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Roots;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Amethyst_Shard;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function SunCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 26;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Mana_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Horseshoe;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function MoonCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 27;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.FireFlower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Voodoo;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function StormCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 28;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Manaflower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Unlit_Torch;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function GladiatorCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 29;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Organs;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Lit_Torch;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function VoidheartCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 30;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Mistyflower;
        _recipe.requiredAlchemyItems[0].amount = 15;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Bat_Wing;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.CORAL;
        _recipe.requiredMaterials[0].amount = 25;
    }

    function TrollCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 31;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Stinky_Flower;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Sailing_Rope;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function WarmongerCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 32;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Stinky_Flower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Gaslamp;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function AssassinCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 33;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Fellherb;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Rotten_Plank;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function DeathCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 34;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Demon_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Entrails;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function AcrobatCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 35;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Rucola;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Heart;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function ShadowCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 36;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Demon_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Infused_Heart;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function ConcentrationCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 37;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Basilicum;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Magma_Heart;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function GuardianCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 38;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Parsley;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Eye;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function SavageCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 39;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Raptorherb;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Bandit_Trophy;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function CultistCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 40;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Shadowflower;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Ball_Of_Yarn;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function FaithCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 41;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Red_Rose;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Anchor;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function WandererCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 42;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Wild_Rose;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Shovel;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function RootsCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 43;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Fellherb;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Stolen_Gol_Bar;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function OrderCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 44;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Cone;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Golden_Skull;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function SealCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 45;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Mistyflower;
        _recipe.requiredAlchemyItems[0].amount = 12;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Hook;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.CORAL;
        _recipe.requiredMaterials[0].amount = 20;
    }

    function ResistanceCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 46;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Bloodberry;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Dice;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function FortitudeCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 47;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Wood_Moss;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Gold_Chunk;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function RunesCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 48;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Stinky_Flower;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Lock;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function MalevolenceCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 49;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dragonherb;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Stolen_Treasure;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function EclipseCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 50;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Mana_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Whip;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function ImmortalCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 51;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Raptorherb;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Animal_Scales;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function SanctityCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 52;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Cone;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Alchemy_Mortar;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function WisdomCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 53;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dragon_Flower;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Chain;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function BerserkerCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 54;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Raptorherb;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Ancient_Statue;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function WizardCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 55;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Golden_Flower;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Chisel;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function ElementalistCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 56;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.FireFlower;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Hammer;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function FerociousCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 57;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Wood_Moss;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Infused_Horseshoe;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function WickedCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 58;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Shadowflower;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Otherworldly_Horseshoe;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function SharpshooterCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 59;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Parsley;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Magical_Horseshoe;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function SkirmishingCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 60;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Wood_Moss;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Silver_Horseshoe;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function DefiantCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 61;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Wild_Rose;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Usable_Horseshoe;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function MercilessCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 62;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dragon_Flower;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Key_Of_Order;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function FieryCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 63;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Parsley;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Key_Of_Wraith;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function ThunderousCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 64;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Raindrop_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Whetstone;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function RighteousCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 65;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Raptorherb;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Leather_Patch;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function FrozenCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 66;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Frozen_Cube;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Stolen_Silver_Bar;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function NaturalCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 67;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Green_Poisonous_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Stolen_Copper_Bar;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function SacredCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 68;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Golden_Flower;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Lost_Diary;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.CORAL;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function EternalCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 69;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Gold_Dust;
        _recipe.requiredAlchemyItems[0].amount = 15;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Spoon;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.RUBY;
        _recipe.requiredMaterials[0].amount = 25;
    }

    function DevastatingCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 70;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Red_Rose;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Crown;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function ForgedCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 71;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Cone;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Unknown_Recipe;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function MysticalCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 72;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Gold_Dust;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Vial_Of_Poison;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function CleverCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 73;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Mana_Mushroom;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Vial_Of_Blood;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function EnormousCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 74;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Stinky_Flower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Fang;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function EtherealCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 75;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Gold_Dust;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Professional_Fishing_Rod;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function VengefulCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 76;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Stinky_Flower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Explosive;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function DivineCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 77;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Golden_Flower;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Gun_Powder;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function ElusiveCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 78;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.King_Flower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Magic_Powder;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function ProtectiveCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 79;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dragon_Flower;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Mechanics_Handbook;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.CORAL;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function PristineCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 80;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Bloodberry;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.RoyalCoin;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.CORAL;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function GlacialCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 81;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Ancient_Flower;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Junk;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function RuggedCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 82;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Wild_Rose;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Rope;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function RuthlessCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 83;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Rucola;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Bronze_Coin;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function LuridCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 84;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dill;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Poisonous_Fang;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function PastoralCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 85;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dill;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Fish_Bone;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function SupremeCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 86;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Ancient_Flower;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Feathers;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.CORAL;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function BanishingCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 87;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Wild_Rose;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Unknown_Key;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function SharpenedCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 88;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Parsley;
        _recipe.requiredAlchemyItems[0].amount = 3;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Silver_Chalice;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMBER;
        _recipe.requiredMaterials[0].amount = 5;
    }

    function ObsidianCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 89;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Wood_Moss;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Golden_Chalice;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function DevotedCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 90;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dragonherb;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Needle;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function RevivalCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 91;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Bloodberry;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Scissor;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function DamnedCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 92;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Shadowberry;
        _recipe.requiredAlchemyItems[0].amount = 9;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Alcohol;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.AMETHYST;
        _recipe.requiredMaterials[0].amount = 15;
    }

    function UnholyCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 93;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Shadowflower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Mirror;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function SmokyCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 94;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Dill;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Broom;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function ShardyCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 95;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Basilicum;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Broken_Knife;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function ShinyCore() public pure returns (CoreRecipe memory _recipe) {
        _recipe.id = 96;
        
        _recipe.requiredAlchemyItems = generateAlchemyRequirement(1);
        _recipe.requiredAlchemyItems[0].id = IAlchemyItem.List.Golden_Flower;
        _recipe.requiredAlchemyItems[0].amount = 6;

        _recipe.requiredMiscItems = generateMiscRequirement(1);
        _recipe.requiredMiscItems[0].id = IMiscs.List.Unknown_Map;
        _recipe.requiredMiscItems[0].amount = 2;

        _recipe.requiredMaterials = generateCraftingMaterialRequirement(1);
        _recipe.requiredMaterials[0].material = CraftingMaterial.PEARL;
        _recipe.requiredMaterials[0].amount = 10;
    }

    function generateCraftingMaterialRequirement(uint256 length)
        internal
        pure
        returns (MaterialRequirement[] memory)
    {
        return new MaterialRequirement[](length);
    }

    function generateMiscRequirement(uint256 length)
        internal
        pure
        returns (BasicMiscRequirement[] memory)
    {
        return new BasicMiscRequirement[](length);
    }

    function generateAlchemyRequirement(uint256 length)
        internal
        pure
        returns (BasicAlchemyRequirement[] memory)
    {
        return new BasicAlchemyRequirement[](length);
    }
}
