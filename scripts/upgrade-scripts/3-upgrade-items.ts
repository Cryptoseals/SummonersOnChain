import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    let tx;
    const deployed = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_weapons, 'utf-8'))
    const {
        CodexStaves: _codexStaves,
        CodexAxes: _codexAxes,
        CodexSwords: _codexSwords,
        CodexShields: _codexShields,
        CodexFocuses: _codexFocuses,
        CodexBows: _codexBows,
        CodexDaggers: _codexDaggers,
        CodexWeapons: _codexWeapons,
    } = deployed

    let CodexStaves = await ethers.getContractFactory("CodexStaves")
    let codexStaves = await upgrades.upgradeProxy(_codexStaves, CodexStaves)
    await codexStaves.deployed()
    console.log("Staves deployed to:", codexStaves.address,)

    let CodexDaggers = await ethers.getContractFactory("CodexDaggers")
    let codexDaggers = await upgrades.upgradeProxy(_codexDaggers, CodexDaggers)
    console.log("Daggers deployed to:", codexDaggers.address,)
    let CodexAxes = await ethers.getContractFactory("CodexAxes")
    let codexAxes = await upgrades.upgradeProxy(_codexAxes, CodexAxes)
    await codexAxes.deployed()
    console.log("Axes deployed to:", codexAxes.address,)

    let CodexBows = await ethers.getContractFactory("CodexBows")
    let codexBows = await upgrades.upgradeProxy(_codexBows, CodexBows)
    await codexBows.deployed()
    console.log("Bows deployed to:", codexBows.address,)


    let CodexFocuses = await ethers.getContractFactory("CodexFocuses")
    let codexFocuses = await upgrades.upgradeProxy(_codexFocuses, CodexFocuses)
    await codexFocuses.deployed()


    let CodexSwords = await ethers.getContractFactory("CodexSwords")
    let codexSwords = await upgrades.upgradeProxy(_codexSwords, CodexSwords)
    await codexSwords.deployed()


    let CodexShields = await ethers.getContractFactory("CodexShields")
    let codexShields = await upgrades.upgradeProxy(_codexShields, CodexShields)
    await codexShields.deployed()
    console.log("Shields deployed to:", codexShields.address,)

    let CodexWeapons = await ethers.getContractFactory("CodexWeapons")
    let codexWeapons = await upgrades.upgradeProxy(_codexWeapons, CodexWeapons)
    await codexWeapons.deployed()
    console.log("CodexWeapons deployed to:", codexWeapons.address,)
}

main();