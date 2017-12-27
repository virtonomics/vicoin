require('babel-register');
require('babel-polyfill');

module.exports = {
	// See <http://truffleframework.com/docs/advanced/configuration>
	// to customize your Truffle configuration!
	networks: {
			development: {
			host: "localhost",
			port: 8545,
			network_id: "*" // Match any network id
		},
		ropsten: {
			network_id: 3,
			host: "192.168.2.42",
			port:  8545,
			gas:   4200000
		},
		local: {
			network_id: 10,
			host: "192.168.2.42",
			port:  8545,
			gas:   4200000
		}
	},
	solc: {
		optimizer: {
			enabled: true,
			runs: 200
		}
	}
};
