import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {
    let tx;
    let helpercontract = await ethers.getContractFactory("InitializeContractHelper");
    const deployedAdventureControls = JSON.parse(fs.readFileSync(DeployedFileLocations.adventure_controls, 'utf-8'))

    const deployedAdventure = JSON.parse(fs.readFileSync(DeployedFileLocations.adventures, 'utf-8'))

    const deployedArtifacts = JSON.parse(fs.readFileSync(DeployedFileLocations.artifacts, 'utf-8'))

    const deployedAttributes = JSON.parse(fs.readFileSync(DeployedFileLocations.attributes, 'utf-8'))

    const deployedCalculator = JSON.parse(fs.readFileSync(DeployedFileLocations.calculator, 'utf-8'))

    const deployedCodexAdventures = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_adventures, 'utf-8'))

    const deployedWeaponsCodex = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_weapons, 'utf-8'))

    const deployedCodexArmors = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_armor, 'utf-8'))

    const deployedCodexHelmet = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_armor, 'utf-8'))

    const deployedCodexBoots = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_armor, 'utf-8'))

    const deployedCrafting = JSON.parse(fs.readFileSync(DeployedFileLocations.crafting, 'utf-8'))

    const deployedCraftingMaterials = JSON.parse(fs.readFileSync(DeployedFileLocations.crafting_materials, 'utf-8'))

    const deployedEquipable = JSON.parse(fs.readFileSync(DeployedFileLocations.inventory, 'utf-8'))

    const deployedEquipableItems = JSON.parse(fs.readFileSync(DeployedFileLocations.equipable_items, 'utf-8'))

    const deployedReward = JSON.parse(fs.readFileSync(DeployedFileLocations.rewards, 'utf-8'))


    console.log(deployedAdventureControls)
    console.log(deployedAdventure)
    console.log(deployedArtifacts)
    console.log(deployedAttributes)
    console.log(deployedCalculator)
    console.log(deployedCodexAdventures)
    console.log(deployedWeaponsCodex)
    console.log(deployedCodexArmors)
    console.log(deployedCodexHelmet)
    console.log(deployedCodexBoots)
    console.log(deployedCrafting)
    console.log(deployedCraftingMaterials)
    console.log(deployedEquipable)
    console.log(deployedEquipableItems)
    console.log(deployedReward)



    const adventureControls = helpercontract.attach(deployedAdventureControls.adventureControls);

    const adventures = helpercontract.attach(deployedAdventure.adventures);

    const artifacts = helpercontract.attach(deployedArtifacts.artifacts);

    const attributes = helpercontract.attach(deployedAttributes.attributes);

    const calculator = helpercontract.attach(deployedCalculator.calculator);

    const codexAdventures = helpercontract.attach(deployedCodexAdventures.adventures);

    const weaponCodex = helpercontract.attach(deployedWeaponsCodex.CodexWeapons);

    const codexArmors = helpercontract.attach(deployedCodexArmors.codexArmors);

    const codexHelmet = helpercontract.attach(deployedCodexArmors.codexHelmets);

    const codexBoots = helpercontract.attach(deployedCodexArmors.codexBoots);

    const crafting = helpercontract.attach(deployedCrafting.crafting);

    const craftingMaterials = helpercontract.attach(deployedCraftingMaterials.craftingMaterials);

    const craftingInventory = helpercontract.attach(deployedEquipable.inventory);

    const craftingEquipableItems = helpercontract.attach(deployedEquipableItems.equipableItems);

    const reward = helpercontract.attach(deployedReward.rewards);


    tx = await adventureControls.initializeContracts();
    await tx.wait(1)
    console.log("adventureControls")
    tx = await adventures.initializeContracts();
    await tx.wait(1)
    console.log("adventures")
    tx = await artifacts.initializeContracts();
    await tx.wait(1)
    console.log("artifacts")
    tx = await attributes.initializeContracts();
    await tx.wait(1)
    console.log("attributes")
    tx = await calculator.initializeContracts();
    await tx.wait(1)
    console.log("calculator")
    tx = await codexAdventures.initializeContracts();
    await tx.wait(1)
    console.log("codexAdventures")
    tx = await weaponCodex.initializeContracts();
    await tx.wait(1)
    console.log("weaponCodex")
    tx = await codexArmors.initializeContracts();
    await tx.wait(1)
    console.log("codexArmors")
    tx = await codexHelmet.initializeContracts();
    await tx.wait(1)
    console.log("codexHelmet")
    tx = await codexBoots.initializeContracts();
    await tx.wait(1)
    console.log("codexBoots")
    tx = await crafting.initializeContracts();
    await tx.wait(1)
    console.log("crafting")
    tx = await craftingMaterials.initializeContracts();
    await tx.wait(1)
    console.log("craftingMaterials")
    tx = await craftingInventory.initializeContracts();
    await tx.wait(1)
    console.log("craftingInventory")
    tx = await craftingEquipableItems.initializeContracts();
    await tx.wait(1)
    console.log("craftingEquipableItems")
    tx = await reward.initializeContracts();
    await tx.wait(1)
    console.log("reward")


    await tx.wait(1)

    console.log(adventureControls.address)
    console.log(adventures.address)
    console.log(artifacts.address)
    console.log(attributes.address)
    console.log(calculator.address)
    console.log(codexAdventures.address)
    console.log(weaponCodex.address)
    console.log(codexArmors.address)
    console.log(codexHelmet.address)
    console.log(codexBoots.address)
    console.log(crafting.address)
    console.log(craftingMaterials.address)
    console.log(craftingInventory.address)
    console.log(craftingEquipableItems.address)
    console.log(reward.address)




}


main();