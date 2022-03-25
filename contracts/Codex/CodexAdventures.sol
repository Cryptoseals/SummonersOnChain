import "../Interfaces/GameObjects/IAdventure.sol";

pragma solidity ^0.8.0;

contract CodexAdventures {
    string constant public index = "Codex";
    string constant public class = "Adventures";
    string constant public version = "0.0.1";

    function adventure(uint _id, uint difficulty) public pure returns (IAdventure.AdventureLevel memory) {
        if (_id == 1) {
            return DummyAdventure(difficulty);
        }

        revert("invalid");
    }

    function DummyAdventure(uint difficulty) public pure returns (IAdventure.AdventureLevel memory _adventure) {
        _adventure.Metadata.name = "First Level";
        _adventure.Metadata.description = "First Level is very easy.";

        _adventure.Monster.damageType = GameObjects.Element.FIRE;

        _adventure.Monster.EnemyElementalStats.ElementalAtk = GameObjects.ElementalAtk({FIRE_ATK : 1, COLD_ATK : 1, EARTH_ATK : 1, LIGHTNING_ATK : 1, DARK_ATK : 1, HOLY_ATK : 1, VOID_ATK : 1});
        _adventure.Monster.EnemyElementalStats.ElementalDef = GameObjects.ElementalDef({FIRE_DEF : 1, COLD_DEF : 1, EARTH_DEF : 1, LIGHTNING_DEF : 1, DARK_DEF : 1, HOLY_DEF : 1, VOID_DEF : 1});
        _adventure.Monster.EnemyGeneratedStats = GameObjects.GeneratedStats({HP : 0, P_ATK : 0, M_ATK : 0, P_DEF : 0, M_DEF : 0, ACCURACY : 0, DODGE : 0, CRIT : 0, CRIT_MULTIPLIER : 0, INFUSION : 0});
        _adventure.Monster.EnemyStats = GameObjects.Stats({STR : 0, AGI : 0, INT : 0, DEX : 0, VIT : 0, LUCK : 0});

        _adventure.Requirements.statRequirement = GameObjects.Stats({STR : 0, AGI : 0, INT : 0, DEX : 0, VIT : 0, LUCK : 0});
        _adventure.Requirements.level = 1;
        _adventure.Requirements.classRequirement = new GameObjects.Class[](0); // means every class can play

        _adventure.Rewards.pool.yieldsGold = true;
        _adventure.Rewards.rewards.goldRewards.minAmount = 50e18;
        _adventure.Rewards.rewards.goldRewards.minAmount = 100e18;
    }
}
