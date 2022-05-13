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
    const deployedSummoners = JSON.parse(fs.readFileSync(DeployedFileLocations.summoners, 'utf-8'))
    let summoners = await ethers.getContractAt("Summoners", deployedSummoners.summoners);
    let tx = await summoners.mintSummoner(0);
    tx.wait(2);
    console.log(await summoners.balanceOf(w1.address));
}

main();
