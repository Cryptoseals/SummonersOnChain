import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let CodexRandom = await ethers.getContractFactory("CodexRandom");
    let codexRandom = await upgrades.deployProxy(CodexRandom)

    await codexRandom.deployed();
    let tx = await navigator.setGameContractsById(CONTRACTS.RANDOM_CODEX,
        codexRandom.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    fs.writeFileSync(DeployedFileLocations.random, JSON.stringify({
        codexRandom: codexRandom.address,
    }), {});

}

main();