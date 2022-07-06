import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexElixirs {
    string constant public index = "Codex";
    string constant public class = "Elixirs";
    string constant public version = "0.0.1";

    function elixir(uint _id, uint _tier) public pure returns (GameObjects.Elixir memory) {
        if (_id == 1) {
            return EldersPotion(_tier);
        }
        else if (_id == 2) {
            return TonicOfTranscendence(_tier);
        }
        else if (_id == 3) {
            return CraftsmansPotion(_tier);
        }
        else if (_id == 4) {
            return TonicOfAnger(_tier);
        }
        else if (_id == 5) {
            return PhialOfAgility(_tier);
        }
        else if (_id == 6) {
            return PotionOfIronSkin(_tier);
        }
        else if (_id == 7) {
            return ElixirOfSolutions(_tier);
        }
        else if (_id == 8) {
            return AthletesFlask(_tier);
        }
        else if (_id == 9) {
            return PerfumeOfBlackwidow(_tier);
        }
        else if (_id == 10) {
            return VialOfMotherEarth(_tier);
        }
        else if (_id == 11) {
            return PotionOfCharge(_tier);
        }
        else if (_id == 12) {
            return ElixirOfFrosty(_tier);
        }
        else if (_id == 13) {
            return DragonBreathPotion(_tier);
        }
        else if (_id == 14) {
            return VialOfSpirit(_tier);
        }
        else if (_id == 15) {
            return NightmareFlask(_tier);
        }
        else if (_id == 16) {
            return NihilityTonic(_tier);
        }
        else if (_id == 17) {
            return PhialOfGladiator(_tier);
        }
        else if (_id == 18) {
            return PotionOfArchmage(_tier);
        }

        revert("invalid");
    }

    function EldersPotion(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.bonus.BonusEXPPercentage = 10;
        
        _elixir.bonus.BonusEXPPercentagePerTier = 2;

        _elixir.turnDuration = 2;
    }

    function TonicOfTranscendence(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.bonus.BonusEssencePercentage = 3;

        _elixir.bonus.BonusEssencePercentagePerTier = 2;

        _elixir.turnDuration = 3;
    }

    function CraftsmansPotion(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.bonus.BonusMaterialPercentage = 5;

        _elixir.bonus.BonusMaterialPercentagePerTier = 3;

        _elixir.turnDuration = 3;
    }

    function TonicOfAnger(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.statBonus.STR = 10;

        _elixir.bonus.StatBonusPerTier = 2;

        _elixir.turnDuration = 2;
    }

    function PhialOfAgility(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.statBonus.AGI = 10;

        _elixir.bonus.StatBonusPerTier = 2;

        _elixir.turnDuration = 2;
    }

    function PotionOfIronSkin(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.statBonus.VIT = 10;

        _elixir.bonus.StatBonusPerTier = 2;

        _elixir.turnDuration = 2;
    }

    function ElixirOfSolutions(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.statBonus.INT = 10;

        _elixir.bonus.StatBonusPerTier = 2;

        _elixir.turnDuration = 2;
    }

    function AthletesFlask(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.statBonus.DEX = 10;

        _elixir.bonus.StatBonusPerTier = 2;

        _elixir.turnDuration = 2;
    }

    function PerfumeOfBlackwidow(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.statBonus.LUCK = 10;

        _elixir.bonus.StatBonusPerTier = 2;

        _elixir.turnDuration = 2;
    }

    function VialOfMotherEarth(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.elementalStats.ElementalAtk.EARTH_ATK = 10;
        
        _elixir.elementalStats.ElementalDef.EARTH_DEF = 10;
        

        _elixir.bonus.EleStatBonusPerTier = 10;


        _elixir.turnDuration = 2;
    }

    function PotionOfCharge(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.elementalStats.ElementalAtk.LIGHTNING_ATK = 10;
        
        _elixir.elementalStats.ElementalDef.LIGHTNING_DEF = 10;        

        _elixir.bonus.EleStatBonusPerTier = 10;

        _elixir.turnDuration = 2;
    }

    function ElixirOfFrosty(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.elementalStats.ElementalAtk.COLD_ATK = 10;
        
        _elixir.elementalStats.ElementalDef.COLD_DEF = 10;        

        _elixir.bonus.EleStatBonusPerTier = 10;

        _elixir.turnDuration = 2;
    }

    function DragonBreathPotion(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.elementalStats.ElementalAtk.FIRE_ATK = 10;
        
        _elixir.elementalStats.ElementalDef.FIRE_DEF = 10;
        
        _elixir.bonus.EleStatBonusPerTier = 10;

        _elixir.turnDuration = 2;
    }

    function VialOfSpirit(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.elementalStats.ElementalAtk.HOLY_ATK = 10;
        
        _elixir.elementalStats.ElementalDef.HOLY_DEF = 10;
        
        _elixir.bonus.EleStatBonusPerTier = 10;

        _elixir.turnDuration = 2;
    }

    function NightmareFlask(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.elementalStats.ElementalAtk.DARK_ATK = 10;
        
        _elixir.elementalStats.ElementalDef.DARK_DEF = 10;
        
        _elixir.bonus.EleStatBonusPerTier = 10;

        _elixir.turnDuration = 2;
    }

    function NihilityTonic(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.elementalStats.ElementalAtk.VOID_ATK = 10;
        
        _elixir.elementalStats.ElementalDef.VOID_DEF = 10;
        
        _elixir.bonus.EleStatBonusPerTier = 10;

        _elixir.turnDuration = 2;
    }

    function PhialOfGladiator(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.generatedStatBonus.P_ATK = 10;
        
        _elixir.generatedStatBonus.P_DEF = 10;
        
        _elixir.bonus.GenStatBonusPerTier = 10;

        _elixir.turnDuration = 2;
    }

    function PotionOfArchmage(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        
        _elixir.generatedStatBonus.M_ATK = 10;
        
        _elixir.generatedStatBonus.M_DEF = 10;
        
        _elixir.bonus.GenStatBonusPerTier = 10;

        _elixir.turnDuration = 2;
    }
}
