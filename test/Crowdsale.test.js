import expectThrow from './helpers/expectThrow';

let vicoin = artifacts.require("VICoin");
let cs = artifacts.require("Crowdsale");


contract('Crowdsale', async function(accounts) {

	let token;
	let minter;

	beforeEach(async function() {

		token = await vicoin.deployed();
		minter = await cs.deployed();

	});

	it('token allow to mint by minter', async function() {
		
		const minter_addr = await token.callers(minter.address);
		assert.equal(minter_addr, minter.address);

	});

	it('minter has token_address', async function() {
		
		const token_addr = await minter.token_address();
		assert.equal(token_addr, token.address);

	});

	it('mint tokens from Crowdsale', async function() {

		const result = await minter.buyTokens(accounts[0], 500, 400);
		assert.equal(result.logs[0].event, 'Buy');

		let balance = await token.balanceOf(accounts[0]);
		assert.isTrue(balance.equals(500));

		let totalSupply = await token.totalSupply();
		assert.isTrue(totalSupply.equals(500));

	});
	
	it('convert tokens from virts with Crowdsale', async function() {

		const result = await minter.convertFromVirts(accounts[0], 500, 146);
		assert.equal(result.logs[0].event, 'Convert');

		let balance = await token.balanceOf(accounts[0]);
		assert.isTrue(balance.equals(1000));

		let totalSupply = await token.totalSupply();
		assert.isTrue(totalSupply.equals(1000));

		let virts = await minter.virts_converted();
		assert.isTrue(virts.equals(500 * 100));

	});
});