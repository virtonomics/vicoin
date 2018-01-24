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

	it('mint tokens from some Crowdsale', async function() {

		const result = await minter.buyTokens(accounts[0], 500, 400);
		assert.equal(result.logs[0].event, 'Buy');
		let balance = await token.balanceOf(accounts[0]);
		assert(balance, 500);
		let totalSupply = await token.totalSupply();
		assert(totalSupply, 500);

	});
});