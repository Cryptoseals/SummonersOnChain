import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedRandom = JSON.parse(fs.readFileSync(DeployedFileLocations.random, 'utf-8'))

    let CodexRandom = await ethers.getContractFactory("CodexRandom");
    let codexRandom = await upgrades.upgradeProxy(deployedRandom.codexRandom,
        CodexRandom);
    await codexRandom.deployed();

    fs.writeFileSync(DeployedFileLocations.random, JSON.stringify({
        codexRandom: codexRandom.address,
    }), {});

}

main();