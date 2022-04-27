import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";
import * as Ring from "./helpers/Accessories/CodexRings";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)


    // belts
    // rings
    let CodexRings = await ethers.getContractFactory("CodexRings")
    let codexRings = await upgrades.deployProxy(CodexRings, [navigator.address]);
    await codexRings.deployed()
    console.log("CodexRings deployed to:", codexRings.address,)
    let tx = await codexRings.initializeCodex1(
        Ring.BASE_STR,
        Ring.BASE_AGI,
        Ring.BASE_DEX,
        Ring.BASE_INT,
        Ring.BASE_VIT,
        Ring.BASE_LUCK,
        Ring.BASE_ATK,
        Ring.BASE_M_ATK,
    );
    await tx.wait(1);
    tx = await codexRings.initializeCodex2(
        Ring.BASE_DEF,
        Ring.BASE_M_DEF,
        Ring.BASE_ELE_DEF,
        Ring.BASE_HP,
        Ring.BASE_DODGE,
        Ring.BASE_CRIT,
        Ring.BASE_CRITMULTI,
        Ring.BASE_ACC,
    )
    await tx.wait(1);


    tx = await navigator.setGameContractsById(CONTRACTS.RINGS_CODEX, codexRings.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    fs.writeFileSync(DeployedFileLocations.codex_rings, JSON.stringify({
        CodexRings: codexRings.address,
    }), {});


}

main();