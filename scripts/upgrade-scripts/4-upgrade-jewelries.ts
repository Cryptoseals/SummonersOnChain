import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    let tx;
    const deployeda = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_amulets, 'utf-8'))
    const deployedr = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_rings, 'utf-8'))
    const deployede = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_earrings, 'utf-8'))
    const deployedb = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_belts, 'utf-8'))

    let CodexAmulets = await ethers.getContractFactory("CodexAmulets")
    let codexAmulets = await upgrades.upgradeProxy(deployeda.CodexAmulets, CodexAmulets)

    let CodexBelts = await ethers.getContractFactory("CodexBelts")
    let codexBelts = await upgrades.upgradeProxy(deployedb.CodexBelts, CodexBelts)

    let CodexRings = await ethers.getContractFactory("CodexRings")
    let codexRings = await upgrades.upgradeProxy(deployedr.CodexRings, CodexRings)

    let CodexEarrings = await ethers.getContractFactory("CodexEarrings")
    let codexEarrings = await upgrades.upgradeProxy(deployede.CodexEarrings, CodexEarrings)

    console.log('DONE')


}

main();