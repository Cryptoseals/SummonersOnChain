import {CraftingMaterialReward, ItemReward, CraftingMaterial} from "../../Interfaces/GameObjects/IGameRewards.sol";
import {AdventureLevel, AdventureMonster} from "../../Interfaces/GameObjects/IAdventure.sol";
import {IMonster} from "../../Interfaces/GameObjects/IMonster.sol";
import {Element} from "../../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexArea8 {
    string public constant index = "Codex";
    string public constant class = "Area8";
    string public constant version = "0.0.1";

    function getAllLevels() external view returns (AdventureLevel[] memory) {
        AdventureLevel[] memory result = new AdventureLevel[](20);
        for (uint256 i = 1; i <= 20; i++) {
            result[i - 1] = adventureLevel(i);
        }
        return result;
    }

    function adventureLevel(uint256 level)
        public
        view
        returns (AdventureLevel memory)
    {
        if (level == 1) {
            return SacredGrounds1();
        } else if (level == 2) {
            return SacredGrounds2();
        } else if (level == 3) {
            return SacredGrounds3();
        } else if (level == 4) {
            return SacredGrounds4();
        } else if (level == 5) {
            return SacredGrounds5();
        } else if (level == 6) {
            return SacredGrounds6();
        } else if (level == 7) {
            return SacredGrounds7();
        } else if (level == 8) {
            return SacredGrounds8();
        } else if (level == 9) {
            return SacredGrounds9();
        } else if (level == 10) {
            return SacredGrounds10();
        } else if (level == 11) {
            return SacredGrounds11();
        } else if (level == 12) {
            return SacredGrounds12();
        } else if (level == 13) {
            return SacredGrounds13();
        } else if (level == 14) {
            return SacredGrounds14();
        } else if (level == 15) {
            return SacredGrounds15();
        } else if (level == 16) {
            return SacredGrounds16();
        } else if (level == 17) {
            return SacredGrounds17();
        } else if (level == 18) {
            return SacredGrounds18();
        } else if (level == 19) {
            return SacredGrounds19();
        } else if (level == 20) {
            return SacredGrounds20();
        }

        revert("invalid");
    }

    function SacredGrounds1()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 1;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 55e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 4e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 6e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(2);

        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.GREEN_WOOD,
            min: 6,
            max: 9
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.COPPER,
            min: 12,
            max: 18
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 1,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 2,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 1,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 2,
            level: 1
        });
    }

    function SacredGrounds2()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 5;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 75e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 110e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 8e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.SOFT_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.GREEN_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.TIN,
            min: 6,
            max: 9
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.COPPER,
            min: 7,
            max: 10
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 2,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 3,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 2,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 3,
            level: 1
        });
    }

    function SacredGrounds3()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 10;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 150e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 220e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.SOFT_WOOD,
            min: 5,
            max: 7
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.GREEN_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.TIN,
            min: 9,
            max: 14
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.COPPER,
            min: 3,
            max: 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 3,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 4,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 3,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 4,
            level: 1
        });
    }

    function SacredGrounds4()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 15;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 300e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 440e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 44e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.AGED_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.SOFT_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.IRON,
            min: 6,
            max: 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.TIN,
            min: 6,
            max: 8
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 4,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 5,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 4,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 5,
            level: 1
        });
    }

    function SacredGrounds5()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 20;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 880e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 60e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 88e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.AGED_WOOD,
            min: 4,
            max: 6
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.SOFT_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.IRON,
            min: 9,
            max: 13
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.TIN,
            min: 4,
            max: 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 5,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 6,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 5,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 6,
            level: 1
        });
    }

    function SacredGrounds6()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 25;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1760e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 120e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 176e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.HARD_WOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.AGED_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.SILVER,
            min: 6,
            max: 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.IRON,
            min: 6,
            max: 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 6,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 7,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 6,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 7,
            level: 1
        });
    }

    function SacredGrounds7()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 30;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3520e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 240e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 352e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.HARD_WOOD,
            min: 4,
            max: 6
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.AGED_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.SILVER,
            min: 9,
            max: 13
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.IRON,
            min: 3,
            max: 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 7,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 8,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 7,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 8,
            level: 1
        });
    }

    function SacredGrounds8()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 35;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7040e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 480e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 704e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.PETRIFIED_WOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.HARD_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.GOLD,
            min: 6,
            max: 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.SILVER,
            min: 6,
            max: 9
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 8,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 9,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 8,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 9,
            level: 1
        });
    }

    function SacredGrounds9()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 40;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14080e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 960e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1408e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.PETRIFIED_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.HARD_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.GOLD,
            min: 6,
            max: 9
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.SILVER,
            min: 3,
            max: 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 9,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 10,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 9,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 10,
            level: 1
        });
    }

    function SacredGrounds10()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 45;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28160e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1920e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2816e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.RED_OAK_WOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.PETRIFIED_WOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.PLATINUM,
            min: 4,
            max: 6
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.GOLD,
            min: 5,
            max: 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 10,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 11,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 10,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 11,
            level: 1
        });
    }

    function SacredGrounds11()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 50;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 38400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 56320e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 3840e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 5632e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.RED_OAK_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.PETRIFIED_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.PLATINUM,
            min: 7,
            max: 10
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.GOLD,
            min: 3,
            max: 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 11,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 12,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 11,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 12,
            level: 1
        });
    }

    function SacredGrounds12()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 55;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 76400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 112640e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 7640e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 11264e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.ELDER_WOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.RED_OAK_WOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.MYTHRIL,
            min: 4,
            max: 6
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.PLATINUM,
            min: 5,
            max: 7
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 12,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 13,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 12,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 13,
            level: 1
        });
    }

    function SacredGrounds13()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 60;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 153600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 225280e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 15360e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 22528e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.ELDER_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.RED_OAK_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.MYTHRIL,
            min: 6,
            max: 9
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.PLATINUM,
            min: 3,
            max: 4
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 13,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 14,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 13,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 14,
            level: 1
        });
    }

    function SacredGrounds14()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 65;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 307200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 450560e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 30720e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 45056e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.ANCIENT_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.ELDER_WOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.ORICALCHUM,
            min: 4,
            max: 6
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.MYTHRIL,
            min: 4,
            max: 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 14,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 15,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 14,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 15,
            level: 1
        });
    }

    function SacredGrounds15()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 70;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 614400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 901120e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 61440e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 90112e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.ANCIENT_WOOD,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.ELDER_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.ORICALCHUM,
            min: 6,
            max: 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.MYTHRIL,
            min: 2,
            max: 3
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 15,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 16,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 15,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 16,
            level: 1
        });
    }

    function SacredGrounds16()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 75;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 1228800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 1802240e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 122880e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 180224e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.EBONY_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.ANCIENT_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.OBSIDIAN,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.ORICALCHUM,
            min: 4,
            max: 6
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 16,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 17,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 16,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 17,
            level: 1
        });
    }

    function SacredGrounds17()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 80;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 2457600e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 3607780e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 245760e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 360778e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.EBONY_WOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.ANCIENT_WOOD,
            min: 1,
            max: 2
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.OBSIDIAN,
            min: 5,
            max: 7
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.ORICALCHUM,
            min: 2,
            max: 3
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 17,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 18,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 17,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 18,
            level: 1
        });
    }

    function SacredGrounds18()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 85;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 4915200e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 7208960e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 491520e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 720896e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.SNAKEWOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.EBONY_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.LUMINITE,
            min: 3,
            max: 5
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.OBSIDIAN,
            min: 3,
            max: 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 18,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 19,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 18,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 19,
            level: 1
        });
    }

    function SacredGrounds19()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 90;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 9830400e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 14417920e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 983040e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 1441792e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.SNAKEWOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.EBONY_WOOD,
            min: 1,
            max: 2
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.LUMINITE,
            min: 4,
            max: 6
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.OBSIDIAN,
            min: 2,
            max: 3
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 19,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 20,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 19,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 20,
            level: 1
        });
    }

    function SacredGrounds20()
        public
        view
        returns (AdventureLevel memory _level)
    {
        _level.MonsterLevel = 95;
        _level.Difficulty = 100;

        _level.CurrencyRewards.yieldsGold = true;
        _level.CurrencyRewards.goldRewards.minAmount = 19660800e18;
        _level.CurrencyRewards.goldRewards.maxAmount = 28835840e18;

        _level.CurrencyRewards.yieldsEssence = true;
        _level.CurrencyRewards.essenceRewards.minAmount = 1966080e18;
        _level.CurrencyRewards.essenceRewards.maxAmount = 2883584e18;

        _level.CurrencyRewards.yieldsCraftingMaterial = true;
        _level.CurrencyRewards.materials = generateMaterialArray(4);
        _level.CurrencyRewards.materials[0] = CraftingMaterialReward({
            material: CraftingMaterial.SNAKEWOOD,
            min: 3,
            max: 4
        });

        _level.CurrencyRewards.materials[1] = CraftingMaterialReward({
            material: CraftingMaterial.EBONY_WOOD,
            min: 2,
            max: 3
        });

        _level.CurrencyRewards.materials[2] = CraftingMaterialReward({
            material: CraftingMaterial.LUMINITE,
            min: 6,
            max: 8
        });

        _level.CurrencyRewards.materials[3] = CraftingMaterialReward({
            material: CraftingMaterial.OBSIDIAN,
            min: 3,
            max: 5
        });

        _level.Rewards.pool.yieldsMiscItem = true;
        _level.Rewards.rewards.miscItemRewards.chanceToDrop = 50;

        _level.MonsterList = generateAdventureMonsterArray(4);

        _level.MonsterList[0] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 20,
            level: 1
        });

        _level.MonsterList[1] = AdventureMonster({
            element: Element.LIGHTNING,
            monsterId: 21,
            level: 1
        });

        _level.MonsterList[2] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 20,
            level: 1
        });

        _level.MonsterList[3] = AdventureMonster({
            element: Element.PHYSICAL,
            monsterId: 21,
            level: 1
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
