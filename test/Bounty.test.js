import expectThrow from './helpers/expectThrow';

let vicoin = artifacts.require("VICoin");
let cs = artifacts.require("Bounty");


contract('Bounty', async function(accounts) {

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

	it('mint tokens from some Bounty', async function() {
		
		const result = await minter.reward(accounts[0], 500);
		assert.equal(result.logs[0].event, 'Reward');

		let balance = await token.balanceOf(accounts[0]);
		assert.isTrue(balance.equals(500));

		let totalSupply = await token.totalSupply();
		assert.isTrue(totalSupply.equals(500));
	});
});