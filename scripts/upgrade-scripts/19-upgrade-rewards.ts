import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";
import {XPRewards} from "../helpers/Rewards/XP";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedRewards = JSON.parse(fs.readFileSync(DeployedFileLocations.rewards, 'utf-8'))

    let Rewards = await ethers.getContractFactory("Rewarder");
    let rewards = await upgrades.upgradeProxy(deployedRewards.rewards,
        Rewards);
    await rewards.deployed();
    // rewards.setExp(XPRewards)


}

main();