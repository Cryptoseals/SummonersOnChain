import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";
import * as Axes from "./helpers/Weapon/CodexAxes";
import * as Bows from "./helpers/Weapon/CodexBows";
import * as Daggers from "./helpers/Weapon/CodexDaggers";
import * as Staves from "./helpers/Weapon/CodexStaves";
import * as Shields from "./helpers/Weapon/CodexShields";
import * as Focus from "./helpers/Weapon/CodexFocus";
import * as Swords from "./helpers/Weapon/CodexSwords";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx
    let CodexStaves = await ethers.getContractFactory("CodexStaves")
    let codexStaves = await upgrades.deployProxy(CodexStaves, [
        Staves.BASE_INT,
        Staves.BASE_AGI,
        Staves.BASE_DEX,
        Staves.BASE_LUCK,
        Staves.BASE_M_ATK,
        Staves.BASE_CRIT,
        Staves.BASE_CRITMULTI,
        Staves.BASE_ACC
    ], {
        initializer: "initialize"
    });
    await codexStaves.deployed()
    console.log("Staves deployed to:", codexStaves.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.STAFF_STATS, codexStaves.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexDaggers = await ethers.getContractFactory("CodexDaggers")
    let codexDaggers = await upgrades.deployProxy(CodexDaggers, [
        Daggers.BASE_STR,
        Daggers.BASE_AGI,
        Daggers.BASE_DEX,
        Daggers.BASE_LUCK,
        Daggers.BASE_ATK,
        Daggers.BASE_CRIT,
        Daggers.BASE_CRITMULTI,
        Daggers.BASE_ACC,
    ], {
        initializer: "initialize"
    });
    await codexDaggers.deployed()
    console.log("Daggers deployed to:", codexDaggers.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.DAGGER_STATS, codexDaggers.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexAxes = await ethers.getContractFactory("CodexAxes")
    let codexAxes = await upgrades.deployProxy(CodexAxes, [
        Axes.BASE_STR,
        Axes.BASE_AGI,
        Axes.BASE_DEX,
        Axes.BASE_ATK,
        Axes.BASE_CRIT,
        Axes.BASE_CRITMULTI,
        Axes.BASE_ACC,
    ], {
        initializer: "initialize"
    });
    await codexAxes.deployed()
    console.log("Axes deployed to:", codexAxes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.AXE_STATS, codexAxes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexBows = await ethers.getContractFactory("CodexBows")
    let codexBows = await upgrades.deployProxy(CodexBows, [
        Bows.BASE_STR,
        Bows.BASE_AGI,
        Bows.BASE_DEX,
        Bows.BASE_LUCK,
        Bows.BASE_ATK,
        Bows.BASE_CRIT,
        Bows.BASE_CRITMULTI,
        Bows.BASE_ACC,
    ], {
        initializer: "initialize"
    });
    await codexBows.deployed()
    console.log("Bows deployed to:", codexBows.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.BOW_STATS, codexBows.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexFocuses = await ethers.getContractFactory("CodexFocuses")
    let codexFocuses = await upgrades.deployProxy(CodexFocuses, [
        Focus.BASE_INT,
        Focus.BASE_AGI,
        Focus.BASE_DEX,
        Focus.BASE_LUCK,
        Focus.BASE_M_ATK,
        Focus.BASE_CRIT,
        Focus.BASE_CRITMULTI,
        Focus.BASE_ACC,
        Focus.BASE_DODGE,
    ], {
        initializer: "initialize"
    });
    await codexFocuses.deployed()
    console.log("Focuses deployed to:", codexFocuses.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.FOCUS_STATS, codexFocuses.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexSwords = await ethers.getContractFactory("CodexSwords")
    let codexSwords = await upgrades.deployProxy(CodexSwords, [
        Swords.BASE_STR,
        Swords.BASE_AGI,
        Swords.BASE_DEX,
        Swords.BASE_ATK,
        Swords.BASE_CRIT,
        Swords.BASE_CRITMULTI,
        Swords.BASE_ACC,
    ], {
        initializer: "initialize"
    });
    await codexSwords.deployed()
    console.log("Swords deployed to:", codexSwords.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.SWORD_STATS, codexSwords.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexShields = await ethers.getContractFactory("CodexShields")
    let codexShields = await upgrades.deployProxy(CodexShields, [
        Shields.BASE_STR,
        Shields.BASE_ATK,
        Shields.BASE_VIT,
        Shields.BASE_HP,
        Shields.BASE_DEF,
        Shields.BASE_M_DEF,
        // Shields.BASE_ACC,
        Shields.BASE_DODGE,
    ], {
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