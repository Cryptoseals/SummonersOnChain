import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    // const deployedE = JSON.parse(fs.readFileSync(DeployedFileLocations.elixirs, 'utf-8'))
    const deployedA = JSON.parse(fs.readFileSync(DeployedFileLocations.artifacts, 'utf-8'))

    let Artifacts = await ethers.getContractFactory("Artifacts");
    let artifacts = await upgrades.upgradeProxy(deployedA.artifacts,
        Artifacts);
    await artifacts.deployed();

    // let Elixirs = await ethers.getContractFactory("Elixirs");
    // let elixirs = await upgrades.upgradeProxy(deployedE.elixirs,
    //     Elixirs);
    // await elixirs.deployed();

}

main();