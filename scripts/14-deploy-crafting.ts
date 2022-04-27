// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import {ethers, upgrades} from "hardhat";
import * as fs from 'fs'
import {CONTRACTS, DeployedFileLocations} from './helpers/constants'

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)


    let Crafting = await ethers.getContractFactory("Crafting")
    let crafting = await upgrades.deployProxy(Crafting, [navigator.address]);
    await crafting.deployed()
    console.log("crafting deployed to:", crafting.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.CRAFTING, crafting.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.crafting, JSON.stringify({
        crafting: crafting.address,
    }))
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
