import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    // earrings
    let CodexEarrings = await ethers.getContractFactory("CodexEarrings")
    let codexEarrings = await upgrades.deployProxy(CodexEarrings);
    await codexEarrings.deployed()
    await codexEarrings.initializeCodex(navigator.address);
    console.log("CodexEarrings deployed to:", codexEarrings.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.RINGS_CODEX, codexEarrings.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.codex_rings, JSON.stringify({
        CodexEarrings: codexEarrings.address,
    }), {});

}

main();