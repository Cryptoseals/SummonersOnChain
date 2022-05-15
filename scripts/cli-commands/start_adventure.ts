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

    const deployedAdventures = JSON.parse(fs.readFileSync(DeployedFileLocations.adventures, 'utf-8'))
    let adventures = await ethers.getContractAt("Adventures", deployedAdventures.adventures)
    let tx
        // tx = await adventures.flee(0)
    // tx = await adventures.startBattle(0, 1, 1)
    // await tx.wait(1)
    console.log(await adventures.timer(0))
    console.log(await adventures.activeBattles(0))
}

main();
