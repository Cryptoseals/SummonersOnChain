import {ethers, upgrades} from "hardhat";
import * as fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "../helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"
const ether = ethers.utils.parseEther("1");

async function main() {
    const deployedE = JSON.parse(fs.readFileSync(DeployedFileLocations.spells, 'utf-8'))
    let tx
    let Spells = await ethers.getContractFactory("Spells")
    let spells = await upgrades.upgradeProxy(deployedE.spells,
        Spells);
    await spells.deployed();
    console.log('done'); 
    
    // let CodexSpellsArcane = await ethers.getContractFactory("CodexSpellsArcane")
    // let codexSpellsArcane = await upgrades.upgradeProxy(deployedE.codexSpellsArcane,
    //     CodexSpellsArcane);
    // await codexSpellsArcane.deployed();
    // console.log('done');
      
    // let CodexSpellsCold = await ethers.getContractFactory("CodexSpellsCold")
    // let codexSpellsCold = await upgrades.upgradeProxy(deployedE.codexSpellsCold,
    //     CodexSpellsCold);
    // await codexSpellsCold.deployed();
    // console.log('done');
       
    // let CodexSpellsDark = await ethers.getContractFactory("CodexSpellsDark")
    // let codexSpellsDark = await upgrades.upgradeProxy(deployedE.codexSpellsDark,
    //     CodexSpellsDark);
    // await codexSpellsDark.deployed();
    // console.log('done');
         
    // let CodexSpellsEarth = await ethers.getContractFactory("CodexSpellsEarth")
    // let codexSpellsEarth = await upgrades.upgradeProxy(deployedE.codexSpellsEarth,
    //     CodexSpellsEarth);
    // await codexSpellsEarth.deployed();
    // console.log('done');
       
    // let CodexSpellsFire = await ethers.getContractFactory("CodexSpellsFire")
    // let codexSpellsFire = await upgrades.upgradeProxy(deployedE.codexSpellsFire,
    //     CodexSpellsFire);
    // await codexSpellsFire.deployed();
    // console.log('done');

    // let CodexSpellsGadgets = await ethers.getContractFactory("CodexSpellsGadgets")
    // let codexSpellsGadgets = await upgrades.upgradeProxy(deployedE.codexSpellsGadgets,
    //     CodexSpellsGadgets);
    // await codexSpellsGadgets.deployed();
    // console.log('done');

    // let CodexSpellsHoly = await ethers.getContractFactory("CodexSpellsHoly")
    // let codexSpellsHoly = await upgrades.upgradeProxy(deployedE.codexSpellsHoly,
    //     CodexSpellsHoly);
    // await codexSpellsHoly.deployed();
    // console.log('done');

    // let CodexSpellsLightning = await ethers.getContractFactory("CodexSpellsLightning")
    // let codexSpellsLightning = await upgrades.upgradeProxy(deployedE.codexSpellsLightning,
    //     CodexSpellsLightning);
    // await codexSpellsLightning.deployed();
    // console.log('done');

    // let CodexSpellsPhysical = await ethers.getContractFactory("CodexSpellsPhysical")
    // let codexSpellsPhysical = await upgrades.upgradeProxy(deployedE.codexSpellsPhysical,
    //     CodexSpellsPhysical);
    // await codexSpellsPhysical.deployed();
    // console.log('done');

    // let CodexSpellsRanged = await ethers.getContractFactory("CodexSpellsRanged")
    // let codexSpellsRanged = await upgrades.upgradeProxy(deployedE.codexSpellsRanged,
    //     CodexSpellsRanged);
    // await codexSpellsRanged.deployed();
    // console.log('done');

    // let CodexSpellsVoid = await ethers.getContractFactory("CodexSpellsVoid")
    // let codexSpellsVoid = await upgrades.upgradeProxy(deployedE.codexSpellsVoid,
    //     CodexSpellsVoid);
    // await codexSpellsVoid.deployed();
    // console.log('done');
    
}

main();