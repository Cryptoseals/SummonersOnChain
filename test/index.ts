import {expect} from "chai";
import {ethers} from "hardhat";

// @ts-ignore
async function test() {
    const signers = await ethers.getSigners()
    let accounts: any[] = []
    
    for (let i = 0; i < signers.length; i++) {
        accounts.push(signers[i].address)
    }
}

test()
    .then(() => {
        process.exit(0)
    })
    .catch(error => {
        console.error(error)
        process.exit(1)
    })