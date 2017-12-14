import expectThrow from './helpers/expectThrow';

let vicoin = artifacts.require("VICoin");

contract('VICoin', async function(accounts) {

	let token;

	beforeEach(async function() {
		token = await vicoin.deployed();
	});

	it('mint not allowed from owner', async function() {

		await expectThrow(token.mint(accounts[0], 1));

	});
});