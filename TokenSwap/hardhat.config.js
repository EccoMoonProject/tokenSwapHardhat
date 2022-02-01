require("dotenv").config();

require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");


require('@openzeppelin/hardhat-upgrades');

const INFURA_URL = "https://ropsten.infura.io/v3/8c5d8b119d8b48a2b9be8a3300e26c1a";
const PRIVATE_KEY = "adbfcba7f0495d8ef1342d72664cfc8fd1ef0cd4ff6949937aae5e9076ce4d0f";





// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.6",
  networks: {
    ropsten: {
      url: "https://ropsten.infura.io/v3/8c5d8b119d8b48a2b9be8a3300e26c1a",
      accounts: ['adbfcba7f0495d8ef1342d72664cfc8fd1ef0cd4ff6949937aae5e9076ce4d0f'],
    }
  }
  
  
};
