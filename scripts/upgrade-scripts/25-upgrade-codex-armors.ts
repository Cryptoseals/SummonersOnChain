import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployed = JSON.parse(fs.readFileSync(DeployedFileLocations.codex_armor, 'utf-8'))
    let tx;
    console.log(deployed)
    let CodexArmorsHeavy = await ethers.getContractFactory("CodexArmorsHeavy")
    let codexArmorsHeavy = await upgrades.upgradeProxy(deployed.codexArmorsHeavy, CodexArmorsHeavy);
    await codexArmorsHeavy.deployed()

    // await tx.wait(1);


    // MARMOR
    let CodexArmorsMedium = await ethers.getContractFactory("CodexArmorsMedium")
    let codexArmorsMedium = await upgrades.upgradeProxy(deployed.codexArmorsMedium, CodexArmorsMedium);
    await codexArmorsMedium.deployed()

    // LARMOR
    let CodexArmorsLight = await ethers.getContractFactory("CodexArmorsLight")
    let codexArmorsLight = await upgrades.upgradeProxy(deployed.codexArmorsLight, CodexArmorsLight);
    await codexArmorsLight.deployed()

    // await tx.wait(1);

    let CodexHelmetsHeavy = await ethers.getContractFactory("CodexHelmetsHeavy")
    let codexHelmetsHeavy = await upgrades.upgradeProxy(deployed.codexHelmetsHeavy, CodexHelmetsHeavy);
    await codexHelmetsHeavy.deployed()

    let CodexHelmetsMedium = await ethers.getContractFactory("CodexHelmetsMedium")
    let codexHelmetsMedium = await upgrades.upgradeProxy(deployed.codexHelmetsMedium, CodexHelmetsMedium);
    await codexHelmetsMedium.deployed()


    let CodexHelmetsLight = await ethers.getContractFactory("CodexHelmetsLight")
    let codexHelmetsLight = await upgrades.upgradeProxy(deployed.codexHelmetsLight, CodexHelmetsLight);
    await codexHelmetsLight.deployed()


    let CodexBootsHeavy = await ethers.getContractFactory("CodexBootsHeavy")
    let codexBootsHeavy = await upgrades.upgradeProxy(deployed.codexBootsHeavy, CodexBootsHeavy);
    await codexBootsHeavy.deployed()


    let CodexBootsMedium = await ethers.getContractFactory("CodexBootsMedium")
    let codexBootsMedium = await upgrades.upgradeProxy(deployed.codexBootsMedium, CodexBootsMedium);
    await codexBootsMedium.deployed()


    let CodexBootsLight = await ethers.getContractFactory("CodexBootsLight")
    let codexBootsLight = await upgrades.upgradeProxy(deployed.codexBootsLight, CodexBootsLight);
    await codexBootsLight.deployed()


    // SET


    //
    // fs.writeFileSync(DeployedFileLocations.codex_armor, JSON.stringify({
    //     codexArmorsHeavy: codexArmorsHeavy.address,
    //     codexArmorsMedium: codexArmorsMedium.address,
    //     codexArmorsLight: codexArmorsLight.address,
    //     codexHelmetsHeavy: codexHelmetsHeavy.address,
    //     codexHelmetsMedium: codexHelmetsMedium.address,
    //     codexHelmetsLight: codexHelmetsLight.address,
    //     codexBootsHeavy: codexBootsHeavy.address,
    //     codexBootsMedium: codexBootsMedium.address,
    //     codexBootsLight: codexBootsLight.address,
    // }), {});


}

main();