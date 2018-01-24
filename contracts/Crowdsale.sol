pragma solidity ^0.4.18;

import './Minter.sol';

/**
* @title Crowdsale for VICoin token
*/
contract Crowdsale is Minter {

	// virts sold on presale (10**18)
	// virts converted while ICO is available (10**18)
	uint256 public virts_converted = 0;

	// Events:
	// when user by vicoins
	event Buy(address who, uint256 amount, uint16 usd_cents);
	// when user converts virts to vicoin
	event Convert(address who, uint256 amount, uint8 user_id);
	
	// Constructor
	function Crowdsale(address _token_address) Minter(_token_address) public {}

	// buy tokens
	function buyTokens(address _to, uint256 _amount, uint16 _usd_cents) onlyOwner public returns (bool) {
		require(_amount > 0);
		require(_usd_cents > 0);
		mint(_to, _amount);
		Buy(_to, _amount, _usd_cents);
		return true;
	}

	// convert tokens from virts
	function convertFromVirts(address _to, uint256 _amount, uint16 _user_id) onlyOwner public returns (bool) {
		// one vicoin = 100 virts
		virts_converted += 100 * _amount;
		mint(_to, _amount);
		Convert(_to, _amount, _user_id);
		return true;
	}
}