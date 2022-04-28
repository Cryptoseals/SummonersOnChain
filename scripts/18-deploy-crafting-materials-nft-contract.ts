
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


    let CraftingMaterials = await ethers.getContractFactory("CraftingMaterials")
    let craftingMaterials = await upgrades.deployProxy(CraftingMaterials, [
        navigator.address,
        "https://play.cryptoseals.art/api/crafting-mats/"
    ]);
    await craftingMaterials.deployed()
    console.log("craftingMaterials deployed to:", craftingMaterials.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.CRAFTING_MATERIALS, craftingMaterials.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    fs.writeFileSync(DeployedFileLocations.crafting_materials, JSON.stringify({
        crafting_materials: craftingMaterials.address,
    }))
    console.log({craftingMaterials: craftingMaterials.address})

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
