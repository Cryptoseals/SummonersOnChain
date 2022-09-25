import {CraftingMaterialReward, ItemReward, CraftingMaterial} from "../../Interfaces/GameObjects/IGameRewards.sol";
import {AdventureLevel, AdventureMonster} from "../../Interfaces/GameObjects/IAdventure.sol";
import {IMonster} from "../../Interfaces/GameObjects/IMonster.sol";
import {Element} from "../../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexArea11 {
    string constant public index = "Codex";
    string constant public class = "Area11";
    string constant public version = "0.0.1";

    function getAllLevels() external view returns (AdventureLevel[] memory){
        AdventureLevel[] memory result = new AdventureLevel[](20);
        for (uint i = 1; i <= 20; i++) {
            result[i-1] = adventureLevel(i);
        }
        return result;
    }

    function adventureLevel(uint level) public view returns (AdventureLevel memory) {

        if (level == 1) {return ElementalHall1();}
        else if (level == 2) {return ElementalHall2();}
        else if (level == 3) {return ElementalHall3();}
        else if (level == 4) {return ElementalHall4();}
        else if (level == 5) {return ElementalHall5();}
        else if (level == 6) {return ElementalHall6();}
        else if (level == 7) {return ElementalHall7();}
        else if (level == 8) {return ElementalHall8();}
        else if (level == 9) {return ElementalHall9();}
        else if (level == 10) {return ElementalHall10();}
        else if (level == 11) {return ElementalHall11();}
        else if (level == 12) {return ElementalHall12();}
        else if (level == 13) {return ElementalHall13();}
        else if (level == 14) {return ElementalHall14();}
        else if (level == 15) {return ElementalHall15();}
        else if (level == 16) {return ElementalHall16();}
        else if (level == 17) {return ElementalHall17();}
        else if (level == 18) {return ElementalHall18();}
        else if (level == 19) {return ElementalHall19();}
        else if (level == 20) {return ElementalHall20();}

        revert("invalid");
    }

    function ElementalHall1() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 1;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 55e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 4e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 6e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);

        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.TATTERED_LEATHER,
        min : 15,
        max : 22
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.JUTE,
        min : 15,
        max : 22
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.AMBER,
        min : 12,
        max : 18
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 1,
        level : 1
        });
    }

    function ElementalHall2() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 5;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 75e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 110e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 8e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);

        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RAGGED_LEATHER,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.WOOL,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.PEARL,
        min : 6,
        max : 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 2,
        level : 1
        });
    }

    function ElementalHall3() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 10;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 150e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 220e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);

        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RAGGED_LEATHER,
        min : 12,
        max : 18
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.WOOL,
        min : 13,
        max : 19
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.PEARL,
        min : 12,
        max : 17
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 3,
        level : 1
        });
    }

    function ElementalHall4() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 15;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 300e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 440e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 44e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RAW_LEATHER,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.COTTON,
        min : 9,
        max : 14
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.AMETHYST,
        min : 6,
        max : 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 4,
        level : 1
        });
    }

    function ElementalHall5() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 20;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 880e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 60e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 88e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);

        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RAW_LEATHER,
        min : 11,
        max : 16
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.COTTON,
        min : 11,
        max : 16
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.AMETHYST,
        min : 10,
        max : 15
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 5,
        level : 1
        });
    }

    function ElementalHall6() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 25;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1760e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 120e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 176e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.THIN_LEATHER,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.LINEN,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.CORAL,
        min : 6,
        max : 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 6,
        level : 1
        });
    }

    function ElementalHall7() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 30;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3520e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 240e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 352e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.THIN_LEATHER,
        min : 11,
        max : 16
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.LINEN,
        min : 11,
        max : 16
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.CORAL,
        min : 10,
        max : 15
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 7,
        level : 1
        });
    }

    function ElementalHall8() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 35;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7040e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 480e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 704e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.COARSE_LEATHER,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.SILK,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.RUBY,
        min : 6,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 8,
        level : 1
        });
    }

    function ElementalHall9() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 40;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14080e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 960e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1408e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.COARSE_LEATHER,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.SILK,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.RUBY,
        min : 8,
        max : 11
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 9,
        level : 1
        });
    }

    function ElementalHall10() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 45;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28160e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1920e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2816e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RUGGED_LEATHER,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.HEMP,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.TOPAZ,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 10,
        level : 1
        });


        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 10,
        level : 1
        });
    }

    function ElementalHall11() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 50;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 56320e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 3840e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 5632e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RUGGED_LEATHER,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.HEMP,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.TOPAZ,
        min : 8,
        max : 11
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 11,
        level : 1
        });
    }

    function ElementalHall12() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 55;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 76400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 112640e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 7640e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11264e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.THICK_LEATHER,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.CASHMERE,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.AZURITE,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](8);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.COLD,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.COLD,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[6] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[7] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 13,
        level : 1
        });
    }

    function ElementalHall13() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 60;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 153600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 225280e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15360e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22528e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.THICK_LEATHER,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.CASHMERE,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.AZURITE,
        min : 7,
        max : 10
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.COLD,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 13,
        level : 1
        });
    }

    function ElementalHall14() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 65;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 307200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 450560e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30720e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 45056e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.REINFORCED_LEATHER,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.VISCOSE,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.EMERALD,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](8);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.COLD,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.COLD,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[6] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[7] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 15,
        level : 1
        });
    }

    function ElementalHall15() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 70;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 614400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 901120e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 61440e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 90112e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.REINFORCED_LEATHER,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.VISCOSE,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.EMERALD,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](8);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.COLD,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.COLD,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[6] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[7] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 16,
        level : 1
        });
    }

    function ElementalHall16() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 75;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1228800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1802240e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 122880e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 180224e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.HARDENED_LEATHER,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.LYOCELL,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.SAPPHIRE,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](8);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.COLD,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.COLD,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[6] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[7] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 17,
        level : 1
        });
    }

    function ElementalHall17() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 80;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2457600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3607780e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 245760e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 360778e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.HARDENED_LEATHER,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.LYOCELL,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.SAPPHIRE,
        min : 6,
        max : 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](8);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.COLD,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.COLD,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[6] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[7] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 18,
        level : 1
        });
    }

    function ElementalHall18() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 85;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4915200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7208960e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 491520e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 720896e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.LORDLY_LEATHER,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.RAYON,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.DIAMOND,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](8);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.COLD,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.COLD,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[6] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[7] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 19,
        level : 1
        });
    }

    function ElementalHall19() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 90;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9830400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14417920e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 983040e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1441792e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.LORDLY_LEATHER,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.RAYON,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.DIAMOND,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](8);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.COLD,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.COLD,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[6] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[7] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 20,
        level : 1
        });
    }

    function ElementalHall20() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 95;
        _level.Difficulty = 150;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19660800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28835840e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1966080e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2883584e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.LORDLY_LEATHER,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.RAYON,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.DIAMOND,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.rewards = new ItemReward[](1);
        _level.Rewards.rewards.miscItemRewards.rewards[0] = ItemReward({
        itemId : 1,
        minAmount : 1,
        maxAmount : 3
        });
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = new AdventureMonster[](8);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.EARTH,
        monsterId : 21,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.LIGHTNING,
        monsterId : 21,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.COLD,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.COLD,
        monsterId : 21,
        level : 1
        });

        _level.MonsterList[6] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[7] = AdventureMonster({
        element : Element.FIRE,
        monsterId : 21,
        level : 1
        });
    }
}