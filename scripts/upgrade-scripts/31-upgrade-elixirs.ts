import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedE = JSON.parse(fs.readFileSync(DeployedFileLocations.consumables, 'utf-8'))


    let CodexConsumableRecipes = await ethers.getContractFactory("CodexBuffEffectRecipes");
    let codexConsumableRecipes = await upgrades.upgradeProxy(deployedE.codexConsumableRecipes,
        CodexConsumableRecipes);
    await codexConsumableRecipes.deployed();

    // let CodexConsumables = await ethers.getContractFactory("CodexBuffEffect");
    // let codexConsumables = await upgrades.upgradeProxy(deployedE.codexConsumables,
    //     CodexConsumables);
    // await codexConsumables.deployed();

    //
    // let Elixirs = await ethers.getContractFactory("Elixirs");
    // let elixirs = await upgrades.upgradeProxy(deployedE.elixirs,
    //     Elixirs);
    // await elixirs.deployed();

}

main();