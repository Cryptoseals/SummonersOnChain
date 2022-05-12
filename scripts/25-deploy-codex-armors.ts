import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";
import * as HArmor from "./helpers/Armor/CodexArmorHeavy";
import * as HHelmet from "./helpers/Armor/CodexHelmetHeavy";
import * as HBoots from "./helpers/Armor/CodexBootsHeavy";
import * as MArmor from "./helpers/Armor/CodexArmorMedium";
import * as MHelmet from "./helpers/Armor/CodexHelmetMedium";
import * as MBoots from "./helpers/Armor/CodexBootsMedium";
import * as LArmor from "./helpers/Armor/CodexArmorLight";
import * as LHelmet from "./helpers/Armor/CodexHelmetLight";
import * as LBoots from "./helpers/Armor/CodexBootsLight";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx;
    // HARMOR
    let CodexArmorsHeavy = await ethers.getContractFactory("CodexArmorsHeavy")
    let codexArmorsHeavy = await upgrades.deployProxy(CodexArmorsHeavy,
        [
            HArmor.BASE_STR,
            HArmor.BASE_AGI,
            HArmor.BASE_DEX,
            HArmor.BASE_VIT,
            HArmor.BASE_DEF,
            HArmor.BASE_M_DEF,
            HArmor.BASE_ELE_DEF,
            HArmor.BASE_HP,
            HArmor.BASE_DODGE,
        ]);
    await codexArmorsHeavy.deployed()

    // await tx.wait(1);


    // MARMOR
    let CodexArmorsMedium = await ethers.getContractFactory("CodexArmorsMedium")
    let codexArmorsMedium = await upgrades.deployProxy(CodexArmorsMedium,
        [
            MArmor.BASE_STR,
            MArmor.BASE_AGI,
            MArmor.BASE_DEX,
            MArmor.BASE_VIT,
            MArmor.BASE_DEF,
            MArmor.BASE_M_DEF,
            MArmor.BASE_ELE_DEF,
            MArmor.BASE_HP,
            MArmor.BASE_DODGE,
        ]);
    await codexArmorsMedium.deployed()

    // LARMOR
    let CodexArmorsLight = await ethers.getContractFactory("CodexArmorsLight")
    let codexArmorsLight = await upgrades.deployProxy(CodexArmorsLight,
        [
            LArmor.BASE_STR,
            LArmor.BASE_AGI,
            LArmor.BASE_DEX,
            LArmor.BASE_VIT,
            LArmor.BASE_INT,
            LArmor.BASE_DEF,
            LArmor.BASE_M_DEF,
            LArmor.BASE_ELE_DEF,
            LArmor.BASE_HP,
            LArmor.BASE_DODGE,
        ]);
    await codexArmorsLight.deployed()

    // await tx.wait(1);

    let CodexHelmetsHeavy = await ethers.getContractFactory("CodexHelmetsHeavy")
    let codexHelmetsHeavy = await upgrades.deployProxy(CodexHelmetsHeavy,
        [
            HHelmet.BASE_STR,
            HHelmet.BASE_DEX,
            HHelmet.BASE_VIT,
            HHelmet.BASE_INT,
            HHelmet.BASE_DEF,
            HHelmet.BASE_M_DEF,
            HHelmet.BASE_ELE_DEF,
            HHelmet.BASE_HP,
            HHelmet.BASE_DODGE,
            HHelmet.BASE_ACC
        ]);
    await codexHelmetsHeavy.deployed()

    let CodexHelmetsMedium = await ethers.getContractFactory("CodexHelmetsMedium")
    let codexHelmetsMedium = await upgrades.deployProxy(CodexHelmetsMedium,
        [
            MHelmet.BASE_STR,
            MHelmet.BASE_AGI,
            MHelmet.BASE_DEX,
            MHelmet.BASE_VIT,
            MHelmet.BASE_INT,
            MHelmet.BASE_DEF,
            MHelmet.BASE_M_DEF,
            MHelmet.BASE_ELE_DEF,
            MHelmet.BASE_HP,
            MHelmet.BASE_DODGE,
            MHelmet.BASE_ACC
        ]);
    await codexHelmetsMedium.deployed()



    let CodexHelmetsLight = await ethers.getContractFactory("CodexHelmetsLight")
    let codexHelmetsLight = await upgrades.deployProxy(CodexHelmetsLight,
        [
            LHelmet.BASE_STR,
            LHelmet.BASE_AGI,
            LHelmet.BASE_DEX,
            LHelmet.BASE_VIT,
            LHelmet.BASE_INT,
            LHelmet.BASE_DEF,
            LHelmet.BASE_M_DEF,
            LHelmet.BASE_ELE_DEF,
            LHelmet.BASE_HP,
            LHelmet.BASE_DODGE,
            LHelmet.BASE_ACC
        ]);
    await codexHelmetsLight.deployed()



    let CodexBootsHeavy = await ethers.getContractFactory("CodexBootsHeavy")
    let codexBootsHeavy = await upgrades.deployProxy(CodexBootsHeavy,
        [
            HBoots.BASE_STR,
            HBoots.BASE_AGI,
            HBoots.BASE_DEX,
            HBoots.BASE_VIT,
            HBoots.BASE_DEF,
            HBoots.BASE_M_DEF,
            HBoots.BASE_ELE_DEF,
            HBoots.BASE_HP,
            HBoots.BASE_DODGE
        ]);
    await codexBootsHeavy.deployed()



    let CodexBootsMedium = await ethers.getContractFactory("CodexBootsMedium")
    let codexBootsMedium = await upgrades.deployProxy(CodexBootsMedium,
        [
            MBoots.BASE_STR,
            MBoots.BASE_AGI,
            MBoots.BASE_DEX,
            MBoots.BASE_VIT,
            MBoots.BASE_DEF,
            MBoots.BASE_M_DEF,
            MBoots.BASE_ELE_DEF,
            MBoots.BASE_HP,
            MBoots.BASE_DODGE
        ]);
    await codexBootsMedium.deployed()



    let CodexBootsLight = await ethers.getContractFactory("CodexBootsLight")
    let codexBootsLight = await upgrades.deployProxy(CodexBootsLight,
        [
            LBoots.BASE_STR,
            LBoots.BASE_AGI,
            LBoots.BASE_DEX,
            LBoots.BASE_VIT,
            LBoots.BASE_INT,
            LBoots.BASE_DEF,
            LBoots.BASE_M_DEF,
            LBoots.BASE_ELE_DEF,
            LBoots.BASE_HP,
            LBoots.BASE_DODGE
        ]);
    await codexBootsLight.deployed()


    // SET

    console.log("codexArmorsHeavy deployed to:", codexArmorsHeavy.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.HEAVY_ARMOR_STATS, codexArmorsHeavy.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    console.log("codexArmorsMedium deployed to:", codexArmorsMedium.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.MEDIUM_ARMOR_RECIPES, codexArmorsMedium.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    console.log("codexArmorsLight deployed to:", codexArmorsLight.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.LIGHT_ARMOR_STATS, codexArmorsLight.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    console.log("codexHelmetsHeavy deployed to:", codexHelmetsHeavy.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.HEAVY_HELMET_STATS, codexHelmetsHeavy.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    console.log("codexHelmetsMedium deployed to:", codexHelmetsMedium.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.MEDIUM_HELMET_STATS, codexHelmetsMedium.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    console.log("codexHelmetsLight deployed to:", codexHelmetsLight.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.LIGHT_HELMET_STATS, codexHelmetsLight.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")


    console.log("codexBootsHeavy deployed to:", codexBootsHeavy.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.HEAVY_BOOTS_STATS, codexBootsHeavy.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    console.log("codexBootsMedium deployed to:", codexBootsMedium.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.MEDIUM_BOOTS_STATS, codexBootsMedium.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")



    console.log("codexBootsLight deployed to:", codexBootsLight.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.LIGHT_BOOTS_STATS, codexBootsLight.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")








    fs.writeFileSync(DeployedFileLocations.codex_amulets, JSON.stringify({
        codexArmorsHeavy: codexArmorsHeavy.address,
        codexArmorsMedium: codexArmorsMedium.address,
        codexArmorsLight: codexArmorsLight.address,
        codexHelmetsHeavy: codexHelmetsHeavy.address,
        codexHelmetsMedium: codexHelmetsMedium.address,
        codexHelmetsLight: codexHelmetsLight.address,
        codexBootsHeavy: codexBootsHeavy.address,
        codexBootsMedium: codexBootsMedium.address,
        codexBootsLight: codexBootsLight.address,
    }), {});


}

main();