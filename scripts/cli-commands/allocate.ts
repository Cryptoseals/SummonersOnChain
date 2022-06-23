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

    const deployedAttr = JSON.parse(fs.readFileSync(DeployedFileLocations.attributes, 'utf-8'))
    let attributes = await ethers.getContractAt("Attributes", deployedAttr.attributes)
    let tx
    tx = await attributes.allocate(0, [10,9,9,0,0,0])
    await tx.wait(1)
    console.log(await attributes.stats(0))
}

main();
