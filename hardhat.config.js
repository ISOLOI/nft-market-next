require("@nomiclabs/hardhat-waffle");
const fs = require("fs");

const privateKey = fs.readFileSync(".secret").toString();
module.exports = {
  networks: {
    hardhat: {
      chainId: 1337,
    },
    mainnet: {
      url: ``,
      accounts: [privateKey],
    },
    ropsten: {
      url: ``,
      accounts: [privateKey],
    },
  },
  solidity: "0.8.4",
};
