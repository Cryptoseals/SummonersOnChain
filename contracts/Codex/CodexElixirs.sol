import "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexElixirs {
    string constant public index = "Codex";
    string constant public class = "Elixirs";
    string constant public version = "0.0.1";

    function elixir(uint _id, uint _tier) public pure returns (GameObjects.Elixir memory) {
        if (_id == 1) {
            return DummyElixir(_tier);
        }

        revert("invalid");
    }

    function DummyElixir(uint tier) public pure returns (GameObjects.Elixir memory _elixir) {
        // value is percentage
        _elixir.statBonus.STR = 5;
        //        _elixir.statBonus.AGI = 5;
        //        _elixir.statBonus.DEX = 5;
        //        _elixir.statBonus.INT = 5;
        //        _elixir.statBonus.VIT = 5;
        //        _elixir.statBonus.LUCK = 5;

        _elixir.generatedStatBonus.HP = 5;
        //        _elixir.generatedStatBonus.P_DEF;
        //        _elixir.generatedStatBonus.M_DEF;
        //        _elixir.generatedStatBonus.P_ATK;
        //        _elixir.generatedStatBonus.M_ATK;
        //        _elixir.generatedStatBonus.CRIT;
        //        _elixir.generatedStatBonus.CRIT_MULTIPLIER;
        //        _elixir.generatedStatBonus.DODGE;
        //        _elixir.generatedStatBonus.ACCURACY;
        //        _elixir.generatedStatBonus.INFUSION;

        _elixir.elementalStats.ElementalAtk.DARK_ATK = 5;


        _elixir.elementalStats.ElementalDef.DARK_DEF = 5;

        _elixir.bonus.BonusEXPPercentage = 5;
        _elixir.bonus.BonusGoldPercentage = 5;
        _elixir.bonus.BonusEssencePercentage = 5;
        _elixir.bonus.BonusMaterialPercentage = 5;
    }
}
