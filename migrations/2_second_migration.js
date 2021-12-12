var votes = artifacts.require("./Election.sol");

module.exports = function(deployer) {
  deployer.deploy(votes);
};
