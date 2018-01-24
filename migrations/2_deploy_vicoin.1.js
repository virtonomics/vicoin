var token = artifacts.require("VICoin.sol");
var minter = artifacts.require("Bounty.sol");

var _token; // instance of vicoin
var _minter; // minter

module.exports = function(deployer) {
	deployer.deploy(token).then(function() {
		// create VICoin minter
		return deployer.deploy(minter, token.address);

	}).then(function() {

		return token.deployed();

	}).then(function(instance) {
		// allow minter to mint tokens
		instance.callerAdd(minter.address);

	})
};