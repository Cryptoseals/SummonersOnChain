import { ethers, upgrades } from "hardhat";
import fs from "fs";
import { CONTRACTS, DeployedFileLocations } from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let CodexStaves = await ethers.getContractFactory("CodexStaves")
    let codexStaves = await upgrades.deployProxy(CodexStaves, [], {
        initializer: "initialize"
    });
    await codexStaves.deployed()
    console.log("Staves deployed to:", codexStaves.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.STAFF_STATS, codexStaves.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexDaggers = await ethers.getContractFactory("CodexDaggers")
    let codexDaggers = await upgrades.deployProxy(CodexDaggers, [], {
        initializer: "initialize"
    });
    await codexDaggers.deployed()
    console.log("Daggers deployed to:", codexDaggers.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.DAGGER_STATS, codexDaggers.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexAxes = await ethers.getContractFactory("CodexAxes")
    let codexAxes = await upgrades.deployProxy(CodexAxes, [], {
        initializer: "initialize"
    });
    await codexAxes.deployed()
    console.log("Axes deployed to:", codexAxes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AXE_STATS, codexAxes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexBows = await ethers.getContractFactory("CodexBows")
    let codexBows = await upgrades.deployProxy(CodexBows, [], {
        initializer: "initialize"
    });
    await codexBows.deployed()
    console.log("Bows deployed to:", codexBows.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.BOW_STATS, codexBows.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexFocuses = await ethers.getContractFactory("CodexFocuses")
    let codexFocuses = await upgrades.deployProxy(CodexFocuses, [], {
        initializer: "initialize"
    });
    await codexFocuses.deployed()
    console.log("Focuses deployed to:", codexFocuses.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.FOCUS_STATS, codexFocuses.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexSwords = await ethers.getContractFactory("CodexSwords")
    let codexSwords = await upgrades.deployProxy(CodexSwords, [], {
        initializer: "initialize"
    });
    await codexSwords.deployed()
    console.log("Swords deployed to:", codexSwords.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.SWORD_STATS, codexSwords.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexShields = await ethers.getContractFactory("CodexShields")
    let codexShields = await upgrades.deployProxy(CodexShields, [], {
        initializer: "initialize"
    });
    await codexShields.deployed()
    console.log("Shields deployed to:", codexShields.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.SHIELD_STATS, codexShields.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexWeapons = await ethers.getContractFactory("CodexWeapons")
    let codexWeapons = await upgrades.deployProxy(CodexWeapons, [navigator.address], {
        initializer: "initialize"
    });
    await codexWeapons.deployed()
    console.log("CodexWeapons deployed to:", codexWeapons.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.WEAPONS_CODEX, codexWeapons.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.codex_weapons, JSON.stringify({
        CodexStaves: codexStaves.address,
        CodexAxes: codexAxes.address,
        CodexSwords: codexSwords.address,
        CodexShields: codexShields.address,
        CodexFocuses: codexFocuses.address,
        CodexBows: codexBows.address,
        CodexDaggers: codexDaggers.address,
        CodexWeapons: codexWeapons.address,
    }), {});

    //fs.writeFileSync('./scripts/contracts.json', JSON.stringify(contracts))
}

main();