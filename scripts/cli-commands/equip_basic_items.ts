import {config} from 'dotenv'
config()
import { ethers, upgrades } from "hardhat";
import fs from "fs";
import { DeployedFileLocations } from "../helpers/constants";
import {ISummoners} from "../../typechain-types"

async function main() {
    let deployer;
    const [w1] = await ethers.getSigners();
    deployer = w1;
    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    const deployedInventory = JSON.parse(fs.readFileSync(DeployedFileLocations.inventory, 'utf-8'))
    const deployedEquipments = JSON.parse(fs.readFileSync(DeployedFileLocations.equipable_items, 'utf-8'))
    let equipments = await ethers.getContractAt("EquipableItems", deployedEquipments.equipableItems)
    let inventory = await ethers.getContractAt("Equipable", deployedInventory.inventory);
    let tx;

    tx = await equipments.setApprovalForAll(inventory.address, true);
    await tx.wait(1);
    for (let i = 1; i < 10; i++) {
        tx = await inventory.equip(0, i);
        await tx.wait(2);
    }
}

main();
