import {ethers, upgrades} from "hardhat";
import {expect} from "chai";

const ether = ethers.utils.parseEther("1");

describe("Navigator and Gold", () => {
    let deployer : any = {
        address: ""
    };
    let Navigator : any;
    let navigator : any;
    let Gold : any;
    let gold: any;
    let tx;

    it('Should mint gold when whitelisted', async () => {
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
        Gold = await ethers.getContractFactory("Gold");
        gold = await upgrades.deployProxy(Gold, ["SoC: Season 1 - Gold", "GOLD", "86400",
            ether,
            navigator.address], {
            initializer: "initialize"
        });
        await gold.deployed();
        console.log(`Gold Deployed: ${gold.address}`)
        console.log(`Navigator: ${await gold.navigator()}`)
        console.log(`Reward: ${await gold.REWARD_PER_LEVEL()}`)
        const bal1 = await gold.balanceOf(deployer.address)
        console.log(`Balance of ${deployer.address}: ${bal1}`)
        tx = await gold.rewardToken(deployer.address, ether, {
            gasLimit: 1000000
        })
        await tx.wait(1);
        const deployerBalance = await gold.balanceOf(deployer.address);
        const bal2 = await gold.balanceOf(deployer.address)
        console.log(`Balance Diff. = ${ethers.utils.formatEther((parseInt(bal2) - parseInt(bal1)).toString())} eth`);
        expect(await gold.totalSupply()).to.equal(deployerBalance);
        return true;
    })
    it('Should burn whole balance', async () => {
        let balance = await gold.balanceOf(deployer.address);
        tx = await gold.burnToken(deployer.address, balance);
        await tx.wait(1);
        balance = await gold.balanceOf(deployer.address);
        expect(parseInt(balance)).to.equal(0);
    })
})

