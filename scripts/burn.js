var BigNumber = require('bignumber.js');

let burner = artifacts.require("ErrorTokensBurner");

module.exports = function(callback)
{
	burner.deployed().then(function(instance) {

		var tokens = new BigNumber(1);
		var dec = new BigNumber('1000000000000000000');
		tokens = tokens.multipliedBy(dec);
		tokens = tokens.toString(10);
		console.log(tokens);

		
		instance.burnOnError('0x572d0e89f7b93875b62a8db285969447daac368a', tokens).then(function()
		{
			console.log('done');
		}).catch(function(e)
		{
			console.log(e);
		});
		
	});
}

