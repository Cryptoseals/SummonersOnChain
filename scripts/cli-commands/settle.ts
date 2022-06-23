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
    let adventuresMain = await ethers.getContractAt("Adventures", deployedAdventures.adventures)
    console.log("before")
    console.log(await adventuresMain.activeBattles(0))



    const deployedAdventureControls = JSON.parse(fs.readFileSync(DeployedFileLocations.adventure_controls, 'utf-8'))
    let adventures = await ethers.getContractAt("AdventureControls", deployedAdventureControls.adventureControls)
    let tx
    tx = await adventures.settleBattle(0, {
        gasLimit: 800000
    })
    await tx.wait(1)
    // console.log(await adventures.activeBattles(0))

    console.log("after")
    const battle = await adventuresMain.activeBattles(0)
    console.log(battle)
    console.log(parseInt(battle?.monsterStats?.TOTAL_HP || "error"))
}

main();
