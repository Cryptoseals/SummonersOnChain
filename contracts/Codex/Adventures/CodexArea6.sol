import {CraftingMaterialReward, ItemReward, CraftingMaterial} from "../../Interfaces/GameObjects/IGameRewards.sol";
import {AdventureLevel, AdventureMonster} from "../../Interfaces/GameObjects/IAdventure.sol";
import {IMonster} from "../../Interfaces/GameObjects/IMonster.sol";
import {Element} from "../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexArea6 {
    string constant public index = "Codex";
    string constant public class = "Area6";
    string constant public version = "0.0.1";

    function getAllLevels() external view returns (AdventureLevel[] memory){
        AdventureLevel[] memory result = new AdventureLevel[](20);
        for (uint i = 1; i <= 20; i++) {
            result[i-1] = adventureLevel(i);
        }
        return result;
    }

    function adventureLevel(uint level) public view returns (AdventureLevel memory) {

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

    function Mistlands1() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 1;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 135e17;
        _level.CurrencyRewards.goldRewards.maxAmount = 165e17;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 9e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](2);

        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.AMBER,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.COPPER,
        min : 12,
        max : 18
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 40;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 1,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 2,
        level : 1
        });
    }

    function Mistlands2() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 5;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 18e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 22e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 18e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.PEARL,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.AMBER,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.TIN,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.COPPER,
        min : 7,
        max : 10
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 41;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 2,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 3,
        level : 1
        });
    }

    function Mistlands3() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 10;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 27e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 33e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 27e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 33e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.PEARL,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.AMBER,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.TIN,
        min : 9,
        max : 14
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.COPPER,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 42;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 3,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 4,
        level : 1
        });
    }

    function Mistlands4() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 15;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 36e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 44e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 36e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 44e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.AMETHYST,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.PEARL,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.IRON,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.TIN,
        min : 6,
        max : 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 43;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 4,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 5,
        level : 1
        });
    }

    function Mistlands5() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 20;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 45e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 55e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 45e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 55e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.AMETHYST,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.PEARL,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.IRON,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.TIN,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 44;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 5,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 6,
        level : 1
        });
    }

    function Mistlands6() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 25;
        _level.Difficulty = 100;


        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 54e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 66e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 54e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 66e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.CORAL,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.AMETHYST,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.SILVER,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.IRON,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 45;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 6,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 7,
        level : 1
        });
    }

    function Mistlands7() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 30;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 72e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 88e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 72e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 88e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.CORAL,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.AMETHYST,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.SILVER,
        min : 9,
        max : 13
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.IRON,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 46;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 7,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 8,
        level : 1
        });
    }

    function Mistlands8() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 35;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 90e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 110e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 9e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RUBY,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.CORAL,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.GOLD,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.SILVER,
        min : 6,
        max : 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 47;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 8,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 9,
        level : 1
        });
    }

    function Mistlands9() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 40;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 117e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 143e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 117e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 143e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.RUBY,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.CORAL,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.GOLD,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.SILVER,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 48;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 9,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 10,
        level : 1
        });
    }

    function Mistlands10() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 45;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 135e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 165e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 135e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 165e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.TOPAZ,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.RUBY,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.PLATINUM,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.GOLD,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 49;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 10,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 11,
        level : 1
        });
    }

    function Mistlands11() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 50;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 180e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 220e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 18e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.TOPAZ,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.RUBY,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.PLATINUM,
        min : 7,
        max : 10
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.GOLD,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 11,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 12,
        level : 1
        });
    }

    function Mistlands12() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 55;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 225e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 275e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 225e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 275e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.AZURITE,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.TOPAZ,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.MYTHRIL,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.PLATINUM,
        min : 5,
        max : 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 51;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 12,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 13,
        level : 1
        });
    }

    function Mistlands13() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 60;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 252e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 308e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 252e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 308e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.AZURITE,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.TOPAZ,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.MYTHRIL,
        min : 6,
        max : 9
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.PLATINUM,
        min : 3,
        max : 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 52;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 13,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 14,
        level : 1
        });
    }

    function Mistlands14() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 65;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 288e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 352e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 288e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 352e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.EMERALD,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.AZURITE,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.ORICALCHUM,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.MYTHRIL,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 53;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 14,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 15,
        level : 1
        });
    }

    function Mistlands15() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 70;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 324e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 396e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 324e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 396e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.EMERALD,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.AZURITE,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.ORICALCHUM,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.MYTHRIL,
        min : 2,
        max : 3
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 54;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 15,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 16,
        level : 1
        });
    }

    function Mistlands16() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 75;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 378e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 462e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 378e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 462e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.SAPPHIRE,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.EMERALD,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.OBSIDIAN,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.ORICALCHUM,
        min : 4,
        max : 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 55;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 16,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 17,
        level : 1
        });
    }

    function Mistlands17() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 80;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 414e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 506e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 414e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 506e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.SAPPHIRE,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.EMERALD,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.OBSIDIAN,
        min : 5,
        max : 7
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.ORICALCHUM,
        min : 2,
        max : 3
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 56;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 17,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 18,
        level : 1
        });
    }

    function Mistlands18() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 85;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 468e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 572e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 468e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 572e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.DIAMOND,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.SAPPHIRE,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.LUMINITE,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.OBSIDIAN,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 57;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 18,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 19,
        level : 1
        });
    }

    function Mistlands19() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 90;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 495e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 605e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 495e17;
        _level.CurrencyRewards.essenceRewards.maxAmount = 605e17;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.DIAMOND,
        min : 3,
        max : 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.SAPPHIRE,
        min : 1,
        max : 2
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.LUMINITE,
        min : 4,
        max : 6
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.OBSIDIAN,
        min : 2,
        max : 3
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 58;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 19,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 20,
        level : 1
        });
    }

    function Mistlands20() public view returns (AdventureLevel memory _level) {
        _level.MonsterLevel = 95;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 540e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 660e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 54e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 66e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = new CraftingMaterialReward[](4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
        material : CraftingMaterial.DIAMOND,
        min : 3,
        max : 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
        material : CraftingMaterial.SAPPHIRE,
        min : 2,
        max : 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
        material : CraftingMaterial.LUMINITE,
        min : 6,
        max : 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
        material : CraftingMaterial.OBSIDIAN,
        min : 3,
        max : 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 59;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
        element : Element.VOID,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[1] = AdventureMonster({
        element : Element.VOID,
        monsterId : 21,
        level : 1
        });

        _level.MonsterList[2] = AdventureMonster({
        element : Element.ARCANE,
        monsterId : 20,
        level : 1
        });

        _level.MonsterList[3] = AdventureMonster({
        element : Element.ARCANE,
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