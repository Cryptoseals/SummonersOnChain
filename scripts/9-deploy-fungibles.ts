import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let Essence = await ethers.getContractFactory("Essence");
    let essence = await upgrades.deployProxy(Essence,
        ["SoC: Season 1 - Essence", "ESSENCE", navigator.address], {
            initializer: "initialize"
        });
    await essence.deployed();
    let tx = await navigator.setGameContractsById(CONTRACTS.ESSENCE, essence.address, true);
    await tx.wait(1)

    let Gold = await ethers.getContractFactory("Gold");
    let gold = await upgrades.deployProxy(Gold, [
        "SoC: Season 1 - Gold",
        "GOLD",
        "86400",
        ether,
        navigator.address], {
        initializer: "initialize"
    });
    await gold.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.GOLD, gold.address, true);
    await tx.wait(1)
    fs.writeFileSync(DeployedFileLocations.codex_enemies, JSON.stringify({
        gold: gold.address,
        essence: essence.address
    }), {});

}

main();