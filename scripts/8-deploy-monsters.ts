import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)


    let BaseEnemyStats = await ethers.getContractFactory("BaseEnemyStats");
    let baseEnemyStats = await upgrades.deployProxy(BaseEnemyStats, []);
    console.log("baseEnemyStats deployed.", baseEnemyStats.address)
    let tx = await baseEnemyStats.initializeDEF();
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
    tx = await navigator.setGameContractsById(CONTRACTS.BASE_ENEMY_STATS, baseEnemyStats.address, true);
    await tx.wait(1)
    console.log("base is set.", baseEnemyStats.address)

    let CodexEnemy = await ethers.getContractFactory("CodexEnemies");
    let codexEnemy = await upgrades.deployProxy(CodexEnemy, [navigator.address], {
        initializer: "initialize"
    });
    console.log("codexEnemy deployed.", codexEnemy.address)
    tx = await navigator.setGameContractsById(CONTRACTS.CODEX_ENEMIES, codexEnemy.address, true);
    await tx.wait(1)
    console.log("codex enemy is set.", codexEnemy.address)


    let EarthMonsters = await ethers.getContractFactory("CodexEnemiesEarth");
    let earthMonsters = await upgrades.deployProxy(EarthMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await earthMonsters.deployed()

    let FireMonsters = await ethers.getContractFactory("CodexEnemiesFire");
    let fireMonsters = await upgrades.deployProxy(FireMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await fireMonsters.deployed()
    console.log("Fire monsters deployed.")
    let ColdMonsters = await ethers.getContractFactory("CodexEnemiesCold");
    let coldMonsters = await upgrades.deployProxy(ColdMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await coldMonsters.deployed()
    console.log("Cold monsters deployed.")
    let LightningMonsters = await ethers.getContractFactory("CodexEnemiesLightning");
    let lightningMonsters = await upgrades.deployProxy(LightningMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await lightningMonsters.deployed()
    console.log("Lightning monsters deployed.")
    let DarkMonsters = await ethers.getContractFactory("CodexEnemiesDark");
    let darkMonsters = await upgrades.deployProxy(DarkMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await darkMonsters.deployed()
    console.log("Dark monsters deployed.")
    let HolyMonsters = await ethers.getContractFactory("CodexEnemiesHoly");
    let holyMonsters = await upgrades.deployProxy(HolyMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await holyMonsters.deployed()
    console.log("Holy monsters deployed.")
    let VoidMonsters = await ethers.getContractFactory("CodexEnemiesVoid");
    let voidMonsters = await upgrades.deployProxy(VoidMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await voidMonsters.deployed()
    console.log("Void monsters deployed.")
    let PhysicalMonsters = await ethers.getContractFactory("CodexEnemiesPhysical");
    let physicalMonsters = await upgrades.deployProxy(PhysicalMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await physicalMonsters.deployed()
    console.log("Physical monsters deployed.")
    let ArcaneMonsters = await ethers.getContractFactory("CodexEnemiesArcane");
    let arcaneMonsters = await upgrades.deployProxy(ArcaneMonsters, [navigator.address], {
        initializer: "initialize"
    });
    await arcaneMonsters.deployed()
    console.log("Arcane monsters deployed.")

    tx = await navigator.setGameContractsById(CONTRACTS.EARTH_ENEMY_CODEX, earthMonsters.address, true);
    await tx.wait(1);
    console.log("Earth address set.")
    tx = await navigator.setGameContractsById(CONTRACTS.COLD_ENEMY_CODEX, coldMonsters.address, true);
    await tx.wait(1);
    console.log("Cold address set.")
    tx = await navigator.setGameContractsById(CONTRACTS.FIRE_ENEMY_CODEX, fireMonsters.address, true);
    await tx.wait(1);
    console.log("Fire address set.")
    tx = await navigator.setGameContractsById(CONTRACTS.LIGHTNING_ENEMY_CODEX, lightningMonsters.address, true);
    await tx.wait(1);
    console.log("Lightning address set.")
    tx = await navigator.setGameContractsById(CONTRACTS.DARK_ENEMY_CODEX, darkMonsters.address, true);
    await tx.wait(1);
    console.log("Dark address set.")
    tx = await navigator.setGameContractsById(CONTRACTS.HOLY_ENEMY_CODEX, holyMonsters.address, true);
    await tx.wait(1);
    console.log("Holy address set.")
    tx = await navigator.setGameContractsById(CONTRACTS.VOID_ENEMY_CODEX, voidMonsters.address, true);
    await tx.wait(1);
    console.log("Void address set.")
    tx = await navigator.setGameContractsById(CONTRACTS.PHYSICAL_ENEMY_CODEX, physicalMonsters.address, true);
    await tx.wait(1);
    console.log("Physical address set.")
    tx = await navigator.setGameContractsById(CONTRACTS.ARCANE_ENEMY_CODEX, arcaneMonsters.address, true);
    await tx.wait(1);
    console.log("Arcane address set.")


    fs.writeFileSync(DeployedFileLocations.codex_enemies, JSON.stringify({
        EnemyMainCodex: codexEnemy.address,
        PhysicalMonstersCodex: physicalMonsters.address,
        FireMonstersCodex: fireMonsters.address,
        ColdMonstersCodex: coldMonsters.address,
        LightningMonstersCodex: lightningMonsters.address,
        EarthMonstersCodex: earthMonsters.address,
        DarkMonstersCodex: darkMonsters.address,
        HolyMonstersCodex: holyMonsters.address,
        ArcaneMonstersCodex: arcaneMonsters.address,
        VoidMonstersCodex: voidMonsters.address,
        BaseStats: baseEnemyStats.address
    }), {});

}

main();