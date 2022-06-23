import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let Equipable = await ethers.getContractFactory("Equipable");
    let equipable = await upgrades.deployProxy(Equipable,
        [navigator.address], {
            initializer: "initialize"
        });
    await equipable.deployed();
    let tx = await navigator.setGameContractsById(CONTRACTS.INVENTORY,
        equipable.address, true);
    await tx.wait(1)

    fs.writeFileSync(DeployedFileLocations.inventory, JSON.stringify({
        inventory: equipable.address,
    }), {});

}

main();