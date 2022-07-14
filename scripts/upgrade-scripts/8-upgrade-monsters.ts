import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {
    const deployedEnemies = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_enemies, 'utf-8'))

    let BaseEnemyStats = await ethers.getContractFactory("BaseEnemyStats");
    let baseEnemyStats = await upgrades.upgradeProxy(deployedEnemies.baseStats, BaseEnemyStats);
    await baseEnemyStats.deployed();

    let CodexEnemy = await ethers.getContractFactory("CodexEnemies");
    let codexEnemy = await upgrades.upgradeProxy(deployedEnemies.enemyMainCodex, CodexEnemy);
    await codexEnemy.deployed();

    fs.writeFileSync(DeployedFileLocations.codex_enemies, JSON.stringify({
        enemyMainCodex: codexEnemy.address,
        baseStats: baseEnemyStats.address
    }), {});
}

main();