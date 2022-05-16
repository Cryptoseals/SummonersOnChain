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

        // defining loot pool boolean values
        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 5e18;
        // defining loot pool boolean values
        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 5e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 10e18;
        // crafting mats
        _level.CurrencyRewards.craftingMaterialRewards.materialIds = new ICraftingMaterials.CraftingMaterial[](3);
        // example:
        _level.CurrencyRewards.craftingMaterialRewards.materialIds[0] = ICraftingMaterials.CraftingMaterial.COPPER;
        _level.CurrencyRewards.craftingMaterialRewards.materialIds[1] = ICraftingMaterials.CraftingMaterial.SILVER;
        _level.CurrencyRewards.craftingMaterialRewards.materialIds[2] = ICraftingMaterials.CraftingMaterial.IRON;

        _level.CurrencyRewards.craftingMaterialRewards.min = new uint[](3);
        _level.CurrencyRewards.craftingMaterialRewards.min[0] = 1;
        _level.CurrencyRewards.craftingMaterialRewards.min[1] = 1;
        _level.CurrencyRewards.craftingMaterialRewards.min[2] = 5;


        _level.CurrencyRewards.craftingMaterialRewards.max = new uint[](3);
        _level.CurrencyRewards.craftingMaterialRewards.max[0] = 10;
        _level.CurrencyRewards.craftingMaterialRewards.max[1] = 10;
        _level.CurrencyRewards.craftingMaterialRewards.max[2] = 15;


        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 0,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;


        // defining monsters in this area
        _level.MonsterList = new IAdventure.AdventureMonster[](1);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.PHYSICAL,
        monsterId : 1
        });
    }
}
