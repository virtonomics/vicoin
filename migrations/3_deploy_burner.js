var token = artifacts.require("VICoin.sol");
var burner = artifacts.require("ErrorTokensBurner.sol");

var _token; // instance of vicoin

module.exports = function(deployer) {

		deployer.then(function() {

			return token.deployed();

		}).then(function(instance) {
		
		_token = instance;
		return deployer.deploy(burner, _token.address);

		}).then(function() {
		
		return _token.callerAdd(burner.address);

	});
}


