import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployed = JSON.parse(fs.readFileSync(DeployedFileLocations.equipable_items, 'utf-8'))

    let Equipable = await ethers.getContractFactory("EquipableItems");
    let equipable = await upgrades.upgradeProxy(deployed.equipableItems,
        Equipable);
    await equipable.deployed();


}

main();