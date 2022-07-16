import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedE = JSON.parse(fs.readFileSync(DeployedFileLocations.elixirs, 'utf-8'))


    let CodexElixirs = await ethers.getContractFactory("CodexElixirs");
    let codexElixirs = await upgrades.upgradeProxy(deployedE.codexElixirs,
        CodexElixirs);
    await codexElixirs.deployed();

    //
    // let Elixirs = await ethers.getContractFactory("Elixirs");
    // let elixirs = await upgrades.upgradeProxy(deployedE.elixirs,
    //     Elixirs);
    // await elixirs.deployed();

}

main();