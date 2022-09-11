import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedMisc = JSON.parse(fs.readFileSync(DeployedFileLocations.misc_items, 'utf-8'))

    let MiscItems = await ethers.getContractFactory("MiscItems");
    let miscItems = await upgrades.upgradeProxy(deployedMisc.miscItems,
        MiscItems);
    await miscItems.deployed();

    //
    // let CookingItems = await ethers.getContractFactory("CookingItems");
    // let cookingItems = await upgrades.upgradeProxy(deployedMisc.cookingItems,
    //     CookingItems);
    // await cookingItems.deployed();
    //
    // let AlchemyItems = await ethers.getContractFactory("AlchemyItems");
    // let alchemyItems = await upgrades.upgradeProxy(deployedMisc.alchemyItems,
    //     AlchemyItems);
    // await alchemyItems.deployed();

    //
    // fs.writeFileSync(DeployedFileLocations.misc_items, JSON.stringify({
    //     miscItems: miscItems.address,
    //     cookingItems: cookingItems.address,
    //     alchemyItems: alchemyItems.address,
    // }), {});
}

main();