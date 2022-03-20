import { ethers, upgrades } from "hardhat";
import fs from "fs";
const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const accounts = await ethers.getSigners();

    for (const account of accounts) {
        console.log(account.address);
    }

    // // Deploying
    const CodexWeapons = await ethers.getContractFactory("CodexWeapons");
    const instance = await upgrades.deployProxy(CodexWeapons);
    await instance.deployed();

    const contracts = {
        CodexWeapons: instance.address
    }
    console.log(contracts)

    fs.writeFileSync('./scripts/contracts.json', JSON.stringify(contracts))
    console.log(instance.address)
}

main();