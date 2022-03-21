import {ethers, upgrades} from "hardhat";
import {expect} from "chai";

const ether = ethers.utils.parseEther("1");

describe("Navigator and Essence", () => {
    let deployer : any = {
        address: ""
    };
    let Navigator : any;
    let navigator : any;
    let Essence : any;
    let essence: any;
    let tx;

    it('Should mint essence when whitelisted', async () => {
        const [w1] = await ethers.getSigners();
        deployer = w1;
        Navigator = await ethers.getContractFactory("Navigator");
        navigator = await upgrades.deployProxy(Navigator, [ethers.constants.AddressZero], {
            initializer: "initialize"
        });
        console.log(`Navigator Deployed: ${navigator.address}`)
        let contracts = [deployer.address];
        tx = await navigator.setGameContractsAddresses(contracts, true);
        await tx.wait(1);
        console.log(`Allowed user.`)
        console.log(await navigator.isGameContract(deployer.address));

        //string memory _name, string memory _symbol,
        // uint _interval, uint _reward, address _navigator
        Essence = await ethers.getContractFactory("Essence");
        essence = await upgrades.deployProxy(Essence, ["SoC: Season 1 - Essence", "ESSENCE", navigator.address], {
            initializer: "initialize"
        });
        await essence.deployed();
        console.log(`Essence Deployed: ${essence.address}`)
        console.log(`Navigator: ${await essence.navigator()}`)
        const bal1 = await essence.balanceOf(deployer.address)
        console.log(`Balance of ${deployer.address}: ${bal1}`)
        tx = await essence.rewardToken(deployer.address, ether, {
            gasLimit: 1000000
        })
        await tx.wait(1);
        const deployerBalance = await essence.balanceOf(deployer.address);
        const bal2 = await essence.balanceOf(deployer.address)
        console.log(`Balance Diff. = ${ethers.utils.formatEther((parseInt(bal2) - parseInt(bal1)).toString())} eth`);
        expect(await essence.totalSupply()).to.equal(deployerBalance);
        return true;
    })
    it('Should burn whole balance', async () => {
        let balance = await essence.balanceOf(deployer.address);
        tx = await essence.burnToken(deployer.address, balance);
        await tx.wait(1);
        balance = await essence.balanceOf(deployer.address);
        expect(parseInt(balance)).to.equal(0);
    })
})

