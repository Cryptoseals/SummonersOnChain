import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedAdv = JSON.parse(fs.readFileSync(DeployedFileLocations.adventures, 'utf-8'))

    let Adventures = await ethers.getContractFactory("Adventures");
    let adventures = await upgrades.upgradeProxy(deployedAdv.adventures,
        Adventures);
    await adventures.deployed();

    fs.writeFileSync(DeployedFileLocations.codex_adventures, JSON.stringify({
        adventures: adventures.address,
    }))

}

main();