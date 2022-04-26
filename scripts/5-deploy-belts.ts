import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";
import * as Belt from "./helpers/Accessories/CodexBelts";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)


    // belts
    let CodexBelts = await ethers.getContractFactory("CodexBelts")
    let codexBelts = await upgrades.deployProxy(CodexBelts, [
        navigator.address
    ], {
        initializer: "initialize"
    });
    await codexBelts.deployed()
    let tx = await codexBelts.initializeCodex1(
        Belt.BASE_STR,
        Belt.BASE_AGI,
        Belt.BASE_DEX,
        Belt.BASE_INT,
        Belt.BASE_VIT,
        Belt.BASE_LUCK,
    )
    await tx.wait(1)
    tx = await codexBelts.initializeCodex2(
        Belt.BASE_DEF,
        Belt.BASE_M_DEF,
        Belt.BASE_ELE_DEF,
        Belt.BASE_HP,
        Belt.BASE_DODGE,
        Belt.BASE_ACC,
    )
    await tx.wait(1)
    console.log("CodexBelts deployed to:", codexBelts.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.BELTS_CODEX, codexBelts.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    console.log('File saved.')
    fs.writeFileSync(DeployedFileLocations.codex_belts, JSON.stringify({
        CodexBelts: codexBelts.address,
    }), {});


}

main();