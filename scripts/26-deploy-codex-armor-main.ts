import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let CodexArmors = await ethers.getContractFactory("CodexArmors");
    let codexArmors = await upgrades.deployProxy(CodexArmors, [navigator.address])

    await codexArmors.deployed();
    let tx = await navigator.setGameContractsById(CONTRACTS.BODY_ARMORS_CODEX,
        codexArmors.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    let CodexHelmets = await ethers.getContractFactory("CodexHelmets");
    let codexHelmets = await upgrades.deployProxy(CodexHelmets, [navigator.address])

    await codexHelmets.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.HELMETS_CODEX,
        codexHelmets.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    let CodexBoots = await ethers.getContractFactory("CodexBoots");
    let codexBoots = await upgrades.deployProxy(CodexBoots, [navigator.address])

    await codexBoots.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.BOOTS_CODEX,
        codexBoots.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    fs.writeFileSync(DeployedFileLocations.codex_armor, JSON.stringify({
        codexArmors: codexArmors.address,
        codexHelmets: codexHelmets.address,
        codexBoots: codexBoots.address,
    }), {});


}

main();