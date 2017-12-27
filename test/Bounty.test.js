import expectThrow from './helpers/expectThrow';

let vicoin = artifacts.require("VICoin");
let cs = artifacts.require("Bounty");


contract('Bounty', async function(accounts) {

	let token;
	let bounty;

	beforeEach(async function() {

		token = await vicoin.deployed();
		bounty = await cs.deployed();

	});

	it('mint tokens from some Bounty', async function() {

		const result = await bounty.reward(accounts[0], 100);
		assert.equal(result.logs[0].event, 'Reward');
		let balance = await token.balanceOf(accounts[0]);
		assert(balance, 100);
		let totalSupply = await token.totalSupply();
		assert(totalSupply, 100);

	});
});