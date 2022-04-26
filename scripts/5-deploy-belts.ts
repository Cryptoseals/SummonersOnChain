import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)


    // belts
    let CodexBelts = await ethers.getContractFactory("CodexBelts")
    let codexBelts = await upgrades.deployProxy(CodexBelts, [navigator.address], {
        initializer: "initialize"
    });
    await codexBelts.deployed()
    console.log("CodexBelts deployed to:", codexBelts.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.BELTS_CODEX, codexBelts.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    console.log('File saved.')
    fs.writeFileSync(DeployedFileLocations.codex_belts, JSON.stringify({
        CodexBelts: codexBelts.address,
    }), {});


}

main();