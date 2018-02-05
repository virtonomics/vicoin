require('babel-register');
require('babel-polyfill');

module.exports = {
	// See <http://truffleframework.com/docs/advanced/configuration>
	// to customize your Truffle configuration!
	networks: {
		development: {
			host: "localhost",
			port: 8545,
			network_id: "*", // Match any network id
			gas:   420000000
		},
		geth: {
			network_id: 3,
			host: "geth",
			port:  8545,
			from:  "0x572d0e89f7b93875b62a8db285969447daac368a",
			gas:   4200000,
			gasPrice: 20000000000
		}
	},
	solc: {
		optimizer: {
			enabled: true,
			runs: 200
		}
	}
};
