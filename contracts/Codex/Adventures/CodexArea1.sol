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
        //        _level.Metadata.name = "Dark Forest Sub-Area 1";
        _level.MonsterLevel = 1;

        //        _level.Difficulty = 0; // 0-100 is same. 101 means 1% boost to stats. 200 means 2x monster stats.

        // defining loot pool boolean values for gold
        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 5e18;

        // defining loot pool boolean values for essence
        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 5e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 10e18;

        // crafting mats
        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        // example:
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.COPPER,
        min : 1,
        max : 5
        });
        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.IRON,
        min : 1,
        max : 5
        });


        // misc item reward
        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        // defining monsters in this area
        _level.MonsterList = new IAdventure.AdventureMonster[](1);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.PHYSICAL,
        monsterId : 1,
        level : 1
        });
    }
}
