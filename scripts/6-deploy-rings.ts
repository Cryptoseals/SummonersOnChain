import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)


    // belts
    // rings
    let CodexRings = await ethers.getContractFactory("CodexRings")
    let codexRings = await upgrades.deployProxy(CodexRings);
    await codexRings.deployed()
    await codexRings.initializeCodex(navigator.address);
    console.log("CodexRings deployed to:", codexRings.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.RINGS_CODEX, codexRings.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    fs.writeFileSync(DeployedFileLocations.codex_rings, JSON.stringify({
        CodexRings: codexRings.address,
    }), {});


}

main();