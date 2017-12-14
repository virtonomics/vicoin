import expectThrow from './helpers/expectThrow';

let vicoin = artifacts.require("VICoin");
let cs = artifacts.require("Minter");


contract('Minter', async function(accounts) {

	let token;
	let minter;

	beforeEach(async function() {

		token = await vicoin.deployed();
		minter = await cs.deployed();

	});

	it('mint tokens from some Minter', async function() {

		const result = await minter.mint(accounts[0], 100);
		assert.equal(result.logs[0].event, 'Mint');
		let balance = await token.balanceOf(accounts[0]);
		assert(balance, 100);
		let totalSupply = await token.totalSupply();
		assert(totalSupply, 102);

	});
});