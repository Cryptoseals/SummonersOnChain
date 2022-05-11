
// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import {ethers, upgrades} from "hardhat";
import * as fs from 'fs'
import {CONTRACTS, DeployedFileLocations} from './helpers/constants'

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)


    let CodexArea1 = await ethers.getContractFactory("CodexArea1")
    let codexArea1 = await upgrades.deployProxy(CodexArea1);
    await codexArea1.deployed()
    console.log("codexArea1 deployed to:", codexArea1.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.AREA_1, codexArea1.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")
    console.log(codexArea1.address)

    let CodexArea2 = await ethers.getContractFactory("CodexArea2")
    let codexArea2 = await upgrades.deployProxy(CodexArea2);
    await codexArea2.deployed()
    console.log("codexArea2 deployed to:", codexArea2.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AREA_2, codexArea2.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")
    console.log(codexArea2.address)

    let CodexArea3 = await ethers.getContractFactory("CodexArea3")
    let codexArea3 = await upgrades.deployProxy(CodexArea3);
    await codexArea3.deployed()
    console.log("codexArea3 deployed to:", codexArea3.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AREA_3, codexArea3.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")
    console.log(codexArea3.address)

    let CodexArea4 = await ethers.getContractFactory("CodexArea4")
    let codexArea4 = await upgrades.deployProxy(CodexArea4);
    await codexArea4.deployed()
    console.log("codexArea4 deployed to:", codexArea4.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AREA_4, codexArea4.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")
    console.log(codexArea4.address)


    let CodexArea5 = await ethers.getContractFactory("CodexArea5")
    let codexArea5 = await upgrades.deployProxy(CodexArea5);
    await codexArea5.deployed()
    console.log("codexArea5 deployed to:", codexArea5.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AREA_5, codexArea5.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")
    console.log(codexArea5.address)


    fs.writeFileSync(DeployedFileLocations.areas, JSON.stringify({
        codexArea1: codexArea1.address,
        codexArea2: codexArea2.address,
        codexArea3: codexArea3.address,
        codexArea4: codexArea4.address,
        codexArea5: codexArea5.address,
    }))

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
