import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx

    let CodexConsumableRecipes = await ethers.getContractFactory("CodexBuffEffectRecipes")
    let codexConsumableRecipes = await upgrades.deployProxy(CodexConsumableRecipes);

    await codexConsumableRecipes.deployed()
    console.log("codexConsumableRecipes deployed to:", codexConsumableRecipes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.CONSUMABLE_RECIPES, codexConsumableRecipes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexConsumables = await ethers.getContractFactory("CodexBuffEffect")
    let codexConsumables = await upgrades.deployProxy(CodexConsumables);

    await codexConsumables.deployed()
    console.log("codexConsumables deployed to:", codexConsumables.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.CONSUMABLES_CODEX, codexConsumables.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let Consumables = await ethers.getContractFactory("ConsumableItems")
    let consumables = await upgrades.deployProxy(Consumables, [navigator.address, "cryptoseals.art/s1/elixir/"], {
        initializer: "initialize"
    });

    await consumables.deployed()
    console.log("consumables deployed to:", consumables.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.CONSUMABLES, consumables.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.consumables,
        JSON.stringify({
            codexConsumableRecipes: codexConsumableRecipes.address,
            codexConsumables: codexConsumables.address,
            consumables: consumables.address,
        }), {});

    //fs.writeFileSync('./scripts/contracts.json', JSON.stringify(contracts))
}

main();