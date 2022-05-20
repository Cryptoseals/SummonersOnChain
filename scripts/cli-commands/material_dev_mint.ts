import {config} from 'dotenv'

config()
import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";
import {ISummoners} from "../../typechain-types"

enum MaterialTypes {
    ORE,
    WOOD,
    CLOTH,
    GEMSTONE

}

enum CraftingMaterial {
    COPPER, TIN, IRON, SILVER, GOLD, PLATINUM, MYTHRIL, ORICALCHUM,
    OBSIDIAN, LUMINITE,

    COPPER_INGOT, TIN_INGOT, IRON_INGOT, SILVER_INGOT, GOLD_INGOT,
    PLATINUM_INGOT, MYTHRIL_INGOT, ORICALCHUM_INGOT,
    OBSIDIAN_INGOT, LUMINITE_INGOT,


    GREEN_WOOD, SOFT_WOOD, AGED_WOOD, HARD_WOOD, PETRIFIED_WOOD, RED_OAK_WOOD,
    ELDER_WOOD, ANCIENT_WOOD, EBONY_WOOD, SNAKEWOOD,
    GREEN_WOOD_PLANK, SOFT_WOOD_PLANK, AGED_WOOD_PLANK, HARD_WOOD_PLANK,
    PETRIFIED_WOOD_PLANK, RED_OAK_WOOD_PLANK, ELDER_WOOD_PLANK,
    ANCIENT_WOOD_PLANK, EBONY_WOOD_PLANK, SNAKEWOOD_PLANK,


    TATTERED_LEATHER, RAGGED_LEATHER, RAW_LEATHER, THIN_LEATHER, COARSE_LEATHER,
    RUGGED_LEATHER, THICK_LEATHER,
    REINFORCED_LEATHER, HARDENED_LEATHER, LORDLY_LEATHER,

    PROCESSED_TATTERED_LEATHER, PROCESSED_RAGGED_LEATHER, PROCESSED_RAW_LEATHER,
    PROCESSED_THIN_LEATHER, PROCESSED_COARSE_LEATHER, PROCESSED_RUGGED_LEATHER,
    PROCESSED_THICK_LEATHER, PROCESSED_REINFORCED_LEATHER,
    PROCESSED_HARDENED_LEATHER, PROCESSED_LORDLY_LEATHER,


    JUTE, WOOL, COTTON, LINEN, SILK,
    HEMP, CASHMERE, VISCOSE, LYOCELL, RAYON,

    BOLT_OF_JUTE, BOLT_OF_WOOL, BOLT_OF_COTTON, BOLT_OF_LINEN,
    BOLT_OF_SILK, BOLT_OF_HEMP, BOLT_OF_CASHMERE, BOLT_OF_VISCOSE,
    BOLT_OF_LYOCELL, BOLT_OF_RAYON,

    AMBER, PEARL, AMETHYST, CORAL, RUBY, TOPAZ,
    AZURITE, EMERALD, SAPPHIRE, DIAMOND,

    POLISHED_AMBER, POLISHED_PEARL, POLISHED_AMETHYST, POLISHED_CORAL, POLISHED_RUBY,
    POLISHED_TOPAZ, POLISHED_AZURITE, POLISHED_EMERALD, POLISHED_SAPPHIRE, POLISHED_DIAMOND
}

async function main() {
    let deployer;
    const [w1] = await ethers.getSigners();
    deployer = w1.address;
    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx
    //
    // tx = await navigator.setGameContractsById(CONTRACTS.JOB, deployer, true)
    // await tx.wait(1)

    const deployedMaterials = JSON.parse(fs.readFileSync(DeployedFileLocations.crafting_materials, 'utf-8'))
    let mats = await ethers.getContractAt("CraftingMaterials", deployedMaterials.craftingMaterials)
    // console.log("COPPER:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.COPPER)))
    // console.log("TIN:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.TIN)))
    // console.log("IRON:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.IRON)))
    // console.log("SILVER:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.SILVER)))
    // console.log("GOLD:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.GOLD)))
    // console.log("COPPER_INGOT:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.COPPER_INGOT)))
    // console.log("IRON_INGOT:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.IRON_INGOT)))
    // console.log("GOLD_INGOT:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.GOLD_INGOT)))
    // //
    console.log("COPPER:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.COPPER)))
    console.log("COPPER_INGOT:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.COPPER_INGOT)))
    console.log("GREEN_WOOD:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.GREEN_WOOD)))
    console.log("GREEN_WOOD:", parseInt(await mats.balanceOf(deployer, CraftingMaterial.GREEN_WOOD)))

    // tx = await mats.mintMaterial(CraftingMaterial.COPPER_INGOT, deployer, 100)
    // await tx.wait(1)
    // tx = await mats.mintMaterial(CraftingMaterial.GREEN_WOOD, deployer, 100)
    // await tx.wait(1)


    // let activeProcesses: any[] = await mats.activeProcessingsOfUser(deployer);
    // activeProcesses = activeProcesses.map((a: any) => parseInt(a));
    // console.log(activeProcesses)
    // for (const prog of activeProcesses) {
    //     const process = await mats.ActiveProcessings(prog);
    //     // tx = await mats.claimProcess(activeProcesses);
    //     // await tx.wait(1)
    //     console.log(process)
    //     let when = parseInt(process.when) * 1000;
    //     let now = Date.now();
    //     let minutes = ((when - now) / 1000) / 60;
    //
    //     console.log("ready in: ", minutes, "minutes")
    // }
    // console.log(await adventures.timer(0))
    // console.log(await adventures.activeBattles(0))

    const deployedCrafting = JSON.parse(fs.readFileSync(DeployedFileLocations.crafting, 'utf-8'))
    let crafting = await ethers.getContractAt("Crafting", deployedCrafting.crafting)

    tx = await crafting.craft(0, 1)
    await tx.wait(1);

}

main();
