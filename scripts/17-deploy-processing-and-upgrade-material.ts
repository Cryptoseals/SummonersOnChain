
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


    let ProcessingClothRecipes = await ethers.getContractFactory("ProcessingClothRecipes")
    let processingClothRecipes = await upgrades.deployProxy(ProcessingClothRecipes);
    await processingClothRecipes.deployed()
    console.log("processingClothRecipes deployed to:", processingClothRecipes.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.CLOTH_PROCESSING_RECIPES, processingClothRecipes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let ProcessingGemstoneRecipes = await ethers.getContractFactory("ProcessingGemstoneRecipes")
    let processingGemstoneRecipes = await upgrades.deployProxy(ProcessingGemstoneRecipes);
    await processingGemstoneRecipes.deployed()
    console.log("processingGemstoneRecipes deployed to:", processingGemstoneRecipes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.GEMSTONE_PROCESSING_RECIPES, processingGemstoneRecipes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let ProcessingOreRecipes = await ethers.getContractFactory("ProcessingOreRecipes")
    let processingOreRecipes = await upgrades.deployProxy(ProcessingOreRecipes);
    await processingOreRecipes.deployed()
    console.log("processingOreRecipes deployed to:", processingOreRecipes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.ORE_PROCESSING_RECIPES, processingOreRecipes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let ProcessingWoodRecipes = await ethers.getContractFactory("ProcessingWoodRecipes")
    let processingWoodRecipes = await upgrades.deployProxy(ProcessingWoodRecipes);
    await processingWoodRecipes.deployed()
    console.log("processingOreRecipes deployed to:", processingWoodRecipes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.WOOD_PROCESSING_RECIPES, processingWoodRecipes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let UpgradingClothRecipes = await ethers.getContractFactory("UpgradingClothRecipes")
    let upgradingClothRecipes = await upgrades.deployProxy(UpgradingClothRecipes);
    await upgradingClothRecipes.deployed()
    console.log("upgradingClothRecipes deployed to:", upgradingClothRecipes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.CLOTH_UPGRADING_RECIPES, upgradingClothRecipes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let UpgradingGemstoneRecipes = await ethers.getContractFactory("UpgradingGemstoneRecipes")
    let upgradingGemstoneRecipes = await upgrades.deployProxy(UpgradingGemstoneRecipes);
    await upgradingGemstoneRecipes.deployed()
    console.log("upgradingGemstoneRecipes deployed to:", upgradingGemstoneRecipes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.GEMSTONE_UPGRADING_RECIPES, upgradingGemstoneRecipes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let UpgradingOreRecipes = await ethers.getContractFactory("UpgradingOreRecipes")
    let upgradingOreRecipes = await upgrades.deployProxy(UpgradingOreRecipes);
    await upgradingOreRecipes.deployed()
    console.log("upgradingOreRecipes deployed to:", upgradingOreRecipes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.ORE_UPGRADING_RECIPES, upgradingOreRecipes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let UpgradingWoodRecipes = await ethers.getContractFactory("UpgradingWoodRecipes")
    let upgradingWoodRecipes = await upgrades.deployProxy(UpgradingWoodRecipes);
    await upgradingWoodRecipes.deployed()
    console.log("upgradingWoodRecipes deployed to:", upgradingWoodRecipes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.WOOD_UPGRADING_RECIPES, upgradingWoodRecipes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.processing_and_upgrade, JSON.stringify({
        processing_c: processingClothRecipes.address,
        processing_g: processingGemstoneRecipes.address,
        processing_w: processingWoodRecipes.address,
        processing_o: processingOreRecipes.address,
        upgrading_c: upgradingClothRecipes.address,
        upgrading_g: upgradingGemstoneRecipes.address,
        upgrading_w: upgradingWoodRecipes.address,
        upgrading_o: upgradingOreRecipes.address,
    }))

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
