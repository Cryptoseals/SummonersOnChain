import {ethers, upgrades} from "hardhat";
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



async function main() {
    let deployer: any = {
        address: ""
    };
    let Navigator: any;
    let navigator: any;
    let CodexEnemy: any;
    let codexEnemy: any;
    let EarthMonsters: any;
    let earthMonsters: any;
    let FireMonsters: any;
    let fireMonsters: any;
    let ColdMonsters: any;
    let coldMonsters: any;
    let LightningMonsters: any;
    let lightningMonsters: any;
    let DarkMonsters: any;
    let darkMonsters: any;
    let HolyMonsters: any;
    let holyMonsters: any;
    let VoidMonsters: any;
    let voidMonsters: any;
    let PhysicalMonsters: any;
    let physicalMonsters: any;
    let ArcaneMonsters: any;
    let arcaneMonsters: any;
    let BaseEnemyStats: any;
    let baseEnemyStats: any;
    let tx;

    Navigator = await ethers.getContractFactory("Navigator");
    navigator = await upgrades.deployProxy(Navigator, [ethers.constants.AddressZero, 30], {
        initializer: "initialize"
    });
    await navigator.deployed();
    console.log("navigator.", navigator.address)
    BaseEnemyStats = await ethers.getContractFactory("BaseEnemyStats");
    baseEnemyStats = await upgrades.deployProxy(BaseEnemyStats, []);
    await baseEnemyStats.deployed()
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
    await codexEnemy.deployed();
    console.log("codexEnemy deployed.", codexEnemy.address)
    tx = await navigator.setGameContractsById(CONTRACT.CODEX_ENEMIES, codexEnemy.address, true);
    await tx.wait(1);
    console.log("codex enemy is set.", codexEnemy.address)

    EarthMonsters = await ethers.getContractFactory("CodexEnemiesEarth");
    earthMonsters = await upgrades.deployProxy(EarthMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await earthMonsters.deployed();
    console.log("Earth monsters deployed.")

    FireMonsters = await ethers.getContractFactory("CodexEnemiesFire");
    fireMonsters = await upgrades.deployProxy(FireMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await fireMonsters.deployed();
    console.log("Fire monsters deployed.")


    ColdMonsters = await ethers.getContractFactory("CodexEnemiesCold");
    coldMonsters = await upgrades.deployProxy(ColdMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await coldMonsters.deployed();
    console.log("Cold monsters deployed.")

    LightningMonsters = await ethers.getContractFactory("CodexEnemiesLightning");
    lightningMonsters = await upgrades.deployProxy(LightningMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await lightningMonsters.deployed();
    console.log("Lightning monsters deployed.")
    DarkMonsters = await ethers.getContractFactory("CodexEnemiesDark");
    darkMonsters = await upgrades.deployProxy(DarkMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await darkMonsters.deployed();
    console.log("Dark monsters deployed.")
    HolyMonsters = await ethers.getContractFactory("CodexEnemiesHoly");
    holyMonsters = await upgrades.deployProxy(HolyMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await holyMonsters.deployed();
    console.log("Holy monsters deployed.")
    VoidMonsters = await ethers.getContractFactory("CodexEnemiesVoid");
    voidMonsters = await upgrades.deployProxy(VoidMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await voidMonsters.deployed();
    console.log("Void monsters deployed.")
    PhysicalMonsters = await ethers.getContractFactory("CodexEnemiesPhysical");
    physicalMonsters = await upgrades.deployProxy(PhysicalMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await physicalMonsters.deployed();
    console.log("Phyiscal monsters deployed.")
    ArcaneMonsters = await ethers.getContractFactory("CodexEnemiesArcane");
    arcaneMonsters = await upgrades.deployProxy(ArcaneMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await arcaneMonsters.deployed();
    console.log("Arcane monsters deployed.")
    tx = await navigator.setGameContractsById(CONTRACT.EARTH_ENEMY_CODEX, earthMonsters.address, true);
    await tx.wait(1);
    console.log("Earth address set.")
    tx = await navigator.setGameContractsById(CONTRACT.COLD_ENEMY_CODEX, coldMonsters.address, true);
    await tx.wait(1);
    console.log("Cold address set.")
    tx = await navigator.setGameContractsById(CONTRACT.FIRE_ENEMY_CODEX, fireMonsters.address, true);
    await tx.wait(1);
    console.log("Fire address set.")
    tx = await navigator.setGameContractsById(CONTRACT.LIGHTNING_ENEMY_CODEX, lightningMonsters.address, true);
    await tx.wait(1);
    console.log("Lightning address set.")
    tx = await navigator.setGameContractsById(CONTRACT.DARK_ENEMY_CODEX, darkMonsters.address, true);
    await tx.wait(1);
    console.log("Dark address set.")
    tx = await navigator.setGameContractsById(CONTRACT.HOLY_ENEMY_CODEX, holyMonsters.address, true);
    await tx.wait(1);
    console.log("Holy address set.")
    tx = await navigator.setGameContractsById(CONTRACT.VOID_ENEMY_CODEX, voidMonsters.address, true);
    await tx.wait(1);
    console.log("Void address set.")
    tx = await navigator.setGameContractsById(CONTRACT.PHYSICAL_ENEMY_CODEX, physicalMonsters.address, true);
    await tx.wait(1);
    console.log("Physical address set.")
    tx = await navigator.setGameContractsById(CONTRACT.ARCANE_ENEMY_CODEX, arcaneMonsters.address, true);
    await tx.wait(1);
    console.log("Arcane address set.")

    fs.writeFileSync('./test/enemy-codex.json', JSON.stringify({
        PhysicalMonstersCodex: physicalMonsters.address,
        FireMonstersCodex: fireMonsters.address,
        ColdMonstersCodex: coldMonsters.address,
        LightningMonstersCodex: lightningMonsters.address,
        EarthMonstersCodex: earthMonsters.address,
        DarkMonstersCodex: darkMonsters.address,
        HolyMonstersCodex: holyMonsters.address,
        ArcaneMonstersCodex: arcaneMonsters.address,
        VoidMonstersCodex: voidMonsters.address,
        Codex: codexEnemy.address,
        Nav: navigator.address,
        BaseStats: baseEnemyStats.address
    }), {});
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});


