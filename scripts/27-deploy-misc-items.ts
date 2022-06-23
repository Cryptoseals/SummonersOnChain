import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let MiscItems = await ethers.getContractFactory("MiscItems");
    let miscItems = await upgrades.deployProxy(MiscItems, [
        navigator.address,
        "test.com/"
    ])

    await miscItems.deployed();
    let tx = await navigator.setGameContractsById(CONTRACTS.MISC_ITEMS,
        miscItems.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    fs.writeFileSync(DeployedFileLocations.misc_items, JSON.stringify({
        miscItems: miscItems.address,
    }), {});

}

main();