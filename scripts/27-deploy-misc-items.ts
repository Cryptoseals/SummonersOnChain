import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    let tx
    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let MiscItems = await ethers.getContractFactory("MiscItems");
    let miscItems = await upgrades.deployProxy(MiscItems, [
        navigator.address,
        "test.com/"
    ])

    await miscItems.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.MISC_ITEMS,
        miscItems.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    let CookingItems = await ethers.getContractFactory("CookingItems");
    let cookingItems = await upgrades.deployProxy(CookingItems, [
        navigator.address,
        "test.com/"
    ])

    await cookingItems.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.COOKING_ITEMS,
        cookingItems.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    let AlchemyItems = await ethers.getContractFactory("AlchemyItems");
    let alchemyItems = await upgrades.deployProxy(AlchemyItems, [
        navigator.address,
        "test.com/"
    ])

    await alchemyItems.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.ALCHEMY_ITEMS,
        alchemyItems.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    fs.writeFileSync(DeployedFileLocations.misc_items, JSON.stringify({
        miscItems: miscItems.address,
        cookingItems: cookingItems.address,
        alchemyItems: alchemyItems.address,
    }), {});

}

main();