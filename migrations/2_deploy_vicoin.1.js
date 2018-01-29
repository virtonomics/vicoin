var token = artifacts.require("VICoin.sol");
var crowdsale = artifacts.require("Crowdsale.sol");
var bounty = artifacts.require("Bounty.sol");

var _token; // instance of vicoin

module.exports = function(deployer) {

	deployer.deploy(token).then(function() {
		
		return token.deployed();

	}).then(function(instance) {

		_token = instance;
		return deployer.deploy(crowdsale, _token.address);

	}).then(function() {
		
		return _token.callerAdd(crowdsale.address);

	}).then(function(instance) {

		return deployer.deploy(bounty, _token.address);

	}).then(function() {
		
		return _token.callerAdd(bounty.address);

	});

}
