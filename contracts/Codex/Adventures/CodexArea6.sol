import {IAdventure, GameObjects, IGameRewards, ICraftingMaterials} from "../../Interfaces/GameObjects/IAdventure.sol";
import {IMonster} from "../../Interfaces/GameObjects/IMonster.sol";
pragma solidity ^0.8.0;

contract CodexArea6 {
    string constant public index = "Codex";
    string constant public class = "Area6";
    string constant public version = "0.0.1";

    function getAllLevels() external view returns (IAdventure.AdventureLevel[] memory){
        IAdventure.AdventureLevel[] memory result = new IAdventure.AdventureLevel[](20);
        for (uint i = 1; i <= 20; i++) {
            result[i-1] = adventureLevel(i);
        }
        return result;
    }

    function adventureLevel(uint level) public view returns (IAdventure.AdventureLevel memory) {

        if (level == 1) {return Mistlands1();}
        else if (level == 2) {return Mistlands2();}
        else if (level == 3) {return Mistlands3();}
        else if (level == 4) {return Mistlands4();}
        else if (level == 5) {return Mistlands5();}
        else if (level == 6) {return Mistlands6();}
        else if (level == 7) {return Mistlands7();}
        else if (level == 8) {return Mistlands8();}
        else if (level == 9) {return Mistlands9();}
        else if (level == 10) {return Mistlands10();}
        else if (level == 11) {return Mistlands11();}
        else if (level == 12) {return Mistlands12();}
        else if (level == 13) {return Mistlands13();}
        else if (level == 14) {return Mistlands14();}
        else if (level == 15) {return Mistlands15();}
        else if (level == 16) {return Mistlands16();}
        else if (level == 17) {return Mistlands17();}
        else if (level == 18) {return Mistlands18();}
        else if (level == 19) {return Mistlands19();}
        else if (level == 20) {return Mistlands20();}

        revert("invalid");
    }

    function Mistlands1() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 1;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 55e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 4e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 6e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);

        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AMBER,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.COPPER,
        min : 12,
        max : 18
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 2,
        level : 1
        });
    }

    function Mistlands2() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 5;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 75e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 110e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 8e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.PEARL,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AMBER,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.TIN,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.COPPER,
        min : 7,
        max : 10
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 3,
        level : 1
        });
    }

    function Mistlands3() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 10;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 150e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 220e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.PEARL,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AMBER,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.TIN,
        min : 9,
        max : 14
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.COPPER,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 4,
        level : 1
        });
    }

    function Mistlands4() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 15;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 300e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 440e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 44e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AMETHYST,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.PEARL,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.IRON,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.TIN,
        min : 6,
        max : 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 5,
        level : 1
        });
    }

    function Mistlands5() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 20;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 880e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 60e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 88e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AMETHYST,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.PEARL,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.IRON,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.TIN,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 6,
        level : 1
        });
    }

    function Mistlands6() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 25;
        _level.Difficulty = 100;


        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1760e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 120e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 176e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.CORAL,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AMETHYST,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SILVER,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.IRON,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 7,
        level : 1
        });
    }

    function Mistlands7() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 30;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3520e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 240e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 352e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.CORAL,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AMETHYST,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SILVER,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.IRON,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 8,
        level : 1
        });
    }

    function Mistlands8() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 35;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7040e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 480e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 704e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.RUBY,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.CORAL,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.GOLD,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SILVER,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 9,
        level : 1
        });
    }

    function Mistlands9() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 40;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14080e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 960e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1408e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.RUBY,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.CORAL,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.GOLD,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SILVER,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 10,
        level : 1
        });
    }

    function Mistlands10() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 45;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28160e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1920e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2816e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.TOPAZ,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.RUBY,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.PLATINUM,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.GOLD,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 11,
        level : 1
        });
    }

    function Mistlands11() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 50;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 56320e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 3840e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 5632e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.TOPAZ,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.RUBY,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.PLATINUM,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.GOLD,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 12,
        level : 1
        });
    }

    function Mistlands12() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 55;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 76400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 112640e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 7640e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11264e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AZURITE,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.TOPAZ,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.MYTHRIL,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.PLATINUM,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 13,
        level : 1
        });
    }

    function Mistlands13() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 60;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 153600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 225280e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15360e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22528e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AZURITE,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.TOPAZ,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.MYTHRIL,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.PLATINUM,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 14,
        level : 1
        });
    }

    function Mistlands14() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 65;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 307200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 450560e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30720e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 45056e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.EMERALD,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AZURITE,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.ORICALCHUM,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.MYTHRIL,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 15,
        level : 1
        });
    }

    function Mistlands15() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 70;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 614400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 901120e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 61440e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 90112e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.EMERALD,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.AZURITE,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.ORICALCHUM,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.MYTHRIL,
        min : 2,
        max : 3
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 16,
        level : 1
        });
    }

    function Mistlands16() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 75;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1228800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1802240e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 122880e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 180224e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SAPPHIRE,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.EMERALD,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.ORICALCHUM,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 17,
        level : 1
        });
    }

    function Mistlands17() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 80;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2457600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3607780e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 245760e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 360778e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SAPPHIRE,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.EMERALD,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.ORICALCHUM,
        min : 2,
        max : 3
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 18,
        level : 1
        });
    }

    function Mistlands18() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 85;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4915200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7208960e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 491520e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 720896e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.DIAMOND,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SAPPHIRE,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LUMINITE,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 19,
        level : 1
        });
    }

    function Mistlands19() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 90;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9830400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14417920e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 983040e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1441792e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.DIAMOND,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SAPPHIRE,
        min : 1,
        max : 2
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LUMINITE,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN,
        min : 2,
        max : 3
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 20,
        level : 1
        });
    }

    function Mistlands20() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 95;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19660800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28835840e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1966080e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2883584e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.DIAMOND,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SAPPHIRE,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LUMINITE,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.OBSIDIAN,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](4);

        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.VOID,
        monsterId : 21,
        level : 1
        });

        _level.MonsterList[2] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[3] = IAdventure.AdventureMonster({
        element : GameObjects.Element.ARCANE,
        monsterId : 21,
        level : 1
        });
    }
}