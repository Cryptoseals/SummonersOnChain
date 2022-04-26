import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";
import * as Earring from "./helpers/Accessories/CodexEarrings";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    // earrings
    let CodexEarrings = await ethers.getContractFactory("CodexEarrings")
    let codexEarrings = await upgrades.deployProxy(CodexEarrings, [navigator.address]);
    await codexEarrings.deployed()
    let tx = await codexEarrings.initializeCodex1(
        Earring.BASE_STR,
        Earring.BASE_AGI,
        Earring.BASE_DEX,
        Earring.BASE_INT,
        Earring.BASE_VIT,
        Earring.BASE_LUCK,
        Earring.BASE_ATK,
        Earring.BASE_M_ATK,
        Earring.BASE_DEF,
    );
    await tx.wait(1);
    tx = await codexEarrings.initializeCodex2(
        Earring.BASE_DEF,
        Earring.BASE_M_DEF,
        Earring.BASE_ELE_DEF,
        Earring.BASE_HP,
        Earring.BASE_DODGE,
        Earring.BASE_CRIT,
        Earring.BASE_CRITMULTI,
        Earring.BASE_ACC,
    );
    await tx.wait(1)
    console.log("CodexEarrings deployed to:", codexEarrings.address,)

    tx = await navigator.setGameContractsById(CONTRACTS.EARRINGS_CODEX, codexEarrings.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.codex_rings, JSON.stringify({
        CodexEarrings: codexEarrings.address,
    }), {});

}

main();