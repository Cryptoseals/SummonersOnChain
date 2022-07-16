import {ethers, upgrades} from "hardhat";
import fs from "fs";
import {CONTRACTS, DeployedFileLocations} from "./helpers/constants";
import * as Axes from "./helpers/Weapon/CodexAxes";
import * as Bows from "./helpers/Weapon/CodexBows";
import * as Daggers from "./helpers/Weapon/CodexDaggers";
import * as Staves from "./helpers/Weapon/CodexStaves";
import * as Shields from "./helpers/Weapon/CodexShields";
import * as Focus from "./helpers/Weapon/CodexFocus";
import * as Swords from "./helpers/Weapon/CodexSwords";

const deployment_mode = process.env?.DEPLOYMENT_MODE || "dev-local"

async function main() {

    const deployedNavigator = JSON.parse(fs.readFileSync(DeployedFileLocations.navigator, 'utf-8'))
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = Navigator.attach(deployedNavigator.navigator)
    let tx

    let CodexArtifactsProperties = await ethers.getContractFactory("CodexArtifactsProperties")
    let codexArtifactsProperties = await upgrades.deployProxy(CodexArtifactsProperties, [navigator.address], {
        initializer: "initialize"
    });

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