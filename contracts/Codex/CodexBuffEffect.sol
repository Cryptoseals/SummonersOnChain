import {BuffEffect} from "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexBuffEffect {
    string constant public index = "Codex";
    string constant public class = "BuffEffects";
    string constant public version = "0.0.1";

    function buffEffectTurnDuration(uint _id, uint _tier) public pure returns (uint) {
        return buffEffect(_id, _tier).turnDuration;
    }

    function buffEffect(uint _id, uint _tier) public pure returns (BuffEffect memory _effect) {
        if (_id == 1) {return EldersPotion(_tier);}
        else if (_id == 2) {return TonicOfTranscendence(_tier);}
        else if (_id == 3) {return CraftsmansPotion(_tier);}
        else if (_id == 4) {return TonicOfAnger(_tier);}
        else if (_id == 5) {return PhialOfAgility(_tier);}
        else if (_id == 6) {return PotionOfIronSkin(_tier);}
        else if (_id == 7) {return ElixirOfSolutions(_tier);}
        else if (_id == 8) {return AthletesFlask(_tier);}
        else if (_id == 9) {return PerfumeOfBlackwidow(_tier);}
        else if (_id == 10) {return VialOfMotherEarth(_tier);}
        else if (_id == 11) {return PotionOfCharge(_tier);}
        else if (_id == 12) {return ElixirOfFrosty(_tier);}
        else if (_id == 13) {return DragonBreathPotion(_tier);}
        else if (_id == 14) {return VialOfSpirit(_tier);}
        else if (_id == 15) {return NightmareFlask(_tier);}
        else if (_id == 16) {return NihilityTonic(_tier);}
        else if (_id == 17) {return PhialOfGladiator(_tier);}
        else if (_id == 18) {return PotionOfArchmage(_tier);}
        else if (_id == 19) {return PotionOfPrecision(_tier);}
        else if (_id == 20) {return ExactionPotion(_tier);}
        else if (_id == 21) {return MercilessFlask(_tier);}
        else if (_id == 22) {return ElixirOfMobility(_tier);}
        else if (_id == 23) {return TonicOfToughness(_tier);}
        else if (_id == 24) {return PiercingTonic(_tier);}
        else if (_id == 25) {return WateryMushroomSoup(_tier);}
        else if (_id == 26) {return GrilledSteak(_tier);}
        else if (_id == 27) {return ApplePie(_tier);}
        else if (_id == 28) {return BaconOmelet(_tier);}
        else if (_id == 29) {return Bread(_tier);}
        else if (_id == 30) {return TomatoSoup(_tier);}
        else if (_id == 31) {return CandyCornCookie(_tier);}
        else if (_id == 32) {return MashedPotato(_tier);}
        else if (_id == 33) {return EggsBenedict(_tier);}
        else if (_id == 34) {return Ribs(_tier);}
        else if (_id == 35) {return Sausages(_tier);}
        else if (_id == 36) {return GrapeCookie(_tier);}
        else if (_id == 37) {return MeatyPastry(_tier);}
        else if (_id == 38) {return SugarCookie(_tier);}
        else if (_id == 39) {return CherryCookie(_tier);}
        else if (_id == 40) {return BananaBread(_tier);}
        else if (_id == 41) {return StrawberryCookie(_tier);}
        else if (_id == 42) {return SimpleMeatStew(_tier);}
        else if (_id == 43) {return FishStew(_tier);}
        else if (_id == 44) {return OceanFishStew(_tier);}
        else if (_id == 45) {return HotChicken(_tier);}
        else if (_id == 46) {return GrapePie(_tier);}
        else if (_id == 47) {return RedGrapePie(_tier);}
        else if (_id == 48) {return BlackGrapePie(_tier);}
        else if (_id == 49) {return PotatoFries(_tier);}
        else if (_id == 50) {return FruitSalad(_tier);}
        else if (_id == 51) {return Hamburger(_tier);}
        else if (_id == 52) {return DeluxeBurger(_tier);}
        else if (_id == 53) {return Cheeseburger(_tier);}
        else if (_id == 54) {return SpicyCheeseburger(_tier);}
        else if (_id == 55) {return MeatChili(_tier);}
        else if (_id == 56) {return Sushi(_tier);}
        else if (_id == 57) {return MeatballWithPotatoFries(_tier);}
        else if (_id == 58) {return SpicySteakWithMushrooms(_tier);}
        else if (_id == 59) {return ChocolateCake(_tier);}
        else if (_id == 60) {return BeefSkewer(_tier);}

        //        revert("invalid");
    }

    function EldersPotion(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.BonusEXPPercentagePerTier = 20;
        _effect.bonus.BonusEXPPercentage = 100 + (tier * _effect.bonus.BonusEXPPercentagePerTier);
        _effect.turnDuration = 2;
    }

    function TonicOfTranscendence(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.BonusEssencePercentagePerTier = 20;
        _effect.bonus.BonusEssencePercentage = 30 + (tier * _effect.bonus.BonusEssencePercentagePerTier);
        _effect.turnDuration = 3;
    }

    function CraftsmansPotion(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.BonusMaterialPercentagePerTier = 30;
        _effect.bonus.BonusMaterialPercentage = 50 + (tier * _effect.bonus.BonusMaterialPercentagePerTier);
        _effect.turnDuration = 3;
    }

    function TonicOfAnger(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 20;
        _effect.statBonus.STR = 30 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 3;
    }

    function PhialOfAgility(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 20;
        _effect.statBonus.AGI = 30 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 3;
    }

    function PotionOfIronSkin(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 20;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 3;
    }

    function ElixirOfSolutions(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 20;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 3;
    }

    function AthletesFlask(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 20;
        _effect.statBonus.DEX = 30 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 3;
    }

    function PerfumeOfBlackwidow(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 20;
        _effect.statBonus.LUCK = 30 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 3;
    }

    function VialOfMotherEarth(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 20;
        _effect.elementalStats.ElementalAtk.EARTH_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.EARTH_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PotionOfCharge(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 20;
        _effect.elementalStats.ElementalAtk.LIGHTNING_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.LIGHTNING_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function ElixirOfFrosty(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 20;
        _effect.elementalStats.ElementalAtk.COLD_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.COLD_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function DragonBreathPotion(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 20;
        _effect.elementalStats.ElementalAtk.FIRE_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.FIRE_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function VialOfSpirit(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 20;
        _effect.elementalStats.ElementalAtk.HOLY_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.HOLY_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function NightmareFlask(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 20;
        _effect.elementalStats.ElementalAtk.DARK_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.DARK_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function NihilityTonic(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 20;
        _effect.elementalStats.ElementalAtk.VOID_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.VOID_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PhialOfGladiator(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 20;
        _effect.generatedStatBonus.P_ATK = 20 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.generatedStatBonus.P_DEF = 20 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PotionOfArchmage(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 20;
        _effect.generatedStatBonus.M_ATK = 20 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.generatedStatBonus.M_DEF = 20 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PotionOfPrecision(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 20;
        _effect.generatedStatBonus.ACCURACY = 20 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function ExactionPotion(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 20;
        _effect.generatedStatBonus.CRIT = 20 + (_effect.bonus.GenStatBonusPerTier * tier);
        _effect.turnDuration = 2;
    }

    function MercilessFlask(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 20;
        _effect.generatedStatBonus.CRIT_MULTIPLIER = 50 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function ElixirOfMobility(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 20;
        _effect.generatedStatBonus.DODGE = 20 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function TonicOfToughness(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 20;
        _effect.generatedStatBonus.HP = 20 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PiercingTonic(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 20;
        _effect.generatedStatBonus.INFUSION = 20 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function WateryMushroomSoup(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 20;
        _effect.generatedStatBonus.HP = 20 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function GrilledSteak(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.STR = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function ApplePie(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.DEX = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function BaconOmelet(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function Bread(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function TomatoSoup(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.AGI = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function CandyCornCookie(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.LUCK = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function MashedPotato(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.P_DEF = 20 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function EggsBenedict(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.INFUSION = 20 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function Ribs(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.AGI = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function Sausages(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.STR = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function GrapeCookie(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.LUCK = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function MeatyPastry(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.STR = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.AGI = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function SugarCookie(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.DEX = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.AGI = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function CherryCookie(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.DEX = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function BananaBread(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function StrawberryCookie(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.LUCK = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function SimpleMeatStew(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.STR = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.P_DEF = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function FishStew(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.DEX = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function OceanFishStew(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.AGI = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function HotChicken(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalAtk.FIRE_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function GrapePie(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier);

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalAtk.EARTH_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function RedGrapePie(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier);

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalAtk.COLD_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function BlackGrapePie(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier);

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalAtk.DARK_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PotatoFries(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier);

        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.P_DEF = 30 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.generatedStatBonus.M_DEF = 30 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function FruitSalad(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.LUCK = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalAtk.EARTH_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalAtk.LIGHTNING_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalAtk.COLD_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalAtk.FIRE_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalAtk.HOLY_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalAtk.DARK_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalAtk.VOID_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;

        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.P_ATK = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.M_ATK = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function Hamburger(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.STR = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalAtk.EARTH_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function DeluxeBurger(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.INFUSION = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalDef.EARTH_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalDef.LIGHTNING_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalDef.COLD_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalDef.FIRE_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalDef.HOLY_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalDef.DARK_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalDef.VOID_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;

        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.P_DEF = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.M_DEF = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function Cheeseburger(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.STR = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.M_ATK = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function SpicyCheeseburger(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.P_ATK = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.M_ATK = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalAtk.FIRE_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function MeatChili(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.AGI = 30 + (tier * _effect.bonus.StatBonusPerTier);

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalAtk.FIRE_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalDef.FIRE_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.elementalStats.ElementalDef.COLD_DEF = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function Sushi(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.AGI = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.LUCK = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.CRIT_MULTIPLIER = 50 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function MeatballWithPotatoFries(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.VIT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.P_ATK = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.P_DEF = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.M_ATK = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.M_DEF = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function SpicySteakWithMushrooms(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.STR = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.P_ATK = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.P_DEF = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.HP = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function ChocolateCake(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.GenStatBonusPerTier = 30;
        _effect.generatedStatBonus.M_ATK = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.M_DEF = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.generatedStatBonus.HP = 30 + (tier * _effect.bonus.GenStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }

    function BeefSkewer(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 30;
        _effect.statBonus.AGI = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.DEX = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;
        _effect.statBonus.INT = 30 + (tier * _effect.bonus.StatBonusPerTier)/2;

        _effect.bonus.EleStatBonusPerTier = 30;
        _effect.elementalStats.ElementalAtk.FIRE_ATK = 30 + (tier * _effect.bonus.EleStatBonusPerTier)/2;
        _effect.turnDuration = 2;
    }
}