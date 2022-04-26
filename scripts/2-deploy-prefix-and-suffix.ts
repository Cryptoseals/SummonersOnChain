// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import {ethers, upgrades} from "hardhat";
import * as fs from 'fs'
import {CONTRACTS, DeployedFileLocations} from './helpers/constants'

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)


    let CodexPrefixes = await ethers.getContractFactory("CodexPrefixes")
    let codexPrefixes = await upgrades.deployProxy(CodexPrefixes);
    await codexPrefixes.deployed()
    console.log("Prefix deployed to:", codexPrefixes.address,)
    let tx = await navigator.setGameContractsById(CONTRACTS.PREFIX_CODEX, codexPrefixes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let CodexSuffixes = await ethers.getContractFactory("CodexSuffixes")
    let codexSuffixes = await upgrades.deployProxy(CodexSuffixes);
    await codexSuffixes.deployed()
    console.log("Suffix deployed to:", codexSuffixes.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.SUFFIX_CODEX, codexSuffixes.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.codex_prefix_and_suffixes, JSON.stringify({
        prefix: codexPrefixes.address,
        suffix: codexSuffixes.address
    }))
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
