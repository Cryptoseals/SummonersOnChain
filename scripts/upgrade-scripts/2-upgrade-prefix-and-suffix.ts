import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployed = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_prefix_and_suffixes, 'utf-8'))

    let Prefix = await ethers.getContractFactory("CodexPrefixes");
    let prefix = await upgrades.upgradeProxy(deployed.prefix,
        Prefix);
    await prefix.deployed();


    let Suffix = await ethers.getContractFactory("CodexSuffixes");
    let suffix = await upgrades.upgradeProxy(deployed.suffix,
        Suffix);
    await suffix.deployed();

}

main();