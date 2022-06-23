import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedMats = JSON.parse(fs.readFileSync(DeployedFileLocations.crafting_materials, 'utf-8'))

    let CraftingMaterials = await ethers.getContractFactory("CraftingMaterials");
    let craftingMaterials = await upgrades.upgradeProxy(deployedMats.craftingMaterials, CraftingMaterials);
    await craftingMaterials.deployed();

    fs.writeFileSync(DeployedFileLocations.crafting_materials, JSON.stringify({
        craftingMaterials: craftingMaterials.address,
    }), {});

}

main();