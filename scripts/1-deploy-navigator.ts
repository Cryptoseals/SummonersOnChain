// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import {ethers, upgrades} from "hardhat";
import * as fs from 'fs'
import {CONTRACTS, DeployedFileLocations} from './helpers/constants'
import {RequiredExp} from "./helpers/requiredExp";

async function main() {

    // Deploy Navigator
    const Navigator = await ethers.getContractFactory("Navigator");
    // args:
    // cryptoseals NFT address, season length (in days)
    const instance = await upgrades.deployProxy(Navigator, [ethers.constants.AddressZero, 90]);
    await instance.deployed();


    let Summoners = await ethers.getContractFactory("Summoners")
    let summoners = await upgrades.deployProxy(Summoners, [instance.address, RequiredExp]);
    await summoners.deployed()
    console.log("summoners deployed to:", summoners.address,)


    let tx = await instance.setGameContractsById(CONTRACTS.SUMMONERS, summoners.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.navigator, JSON.stringify({
        navigator: instance.address
    }))

    fs.writeFileSync(DeployedFileLocations.summoners, JSON.stringify({
        summoners: summoners.address,
    }))

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
