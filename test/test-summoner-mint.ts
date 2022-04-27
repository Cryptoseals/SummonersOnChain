import {ethers, upgrades} from "hardhat";
import {expect} from "chai";
import { DeployedFileLocations } from "../scripts/helpers/constants";
import fs from "fs";

const ether = ethers.utils.parseEther("1");

describe("Navigator and Essence", () => {
    let deployer : any = {
        address: ""
    };
    let Summoner;
    const deployedSummoner = JSON.parse(fs.readFileSync(DeployedFileLocations.summoners, 'utf-8'))

    it('Should mint summoner', async () => {
        const [w1] = await ethers.getSigners();
        deployer = w1;
        DeployedFileLocations.summoners
        Summoner = await ethers.getContractAt("Summoners", deployedSummoner.summoners);
        const initialBalance = await Summoner.balanceOf(deployer.address)
        console.log({initialBalance})
        /*
        enum Class {
            Barbarian, Paladin, Assassin, Wizard, Necromancer, Priest, Engineer, Ranger
        }
        */
        let tx = await Summoner.mintSummoner(0)
        await tx.wait(1);
        const currentBalance = await Summoner.balanceOf(deployer.address)
        console.log({currentBalance})
        console.log(
            await Summoner.summonerData(currentBalance-1)
        )
        expect(currentBalance).to.equal(initialBalance+1);
    })

})

