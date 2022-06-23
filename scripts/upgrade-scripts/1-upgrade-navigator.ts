import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))

    let Navigator = await ethers.getContractFactory("Navigator");
    let navigator = await upgrades.upgradeProxy(deployedNavigator.navigator,
        Navigator);
    await navigator.deployed();


}

main();