import { ethers, upgrades } from "hardhat";
import fs from "fs";
import { CONTRACTS, DeployedFileLocations } from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx

    let CodexSpellsArcane = await ethers.getContractFactory("CodexSpellsArcane")
    let codexSpellsArcane = await upgrades.deployProxy(CodexSpellsArcane);

    await codexSpellsArcane.deployed()
    console.log("codexSpellsArcane deployed to:", codexSpellsArcane.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.ARCANE_SPELLS, codexSpellsArcane.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexSpellsCold = await ethers.getContractFactory("CodexSpellsCold")
    let codexSpellsCold = await upgrades.deployProxy(CodexSpellsCold);

    await codexSpellsCold.deployed()
    console.log("codexSpellsCold deployed to:", codexSpellsCold.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.COLD_SPELLS, codexSpellsCold.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")



    let CodexSpellsDark = await ethers.getContractFactory("CodexSpellsDark")
    let codexSpellsDark = await upgrades.deployProxy(CodexSpellsDark);

    await codexSpellsDark.deployed()
    console.log("codexSpellsDark deployed to:", codexSpellsDark.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.DARK_SPELLS, codexSpellsDark.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")



    let CodexSpellsEarth = await ethers.getContractFactory("CodexSpellsEarth")
    let codexSpellsEarth = await upgrades.deployProxy(CodexSpellsEarth);

    await codexSpellsEarth.deployed()
    console.log("codexSpellsEarth deployed to:", codexSpellsEarth.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.EARTH_SPELLS, codexSpellsEarth.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")



    let CodexSpellsFire = await ethers.getContractFactory("CodexSpellsFire")
    let codexSpellsFire = await upgrades.deployProxy(CodexSpellsFire);

    await codexSpellsFire.deployed()
    console.log("codexSpellsFire deployed to:", codexSpellsFire.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.FIRE_SPELLS, codexSpellsFire.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexSpellsGadgets = await ethers.getContractFactory("CodexSpellsGadgets")
    let codexSpellsGadgets = await upgrades.deployProxy(CodexSpellsGadgets);

    await codexSpellsGadgets.deployed()
    console.log("codexSpellsGadgets deployed to:", codexSpellsGadgets.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.GADGET_SPELLS, codexSpellsGadgets.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexSpellsHoly = await ethers.getContractFactory("CodexSpellsHoly")
    let codexSpellsHoly = await upgrades.deployProxy(CodexSpellsHoly);

    await codexSpellsHoly.deployed()
    console.log("codexSpellsHoly deployed to:", codexSpellsHoly.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.HOLY_SPELLS, codexSpellsHoly.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexSpellsLightning = await ethers.getContractFactory("CodexSpellsLightning")
    let codexSpellsLightning = await upgrades.deployProxy(CodexSpellsLightning);

    await codexSpellsLightning.deployed()
    console.log("codexSpellsLightning deployed to:", codexSpellsLightning.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.LIGHTNING_SPELLS, codexSpellsLightning.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexSpellsPhysical = await ethers.getContractFactory("CodexSpellsPhysical")
    let codexSpellsPhysical = await upgrades.deployProxy(CodexSpellsPhysical);

    await codexSpellsPhysical.deployed()
    console.log("codexSpellsPhysical deployed to:", codexSpellsPhysical.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.PHYSICAL_SPELLS, codexSpellsPhysical.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexSpellsRanged = await ethers.getContractFactory("CodexSpellsRanged")
    let codexSpellsRanged = await upgrades.deployProxy(CodexSpellsRanged);

    await codexSpellsRanged.deployed()
    console.log("codexSpellsRanged deployed to:", codexSpellsRanged.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.RANGED_SPELLS, codexSpellsRanged.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let CodexSpellsVoid = await ethers.getContractFactory("CodexSpellsVoid")
    let codexSpellsVoid = await upgrades.deployProxy(CodexSpellsVoid);

    await codexSpellsVoid.deployed()
    console.log("codexSpellsVoid deployed to:", codexSpellsVoid.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.VOID_SPELLS, codexSpellsVoid.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexSpells = await ethers.getContractFactory("CodexSpells")
    let codexSpells = await upgrades.deployProxy(CodexSpells, [navigator.address]);

    await codexSpells.deployed()
    console.log("codexSpells deployed to:", codexSpells.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.SPELLS_CODEX, codexSpells.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    let Spells = await ethers.getContractFactory("Spells")
    let spells = await upgrades.deployProxy(Spells, [navigator.address]);

    await spells.deployed()
    console.log("spells deployed to:", spells.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.SPELLS, spells.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    fs.writeFileSync(
        DeployedFileLocations.spells,
        JSON.stringify({
            codexSpellsArcane: codexSpellsArcane.address,
            codexSpellsCold: codexSpellsCold.address,
            codexSpellsDark: codexSpellsDark.address,
            codexSpellsEarth: codexSpellsEarth.address,
            codexSpellsFire: codexSpellsFire.address,
            codexSpellsGadgets: codexSpellsGadgets.address,
            codexSpellsHoly: codexSpellsHoly.address,
            codexSpellsLightning: codexSpellsLightning.address,
            codexSpellsPhysical: codexSpellsPhysical.address,
            codexSpellsRanged: codexSpellsRanged.address,
            codexSpellsVoid: codexSpellsVoid.address,
            codexSpells: codexSpells.address,
            spells: spells.address,
        }));

    //fs.writeFileSync('./scripts/contracts.json', JSON.stringify(contracts))
}

main();