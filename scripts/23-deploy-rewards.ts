
// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import {ethers, upgrades} from "hardhat";
import * as fs from 'fs'
import {CONTRACTS, DeployedFileLocations} from './helpers/constants'
import {XPRewards} from "./helpers/Rewards/XP";

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)


    let Rewards = await ethers.getContractFactory("Rewarder")
    let rewards = await upgrades.deployProxy(Rewards, [
        navigator.address,
        XPRewards
    ]);
    await rewards.deployed()
    console.log("rewards deployed to:", rewards.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.REWARDS, rewards.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    fs.writeFileSync(DeployedFileLocations.rewards, JSON.stringify({
        rewards: rewards.address,
    }))
    console.log({rewards: rewards.address})

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
