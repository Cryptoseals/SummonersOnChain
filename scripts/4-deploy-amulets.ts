import { ethers, upgrades } from "hardhat";
import fs from "fs";
import { CONTRACTS, DeployedFileLocations } from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    // amulets
    let CodexAmulets = await ethers.getContractFactory("CodexAmulets")
    let codexAmulets = await upgrades.deployProxy(CodexAmulets);
    await codexAmulets.deployed()
    await codexAmulets.initializeCodex(navigator.address);
    console.log("CodexAmulets deployed to:", codexAmulets.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.RINGS_CODEX, codexAmulets.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.codex_amulets, JSON.stringify({
        CodexAmulets: codexAmulets.address,
    }), {});


}

main();