var token = artifacts.require("VICoin.sol");
var minter = artifacts.require("Crowdsale.sol");

module.exports = function(deployer) {

	deployer.deploy(minter, token.address).then(function() {
		
		return token.deployed();

	}).then(function(instance) {

		instance.callerAdd(minter.address);

	})
};
