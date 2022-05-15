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

    const deployedAdventureControls = JSON.parse(fs.readFileSync(DeployedFileLocations.adventure_controls, 'utf-8'))
    let adventures = await ethers.getContractAt("AdventureControls", deployedAdventureControls.adventureControls)
    let tx
    tx = await adventures.basicAttack(0, {
        gasLimit: 500000
    })
    await tx.wait(1)
    // console.log(await adventures.activeBattles(0))
}

main();
