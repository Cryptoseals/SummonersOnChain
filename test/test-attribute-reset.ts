
import {ethers, upgrades} from "hardhat";
import {expect} from "chai";
import {DeployedFileLocations} from "../scripts/helpers/constants";
import fs from "fs";

const ether = ethers.utils.parseEther("1");

describe("Attribute set", () => {
    let deployer: any = {
        address: ""
    };
    let Attributes;
    let tx;
    const deployedAttr = JSON.parse(fs.readFileSync(DeployedFileLocations.attributes, 'utf-8'))

    it('Should reset', async () => {
        const [w1] = await ethers.getSigners();
        deployer = w1;
        Attributes = await ethers.getContractAt("Attributes", deployedAttr.attributes);
        tx = await Attributes.reset(0);
        await tx.wait(1);
        console.log(await Attributes.stats(0));
        console.log(await Attributes.totalPointsOfSummoner(0));
        console.log(await Attributes.UsedPoints(0));
    })

})

