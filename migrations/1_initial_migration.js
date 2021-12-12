var votes = artifacts.require("./votes.sol");

module.exports = function(deployer) {
  deployer.deploy(votes);
};
