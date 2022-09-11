import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedE = JSON.parse(fs.readFileSync(DeployedFileLocations.lands, 'utf-8'))


    let tx
    let Lands = await ethers.getContractFactory("Lands");
    let lands = await upgrades.upgradeProxy(deployedE.lands,
        Lands);
    await lands.deployed();
    //
    let CodexLands = await ethers.getContractFactory("CodexLands");
    let codexLands = await upgrades.upgradeProxy(deployedE.codexLands,
        CodexLands);
    await codexLands.deployed();
    //
    //
    // let LandControls = await ethers.getContractFactory("LandControls")
    // let landControls = await upgrades.upgradeProxy(deployedE.landControls,
    //     LandControls);
    // await landControls.deployed();
    //
    // tx = await landControls.initializeContracts()
    // await tx.wait(1)


}

main();