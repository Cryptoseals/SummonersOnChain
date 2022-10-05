import { ethers, upgrades } from "hardhat";
import * as fs from "fs";
import { CONTRACTS, DeployedFileLocations } from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedAdvC = JSON.parse(fs.readFileSync(DeployedFileLocations.adventure_controls, 'utf-8'))
    const deployedAdv = JSON.parse(fs.readFileSync(DeployedFileLocations.adventures, 'utf-8'))

    let Adventures = await ethers.getContractFactory("Adventures");
    let adventures = await upgrades.upgradeProxy(deployedAdv.adventures,
        Adventures);
    await adventures.deployed();

    // let AdventureControls = await ethers.getContractFactory("AdventureControls");
    // let adventureControls = await upgrades.upgradeProxy(deployedAdvC.adventureControls,
    //     AdventureControls);
    // await adventureControls.deployed();

    // fs.writeFileSync(DeployedFileLocations.codex_adventures, JSON.stringify({
    //     adventures: adventures.address,
    // }))

}

main();