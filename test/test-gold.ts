import {ethers, upgrades} from "hardhat";

async function main() {
    console.log(process.env.DEPLOYMENT_ACCOUNT_ADDRESS)
    let tx;
    const ether = ethers.utils.parseEther("1");
    const Navigator = await ethers.getContractFactory("Navigator");
    const navigator = await upgrades.deployProxy(Navigator, [ethers.constants.AddressZero], {
        initializer: "initialize"
    });
    console.log(`Navigator Deployed: ${navigator.address}`)
    let contracts = [process.env.DEPLOYMENT_ACCOUNT_ADDRESS];
    tx = await navigator.setGameContractsAddresses(contracts, true);
    await tx.wait(1);
    console.log(`Allowed user.`)
    console.log(await navigator.isGameContract(process.env.DEPLOYMENT_ACCOUNT_ADDRESS));

    //string memory _name, string memory _symbol,
    // uint _interval, uint _reward, address _navigator
    const Gold = await ethers.getContractFactory("Gold");
    const gold = await upgrades.deployProxy(Gold, ["SoC: Season 1 - Gold", "GOLD", "86400",
        ether,
        navigator.address], {
        initializer: "initialize"
    });
    await gold.deployed();
    console.log(`Gold Deployed: ${gold.address}`)
    console.log(`Navigator: ${await gold.navigator()}`)
    console.log(`Reward: ${await gold.REWARD_PER_LEVEL()}`)
    const bal1 = await gold.balanceOf(process.env.DEPLOYMENT_ACCOUNT_ADDRESS)
    console.log(`Balance of ${process.env.DEPLOYMENT_ACCOUNT_ADDRESS}: ${bal1}`)
    tx = await gold.rewardToken(process.env.DEPLOYMENT_ACCOUNT_ADDRESS, ether, {
        gasLimit: 1000000
    })
    await tx.wait(1);

    const bal2 = await gold.balanceOf(process.env.DEPLOYMENT_ACCOUNT_ADDRESS)
    console.log(ethers.utils.formatEther(bal1), ethers.utils.formatEther(bal2));
    console.log(`Diff = ${parseInt(bal1) - parseInt(bal2)} eth`);
}

main();