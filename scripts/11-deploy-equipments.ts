import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let EquipableItems = await ethers.getContractFactory("EquipableItems");
    let equipableItems = await upgrades.deployProxy(EquipableItems,
        [navigator.address,
            "SoC: Season 1 Equipments", "SoC1equip"], {
            initializer: "initialize"
        });
    
    await equipableItems.deployed();
    let tx = await navigator.setGameContractsById(CONTRACTS.EQUIPABLE_ITEMS,
        equipableItems.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    fs.writeFileSync(DeployedFileLocations.equipable_items, JSON.stringify({
        equipableItems: equipableItems.address,
    }), {});

}

main();