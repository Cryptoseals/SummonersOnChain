import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/GameObjects/IAdventure.sol";
pragma solidity ^0.8.0;

contract CodexArea1 {
    string constant public index = "Codex";
    string constant public class = "Area1";
    string constant public version = "0.0.1";

    function adventureLevel(uint level) public view returns (IAdventure.AdventureLevel memory) {
        if (level == 1) {
            return DarkForest1();
        }
        revert("invalid");
    }

    function DarkForest1() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.Metadata.name = "Dark Forest Sub-Area 1";

        // defining loot pool boolean values
        _level.Rewards.pool.yieldsGold = true;
        _level.Rewards.rewards.goldRewards.minAmount = 1e18;
        _level.Rewards.rewards.goldRewards.minAmount = 5e18;
        _level.MonsterLevel = 1;

        // defining monsters in this area
        _level.MonsterList = new IAdventure.AdventureMonster[](1);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.PHYSICAL,
        monsterId: 1
        });
    }
}