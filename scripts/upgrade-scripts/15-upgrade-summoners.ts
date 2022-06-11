import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedSummoners = JSON.parse(fs.readFileSync(DeployedFileLocations.summoners, 'utf-8'))

    let Summoners = await ethers.getContractFactory("Summoners");
    let summoners = await upgrades.upgradeProxy(deployedSummoners.summoners,
        Summoners);
    await summoners.deployed();

    fs.writeFileSync(DeployedFileLocations.summoners, JSON.stringify({
        summoners: summoners.address,
    }), {});

}

main();