import "../../Interfaces/GameObjects/IMonster.sol";
import "../../Interfaces/GameObjects/IAdventure.sol";
pragma solidity ^0.8.0;

contract CodexArea4 {
    string constant public index = "Codex";
    string constant public class = "Area4";
    string constant public version = "0.0.1";

    function getAllLevels() external view returns (IAdventure.AdventureLevel[] memory){
        IAdventure.AdventureLevel[] memory result = new IAdventure.AdventureLevel[](20);
        for (uint i = 1; i < 20; i++) {
            result[i-1] = adventureLevel(i);
        }
        return result;
    }

    function adventureLevel(uint level) public view returns (IAdventure.AdventureLevel memory) {

        if (level == 1) {return AshenDominion1();}
        else if (level == 2) {return AshenDominion2();}
        else if (level == 3) {return AshenDominion3();}
        else if (level == 4) {return AshenDominion4();}
        else if (level == 5) {return AshenDominion5();}
        else if (level == 6) {return AshenDominion6();}
        else if (level == 7) {return AshenDominion7();}
        else if (level == 8) {return AshenDominion8();}
        else if (level == 9) {return AshenDominion9();}
        else if (level == 10) {return AshenDominion10();}
        else if (level == 11) {return AshenDominion11();}
        else if (level == 12) {return AshenDominion12();}
        else if (level == 13) {return AshenDominion13();}
        else if (level == 14) {return AshenDominion14();}
        else if (level == 15) {return AshenDominion15();}
        else if (level == 16) {return AshenDominion16();}
        else if (level == 17) {return AshenDominion17();}
        else if (level == 18) {return AshenDominion18();}
        else if (level == 19) {return AshenDominion19();}
        else if (level == 20) {return AshenDominion20();}

        revert("invalid");
    }

    function AshenDominion1() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 1;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 55e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 4e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 6e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](1);

        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.JUTE,
        min : 15,
        max : 22
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 2,
        level : 1
        });
    }

    function AshenDominion2() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 5;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 75e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 110e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 8e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.WOOL,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.JUTE,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 3,
        level : 1
        });
    }

    function AshenDominion3() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 10;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 150e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 220e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.WOOL,
        min : 13,
        max : 19
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.JUTE,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 4,
        level : 1
        });
    }

    function AshenDominion4() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 15;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 300e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 440e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 44e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.COTTON,
        min : 9,
        max : 14
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.WOOL,
        min : 8,
        max : 11
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 5,
        level : 1
        });
    }

    function AshenDominion5() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 20;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 880e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 60e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 88e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.COTTON,
        min : 11,
        max : 16
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.WOOL,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 6,
        level : 1
        });
    }

    function AshenDominion6() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 25;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1760e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 120e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 176e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LINEN,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.COTTON,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 7,
        level : 1
        });
    }

    function AshenDominion7() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 30;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3520e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 240e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 352e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LINEN,
        min : 11,
        max : 16
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.COTTON,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 8,
        level : 1
        });
    }

    function AshenDominion8() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 35;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7040e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 480e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 704e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SILK,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LINEN,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 9,
        level : 1
        });
    }

    function AshenDominion9() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 40;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14080e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 960e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1408e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SILK,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LINEN,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 10,
        level : 1
        });
    }

    function AshenDominion10() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 45;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28160e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1920e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2816e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.HEMP,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SILK,
        min : 6,
        max : 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 11,
        level : 1
        });
    }

    function AshenDominion11() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 50;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 56320e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 3840e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 5632e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.HEMP,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.SILK,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 12,
        level : 1
        });
    }

    function AshenDominion12() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 55;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 76400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 112640e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 7640e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11264e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.CASHMERE,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.HEMP,
        min : 6,
        max : 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 13,
        level : 1
        });
    }

    function AshenDominion13() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 60;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 153600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 225280e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15360e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22528e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.CASHMERE,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.HEMP,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 14,
        level : 1
        });
    }

    function AshenDominion14() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 65;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 307200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 450560e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30720e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 45056e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.VISCOSE,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.CASHMERE,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 15,
        level : 1
        });
    }

    function AshenDominion15() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 70;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 614400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 901120e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 61440e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 90112e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.VISCOSE,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.CASHMERE,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 16,
        level : 1
        });
    }

    function AshenDominion16() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 75;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1228800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1802240e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 122880e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 180224e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LYOCELL,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.VISCOSE,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 17,
        level : 1
        });
    }

    function AshenDominion17() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 80;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2457600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3607780e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 245760e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 360778e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LYOCELL,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.VISCOSE,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 18,
        level : 1
        });
    }

    function AshenDominion18() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 85;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4915200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7208960e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 491520e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 720896e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.RAYON,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LYOCELL,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 19,
        level : 1
        });
    }

    function AshenDominion19() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 90;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9830400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14417920e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 983040e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1441792e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.RAYON,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LYOCELL,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 20,
        level : 1
        });
    }

    function AshenDominion20() public view returns (IAdventure.AdventureLevel memory _level) {
        _level.MonsterLevel = 95;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19660800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28835840e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1966080e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2883584e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new IGameRewards.CraftingMaterialReward[](2);
        _level.CurrencyRewards.materials[0] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.RAYON,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[1] = IGameRewards.CraftingMaterialReward({
        material : ICraftingMaterials.CraftingMaterial.LYOCELL,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new IGameRewards.MiscItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = IGameRewards.MiscItemReward({
        miscType : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new IAdventure.AdventureMonster[](2);
        _level.MonsterList[0] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[1] = IAdventure.AdventureMonster({
        element : GameObjects.Element.HOLY,
        monsterId : 21,
        level : 1
        });
    }
}