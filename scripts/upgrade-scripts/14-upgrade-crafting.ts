import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployed = JSON.parse(fs.readFileSync(DeployedFileLocations.crafting, 'utf-8'))

    let Crafting = await ethers.getContractFactory("Crafting");
    let crafting = await upgrades.upgradeProxy(deployed.crafting,
        Crafting);
    await crafting.deployed();

}

main();