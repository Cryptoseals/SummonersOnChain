import { ethers, upgrades } from "hardhat";
import fs from "fs";
import { CONTRACTS, DeployedFileLocations } from "./helpers/constants";
import * as Amulets from "./helpers/Accessories/CodexAmulets";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx;
        // amulets
    let CodexAmulets = await ethers.getContractFactory("CodexAmulets")
    let codexAmulets = await upgrades.deployProxy(CodexAmulets, [navigator.address]);
    await codexAmulets.deployed()
    tx = await codexAmulets.initializeCodex1(
        Amulets.BASE_STR,
        Amulets.BASE_AGI,
        Amulets.BASE_DEX,
        Amulets.BASE_INT,
        Amulets.BASE_VIT,
        Amulets.BASE_LUCK,
        Amulets.BASE_ATK,
        Amulets.BASE_M_ATK
    );
    await tx.wait(1);
    tx = await codexAmulets.initializeCodex2(
        Amulets.BASE_DEF,
        Amulets.BASE_M_DEF,
        Amulets.BASE_ELE_DEF,
        Amulets.BASE_HP,
        Amulets.BASE_DODGE,
        Amulets.BASE_CRIT,
        Amulets.BASE_CRITMULTI,
        Amulets.BASE_ACC
    );
    await tx.wait(1)
    console.log("CodexAmulets deployed to:", codexAmulets.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AMULETS_CODEX, codexAmulets.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.codex_amulets, JSON.stringify({
        CodexAmulets: codexAmulets.address,
    }), {});


}

main();