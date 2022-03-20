// 0xc51b2f8E24acc0164ED2a5966b36Febeb20c510C
import { ethers, upgrades } from "hardhat";
import contracts from '../scripts/contracts.json'
async function main() {

    console.log(contracts.CodexWeapons)
    const weaponCodex = await ethers.getContractAt("CodexWeapons",contracts.CodexWeapons);
    console.log((await weaponCodex.version()))
}

main();