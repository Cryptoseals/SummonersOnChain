import {config} from 'dotenv'

config()
import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {DeployedFileLocations} from "../helpers/constants";
import {ISummoners} from "../../typechain-types"

async function main() {
    let deployer;
    const [w1] = await ethers.getSigners();
    deployer = w1;

    const deployedFgbls = JSON.parse(fs.readFileSync(DeployedFileLocations.fungibles, 'utf-8'))
    const gold = await ethers.getContractAt("Gold", deployedFgbls.gold)
    console.log("gld 1:", parseInt(await gold.balanceOf(w1.address)) / 1e18)
    const essence = await ethers.getContractAt("Essence", deployedFgbls.essence)
    console.log("ess 1:", parseInt(await essence.balanceOf(w1.address)) / 1e18)

    const deployedMiscs = JSON.parse(fs.readFileSync(DeployedFileLocations.misc_items, 'utf-8'))
    const miscs = await ethers.getContractAt("MiscItems", deployedMiscs.miscItems)
    console.log("misc 1:", parseInt(await miscs.balanceOf(w1.address, 1)))


    const deployedMats = JSON.parse(fs.readFileSync(DeployedFileLocations.crafting_materials, 'utf-8'))
    const materials = await ethers.getContractAt("CraftingMaterials", deployedMats.craftingMaterials)

    for (let i = 0; i < 5; i++) {
        console.log(`mat : ${i}`, parseInt(await materials.balanceOf(w1.address, i)))
    }
}

main();
