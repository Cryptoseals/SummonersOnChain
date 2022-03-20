import { ethers, upgrades } from "hardhat";

import deployedContracts from "./contracts.json";
import * as fs from "fs";

async function main() {

    const accounts = await ethers.getSigners();

    for (const account of accounts) {
        console.log(account.address);
    }

    // // Deploying
    // const CodexWeapons = await ethers.getContractFactory("CodexWeapons");
    // const instance = await upgrades.deployProxy(CodexWeapons);
    // await instance.deployed();

    // console.log(instance.address)
    // Upgrading
    const WeaponCodex = await ethers.getContractFactory("CodexWeapons");
    const upgraded = await upgrades.upgradeProxy(deployedContracts.CodexWeapons, WeaponCodex)
    console.log(`Upgraded.`)
}

main();