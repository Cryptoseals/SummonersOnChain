import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx

    let CodexArtifactsProperties = await ethers.getContractFactory("CodexArtifactsProperties")
    let codexArtifactsProperties = await upgrades.deployProxy(CodexArtifactsProperties);

    await codexArtifactsProperties.deployed()
    console.log("codexArtifactsProperties deployed to:", codexArtifactsProperties.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.ARTIFACT_PROPS_CODEX, codexArtifactsProperties.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    let Artifacts = await ethers.getContractFactory("Artifacts")
    let artifacts = await upgrades.deployProxy(Artifacts, [navigator.address, "SoC Season 1, ARTIFACTS", "S1AFX"], {
        initializer: "initialize"
    });

    await artifacts.deployed()
    console.log("artifacts deployed to:", artifacts.address,)
    tx = await navigator.setGameContractsById(CONTRACTS.ARTIFACTS, artifacts.address, true)
    await tx.wait(1)
    console.log("and set in navigator.")

    fs.writeFileSync(DeployedFileLocations.artifacts,
        JSON.stringify({
        codexArtifactsProperties: codexArtifactsProperties.address,
        artifacts: artifacts.address,
    }), {});

    //fs.writeFileSync('./scripts/contracts.json', JSON.stringify(contracts))
}

main();