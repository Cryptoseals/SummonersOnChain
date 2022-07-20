import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx

    let CodexCores = await ethers.getContractFactory("CodexCores")
    let codexCores = await upgrades.deployProxy(CodexCores);

    await codexCores.deployed()
    console.log("codexCores deployed to:", codexCores.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.CORE_CODEX, codexCores.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    //
    // let Cores = await ethers.getContractFactory("Cores")
    // let cores = await upgrades.deployProxy(Cores, [navigator.address, "SoC: Season 1 - Core"]);
    //
    // await cores.deployed()
    // console.log("cores deployed to:", cores.address,)
    // tx = await navigator.setGameContractsById(CONTRACTS.CORES, cores.address, true)
    // await tx.wait(1)
    // console.log("and set in navigator.")

    //
    // fs.writeFileSync(DeployedFileLocations.cores,
    //     JSON.stringify({
    //         coreCodex: codexCores.address,
    //         core: cores.address,
    //     }), {});

    //fs.writeFileSync('./scripts/contracts.json', JSON.stringify(contracts))
}

main();