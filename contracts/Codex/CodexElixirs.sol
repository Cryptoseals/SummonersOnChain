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
        _elixir.metadata.id = 1;
        _elixir.metadata.baseType = GameObjects.ItemType.ELIXIR;
        _elixir.metadata.name = "Dummy Elixir";
        _elixir.metadata.description = "Dummy Elixir is best elixir";
        _elixir.metadata.upgradable = true;

        _elixir.requirement.level = 1;
        _elixir.requirement.classRequirement = new GameObjects.Class[](0);
        _elixir.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _elixir.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _elixir.generatedStatBonus = GameObjects.GeneratedStats({HP : 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION: 0});
    }
}
