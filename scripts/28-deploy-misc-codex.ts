import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
let tx
    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let CodexMiscItems = await ethers.getContractFactory("CodexMiscItems");
    let codexMiscItems = await upgrades.deployProxy(CodexMiscItems)

    await codexMiscItems.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.MISC_CODEX,
        codexMiscItems.address, true);
    await tx.wait(1)
    console.log('codexMiscItems set in contracts')


    let CodexAlchemyItems = await ethers.getContractFactory("CodexAlchemyItems");
    let codexAlchemyItems = await upgrades.deployProxy(CodexAlchemyItems)

    await codexAlchemyItems.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.ALCHEMY_ITEMS_CODEX,
        codexAlchemyItems.address, true);
    await tx.wait(1)
    console.log('codexAlchemyItems set in contracts')


    let CodexCookingItems = await ethers.getContractFactory("CodexCookingItems");
    let codexCookingItems = await upgrades.deployProxy(CodexCookingItems)

    await codexCookingItems.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.COOKING_ITEMS_CODEX,
        codexCookingItems.address, true);
    await tx.wait(1)

    console.log('codexCookingItems set in contracts')

    fs.writeFileSync(DeployedFileLocations.misc_codex, JSON.stringify({
        codexMiscItems: codexMiscItems.address,
        codexAlchemyItems: codexAlchemyItems.address,
        codexCookingItems: codexCookingItems.address,
    }), {});

}

main();