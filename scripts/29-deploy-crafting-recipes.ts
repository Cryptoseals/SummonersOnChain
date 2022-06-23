import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)

    let AmuletRecipes = await ethers.getContractFactory("AmuletRecipes");
    let amuletRecipes = await upgrades.deployProxy(AmuletRecipes)

    await amuletRecipes.deployed();
    let tx = await navigator.setGameContractsById(CONTRACTS.AMULET_RECIPES,
        amuletRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    //--------------------------------


    let RingRecipes = await ethers.getContractFactory("RingRecipes");
    let ringRecipes = await upgrades.deployProxy(RingRecipes)

    await ringRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.RING_RECIPES,
        ringRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    //--------------------------------


    let EarringsRecipes = await ethers.getContractFactory("EarringsRecipes");
    let earringRecipes = await upgrades.deployProxy(EarringsRecipes)

    await earringRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.EARRING_RECIPES,
        earringRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')
    //--------------------------------


    let BeltRecipes = await ethers.getContractFactory("BeltRecipes");
    let beltRecipes = await upgrades.deployProxy(BeltRecipes)

    await beltRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.BELT_RECIPES,
        beltRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    //--------------------------------

    let SwordRecipes = await ethers.getContractFactory("SwordRecipes");
    let swordRecipes = await upgrades.deployProxy(SwordRecipes)

    await swordRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.SWORD_RECIPES,
        swordRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    //--------------------------------

    let AxeRecipes = await ethers.getContractFactory("AxeRecipes");
    let axeRecipes = await upgrades.deployProxy(AxeRecipes)

    await axeRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.AXE_RECIPES,
        axeRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    //--------------------------------

    let BowRecipes = await ethers.getContractFactory("BowRecipes");
    let bowRecipes = await upgrades.deployProxy(BowRecipes)

    await bowRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.BOW_RECIPES,
        bowRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    //--------------------------------

    let DaggerRecipes = await ethers.getContractFactory("DaggerRecipes");
    let daggerRecipes = await upgrades.deployProxy(DaggerRecipes)

    await daggerRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.DAGGER_RECIPES,
        daggerRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    //--------------------------------

    let FocusRecipes = await ethers.getContractFactory("FocusRecipes");
    let focusRecipes = await upgrades.deployProxy(FocusRecipes)

    await focusRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.FOCUS_RECIPES,
        focusRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    //--------------------------------

    let ShieldRecipes = await ethers.getContractFactory("ShieldRecipes");
    let shieldRecipes = await upgrades.deployProxy(ShieldRecipes)

    await shieldRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.SHIELD_RECIPES,
        shieldRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    //--------------------------------

    let StaffRecipes = await ethers.getContractFactory("StaffRecipes");
    let staffRecipes = await upgrades.deployProxy(StaffRecipes)

    await staffRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.STAFF_RECIPES,
        staffRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    //--------------------------------

    let WeaponRecipes = await ethers.getContractFactory("WeaponRecipes");
    let weaponRecipes = await upgrades.deployProxy(WeaponRecipes, [navigator.address])

    await weaponRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.WEAPON_RECIPES,
        weaponRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    //_________@ARMORS___________

    let ArmorHeavyRecipes = await ethers.getContractFactory("ArmorHeavyRecipes");
    let armorHeavyRecipes = await upgrades.deployProxy(ArmorHeavyRecipes)

    await armorHeavyRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.HEAVY_ARMOR_RECIPES,
        armorHeavyRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    let ArmorMediumRecipes = await ethers.getContractFactory("ArmorMediumRecipes");
    let armorMediumRecipes = await upgrades.deployProxy(ArmorMediumRecipes)

    await armorMediumRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.MEDIUM_ARMOR_RECIPES,
        armorMediumRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    let ArmorLightRecipes = await ethers.getContractFactory("ArmorLightRecipes");
    let armorLightRecipes = await upgrades.deployProxy(ArmorLightRecipes)

    await armorLightRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.LIGHT_ARMOR_RECIPES,
        armorLightRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    let ArmorRecipes = await ethers.getContractFactory("ArmorRecipes");
    let armorRecipes = await upgrades.deployProxy(ArmorRecipes, [navigator.address])

    await armorRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.ARMOR_RECIPES,
        armorRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    //_________@Helmets___________

    let HelmetHeavyRecipes = await ethers.getContractFactory("HelmetHeavyRecipes");
    let helmetHeavyRecipes = await upgrades.deployProxy(HelmetHeavyRecipes)

    await helmetHeavyRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.HEAVY_HELMET_RECIPES,
        helmetHeavyRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    let HelmetMediumRecipes = await ethers.getContractFactory("HelmetMediumRecipes");
    let helmetMediumRecipes = await upgrades.deployProxy(HelmetMediumRecipes)

    await helmetMediumRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.MEDIUM_HELMET_RECIPES,
        helmetMediumRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    let HelmetLightRecipes = await ethers.getContractFactory("HelmetLightRecipes");
    let helmetLightRecipes = await upgrades.deployProxy(HelmetLightRecipes)

    await helmetLightRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.LIGHT_HELMET_RECIPES,
        helmetLightRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    let HelmetRecipes = await ethers.getContractFactory("HelmetRecipes");
    let helmetRecipes = await upgrades.deployProxy(HelmetRecipes, [navigator.address])

    await helmetRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.HELMET_RECIPES,
        helmetRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    //_________@BOOTS___________

    let BootsHeavyRecipes = await ethers.getContractFactory("BootsHeavyRecipes");
    let bootsHeavyRecipes = await upgrades.deployProxy(BootsHeavyRecipes)

    await bootsHeavyRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.HEAVY_BOOTS_RECIPES,
        bootsHeavyRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    let BootsMediumRecipes = await ethers.getContractFactory("BootsMediumRecipes");
    let bootsMediumRecipes = await upgrades.deployProxy(BootsMediumRecipes)

    await bootsMediumRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.MEDIUM_BOOTS_RECIPES,
        bootsMediumRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')

    let BootsLightRecipes = await ethers.getContractFactory("BootsLightRecipes");
    let bootsLightRecipes = await upgrades.deployProxy(BootsLightRecipes)

    await bootsLightRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.LIGHT_BOOTS_RECIPES,
        bootsLightRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    let BootsRecipes = await ethers.getContractFactory("BootsRecipes");
    let bootsRecipes = await upgrades.deployProxy(BootsRecipes, [navigator.address])

    await bootsRecipes.deployed();
    tx = await navigator.setGameContractsById(CONTRACTS.BOOTS_RECIPES,
        bootsRecipes.address, true);
    await tx.wait(1)
    console.log('set in contracts')


    fs.writeFileSync(DeployedFileLocations.crafting_recipes, JSON.stringify({}), {});

}

main();