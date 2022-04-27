import {ethers, upgrades} from "hardhat";
import {expect} from "chai";
import {DeployedFileLocations} from "../scripts/helpers/constants";
import fs from "fs";

const ether = ethers.utils.parseEther("1");

describe("Navigator and Essence", () => {
    let deployer: any = {
        address: ""
    };
    let Equipable;
    let Equipments;
    const deployedInventory = JSON.parse(fs.readFileSync(DeployedFileLocations.inventory, 'utf-8'))
    const deployedEquipments = JSON.parse(fs.readFileSync(DeployedFileLocations.equipable_items, 'utf-8'))

    it('Should equip an item', async () => {
        const [w1] = await ethers.getSigners();
        deployer = w1;
        Equipable = await ethers.getContractAt("Equipable", deployedInventory.inventory);
        Equipments = await ethers.getContractAt("EquipableItems", deployedEquipments.equipableItems);
        let tx = await Equipments.setApprovalForAll(deployedInventory.inventory, true);
        await tx.wait(1);
        tx = await Equipable.equip(0, 1);
        await tx.wait(1);
        console.log(await Equipable.EquippedWeapons(0))
        console.log(await Equipable.PreCalculatedEquipmentStats(0))
        console.log(await Equipable.PreCalculatedGeneratedEquipmentStats(0))
        console.log(await Equipable.PreCalculatedEquipmentElementalStats(0))
    })

})

