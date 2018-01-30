
var minter = artifacts.require("Crowdsale");

module.exports = function(callback)
{
	minter.deployed().then(function(instance) {

		instance.buyTokens('0x572d0e89f7b93875b62a8db285969447daac368a', '1000000000000000000', '40').then(function()
		{
			console.log('done');
		});
	});
}

