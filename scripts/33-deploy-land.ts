import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx

    let CodexLands = await ethers.getContractFactory("CodexLands")
    let codexLands = await upgrades.deployProxy(CodexLands);

    await codexLands.deployed()
    console.log("codexLands deployed to:", codexLands.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.LANDS_CODEX, codexLands.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let Lands = await ethers.getContractFactory("Lands")
    let lands = await upgrades.deployProxy(Lands, [navigator.address,"SoC : LAND", "SOCLAND"]);

    await lands.deployed()
    console.log("lands deployed to:", lands.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.LANDS, lands.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let LandControls = await ethers.getContractFactory("LandControls")
    let landControls = await upgrades.deployProxy(LandControls, [navigator.address]);

    await landControls.deployed()
    console.log("landControls deployed to:", landControls.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.LAND_CONTROLS, landControls.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let Seeds = await ethers.getContractFactory("Seeds")
    let seeds = await upgrades.deployProxy(Seeds, [navigator.address, "abc.com/seeds/"]);

    await seeds.deployed()
    console.log("seeds deployed to:", seeds.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.SEEDS, seeds.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let Animals = await ethers.getContractFactory("Animals")
    let animals = await upgrades.deployProxy(Animals, [navigator.address, "abc.com/animals/"]);

    await animals.deployed()
    console.log("animals deployed to:", animals.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.ANIMALS, animals.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let Trader = await ethers.getContractFactory("Trader")
    let trader = await upgrades.deployProxy(Trader, [navigator.address]);

    await trader.deployed()
    console.log("trader deployed to:", trader.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.TRADER, trader.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    fs.writeFileSync(DeployedFileLocations.lands,
        JSON.stringify({
            codexLands: codexLands.address,
            lands: lands.address,
            landControls: landControls.address,
            seeds: seeds.address,
            animals: animals.address,
            trader: trader.address
        }), {});

    //fs.writeFileSync('./scripts/contracts.json', JSON.stringify(contracts))
}

main();