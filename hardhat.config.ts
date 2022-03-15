import * as dotenv from "dotenv";
import { HardhatUserConfig, task } from "hardhat/config";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";
import "hardhat-gas-reporter";
import "solidity-coverage";
import "hardhat-contract-sizer";
dotenv.config();
const deploymentAccount = process.env.DEPLOYMENT_ACCOUNT_KEY || ""
const chainInstance = process.env.CHAIN_INSTANCE || ""
// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.7",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  contractSizer: {
    alphaSort: true,
    runOnCompile: false,
    disambiguatePaths: false,
  },

  mocha: {
    timeout: 60000
  },

  networks: {
    hardhat: {
      gasPrice: 225000000000,
      chainId: 1337,
      accounts: {
        accountsBalance: '1000000000000000000000000',
        count: 5
      }
    },

    avash_local: {
      url: chainInstance,
      gasPrice: 225000000000,
      chainId: 43112,
      accounts: [deploymentAccount]
    },

    avash_dev: {
      url: chainInstance,
      gasPrice: 225000000000,
      chainId: 43112,
      accounts: [deploymentAccount]
    },

    fuji: {
      url: chainInstance,
      gasPrice: 25000000000,
      chainId: 43113,
      accounts: [deploymentAccount]
    },
    local: {
      url: chainInstance,
      gasPrice: 1000000000,
      chainId: 6942069,
      accounts: [deploymentAccount]
    },
    prod: {
      url: chainInstance,
      gasPrice: 225000000000,
      chainId: 43114,
      accounts: [deploymentAccount]
    },

    subnet_local: {
      url: chainInstance,
      gasPrice: 225000000000,
      chainId: 43214,
      accounts: [deploymentAccount]
    }
  },
  etherscan: {
    apiKey:  process.env.API_KEY
  }
};

export default config;
