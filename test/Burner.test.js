import expectThrow from './helpers/expectThrow';

let vicoin = artifacts.require("VICoin");
let cs = artifacts.require("Crowdsale");
let bn = artifacts.require("ErrorTokensBurner");


contract('ErrorTokensBurner', async function(accounts) {

	let token;
	let burner;
	let minter;

	beforeEach(async function() {

		token = await vicoin.deployed();
		minter = await cs.deployed();
		burner = await bn.deployed();
	});

	it('token allow to burn by burner', async function() {
		
		const minter_addr = await token.callers(burner.address);
		assert.equal(minter_addr, burner.address);

	});

	it('burner has token_address', async function() {
		
		const token_addr = await burner.token_address();
		assert.equal(token_addr, token.address);

	});

	it('burn tokens from ErrorTokensBurner', async function() {

		let result = await minter.convertFromVirts(accounts[0], 500, 146);
		let balance = await token.balanceOf(accounts[0]);
		assert.isTrue(balance.equals(500));
		
		result = await burner.burnOnError(accounts[0], 200);
		assert.equal(result.logs[0].event, 'Burn');

		balance = await token.balanceOf(accounts[0]);
		assert.isTrue(balance.equals(300));

		let totalSupply = await token.totalSupply();
		assert.isTrue(totalSupply.equals(300));

	});

});