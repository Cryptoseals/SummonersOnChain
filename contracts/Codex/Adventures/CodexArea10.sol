import {CraftingMaterialReward, ItemReward, CraftingMaterial} from "../../Interfaces/GameObjects/IGameRewards.sol";
import {AdventureLevel, AdventureMonster} from "../../Interfaces/GameObjects/IAdventure.sol";
import {IMonster} from "../../Interfaces/GameObjects/IMonster.sol";
import {Element} from "../../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexArea10 {
    string constant public index = "Codex";
    string constant public class = "Area10";
    string constant public version = "0.0.1";

    function getAllLevels() external view returns (AdventureLevel[] memory){
        AdventureLevel[] memory result = new AdventureLevel[](20);
        for (uint i = 1; i <= 20; i++) {
            result[i-1] = adventureLevel(i);
        }
        return result;
    }

    function adventureLevel(uint level) public view returns (AdventureLevel memory) {

        if (level == 1) {return DivineBattlefield1();}
        else if (level == 2) {return DivineBattlefield2();}
        else if (level == 3) {return DivineBattlefield3();}
        else if (level == 4) {return DivineBattlefield4();}
        else if (level == 5) {return DivineBattlefield5();}
        else if (level == 6) {return DivineBattlefield6();}
        else if (level == 7) {return DivineBattlefield7();}
        else if (level == 8) {return DivineBattlefield8();}
        else if (level == 9) {return DivineBattlefield9();}
        else if (level == 10) {return DivineBattlefield10();}
        else if (level == 11) {return DivineBattlefield11();}
        else if (level == 12) {return DivineBattlefield12();}
        else if (level == 13) {return DivineBattlefield13();}
        else if (level == 14) {return DivineBattlefield14();}
        else if (level == 15) {return DivineBattlefield15();}
        else if (level == 16) {return DivineBattlefield16();}
        else if (level == 17) {return DivineBattlefield17();}
        else if (level == 18) {return DivineBattlefield18();}
        else if (level == 19) {return DivineBattlefield19();}
        else if (level == 20) {return DivineBattlefield20();}

        revert("invalid");
    }

    function DivineBattlefield1() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 1;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 55e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 4e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 6e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.GREEN_WOOD,
        min : 12,
        max : 17
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.COPPER,
        min : 24,
        max : 36
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.TATTERED_LEATHER,
        min : 15,
        max : 22
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(3);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.VOID,
        monsterId : 1,
        level : 1
        });
    }

    function DivineBattlefield2() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 5;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 75e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 110e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 8e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.SOFT_WOOD,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.TIN,
        min : 12,
        max : 17
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.RAGGED_LEATHER,
        min : 7,
        max : 10
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(3);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.VOID,
        monsterId : 2,
        level : 1
        });
    }

    function DivineBattlefield3() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 10;
        _level.Difficulty = 120;
        
        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 150e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 220e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.SOFT_WOOD,
        min : 9,
        max : 14
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.TIN,
        min : 18,
        max : 27
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.RAGGED_LEATHER,
        min : 12,
        max : 18
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(3);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.VOID,
        monsterId : 3,
        level : 1
        });
    }

    function DivineBattlefield4() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 15;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 300e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 440e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 44e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.AGED_WOOD,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.IRON,
        min : 11,
        max : 16
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.RAW_LEATHER,
        min : 8,
        max : 11
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(3);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.VOID,
        monsterId : 4,
        level : 1
        });
    }

    function DivineBattlefield5() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 20;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 880e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 60e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 88e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.AGED_WOOD,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.IRON,
        min : 17,
        max : 25
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.RAW_LEATHER,
        min : 11,
        max : 16
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(3);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.VOID,
        monsterId : 5,
        level : 1
        });
    }

    function DivineBattlefield6() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 25;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1760e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 120e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 176e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.HARD_WOOD,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.SILVER,
        min : 10,
        max : 15
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.THIN_LEATHER,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 7,
        level : 1
        });
    }

    function DivineBattlefield7() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 30;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3520e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 240e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 352e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.HARD_WOOD,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.SILVER,
        min : 17,
        max : 25
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.THIN_LEATHER,
        min : 11,
        max : 16
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 8,
        level : 1
        });
    }

    function DivineBattlefield8() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 35;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7040e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 480e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 704e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.PETRIFIED_WOOD,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.GOLD,
        min : 10,
        max : 15
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.COARSE_LEATHER,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 9,
        level : 1
        });
    }

    function DivineBattlefield9() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 40;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14080e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 960e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1408e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.PETRIFIED_WOOD,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.GOLD,
        min : 12,
        max : 18
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.COARSE_LEATHER,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 10,
        level : 1
        });
    }

    function DivineBattlefield10() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 45;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28160e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1920e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2816e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RED_OAK_WOOD,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.PLATINUM,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.RUGGED_LEATHER,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 11,
        level : 1
        });
    }

    function DivineBattlefield11() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 50;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 56320e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 3840e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 5632e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RED_OAK_WOOD,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.PLATINUM,
        min : 13,
        max : 19
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.RUGGED_LEATHER,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 12,
        level : 1
        });
    }

    function DivineBattlefield12() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 55;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 76400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 112640e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 7640e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11264e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.ELDER_WOOD,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.MYTHRIL,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.THICK_LEATHER,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 13,
        level : 1
        });
    }

    function DivineBattlefield13() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 60;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 153600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 225280e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15360e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22528e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.ELDER_WOOD,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.MYTHRIL,
        min : 12,
        max : 17
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.THICK_LEATHER,
        min : 7,
        max : 10
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 14,
        level : 1
        });
    }

    function DivineBattlefield14() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 65;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 307200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 450560e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30720e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 45056e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.ANCIENT_WOOD,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.ORICALCHUM,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.REINFORCED_LEATHER,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 15,
        level : 1
        });
    }

    function DivineBattlefield15() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 70;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 614400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 901120e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 61440e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 90112e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.ANCIENT_WOOD,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.ORICALCHUM,
        min : 11,
        max : 16
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.REINFORCED_LEATHER,
        min : 7,
        max : 10
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 16,
        level : 1
        });
    }

    function DivineBattlefield16() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 75;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1228800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1802240e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 122880e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 180224e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.EBONY_WOOD,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.OBSIDIAN,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.HARDENED_LEATHER,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 17,
        level : 1
        });
    }

    function DivineBattlefield17() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 80;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2457600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3607780e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 245760e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 360778e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.EBONY_WOOD,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.OBSIDIAN,
        min : 9,
        max : 14
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.HARDENED_LEATHER,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 18,
        level : 1
        });
    }

    function DivineBattlefield18() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 85;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4915200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7208960e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 491520e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 720896e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.SNAKEWOOD,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.LUMINITE,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.LORDLY_LEATHER,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 19,
        level : 1
        });
    }

    function DivineBattlefield19() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 90;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9830400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14417920e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 983040e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1441792e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.SNAKEWOOD,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.LUMINITE,
        min : 8,
        max : 11
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.LORDLY_LEATHER,
        min : 6,
        max : 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 20,
        level : 1
        });
    }

    function DivineBattlefield20() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 95;
        _level.Difficulty = 120;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19660800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28835840e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1966080e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2883584e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(3);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.SNAKEWOOD,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.LUMINITE,
        min : 10,
        max : 15
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.LORDLY_LEATHER,
        min : 7,
        max : 10
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(6);
        _level.MonsterList[0] = AdventureMonster({
        element : Element.DARK,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.DARK,
        monsterId : 21,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.HOLY,
        monsterId : 21,
        level : 1
        });

        _level.MonsterList[4] = AdventureMonster({
        element : Element.VOID,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[5] = AdventureMonster({
        element : Element.VOID,
        monsterId : 21,
        level : 1
        });
    }

    
    function generateAdventureMonsterArray(uint256 len)
        public
        pure
        returns (AdventureMonster[] memory)
    {
        return new AdventureMonster[](len);
    }

    function generateMaterialArray(uint256 len)
        public
        pure
        returns (CraftingMaterialReward[] memory)
    {
        return new CraftingMaterialReward[](len);
    }
}