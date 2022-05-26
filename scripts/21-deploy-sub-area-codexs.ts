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

    let tx
    // let CodexArea1 = await ethers.getContractFactory("CodexArea1")
    // let codexArea1 = await upgrades.deployProxy(CodexArea1);
    // await codexArea1.deployed()
    // console.log("codexArea1 deployed to:", codexArea1.address,)
    // tx = await navigator.setGameContractsById(CONTRACTS.AREA_1, codexArea1.address, true)
    // await tx.wait(1)
    // console.log("and set in navigator.")
    // console.log(codexArea1.address)
    //
    // let CodexArea2 = await ethers.getContractFactory("CodexArea2")
    // let codexArea2 = await upgrades.deployProxy(CodexArea2);
    // await codexArea2.deployed()
    // console.log("codexArea2 deployed to:", codexArea2.address,)
    // tx = await navigator.setGameContractsById(CONTRACTS.AREA_2, codexArea2.address, true)
    // await tx.wait(1)
    // console.log("and set in navigator.")
    // console.log(codexArea2.address)
    //
    // let CodexArea3 = await ethers.getContractFactory("CodexArea3")
    // let codexArea3 = await upgrades.deployProxy(CodexArea3);
    // await codexArea3.deployed()
    // console.log("codexArea3 deployed to:", codexArea3.address,)
    // tx = await navigator.setGameContractsById(CONTRACTS.AREA_3, codexArea3.address, true)
    // await tx.wait(1)
    // console.log("and set in navigator.")
    // console.log(codexArea3.address)
    //
    // let CodexArea4 = await ethers.getContractFactory("CodexArea4")
    // let codexArea4 = await upgrades.deployProxy(CodexArea4);
    // await codexArea4.deployed()
    // console.log("codexArea4 deployed to:", codexArea4.address,)
    // tx = await navigator.setGameContractsById(CONTRACTS.AREA_4, codexArea4.address, true)
    // await tx.wait(1)
    // console.log("and set in navigator.")
    // console.log(codexArea4.address)
    //
    //
    // let CodexArea5 = await ethers.getContractFactory("CodexArea5")
    // let codexArea5 = await upgrades.deployProxy(CodexArea5);
    // await codexArea5.deployed()
    // console.log("codexArea5 deployed to:", codexArea5.address,)
    // tx = await navigator.setGameContractsById(CONTRACTS.AREA_5, codexArea5.address, true)
    // await tx.wait(1)
    // console.log("and set in navigator.")
    // console.log(codexArea5.address)
    //

    // let CodexArea6 = await ethers.getContractFactory("CodexArea6")
    // let codexArea6 = await upgrades.deployProxy(CodexArea6);
    // await codexArea6.deployed()
    // console.log("codexArea6 deployed to:", codexArea6.address,)
    // tx = await navigator.setGameContractsById(CONTRACTS.AREA_6, codexArea6.address, true)
    // await tx.wait(1)
    // console.log("and set in navigator.")
    // console.log(codexArea6.address)
    //
    // let CodexArea7 = await ethers.getContractFactory("CodexArea7")
    // let codexArea7 = await upgrades.deployProxy(CodexArea7);
    // await codexArea7.deployed()
    // console.log("codexArea7 deployed to:", codexArea7.address,)
    // tx = await navigator.setGameContractsById(CONTRACTS.AREA_7, codexArea7.address, true)
    // await tx.wait(1)
    // console.log("and set in navigator.")
    // console.log(codexArea7.address)
    //
    // let CodexArea8 = await ethers.getContractFactory("CodexArea8")
    // let codexArea8 = await upgrades.deployProxy(CodexArea8);
    // await codexArea8.deployed()
    // console.log("codexArea8 deployed to:", codexArea8.address,)
    // tx = await navigator.setGameContractsById(CONTRACTS.AREA_8, codexArea8.address, true)
    // await tx.wait(1)
    // console.log("and set in navigator.")
    // console.log(codexArea8.address)

    let CodexArea9 = await ethers.getContractFactory("CodexArea9")
    let codexArea9 = await upgrades.deployProxy(CodexArea9);
    await codexArea9.deployed()
    console.log("codexArea9 deployed to:", codexArea9.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AREA_9, codexArea9.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")
    console.log(codexArea9.address)

    let CodexArea10 = await ethers.getContractFactory("CodexArea10")
    let codexArea10 = await upgrades.deployProxy(CodexArea10);
    await codexArea10.deployed()
    console.log("codexArea10 deployed to:", codexArea10.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AREA_10, codexArea10.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")
    console.log(codexArea10.address)

    let CodexArea11 = await ethers.getContractFactory("CodexArea11")
    let codexArea11 = await upgrades.deployProxy(CodexArea11);
    await codexArea11.deployed()
    console.log("codexArea11 deployed to:", codexArea11.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AREA_11, codexArea11.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")
    console.log(codexArea11.address)


    fs.writeFileSync(DeployedFileLocations.areas, JSON.stringify({
        // codexArea1: codexArea1.address,
        // codexArea2: codexArea2.address,
        // codexArea3: codexArea3.address,
        // codexArea4: codexArea4.address,
        // codexArea5: codexArea5.address,
        // codexArea6: codexArea6.address,
        // codexArea7: codexArea7.address,
        // codexArea8: codexArea8.address,
        codexArea9: codexArea9.address,
        codexArea10: codexArea10.address,
        codexArea11: codexArea11.address,
    }))

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
