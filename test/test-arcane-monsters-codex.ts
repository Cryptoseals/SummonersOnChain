import {ethers, upgrades} from "hardhat";
import {expect} from "chai";
import fs from 'fs'
const ether = ethers.utils.parseEther("1");

enum CONTRACT {
    SUMMONERS, // 0
    ATTRIBUTES, // 1
    SKILLS, // 2
    EQUIPABLE_ITEMS, // 4 NFTS
    INVENTORY, // 5 EQUIP SLOTS
    EXP, // 6
    GOLD, // 7
    ESSENCE, // 8
    SCRAPS, // 9
    JOB, // 10
    HELMETS_CODEX, //11
    ARMORS_CODEX, //12
    BOOTS_CODEX, // 13
    WEAPONS_CODEX, //14
    OFF_HANDS_CODEX, //15
    AMULETS_CODEX, //16
    RINGS_CODEX, //17
    EARRINGS_CODEX, //18
    BELTS_CODEX, //19
    ARTIFACTS_CODEX, //20
    ELIXIRS_CODEX, //21
    MOUNTS_CODEX, //22
    RANDOM_CODEX, //23
    CALCULATOR, // 24
    CRYPTO_SEAL, // 25
    ARTIFACT_AND_ELIXIR_SLOTS, // 26
    ARTIFACTS,
    ELIXIRS,
    MISC_CODEX,
    MISC_ITEMS,
    PREFIX_CODEX,
    SUFFIX_CODEX,
    EXP_CARDS,
    FIRE_ENEMY_CODEX,
    COLD_ENEMY_CODEX,
    LIGHTNING_ENEMY_CODEX,
    EARTH_ENEMY_CODEX,
    DARK_ENEMY_CODEX,
    HOLY_ENEMY_CODEX,
    VOID_ENEMY_CODEX,
    PHYSICAL_ENEMY_CODEX,
    ARCANE_ENEMY_CODEX,
    SPELLS_CODEX,
    FIRE_SPELLS,
    COLD_SPELLS,
    EARTH_SPELLS,
    LIGHTNING_SPELLS,
    GADGET_SPELLS,
    PHYSICAL_SPELLS,
    ARCANE_SPELLS,
    DARK_SPELLS,
    HOLY_SPELLS,
    VOID_SPELLS,
    RANGED_SPELLS,
    BASE_ENEMY_STATS,
    CODEX_ENEMIES
}

enum Element {
    PHYSICAL,
    ARCANE,
    FIRE,
    COLD,
    EARTH,
    LIGHTNING,
    DARK,
    HOLY,
    VOID
}

describe("Navigator and Enemy Codexs", () => {
    let deployer: any = {
        address: ""
    };
    let Navigator: any;
    let navigator: any;
    let CodexEnemy: any;
    let codexEnemy: any;
    let CodexArcane: any;
    let codexArcane: any;
    let BaseEnemyStats: any;
    let baseEnemyStats: any;

    let tx;

    it('Should deploy navigator.', async () => {
        Navigator = await ethers.getContractFactory("Navigator");
        navigator = await upgrades.deployProxy(Navigator, [ethers.constants.AddressZero, 30], {
            initializer: "initialize"
        });
    })

    it('Should work ', async () => {
        BaseEnemyStats = await ethers.getContractFactory("BaseEnemyStats");
        baseEnemyStats = await upgrades.deployProxy(BaseEnemyStats, []);
        console.log("baseEnemyStats deployed.", baseEnemyStats.address)

        tx = await baseEnemyStats.initializeDEF();
        await tx.wait(1)
        console.log("baseEnemyStats DEF set.", baseEnemyStats.address)
        tx = await baseEnemyStats.initializeHP();
        await tx.wait(1)
        console.log("baseEnemyStats HP set.", baseEnemyStats.address)
        tx = await baseEnemyStats.initializeATK();
        await tx.wait(1)
        console.log("baseEnemyStats ATK set.", baseEnemyStats.address)
        tx = await baseEnemyStats.initializeSTAT();
        await tx.wait(1)
        console.log("baseEnemyStats STAT set.", baseEnemyStats.address)
        tx = await baseEnemyStats.initializeACC();
        await tx.wait(1)
        console.log("baseEnemyStats ACC set.", baseEnemyStats.address)
        tx = await baseEnemyStats.initializeDODGE();
        await tx.wait(1)
        console.log("baseEnemyStats DODGE set.", baseEnemyStats.address)
        tx = await baseEnemyStats.initializeCRIT();
        await tx.wait(1)
        console.log("baseEnemyStats CRIT set.", baseEnemyStats.address)
        tx = await baseEnemyStats.initializeCRITMULT();
        await tx.wait(1)
        console.log("baseEnemyStats CRITM set.", baseEnemyStats.address)
        tx = await navigator.setGameContractsById(CONTRACT.BASE_ENEMY_STATS, baseEnemyStats.address, true);
        console.log("base is set.", baseEnemyStats.address)


        CodexEnemy = await ethers.getContractFactory("CodexEnemies");
        codexEnemy = await upgrades.deployProxy(CodexEnemy, [navigator.address], {
            initializer: "initialize"
        });
        console.log("codexEnemy deployed.", codexEnemy.address)
        tx = await navigator.setGameContractsById(CONTRACT.CODEX_ENEMIES, codexEnemy.address, true);
        console.log("codex enemy is set.", codexEnemy.address)

        CodexArcane = await ethers.getContractFactory("CodexEnemiesArcane");
        codexArcane = await upgrades.deployProxy(CodexArcane, [navigator.address], {
            initializer: "initialize"
        });
        console.log("codexArcane deployed.", codexArcane.address)

        tx = await navigator.setGameContractsById(CONTRACT.ARCANE_ENEMY_CODEX, codexArcane.address, true);


        try {
            for (let i = 1; i < 100; i++) {
                await codexEnemy.enemy(Element.ARCANE, i, 1)
            }
            for (let i = 1; i < 100; i++) {
                await codexEnemy.enemy(Element.ARCANE, 1, i)
            }
        } catch (e) {
            console.log(e)
        }

        fs.writeFileSync('./test/last-deploy.json', JSON.stringify({
            BaseStats: baseEnemyStats.address,
            CodexEnemy:             codexEnemy.address,
        }),{});


    })

})

