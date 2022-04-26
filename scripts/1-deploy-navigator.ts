// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers, upgrades } from "hardhat";
import * as fs from 'fs'
import {DeployedFileLocations} from './helpers/constants'
async function main() {
 
  // Deploy Navigator
  const Navigator = await ethers.getContractFactory("Navigator");
  // args:
  // cryptoseals NFT address, season length (in days)
  const instance = await upgrades.deployProxy(Navigator, [ethers.constants.AddressZero, 90]);
  await instance.deployed();

  fs.writeFileSync(DeployedFileLocations.navigator, JSON.stringify({
    navigator: instance.address
  }))
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
