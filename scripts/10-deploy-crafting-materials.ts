import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let CraftingMaterials = await ethers.getContractFactory("CraftingMaterials");
    let craftingMaterials = await upgrades.deployProxy(CraftingMaterials,
        [navigator.address,
        "https://api.cryptoseals.art/game/fungible/"], {
            initializer: "initialize"
        });
    await craftingMaterials.deployed();
    let tx = await navigator.setGameContractsById(CONTRACTS.CRAFTING_MATERIALS,
        craftingMaterials.address, true);
    await tx.wait(1)
    console.log('craftingMaterials set in contracts')

    fs.writeFileSync(DeployedFileLocations.crafting_materials, JSON.stringify({
        craftingMaterials: craftingMaterials.address,
    }), {});

}

main();