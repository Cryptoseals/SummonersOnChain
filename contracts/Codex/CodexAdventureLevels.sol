import "../Interfaces/GameObjects/IMonster.sol";
import "../Interfaces/GameObjects/IAdventure.sol";
pragma solidity ^0.8.0;

contract CodexAdventureLevels {
    string constant public index = "Codex";
    string constant public class = "AdventureLevels";
    string constant public version = "0.0.1";

    function adventureLevel(uint area_id, uint difficulty) public view returns (IAdventure.AdventureLevel memory) {
        if (area_id == 1) {
            return DarkForest1(difficulty);
        }

        revert("invalid");
    }

    function DarkForest1(uint difficulty) public view returns (IAdventure.AdventureLevel memory _level) {
        _level.Metadata.name = "Dark Forest Sub-Area 1";

        // defining loot pool boolean values
        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.pool.yieldsGold = true;


        // define specific loots

        // min - max amount of drop.
        _level.Rewards.rewards.miscItemRewards.minAmount = 2;
        _level.Rewards.rewards.miscItemRewards.maxAmount = 2;
        // id of misc item from misc item codex
        _level.Rewards.rewards.miscItemRewards.miscType = 1;
        // gold reward min-max example
        _level.Rewards.rewards.goldRewards.maxAmount = 10;
        _level.Rewards.rewards.goldRewards.minAmount = 3;

        // defining monsters in this area
        _level.MonsterList = new IAdventure.AdventureMonster[](4);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.PHYSICAL,
        monsterId: 1
        });

    }
}
