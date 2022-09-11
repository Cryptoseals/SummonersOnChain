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
        if (_id == 1) {
            _effect = EldersPotion(_tier);
        }
        else if (_id == 2) {
            _effect = TonicOfTranscendence(_tier);
        }
        else if (_id == 3) {
            _effect = CraftsmansPotion(_tier);
        }
        else if (_id == 4) {
            _effect = TonicOfAnger(_tier);
        }
        else if (_id == 5) {
            _effect = PhialOfAgility(_tier);
        }
        else if (_id == 6) {
            _effect = PotionOfIronSkin(_tier);
        }
        else if (_id == 7) {
            _effect = ElixirOfSolutions(_tier);
        }
        else if (_id == 8) {
            _effect = AthletesFlask(_tier);
        }
        else if (_id == 9) {
            _effect = PerfumeOfBlackwidow(_tier);
        }
        else if (_id == 10) {
            _effect = VialOfMotherEarth(_tier);
        }
        else if (_id == 11) {
            _effect = PotionOfCharge(_tier);
        }
        else if (_id == 12) {
            _effect = ElixirOfFrosty(_tier);
        }
        else if (_id == 13) {
            _effect = DragonBreathPotion(_tier);
        }
        else if (_id == 14) {
            _effect = VialOfSpirit(_tier);
        }
        else if (_id == 15) {
            _effect = NightmareFlask(_tier);
        }
        else if (_id == 16) {
            _effect = NihilityTonic(_tier);
        }
        else if (_id == 17) {
            _effect = PhialOfGladiator(_tier);
        }
        else if (_id == 18) {
            _effect = PotionOfArchmage(_tier);
        }
        else if (_id == 19) {
            _effect = PotionOfPrecision(_tier);
        }
        else if (_id == 20) {
            _effect = ExactionPotion(_tier);
        }
        else if (_id == 21) {
            _effect = MercilessFlask(_tier);
        }
        else if (_id == 22) {
            _effect = ElixirOfMobility(_tier);
        }
        else if (_id == 23) {
            _effect = TonicOfToughness(_tier);
        }
        else if (_id == 24) {
            _effect = PiercingTonic(_tier);
        }

        revert("invalid");
    }

    function EldersPotion(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.BonusEXPPercentagePerTier = 2;
        _effect.bonus.BonusEXPPercentage = 10 + (tier * _effect.bonus.BonusEXPPercentagePerTier);
        _effect.turnDuration = 2;
    }

    function TonicOfTranscendence(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.BonusEssencePercentagePerTier = 2;
        _effect.bonus.BonusEssencePercentage = 3 + (tier * _effect.bonus.BonusEssencePercentagePerTier);
        _effect.turnDuration = 3;
    }

    function CraftsmansPotion(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.BonusMaterialPercentagePerTier = 3;
        _effect.bonus.BonusMaterialPercentage = 5 + (tier * _effect.bonus.BonusMaterialPercentagePerTier);
        _effect.turnDuration = 3;
    }

    function TonicOfAnger(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 2;
        _effect.statBonus.STR = 3 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PhialOfAgility(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 2;
        _effect.statBonus.AGI = 3 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PotionOfIronSkin(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 2;
        _effect.statBonus.VIT = 3 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function ElixirOfSolutions(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 2;
        _effect.statBonus.INT = 3 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function AthletesFlask(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 2;
        _effect.statBonus.DEX = 3 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PerfumeOfBlackwidow(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.StatBonusPerTier = 2;
        _effect.statBonus.LUCK = 3 + (tier * _effect.bonus.StatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function VialOfMotherEarth(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 2;
        _effect.elementalStats.ElementalAtk.EARTH_ATK = 3 + _effect.bonus.EleStatBonusPerTier;
        _effect.elementalStats.ElementalDef.EARTH_DEF = 3 + _effect.bonus.EleStatBonusPerTier;
        _effect.turnDuration = 2;
    }

    function PotionOfCharge(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 2;
        _effect.elementalStats.ElementalAtk.LIGHTNING_ATK = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.LIGHTNING_DEF = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function ElixirOfFrosty(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 2;
        _effect.elementalStats.ElementalAtk.COLD_ATK = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.COLD_DEF = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function DragonBreathPotion(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 2;
        _effect.elementalStats.ElementalAtk.FIRE_ATK = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.FIRE_DEF = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function VialOfSpirit(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 2;
        _effect.elementalStats.ElementalAtk.HOLY_ATK = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.HOLY_DEF = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function NightmareFlask(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 2;
        _effect.elementalStats.ElementalAtk.DARK_ATK = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.DARK_DEF = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function NihilityTonic(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.EleStatBonusPerTier = 2;
        _effect.elementalStats.ElementalAtk.VOID_ATK = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.elementalStats.ElementalDef.VOID_DEF = 3 + (tier * _effect.bonus.EleStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PhialOfGladiator(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 2;
        _effect.generatedStatBonus.P_ATK = 2 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.generatedStatBonus.P_DEF = 2 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PotionOfArchmage(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 2;
        _effect.generatedStatBonus.M_ATK = 2 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.generatedStatBonus.M_DEF = 2 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PotionOfPrecision(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 2;
        _effect.generatedStatBonus.ACCURACY = 2 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function ExactionPotion(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 2;
        _effect.generatedStatBonus.CRIT = 1 + (_effect.bonus.GenStatBonusPerTier * tier);
        _effect.turnDuration = 2;
    }

    function MercilessFlask(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 2;
        _effect.generatedStatBonus.CRIT_MULTIPLIER = 5 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function ElixirOfMobility(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 2;
        _effect.generatedStatBonus.DODGE = 2 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function TonicOfToughness(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.generatedStatBonus.HP = 3;
        _effect.bonus.GenStatBonusPerTier = 2 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }

    function PiercingTonic(uint tier) public pure returns (BuffEffect memory _effect) {
        _effect.bonus.GenStatBonusPerTier = 2;
        _effect.generatedStatBonus.INFUSION = 2 + (tier * _effect.bonus.GenStatBonusPerTier);
        _effect.turnDuration = 2;
    }
}
