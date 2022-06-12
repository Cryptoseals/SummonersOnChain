import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployed = JSON.parse(fs.readFileSync(DeployedFileLocations.attributes, 'utf-8'))

    let Attributes = await ethers.getContractFactory("Attributes");
    let attributes = await upgrades.upgradeProxy(deployed.attributes,
        Attributes);
    await attributes.deployed();

}

main();